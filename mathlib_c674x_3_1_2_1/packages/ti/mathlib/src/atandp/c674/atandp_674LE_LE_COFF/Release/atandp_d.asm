;******************************************************************************
;* TMS320C6x C/C++ Codegen                                          PC v7.4.2 *
;* Date/Time created: Mon May 16 23:37:18 2016                                *
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
	.word	0d3eba4ffh,04012be3bh		; _a[0] @ 0
	.word	0e5de15cah,0c0118e22h		; _a[1] @ 64
	.word	0da95e32ch,0c018e341h		; _a[2] @ 128
	.word	0aa5e0cfch,04007c988h		; _a[3] @ 192
	.word	067b0e941h,0c00b2c74h		; _a[4] @ 256
	.word	086d3c438h,0400d1c1eh		; _a[5] @ 320
	.word	0520f974dh,0bffcc101h		; _a[6] @ 384
	.word	050acc0beh,0c015dba4h		; _a[7] @ 448
	.word	0f295b432h,0c00fe2b5h		; _a[8] @ 512
	.word	0437edad1h,0bfe1dff2h		; _a[9] @ 576
	.word	0c239cbd4h,0400f1eb3h		; _a[10] @ 640
	.word	0b57d24efh,0bff511feh		; _a[11] @ 704
	.word	05db918bbh,0c015c11eh		; _a[12] @ 768
	.word	0f7bd3b5fh,0c00e1edch		; _a[13] @ 832
	.word	07669e9a9h,04012b693h		; _a[14] @ 896
	.word	0c94dbc4bh,0bfddbe83h		; _a[15] @ 960
	.word	036a4d7bbh,03ff0abcch		; _a[16] @ 1024
	.word	074701465h,0bff0953ah		; _a[17] @ 1088
	.word	08a2a90cdh,0bff33957h		; _a[18] @ 1152
	.word	07f8012e0h,0c001654ah		; _a[19] @ 1216
	.word	05f5ad96ah,04008f424h		; _a[20] @ 1280
	.word	02d6fa4d4h,0401162eeh		; _a[21] @ 1344
	.word	0e9559990h,03ff4a838h		; _a[22] @ 1408
	.word	0628a38d4h,0bff459a8h		; _a[23] @ 1472
	.word	0fd1569f5h,04015a9a1h		; _a[24] @ 1536
	.word	08afc47e5h,03fea9c35h		; _a[25] @ 1600
	.word	0ba1e745fh,0c0183d45h		; _a[26] @ 1664
	.word	01059ea57h,0bfe83bcah		; _a[27] @ 1728
	.word	04a20b582h,04011e76ah		; _a[28] @ 1792
	.word	08ed5f139h,0c018b4e2h		; _a[29] @ 1856
	.word	0a275e12eh,03fd7eac9h		; _a[30] @ 1920
	.word	0fb748005h,03fe07ff6h		; _a[31] @ 1984
	.word	0bfcd0a09h,03fefc3a7h		; _a[32] @ 2048
	.word	02b08c246h,04016595fh		; _a[33] @ 2112
	.word	0dd4ac952h,0bff9aadfh		; _a[34] @ 2176
	.word	0540e750eh,0c011ba7ch		; _a[35] @ 2240
	.word	051ac9afeh,03fa8d10fh		; _a[36] @ 2304
	.word	0847a4da4h,0bfc9683fh		; _a[37] @ 2368
	.word	0aa469007h,0c012db94h		; _a[38] @ 2432
	.word	093e524b2h,0c016e1bah		; _a[39] @ 2496
	.word	0445747e5h,0bffa4da8h		; _a[40] @ 2560
	.word	0fc2a886ah,0c014fe19h		; _a[41] @ 2624
	.word	07d5311f6h,04003c142h		; _a[42] @ 2688
	.word	0c5b8dc55h,0bffbdcfch		; _a[43] @ 2752
	.word	04bb50a38h,0c00644c0h		; _a[44] @ 2816
	.word	091ec262eh,03fe329bch		; _a[45] @ 2880
	.word	04ce08363h,0bffbd0a7h		; _a[46] @ 2944
	.word	05bb6dffbh,03fee0a37h		; _a[47] @ 3008
	.word	0a762aff9h,03fffa80eh		; _a[48] @ 3072
	.word	0032c046bh,0c0180018h		; _a[49] @ 3136
	.word	0fc555094h,04005cb3ah		; _a[50] @ 3200
	.word	07bef64a7h,0bf64d28ah		; _a[51] @ 3264
	.word	0032b2dabh,0c00536bdh		; _a[52] @ 3328
	.word	051c69c31h,040191314h		; _a[53] @ 3392
	.word	0c16c467ah,040054a9ch		; _a[54] @ 3456
	.word	04c3a6b36h,0c0052445h		; _a[55] @ 3520
	.word	01650a45dh,0c0051ebeh		; _a[56] @ 3584
	.word	0c2cd6f8ah,0c003dd43h		; _a[57] @ 3648
	.word	05b72ed5dh,03ffe246ch		; _a[58] @ 3712
	.word	0fbe8434bh,0bfde2b04h		; _a[59] @ 3776
	.word	0b6ec90b7h,0c01293b0h		; _a[60] @ 3840
	.word	0127476cah,0c0134a00h		; _a[61] @ 3904
	.word	0b9c8e40ah,0c0114303h		; _a[62] @ 3968
	.word	09ecb31c2h,040123604h		; _a[63] @ 4032
	.word	0889712d7h,03ff7d55ch		; _a[64] @ 4096
	.word	07693db14h,04016ca59h		; _a[65] @ 4160
	.word	0851654d6h,0c00b845dh		; _a[66] @ 4224
	.word	0173e0a27h,040019657h		; _a[67] @ 4288
	.word	0b9d070c6h,040147f36h		; _a[68] @ 4352
	.word	0f3915cb4h,04002e959h		; _a[69] @ 4416
	.word	0605ab3abh,0c010818fh		; _a[70] @ 4480
	.word	090166319h,0bfe6b2ach		; _a[71] @ 4544
	.word	0e9f92d7eh,0bfc0f889h		; _a[72] @ 4608
	.word	0712ae587h,03fd09c78h		; _a[73] @ 4672
	.word	0b7f3f7b4h,04000bd4eh		; _a[74] @ 4736
	.word	04383e34fh,0c0171014h		; _a[75] @ 4800
	.word	08ca23a52h,0c00cee02h		; _a[76] @ 4864
	.word	005a7dfadh,0c018b38ah		; _a[77] @ 4928
	.word	0501e2585h,04006c536h		; _a[78] @ 4992
	.word	0b5dcc63fh,04003ec84h		; _a[79] @ 5056
	.word	0ef911cf3h,0c008aa52h		; _a[80] @ 5120
	.word	07e08439bh,0c017260ah		; _a[81] @ 5184
	.word	01645bca3h,04004351fh		; _a[82] @ 5248
	.word	0667c35dch,0401811a4h		; _a[83] @ 5312
	.word	026b7faaeh,0c011a838h		; _a[84] @ 5376
	.word	0ff3a0763h,04012001bh		; _a[85] @ 5440
	.word	06c050bd8h,0c004d307h		; _a[86] @ 5504
	.word	0bcc79c0bh,0400d71e9h		; _a[87] @ 5568
	.word	0a958537eh,0400af2a0h		; _a[88] @ 5632
	.word	0d794a6ech,0c017284ah		; _a[89] @ 5696
	.word	0d1da52c7h,03fe446eeh		; _a[90] @ 5760
	.word	01839b2a9h,0bff5bcfbh		; _a[91] @ 5824
	.word	06a161e4fh,0c002134dh		; _a[92] @ 5888
	.word	07db6e504h,03fd27a8fh		; _a[93] @ 5952
	.word	0e78910b5h,040118011h		; _a[94] @ 6016
	.word	0d4e31bc4h,0bff7fe18h		; _a[95] @ 6080
	.word	0f1015f7ch,0bffa255fh		; _a[96] @ 6144
	.word	035a6aafah,03feb0917h		; _a[97] @ 6208
	.word	030e1495ch,04015fb87h		; _a[98] @ 6272
	.word	0624b4eb3h,040044bffh		; _a[99] @ 6336
	.word	0d78d1a2fh,040101417h		; _a[100] @ 6400
	.word	0ad4e8244h,0400db163h		; _a[101] @ 6464
	.word	03da8013bh,04012b080h		; _a[102] @ 6528
	.word	07a66ce6bh,03ffb582eh		; _a[103] @ 6592
	.word	0524bfd2fh,04014d299h		; _a[104] @ 6656
	.word	07a46edfbh,0c01174ach		; _a[105] @ 6720
	.word	0dd1010efh,0c014cbfdh		; _a[106] @ 6784
	.word	02d285737h,0400f0fb7h		; _a[107] @ 6848
	.word	0ebbe299ch,0c009747dh		; _a[108] @ 6912
	.word	0dede4749h,04016cedah		; _a[109] @ 6976
	.word	0fbba2022h,0c0005877h		; _a[110] @ 7040
	.word	0ad22e35ah,0c00d5ae7h		; _a[111] @ 7104
	.word	0222acd33h,040096d79h		; _a[112] @ 7168
	.word	0cff7fa78h,040113b89h		; _a[113] @ 7232
	.word	07f1b6912h,04006e2a2h		; _a[114] @ 7296
	.word	09c007c27h,0c0122b28h		; _a[115] @ 7360
	.word	015e89f91h,0400516aah		; _a[116] @ 7424
	.word	0e2cce952h,0400df96ah		; _a[117] @ 7488
	.word	05113180bh,040056102h		; _a[118] @ 7552
	.word	0871f4392h,0c007661ch		; _a[119] @ 7616
	.word	009fe8683h,04007562eh		; _a[120] @ 7680
	.word	0c010fca8h,0c0112172h		; _a[121] @ 7744
	.word	097792de9h,0c01501e6h		; _a[122] @ 7808
	.word	089bbd605h,03ff3066bh		; _a[123] @ 7872
	.word	08cd7ea37h,0400dc4c2h		; _a[124] @ 7936
	.word	0d5687cc1h,03ff4bd9dh		; _a[125] @ 8000
	.word	064cddff2h,040181249h		; _a[126] @ 8064
	.word	04d551d69h,0bfd47510h		; _a[127] @ 8128
	.word	0d8d0104eh,0c00dc5f2h		; _a[128] @ 8192
	.word	0069bfb74h,0c011a5fbh		; _a[129] @ 8256
	.word	0762017cdh,04012e74bh		; _a[130] @ 8320
	.word	0803a4d03h,03ff31234h		; _a[131] @ 8384
	.word	0b5f295b4h,03ff70fc2h		; _a[132] @ 8448
	.word	0eed45e92h,0c010d957h		; _a[133] @ 8512
	.word	01b0b1e41h,03ff5aaafh		; _a[134] @ 8576
	.word	04d0a74ceh,04018c46dh		; _a[135] @ 8640
	.word	0ce11706bh,0c018395dh		; _a[136] @ 8704
	.word	0edb07223h,0bffd89a3h		; _a[137] @ 8768
	.word	0033ccb62h,0c000ab34h		; _a[138] @ 8832
	.word	0d04d8acdh,0c016f5cbh		; _a[139] @ 8896
	.word	0ad729472h,0400a33ach		; _a[140] @ 8960
	.word	085751f67h,0400b1588h		; _a[141] @ 9024
	.word	085d9c935h,03fed4830h		; _a[142] @ 9088
	.word	08e72f4eah,0bfd12cf0h		; _a[143] @ 9152
	.word	0cc8076b3h,03fd26973h		; _a[144] @ 9216
	.word	0cb740739h,0400e17b3h		; _a[145] @ 9280
	.word	0c4c3e9cfh,0c00fe130h		; _a[146] @ 9344
	.word	0922d948eh,0bffbe376h		; _a[147] @ 9408
	.word	0ef54b711h,0c00098bah		; _a[148] @ 9472
	.word	0786cf928h,0c00eced5h		; _a[149] @ 9536
	.word	099920cddh,0bffd7566h		; _a[150] @ 9600
	.word	0df73987eh,0c0142820h		; _a[151] @ 9664
	.word	085b4e047h,03fe9ec8ch		; _a[152] @ 9728
	.word	02054335eh,0c0177d0eh		; _a[153] @ 9792
	.word	043a5713eh,03ffbee4ch		; _a[154] @ 9856
	.word	04a49d02eh,0bfe151d5h		; _a[155] @ 9920
	.word	0c48428efh,04015f22ch		; _a[156] @ 9984
	.word	0574637f3h,04007a58eh		; _a[157] @ 10048
	.word	083459a3eh,04015156fh		; _a[158] @ 10112
	.word	0d189caefh,03fcdc4ceh		; _a[159] @ 10176
	.word	063fdd65ah,03fa03a21h		; _a[160] @ 10240
	.word	0ced2608bh,0c014e11fh		; _a[161] @ 10304
	.word	040c1912fh,0bfeb12c6h		; _a[162] @ 10368
	.word	0edc64198h,04007bce1h		; _a[163] @ 10432
	.word	0a4b47fcfh,04000c348h		; _a[164] @ 10496
	.word	057fdedd7h,0c00fe667h		; _a[165] @ 10560
	.word	02fdd3d5dh,04008bf55h		; _a[166] @ 10624
	.word	0c08a9f2bh,04013b5fdh		; _a[167] @ 10688
	.word	0a96ac7f5h,0c0105072h		; _a[168] @ 10752
	.word	02782fbc8h,0bfc2883eh		; _a[169] @ 10816
	.word	0d928fba2h,0400d05a0h		; _a[170] @ 10880
	.word	0c86990bdh,0c0132dd3h		; _a[171] @ 10944
	.word	07dde5230h,0c012e244h		; _a[172] @ 11008
	.word	0e8c3a358h,0400f9c5eh		; _a[173] @ 11072
	.word	060814a17h,0400f47e9h		; _a[174] @ 11136
	.word	02055e0ddh,0401387c4h		; _a[175] @ 11200
	.word	09f8ea621h,0401611d7h		; _a[176] @ 11264
	.word	066ffe95ah,0c0049673h		; _a[177] @ 11328
	.word	064dcf96bh,0bfec52afh		; _a[178] @ 11392
	.word	0d07ad737h,0c0183efdh		; _a[179] @ 11456
	.word	055087011h,0bff3966ah		; _a[180] @ 11520
	.word	0dd34f9ddh,0bfef17a1h		; _a[181] @ 11584
	.word	0ea897636h,03ff081adh		; _a[182] @ 11648
	.word	005418861h,04000be2ch		; _a[183] @ 11712
	.word	0f7d08696h,03ffcd609h		; _a[184] @ 11776
	.word	01358a259h,0c0179ab0h		; _a[185] @ 11840
	.word	0bc530206h,03ff00d80h		; _a[186] @ 11904
	.word	0b54ad008h,0c00050aah		; _a[187] @ 11968
	.word	0da5f5c87h,0c0134b26h		; _a[188] @ 12032
	.word	0c5b4aa97h,0c004be35h		; _a[189] @ 12096
	.word	00e3c02e6h,0c016e828h		; _a[190] @ 12160
	.word	0ab2e1694h,0401341b0h		; _a[191] @ 12224
	.word	094daedf8h,03ffaaee1h		; _a[192] @ 12288
	.word	01b27a3b3h,04007d8c5h		; _a[193] @ 12352
	.word	0915450bah,040176c65h		; _a[194] @ 12416
	.word	06f013f9bh,0bfa7bddch		; _a[195] @ 12480
	.word	0f88333fdh,0bffe0ec0h		; _a[196] @ 12544
	.word	081916518h,0c00c9497h		; _a[197] @ 12608
	.word	05682c394h,04000a1bbh		; _a[198] @ 12672
	.word	066a3a308h,040056159h		; _a[199] @ 12736
	.word	0a8f48070h,0400a3953h		; _a[200] @ 12800
$C$IR_1:	.set	1608

	.global	_a
_a:	.usect	".far",1608,8
;	C:\MATHLIB_Tools\CCSV5_5_0\ccsv5\tools\compiler\c6000_7.4.2\bin\opt6x.exe C:\\Users\\gtbldadm\\AppData\\Local\\Temp\\019524 C:\\Users\\gtbldadm\\AppData\\Local\\Temp\\019526 
;**	Parameter deleted: req_flags == 1;
	.sect	".text"
	.clink

;******************************************************************************
;* FUNCTION NAME: allequal                                                    *
;*                                                                            *
;*   Regs Modified     : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,B0,B1, *
;*                           B2,B3,B4,B5,B6,B7,B8,B9,B10,B11,SP,A16,A17,A18,  *
;*                           A19,A20,A21,A22,A23,A24,A25,A26,A27,A28,A29,A30, *
;*                           A31,B16,B17,B18,B19,B20,B21,B22,B23,B24,B25,B26, *
;*                           B27,B28,B29,B30,B31                              *
;*   Regs Used         : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,B0,B1, *
;*                           B2,B3,B4,B5,B6,B7,B8,B9,B10,B11,DP,SP,A16,A17,   *
;*                           A18,A19,A20,A21,A22,A23,A24,A25,A26,A27,A28,A29, *
;*                           A30,A31,B16,B17,B18,B19,B20,B21,B22,B23,B24,B25, *
;*                           B26,B27,B28,B29,B30,B31                          *
;*   Local Frame Size  : 0 Args + 0 Auto + 32 Save = 32 byte                  *
;******************************************************************************
_allequal:
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 12
           STW     .D2T1   A11,*SP--(8)      ; |63| 
           STDW    .D2T2   B11:B10,*SP--     ; |63| 
           STDW    .D2T1   A13:A12,*SP--     ; |63| 

           STW     .D2T1   A10,*SP--(8)      ; |63| 
||         MVKL    .S1     _output,A10

           MVKH    .S1     _output,A10
||         MV      .L1     A4,A6             ; |63| 

           MV      .L1     A4,A13            ; |63| 
||         MV      .L2     B4,B6             ; |63| 
||         LDW     .D1T1   *A10,A4           ; |66| 
||         MV      .S1X    B5,A11            ; |63| 

           MV      .L2     B3,B11            ; |63| 
||         CALLP   .S2     _isequal,B3
||         MV      .L1X    B4,A12            ; |63| 
||         LDW     .D1T2   *+A10(4),B4       ; |66| 
||         MVK     .S1     0x1,A8            ; |66| 
||         MV      .D2     B5,B7             ; |63| 

$C$RL0:    ; CALL OCCURS {_isequal} {0}      ; |66| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 22
           MVKL    .S2     _fcn_pass,B10

           MV      .L1     A4,A3             ; |66| 
||         LDW     .D1T1   *A10,A4           ; |67| 
||         MVKH    .S2     _fcn_pass,B10
||         MV      .L2X    A12,B6            ; |67| 

           CALLP   .S2     _isequal,B3
||         LDW     .D1T2   *+A10(8),B4       ; |67| 
||         STW     .D2T1   A3,*+B10(4)       ; |66| 
||         MV      .L1     A13,A6            ; |67| 
||         MV      .L2X    A11,B7            ; |67| 
||         MVK     .S1     0x1,A8            ; |67| 

$C$RL1:    ; CALL OCCURS {_isequal} {0}      ; |67| 

           MV      .L1     A4,A3             ; |67| 
||         LDW     .D1T1   *A10,A4           ; |68| 
||         MV      .L2X    A12,B6            ; |68| 

           CALLP   .S2     _isequal,B3
||         LDW     .D1T2   *+A10(12),B4      ; |68| 
||         STW     .D2T1   A3,*+B10(8)       ; |67| 
||         MV      .L1     A13,A6            ; |68| 
||         MV      .L2X    A11,B7            ; |68| 
||         MVK     .S1     0x1,A8            ; |68| 

$C$RL2:    ; CALL OCCURS {_isequal} {0}      ; |68| 

           MV      .L1     A10,A5            ; |66| 
||         STW     .D2T1   A4,*+B10(12)      ; |68| 
||         LDW     .D1T2   *+A10(16),B4      ; |69| 
||         MV      .L2X    A12,B6            ; |69| 

           CALLP   .S2     _isequal,B3
||         LDW     .D1T1   *A5,A4            ; |69| 
||         MV      .L1     A13,A6            ; |69| 
||         MV      .L2X    A11,B7            ; |69| 
||         MVK     .S1     0x1,A8            ; |69| 

$C$RL3:    ; CALL OCCURS {_isequal} {0}      ; |69| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 12
           ADD     .L2     4,B10,B4
           LDW     .D2T2   *B4,B0            ; |72| 
           STW     .D2T1   A4,*+B10(16)      ; |69| 
           ADD     .L2     8,B10,B4
           NOP             2

   [!B0]   BNOP    .S1     $C$L1,4           ; |72| 
||         MV      .L2     B0,B1             ; guard predicate rewrite
|| [ B0]   LDW     .D2T2   *B4,B0            ; |72| 

   [ B1]   ADD     .L2     4,B4,B4
           ; BRANCHCC OCCURS {$C$L1}         ; |72| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 15
   [ B0]   LDW     .D2T2   *B4,B4            ; |72| 
           CMPEQ   .L1     A4,0,A3           ; |72| 
   [!B0]   ZERO    .L1     A0                ; |72| 
           MVKL    .S1     _all_pass,A4
           MVKH    .S1     _all_pass,A4
   [ B0]   CMPEQ   .L2     B4,0,B4           ; |72| 
   [ B0]   XOR     .L2     1,B4,B4           ; |72| 
           XOR     .L1     1,A3,A3           ; |72| 

   [ B0]   AND     .L1X    A3,B4,A0          ; |72| 
||         MVK     .S1     0x1,A3            ; |72| 

   [ A0]   STW     .D1T1   A3,*A4            ; |72| 
|| [ A0]   B       .S1     $C$L2             ; |72| 
|| [ A0]   MV      .L2     B11,B3            ; |74| 

   [ A0]   LDW     .D2T1   *++SP(8),A10      ; |74| 
   [ A0]   LDDW    .D2T1   *++SP,A13:A12     ; |74| 

   [ A0]   RET     .S2     B3                ; |74| 
|| [ A0]   LDDW    .D2T2   *++SP,B11:B10     ; |74| 

   [ A0]   LDW     .D2T1   *++SP(8),A11      ; |74| 
           NOP             1
           ; BRANCHCC OCCURS {$C$L2}         ; |72| 
;** --------------------------------------------------------------------------*
$C$L1:    
;          EXCLUSIVE CPU CYCLES: 8
           MVKL    .S1     _all_pass,A4

           MVKH    .S1     _all_pass,A4
||         ZERO    .L1     A3                ; |72| 

           STW     .D1T1   A3,*A4            ; |72| 
           LDW     .D2T1   *++SP(8),A10      ; |74| 

           LDDW    .D2T1   *++SP,A13:A12     ; |74| 
||         MV      .L2     B11,B3            ; |74| 

           LDDW    .D2T2   *++SP,B11:B10     ; |74| 
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
;*   Local Frame Size  : 8 Args + 16 Auto + 56 Save = 80 byte                 *
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

           STW     .D2T2   B3,*SP--(32)      ; |112| 
||         CALLP   .S2     _driver_init,B3
||         MVKH    .S1     $C$SL1+0,A4

$C$RL4:    ; CALL OCCURS {_driver_init} {0}  ; |120| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 7

           MVKL    .S1     _a,A11
||         MVKL    .S2     _output,B10

           MVKH    .S1     _a,A11
||         MVKH    .S2     _output,B10

           MV      .L1     A11,A13
||         CALL    .S1     _atan             ; |129| 
||         LDW     .D2T1   *B10,A12

           LDDW    .D1T1   *A13++,A5:A4      ; |129| 
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
           ADDKPC  .S2     $C$RL5,B3,0       ; |129| 
$C$RL5:    ; CALL OCCURS {_atan} {0}         ; |129| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 7

           SUB     .L1     A10,1,A0          ; |128| 
||         STDW    .D1T1   A5:A4,*A12++      ; |129| 
||         SUB     .S1     A10,1,A10         ; |128| 

   [!A0]   MVK     .S2     0xc9,B4
|| [!A0]   ADD     .L2     4,B10,B11
|| [ A0]   B       .S1     $C$L3             ; |128| 

   [ A0]   CALL    .S1     _atan             ; |129| 
   [ A0]   LDDW    .D1T1   *A13++,A5:A4      ; |129| 
   [!A0]   MV      .L1     A11,A10
   [!A0]   ZERO    .L2     B10
   [!A0]   MV      .L1X    B4,A12
           ; BRANCHCC OCCURS {$C$L3}         ; |128| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 1
           CALL    .S1     _atandp           ; |132| 
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L4:    
;          EXCLUSIVE CPU CYCLES: 5
           LDDW    .D1T1   *A10++,A5:A4      ; |132| 
           ADDKPC  .S2     $C$RL6,B3,3       ; |132| 
$C$RL6:    ; CALL OCCURS {_atandp} {0}       ; |132| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 7

           LDW     .D2T2   *B11,B4           ; |132| 
||         SUB     .L1     A12,1,A0          ; |131| 
||         SUB     .S1     A12,1,A12         ; |131| 

   [ A0]   BNOP    .S1     $C$L4,3           ; |131| 

           ADD     .L2     B10,B4,B5         ; |132| 
||         ADD     .S2     8,B10,B10         ; |131| 
|| [!A0]   ADD     .D2     4,B11,B4

   [ A0]   CALL    .S1     _atandp           ; |132| 
||         STDW    .D2T1   A5:A4,*B5         ; |132| 
|| [!A0]   MVK     .S2     0xc9,B5

           ; BRANCHCC OCCURS {$C$L4}         ; |131| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 2

           ZERO    .L2     B10
||         STW     .D2T2   B4,*+SP(24)
||         MV      .L1     A11,A12

           MV      .L1X    B5,A10
||         CALL    .S1     _atandp_c         ; |135| 

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L5:    
;          EXCLUSIVE CPU CYCLES: 5
           LDDW    .D1T1   *A12++,A5:A4      ; |135| 
           ADDKPC  .S2     $C$RL7,B3,3       ; |135| 
$C$RL7:    ; CALL OCCURS {_atandp_c} {0}     ; |135| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 12

           LDW     .D2T2   *+SP(24),B4       ; |135| 
||         SUB     .L1     A10,1,A0          ; |134| 

   [!A0]   LDW     .D2T1   *+SP(24),A3
           SUB     .L1     A10,1,A10         ; |134| 
   [!A0]   MVKL    .S1     _ti_math_vTable,A12
           NOP             1
           LDW     .D2T2   *B4,B4            ; |135| 

   [ A0]   BNOP    .S1     $C$L5,3           ; |134| 
|| [!A0]   ADD     .L1     4,A3,A6

           ADD     .L2     B10,B4,B5         ; |135| 
||         ADD     .S2     8,B10,B10         ; |134| 

   [ A0]   CALL    .S1     _atandp_c         ; |135| 
||         STDW    .D2T1   A5:A4,*B5         ; |135| 

           ; BRANCHCC OCCURS {$C$L5}         ; |134| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 2

           ZERO    .L2     B13
||         ZERO    .L1     A4                ; |82| 
||         LDW     .D1T1   *A6,A3
||         MVKH    .S1     _ti_math_vTable,A12
||         MVK     .S2     0xc9,B0
||         ZERO    .D2     B31

           SET     .S2     B13,0x14,0x1d,B13
||         ZERO    .L1     A31
||         ZERO    .L2     B12               ; |86| 
||         MV      .D2X    A11,B16

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains control code
;*----------------------------------------------------------------------------*
$C$L6:    
;          EXCLUSIVE CPU CYCLES: 18
           LDDW    .D2T2   *B16++,B7:B6      ; |78| 
           SET     .S1     A4,31,31,A8       ; |82| 
           ZERO    .L1     A5:A4             ; |81| 
           NOP             2

           MV      .L2     B6,B4             ; |81| 
||         MV      .S2     B7,B5             ; |81| 

           NOP             1
           CMPLTDP .S1X    B5:B4,A5:A4,A0    ; |81| 
           NOP             1
   [ A0]   XOR     .L2X    B5,A8,B7          ; |82| 
           CMPGTDP .S2     B7:B6,B13:B12,B1  ; |86| 

   [ A0]   ZERO    .L1     A0                ; |83| 
|| [!A0]   MVK     .S1     0xffffffff,A0     ; |77| 

   [!B1]   BNOP    .S1     $C$L7,1
||         RCPDP   .S2     B7:B6,B5:B4       ; |53| 
|| [ B1]   ZERO    .L1     A5
|| [ B1]   ZERO    .D1     A4                ; |53| 

           MPYDP   .M2     B7:B6,B5:B4,B9:B8 ; |53| 
   [!B1]   ZERO    .L1     A7                ; |79| 
   [ B1]   SET     .S1     A5,0x1e,0x1e,A5
   [!B1]   MVKL    .S2     0x5e9ecd56,B4
           ; BRANCHCC OCCURS {$C$L7}  
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 74
           MV      .L2X    A5,B19            ; |53| 
           ZERO    .L2     B18               ; |53| 
           MVK     .L1     0x2,A7            ; |88| 
           NOP             3
           SUBDP   .L2X    A5:A4,B9:B8,B9:B8 ; |53| 
           ZERO    .L1     A4                ; |53| 
           NOP             5
           MPYDP   .M2     B5:B4,B9:B8,B5:B4 ; |53| 
           NOP             9
           MPYDP   .M2     B7:B6,B5:B4,B9:B8 ; |53| 
           NOP             9
           SUBDP   .L2     B19:B18,B9:B8,B9:B8 ; |53| 
           NOP             6
           MPYDP   .M2     B5:B4,B9:B8,B5:B4 ; |53| 
           NOP             9
           MPYDP   .M2     B7:B6,B5:B4,B7:B6 ; |53| 
           NOP             9
           SUBDP   .L2X    A5:A4,B7:B6,B7:B6 ; |53| 
           NOP             6
           MPYDP   .M2     B5:B4,B7:B6,B7:B6 ; |53| 
           NOP             5
           MVKL    .S2     0x5e9ecd56,B4
;** --------------------------------------------------------------------------*
$C$L7:    
;          EXCLUSIVE CPU CYCLES: 11
           MVKL    .S2     0x3fd12614,B5
           MVKH    .S2     0x3fd12614,B5
           MVKH    .S2     0x5e9ecd56,B4
           CMPGTDP .S2     B7:B6,B5:B4,B1    ; |91| 
           NOP             1

   [!B1]   B       .S1     $C$L8             ; |91| 
||         MVKL    .S2     0x3ffbb67a,B5

           MVKL    .S2     0xe8584caa,B4
           MVKH    .S2     0x3ffbb67a,B5
           MVKH    .S2     0xe8584caa,B4
           ADDDP   .L2     B5:B4,B7:B6,B9:B8 ; |53| 
           NOP             1
           ; BRANCHCC OCCURS {$C$L8}         ; |91| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 91
           MV      .L1X    B12,A4            ; |53| 
           ZERO    .L1     A5
           SET     .S1     A5,0x1e,0x1e,A5
           ZERO    .L1     A17
           MV      .L1X    B12,A16           ; |53| 
           RCPDP   .S2     B9:B8,B5:B4       ; |53| 
           SET     .S1     A17,0x1e,0x1e,A17
           MPYDP   .M2     B5:B4,B9:B8,B19:B18 ; |53| 
           ADD     .L1     1,A7,A7           ; |92| 
           NOP             9
           SUBDP   .L1X    A5:A4,B19:B18,A5:A4 ; |53| 
           NOP             6
           MPYDP   .M1X    B5:B4,A5:A4,A5:A4 ; |53| 
           NOP             9
           MPYDP   .M1X    A5:A4,B9:B8,A9:A8 ; |53| 
           NOP             9
           SUBDP   .L1     A17:A16,A9:A8,A9:A8 ; |53| 
           NOP             6
           MPYDP   .M1     A5:A4,A9:A8,A5:A4 ; |53| 
           NOP             9
           NOP             1
           MPYDP   .M2X    A5:A4,B9:B8,B5:B4 ; |53| 
           MVKL    .S1     0xe8584caa,A8
           MVKL    .S1     0x3ffbb67a,A9
           MVKH    .S1     0xe8584caa,A8
           MVKH    .S1     0x3ffbb67a,A9
           MV      .L2     B12,B8            ; |53| 
           MV      .L2X    A17,B9            ; |53| 
           NOP             3

           SUBDP   .L2     B9:B8,B5:B4,B7:B6 ; |53| 
||         MPYDP   .M2X    A9:A8,B7:B6,B5:B4 ; |53| 

           MV      .S2     B13,B9            ; |53| 
           NOP             5
           MPYDP   .M2X    A5:A4,B7:B6,B7:B6 ; |53| 
           NOP             2
           SUBDP   .L2     B5:B4,B9:B8,B5:B4 ; |53| 
           NOP             6
           MPYDP   .M2     B5:B4,B7:B6,B7:B6 ; |53| 
;** --------------------------------------------------------------------------*
$C$L8:    
;          EXCLUSIVE CPU CYCLES: 19
           NOP             6
           MVKL    .S2     0x3e4fffff,B9
           MVKH    .S2     0x3e4fffff,B9
           MVK     .S2     0xffffedec,B8     ; |102| 
           ABSDP   .S2     B7:B6,B5:B4       ; |102| 
           NOP             1

           CMPGTDP .S2     B5:B4,B9:B8,B1    ; |102| 
||         MPYDP   .M2     B5:B4,B5:B4,B5:B4 ; |53| 

           NOP             1

   [!B1]   BNOP    .S1     $C$L9,2           ; |102| 
|| [ B1]   MVKL    .S2     0x402e0c49,B9

   [ B1]   MVKL    .S2     0xe14ac710,B8
   [ B1]   MVKH    .S2     0x402e0c49,B9
   [ B1]   MVKH    .S2     0xe14ac710,B8
           ; BRANCHCC OCCURS {$C$L9}         ; |102| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 166
           MVKL    .S1     0x404dca0a,A5
           MVKL    .S1     0x320da3d7,A4
           ADDDP   .L2     B9:B8,B5:B4,B9:B8 ; |53| 
           MVKH    .S1     0x404dca0a,A5
           MVKH    .S1     0x320da3d7,A4
           MVKL    .S2     0x40558a12,B19
           MVKL    .S2     0x40b6da5,B18
           MVKH    .S2     0x40558a12,B19
           MVKH    .S2     0x40b6da5,B18
           MPYDP   .M2     B5:B4,B9:B8,B9:B8 ; |53| 
           MV      .L1X    B12,A18           ; |53| 
           ZERO    .L1     A19
           SET     .S1     A19,0x1e,0x1e,A19
           NOP             6
           ADDDP   .L2X    A5:A4,B9:B8,B9:B8 ; |53| 
           MVKL    .S1     0x4044887c,A5
           MVKL    .S1     0xbcc495a9,A4
           MVKH    .S1     0x4044887c,A5
           MVKH    .S1     0xbcc495a9,A4
           NOP             2
           MPYDP   .M2     B5:B4,B9:B8,B9:B8 ; |53| 
           NOP             9
           ADDDP   .L2     B19:B18,B9:B8,B9:B8 ; |53| 
           SET     .S2     B31,0x1e,0x1e,B19
           MV      .L2     B12,B18           ; |53| 
           NOP             4
           MPYDP   .M2     B5:B4,B9:B8,B9:B8 ; |53| 
           NOP             9
           NOP             1
           ADDDP   .L1X    A5:A4,B9:B8,A9:A8 ; |53| 
           MVKL    .S2     0xbfeacd7a,B9
           MVKL    .S2     0xd9b187bd,B8
           MVKH    .S2     0xbfeacd7a,B9
           MVKH    .S2     0xd9b187bd,B8
           MPYDP   .M2     B9:B8,B5:B4,B9:B8 ; |53| 
           NOP             1
           RCPDP   .S1     A9:A8,A5:A4       ; |53| 
           NOP             1
           MPYDP   .M1     A5:A4,A9:A8,A17:A16 ; |53| 
           NOP             9
           SUBDP   .L1     A19:A18,A17:A16,A17:A16 ; |53| 
           MVKL    .S1     0xc020fd3f,A19
           MVKL    .S1     0x5c8d6a63,A18
           MVKH    .S1     0xc020fd3f,A19
           MVKH    .S1     0x5c8d6a63,A18
           NOP             2
           MPYDP   .M1     A5:A4,A17:A16,A5:A4 ; |53| 
           ADDDP   .L2X    A19:A18,B9:B8,B9:B8 ; |53| 
           MV      .L1X    B12,A18           ; |53| 
           SET     .S1     A31,0x1e,0x1e,A19
           NOP             6
           MPYDP   .M1     A5:A4,A9:A8,A17:A16 ; |53| 
           MPYDP   .M2     B5:B4,B9:B8,B9:B8 ; |53| 
           NOP             8
           SUBDP   .L1X    B19:B18,A17:A16,A17:A16 ; |53| 
           MVKL    .S2     0xc034817f,B19
           MVKL    .S2     0xb9e2bccb,B18
           MVKH    .S2     0xc034817f,B19
           MVKH    .S2     0xb9e2bccb,B18
           ADDDP   .L2     B19:B18,B9:B8,B9:B8 ; |53| 
           NOP             1
           MPYDP   .M1     A5:A4,A17:A16,A17:A16 ; |53| 
           NOP             9
           MPYDP   .M1     A17:A16,A9:A8,A5:A4 ; |53| 
           MPYDP   .M2     B5:B4,B9:B8,B9:B8 ; |53| 
           NOP             4
           MVKL    .S1     0xc02b60a6,A9
           MVKL    .S1     0x51061ce2,A8
           MVKH    .S1     0xc02b60a6,A9
           MVKH    .S1     0x51061ce2,A8
           SUBDP   .L1     A19:A18,A5:A4,A5:A4 ; |53| 
           ADDDP   .L2X    A9:A8,B9:B8,B9:B8 ; |53| 
           NOP             5
           MPYDP   .M1     A17:A16,A5:A4,A5:A4 ; |53| 
           MPYDP   .M2     B5:B4,B9:B8,B5:B4 ; |53| 
           NOP             9
           MPYDP   .M2X    B5:B4,A5:A4,B5:B4 ; |53| 
           NOP             9
           MPYDP   .M2     B7:B6,B5:B4,B5:B4 ; |53| 
           NOP             9
           ADDDP   .L2     B5:B4,B7:B6,B7:B6 ; |53| 
;** --------------------------------------------------------------------------*
$C$L9:    
;          EXCLUSIVE CPU CYCLES: 18

           SUB     .S2     B0,1,B0           ; |137| 
|| [!A0]   MV      .L1X    B12,A8            ; |117| 

           CMPLT   .L1     A7,2,A1           ; |117| 
           LDDW    .D1T1   *+A12[A7],A5:A4   ; |117| 
   [!B0]   ADD     .L1     4,A6,A10
           MV      .S2     B12,B4
           SET     .S2     B4,31,31,B5       ; |117| 

   [!A1]   MV      .L2     B6,B4             ; |117| 
|| [!A1]   XOR     .S2     B7,B5,B5          ; |117| 
|| [ A1]   MV      .D2     B7,B5             ; |117| 

   [ A1]   MV      .L2     B6,B4             ; |117| 
   [ B0]   ZERO    .L2     B13
           ADDDP   .L1X    A5:A4,B5:B4,A5:A4 ; |117| 
   [!A0]   SET     .S1     A8,31,31,A8       ; |117| 
   [ B0]   SET     .S2     B13,0x14,0x1d,B13
   [ B0]   BNOP    .S1     $C$L6,3           ; |137| 
   [!A0]   XOR     .L1     A5,A8,A5          ; |117| 

   [!B0]   CALL    .S1     _atandp_v         ; |140| 
||         STDW    .D1T1   A5:A4,*A3++       ; |117| 
|| [ B0]   ZERO    .L1     A4                ; |82| 

           ; BRANCHCC OCCURS {$C$L6}         ; |137| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           LDW     .D1T2   *A10,B4           ; |140| 
           MV      .L1     A11,A4            ; |140| 
           MVK     .S1     0xc9,A6           ; |140| 
           ADDKPC  .S2     $C$RL8,B3,1       ; |140| 
$C$RL8:    ; CALL OCCURS {_atandp_v} {0}     ; |140| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 16
           MVKL    .S2     0x3e112e0b,B5
           MVKL    .S2     0xe826d695,B4
           MVKH    .S2     0x3e112e0b,B5
           MVKH    .S2     0xe826d695,B4

           CALLP   .S2     _allequal,B3
||         MVK     .S1     0xc9,A4           ; |143| 

$C$RL9:    ; CALL OCCURS {_allequal} {0}     ; |143| 

           CALLP   .S2     _print_test_results,B3
||         MVK     .L1     0x1,A4            ; |144| 

$C$RL10:   ; CALL OCCURS {_print_test_results} {0}  ; |144| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 9
           MVKL    .S1     _a_sc,A13

           MVKH    .S1     _a_sc,A13
||         MVK     .L2     0xffffffff,B5     ; |157| 

           STDW    .D1T2   B13:B12,*+A13(32) ; |155| 
||         MV      .L2     B5,B4             ; |157| 
||         ZERO    .S2     B9

           STDW    .D1T2   B5:B4,*+A13(48)   ; |157| 
||         MVKH    .S2     0xfff00000,B9
||         ZERO    .L1     A5
||         ZERO    .L2     B8                ; |154| 

           STDW    .D1T2   B9:B8,*+A13(24)   ; |154| 
||         SET     .S1     A5,0x14,0x1e,A5
||         ZERO    .L2     B7
||         ZERO    .L1     A4                ; |153| 

           STDW    .D1T1   A5:A4,*+A13(16)   ; |153| 
||         MVKH    .S2     0xbff00000,B7
||         ZERO    .L2     B17
||         ZERO    .D2     B6                ; |156| 

           MVK     .L2     0x7,B4
||         STDW    .D1T2   B7:B6,*+A13(40)   ; |156| 
||         MVKH    .S2     0x80000000,B17
||         ZERO    .D2     B16               ; |152| 

           STDW    .D1T2   B17:B16,*+A13(8)  ; |152| 
||         ZERO    .L1     A7:A6             ; |151| 

           MV      .L1X    B4,A15            ; |152| 
||         STDW    .D1T1   A7:A6,*A13        ; |151| 
||         SUB     .L2X    A13,8,B12
||         ZERO    .S2     B10

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
;          EXCLUSIVE CPU CYCLES: 7
           LDDW    .D2T2   *++B12,B5:B4      ; |159| 
           CALL    .S1     _atan             ; |159| 
           ADDKPC  .S2     $C$RL11,B3,2      ; |159| 
           MV      .L1X    B4,A4             ; |159| 
           MV      .L1X    B5,A5             ; |159| 
$C$RL11:   ; CALL OCCURS {_atan} {0}         ; |159| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 34
           MVKL    .S1     _output,A14
           MVKH    .S1     _output,A14
           LDW     .D1T2   *A14,B4           ; |159| 
           NOP             4
           ADD     .L2     B10,B4,B4         ; |159| 
           STDW    .D2T1   A5:A4,*B4         ; |159| 

           CALLP   .S2     _atandp,B3
||         LDDW    .D2T1   *B12,A5:A4        ; |160| 

$C$RL12:   ; CALL OCCURS {_atandp} {0}       ; |160| 
           LDW     .D1T1   *+A14(4),A3       ; |160| 
           NOP             4
           ADD     .L2X    B10,A3,B4         ; |160| 
           STDW    .D2T1   A5:A4,*B4         ; |160| 
           LDDW    .D2T2   *B12,B5:B4        ; |161| 
           NOP             4
           MV      .L1X    B4,A4             ; |161| 

           CALLP   .S2     _atandp_c,B3
||         MV      .L1X    B5,A5             ; |161| 

$C$RL13:   ; CALL OCCURS {_atandp_c} {0}     ; |161| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 25
           LDW     .D1T1   *+A14(8),A3       ; |161| 
           MV      .L2     B13,B9            ; |81| 
           ZERO    .L2     B8                ; |82| 
           SET     .S2     B8,31,31,B31      ; |82| 
           NOP             1
           ADD     .L2X    B10,A3,B4         ; |161| 
           STDW    .D2T1   A5:A4,*B4         ; |161| 
           LDDW    .D2T2   *B12,B7:B6        ; |78| 
           ZERO    .L1     A5:A4             ; |81| 
           NOP             3

           MV      .L2     B7,B5             ; |81| 
||         MV      .S2     B6,B4             ; |81| 

           NOP             1
           CMPLTDP .S1X    B5:B4,A5:A4,A0    ; |81| 
           NOP             1

   [!A0]   MVK     .L2     0xffffffff,B0     ; |77| 
|| [ A0]   XOR     .S2     B5,B31,B7         ; |82| 

           CMPGTDP .S2     B7:B6,B9:B8,B1    ; |86| 
   [ A0]   ZERO    .L2     B0                ; |82| 

   [!B1]   BNOP    .S1     $C$L11,1
|| [!B1]   MV      .L1X    B8,A11            ; |86| 
||         RCPDP   .S2     B7:B6,B9:B8       ; |53| 

           MPYDP   .M2     B7:B6,B9:B8,B5:B4 ; |53| 
   [ B1]   ZERO    .L1     A5
   [ B1]   ZERO    .L1     A4                ; |53| 
   [ B1]   SET     .S1     A5,0x1e,0x1e,A5
           ; BRANCHCC OCCURS {$C$L11}  
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 68
           NOP             6
           SUBDP   .L2X    A5:A4,B5:B4,B5:B4 ; |53| 
           NOP             6
           MPYDP   .M2     B9:B8,B5:B4,B5:B4 ; |53| 
           NOP             9
           MPYDP   .M2     B7:B6,B5:B4,B9:B8 ; |53| 
           NOP             8

           ZERO    .L2     B16               ; |53| 
||         MV      .S2X    A5,B17            ; |53| 

           SUBDP   .L2     B17:B16,B9:B8,B9:B8 ; |53| 
           NOP             6
           MPYDP   .M2     B5:B4,B9:B8,B5:B4 ; |53| 
           NOP             9
           MPYDP   .M2     B7:B6,B5:B4,B7:B6 ; |53| 
           NOP             9
           SUBDP   .L2X    A5:A4,B7:B6,B7:B6 ; |53| 
           NOP             6

           MPYDP   .M2     B5:B4,B7:B6,B7:B6 ; |53| 
||         MVK     .L1     0x2,A11           ; |88| 

;** --------------------------------------------------------------------------*
$C$L11:    
;          EXCLUSIVE CPU CYCLES: 18
           NOP             6
           MVKL    .S2     0x3fd12614,B5
           MVKL    .S2     0x5e9ecd56,B4
           MVKH    .S2     0x3fd12614,B5
           MVKH    .S2     0x5e9ecd56,B4
           CMPGTDP .S2     B7:B6,B5:B4,B1    ; |91| 
           NOP             1

   [!B1]   B       .S1     $C$L12            ; |91| 
||         MVKL    .S2     0x3ffbb67a,B5

           MVKL    .S2     0xe8584caa,B4
           MVKH    .S2     0x3ffbb67a,B5
           MVKH    .S2     0xe8584caa,B4
           ADDDP   .L2     B5:B4,B7:B6,B9:B8 ; |53| 
           NOP             1
           ; BRANCHCC OCCURS {$C$L12}        ; |91| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 91
           ZERO    .L1     A4                ; |53| 
           ZERO    .L1     A5
           SET     .S1     A5,0x1e,0x1e,A5
           ZERO    .L1     A9
           ZERO    .L1     A8                ; |53| 
           RCPDP   .S2     B9:B8,B5:B4       ; |53| 
           SET     .S1     A9,0x1e,0x1e,A9
           MPYDP   .M2     B5:B4,B9:B8,B17:B16 ; |53| 
           ADD     .L1     1,A11,A11         ; |92| 
           NOP             9
           SUBDP   .L1X    A5:A4,B17:B16,A5:A4 ; |53| 
           NOP             6
           MPYDP   .M1X    B5:B4,A5:A4,A5:A4 ; |53| 
           NOP             9
           MPYDP   .M1X    A5:A4,B9:B8,A7:A6 ; |53| 
           NOP             9
           SUBDP   .L1     A9:A8,A7:A6,A7:A6 ; |53| 
           NOP             6
           MPYDP   .M1     A5:A4,A7:A6,A5:A4 ; |53| 
           NOP             9
           NOP             1
           MPYDP   .M2X    A5:A4,B9:B8,B5:B4 ; |53| 
           MVKL    .S1     0xe8584caa,A6
           MVKL    .S1     0x3ffbb67a,A7
           MVKH    .S1     0xe8584caa,A6
           MVKH    .S1     0x3ffbb67a,A7
           MV      .L2X    A9,B9             ; |53| 
           MV      .L2X    A8,B8             ; |53| 
           MPYDP   .M2X    A7:A6,B7:B6,B7:B6 ; |53| 
           NOP             2
           SUBDP   .L2     B9:B8,B5:B4,B5:B4 ; |53| 
           MV      .S2     B13,B9            ; |53| 
           NOP             5
           MPYDP   .M2X    A5:A4,B5:B4,B5:B4 ; |53| 
           SUBDP   .L2     B7:B6,B9:B8,B7:B6 ; |53| 
           NOP             8
           MPYDP   .M2     B7:B6,B5:B4,B7:B6 ; |53| 
;** --------------------------------------------------------------------------*
$C$L12:    
;          EXCLUSIVE CPU CYCLES: 22
           ZERO    .L1     A3                ; |99| 
           ZERO    .L1     A5:A4             ; |98| 
           SET     .S1     A3,31,31,A3       ; |99| 
           NOP             5
           MVKL    .S2     0x3e4fffff,B9

           MV      .L2     B6,B4             ; |96| 
||         MV      .S2     B7,B5             ; |96| 

           MVKH    .S2     0x3e4fffff,B9
           CMPLTDP .S1X    B5:B4,A5:A4,A0    ; |98| 
           MVK     .S2     0xffffedec,B8     ; |102| 
   [ A0]   XOR     .L2X    B5,A3,B5          ; |99| 

           CMPGTDP .S2     B5:B4,B9:B8,B1    ; |102| 
||         MPYDP   .M2     B5:B4,B5:B4,B5:B4 ; |53| 

           NOP             1

   [!B1]   BNOP    .S1     $C$L13,2          ; |102| 
|| [ B1]   MVKL    .S2     0x402e0c49,B9

   [ B1]   MVKL    .S2     0xe14ac710,B8
   [ B1]   MVKH    .S2     0x402e0c49,B9
   [ B1]   MVKH    .S2     0xe14ac710,B8
           ; BRANCHCC OCCURS {$C$L13}        ; |102| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 166
           MVKL    .S1     0x404dca0a,A5
           MVKL    .S1     0x320da3d7,A4
           ADDDP   .L2     B9:B8,B5:B4,B9:B8 ; |53| 
           MVKH    .S1     0x404dca0a,A5
           MVKH    .S1     0x320da3d7,A4
           ZERO    .L1     A16               ; |53| 
           ZERO    .L1     A17
           SET     .S1     A17,0x1e,0x1e,A17
           ZERO    .S2     B31
           MPYDP   .M2     B5:B4,B9:B8,B9:B8 ; |53| 
           ZERO    .L1     A31
           NOP             8
           ADDDP   .L2X    A5:A4,B9:B8,B9:B8 ; |53| 
           MVKL    .S1     0x4044887c,A5
           MVKL    .S1     0xbcc495a9,A4
           MVKH    .S1     0x4044887c,A5
           MVKH    .S1     0xbcc495a9,A4
           NOP             2
           MPYDP   .M2     B5:B4,B9:B8,B17:B16 ; |53| 
           NOP             5
           MVKL    .S2     0x40558a12,B9
           MVKL    .S2     0x40b6da5,B8
           MVKH    .S2     0x40558a12,B9
           MVKH    .S2     0x40b6da5,B8
           ADDDP   .L2     B9:B8,B17:B16,B9:B8 ; |53| 
           ZERO    .S2     B16               ; |53| 
           SET     .S2     B31,0x1e,0x1e,B17
           NOP             4
           MPYDP   .M2     B5:B4,B9:B8,B9:B8 ; |53| 
           NOP             9
           NOP             1
           ADDDP   .L1X    A5:A4,B9:B8,A5:A4 ; |53| 
           MVKL    .S2     0xbfeacd7a,B9
           MVKL    .S2     0xd9b187bd,B8
           MVKH    .S2     0xbfeacd7a,B9
           MVKH    .S2     0xd9b187bd,B8
           MPYDP   .M2     B9:B8,B5:B4,B9:B8 ; |53| 
           NOP             1
           RCPDP   .S1     A5:A4,A7:A6       ; |53| 
           NOP             1
           MPYDP   .M1     A7:A6,A5:A4,A9:A8 ; |53| 
           NOP             9
           SUBDP   .L1     A17:A16,A9:A8,A9:A8 ; |53| 
           MVKL    .S1     0xc020fd3f,A17
           MVKL    .S1     0x5c8d6a63,A16
           MVKH    .S1     0xc020fd3f,A17
           MVKH    .S1     0x5c8d6a63,A16
           NOP             2
           MPYDP   .M1     A7:A6,A9:A8,A7:A6 ; |53| 
           ADDDP   .L2X    A17:A16,B9:B8,B9:B8 ; |53| 
           MVKL    .S1     0xc02b60a6,A17
           MVKL    .S1     0x51061ce2,A16
           MVKH    .S1     0xc02b60a6,A17
           MVKH    .S1     0x51061ce2,A16
           NOP             4
           MPYDP   .M1     A7:A6,A5:A4,A9:A8 ; |53| 
           NOP             9
           SUBDP   .L1X    B17:B16,A9:A8,A9:A8 ; |53| 
           MPYDP   .M2     B5:B4,B9:B8,B17:B16 ; |53| 
           NOP             4
           MVKL    .S2     0xc034817f,B9
           MPYDP   .M1     A9:A8,A7:A6,A7:A6 ; |53| 
           MVKL    .S2     0xb9e2bccb,B8
           MVKH    .S2     0xc034817f,B9
           MVKH    .S2     0xb9e2bccb,B8
           ADDDP   .L2     B9:B8,B17:B16,B9:B8 ; |53| 
           ZERO    .L1     A8                ; |53| 
           SET     .S1     A31,0x1e,0x1e,A9
           NOP             3
           MPYDP   .M1     A7:A6,A5:A4,A5:A4 ; |53| 
           MPYDP   .M2     B5:B4,B9:B8,B9:B8 ; |53| 
           NOP             8
           SUBDP   .L1     A9:A8,A5:A4,A5:A4 ; |53| 
           ADDDP   .L2X    A17:A16,B9:B8,B9:B8 ; |53| 
           NOP             5
           MPYDP   .M1     A7:A6,A5:A4,A5:A4 ; |53| 
           MPYDP   .M2     B5:B4,B9:B8,B5:B4 ; |53| 
           NOP             9
           MPYDP   .M2X    B5:B4,A5:A4,B5:B4 ; |53| 
           NOP             9
           MPYDP   .M2     B5:B4,B7:B6,B5:B4 ; |107| 
           NOP             9
           ADDDP   .L2     B5:B4,B7:B6,B7:B6 ; |107| 
;** --------------------------------------------------------------------------*
$C$L13:    
;          EXCLUSIVE CPU CYCLES: 17

           MVK     .S2     12,B31
||         SUB     .L1     A15,1,A2          ; |158| 

           CMPLT   .L1     A11,2,A0          ; |110| 
           LDDW    .D1T1   *+A12[A11],A5:A4  ; |114| 
           SUB     .L1     A15,1,A15         ; |158| 
           ZERO    .S2     B4                ; |111| 
           SET     .S2     B4,31,31,B4       ; |111| 

   [!A0]   XOR     .L2     B7,B4,B7          ; |111| 
||         ADD     .S2X    A14,B31,B4

           LDW     .D2T2   *B4,B4            ; |162| 
           ADDDP   .L1X    A5:A4,B7:B6,A5:A4 ; |114| 
   [!B0]   ZERO    .S1     A3                ; |117| 
   [!B0]   SET     .S1     A3,31,31,A3       ; |117| 
   [ A2]   BNOP    .S1     $C$L10,1          ; |158| 
           ADD     .L2     B10,B4,B5         ; |162| 
           ADD     .L2     8,B10,B10         ; |158| 
   [!B0]   XOR     .L1     A5,A3,A5          ; |117| 

   [!A2]   CALL    .S1     _atandp_v         ; |164| 
||         STDW    .D2T1   A5:A4,*B5         ; |162| 

           ; BRANCHCC OCCURS {$C$L10}        ; |158| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           LDW     .D1T2   *A10,B4           ; |164| 
           MV      .L1     A13,A4
           MVK     .L1     0x7,A6            ; |164| 
           ADDKPC  .S2     $C$RL14,B3,1      ; |164| 
$C$RL14:   ; CALL OCCURS {_atandp_v} {0}     ; |164| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 16
           MVKL    .S2     0x3e112e0b,B5
           MVKL    .S2     0xe826d695,B4
           MVKH    .S2     0x3e112e0b,B5
           MVKH    .S2     0xe826d695,B4

           CALLP   .S2     _allequal,B3
||         MVK     .L1     0x7,A4            ; |167| 

$C$RL15:   ; CALL OCCURS {_allequal} {0}     ; |167| 

           CALLP   .S2     _print_test_results,B3
||         MVK     .L1     0x3,A4            ; |168| 

$C$RL16:   ; CALL OCCURS {_print_test_results} {0}  ; |168| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 3

           ZERO    .L2     B5
||         MVKL    .S1     _a_ext,A13

           SET     .S2     B5,0x14,0x14,B5
||         MVKH    .S1     _a_ext,A13
||         ZERO    .L2     B4                ; |171| 

           CALL    .S2     _atan             ; |173| 
||         STDW    .D1T2   B5:B4,*A13        ; |171| 
||         MV      .L1     A13,A14           ; |171| 
||         MVK     .S1     0x777,A15
||         ZERO    .L2     B10               ; |171| 

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
           LDDW    .D1T1   *A14,A5:A4        ; |173| 
           ADDKPC  .S2     $C$RL17,B3,3      ; |173| 
$C$RL17:   ; CALL OCCURS {_atan} {0}         ; |173| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 30
           MVKL    .S1     _output,A3
           MVKH    .S1     _output,A3
           LDW     .D1T1   *A3,A3            ; |173| 
           NOP             4
           ADD     .L1X    B10,A3,A3         ; |173| 
           STDW    .D1T1   A5:A4,*A3         ; |173| 

           CALLP   .S2     _atandp,B3
||         LDDW    .D1T1   *A14,A5:A4        ; |174| 

$C$RL18:   ; CALL OCCURS {_atandp} {0}       ; |174| 
           MVKL    .S1     _output,A3
           MVKH    .S1     _output,A3
           LDW     .D1T1   *+A3(4),A3        ; |174| 
           NOP             4
           ADD     .L1X    B10,A3,A3         ; |174| 
           STDW    .D1T1   A5:A4,*A3         ; |174| 

           CALLP   .S2     _atandp_c,B3
||         LDDW    .D1T1   *A14,A5:A4        ; |175| 

$C$RL19:   ; CALL OCCURS {_atandp_c} {0}     ; |175| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 27
           MVKL    .S1     _output,A3
           MVKH    .S1     _output,A3
           LDW     .D1T1   *+A3(8),A3        ; |175| 
           MV      .L2     B13,B7            ; |81| 
           ZERO    .L2     B6                ; |82| 
           SET     .S2     B6,31,31,B31      ; |82| 
           NOP             1
           ADD     .L2X    B10,A3,B4         ; |175| 
           STDW    .D2T1   A5:A4,*B4         ; |175| 
           LDDW    .D1T2   *A14,B9:B8        ; |78| 
           ZERO    .L1     A5:A4             ; |81| 
           NOP             3

           MV      .L2     B9,B5             ; |81| 
||         MV      .S2     B8,B4             ; |81| 

           NOP             1
           CMPLTDP .S1X    B5:B4,A5:A4,A0    ; |81| 
           NOP             1

   [!A0]   MVK     .L2     0xffffffff,B0     ; |77| 
|| [ A0]   XOR     .S2     B5,B31,B9         ; |82| 

           CMPGTDP .S2     B9:B8,B7:B6,B1    ; |86| 
   [ A0]   ZERO    .L2     B0                ; |82| 

   [!B1]   BNOP    .S1     $C$L15,1
||         RCPDP   .S2     B9:B8,B5:B4       ; |53| 
|| [!B1]   MV      .L1X    B6,A11            ; |86| 
|| [ B1]   ZERO    .D1     A5

           MPYDP   .M2     B9:B8,B5:B4,B7:B6 ; |53| 
   [ B1]   ZERO    .L1     A4                ; |53| 
   [ B1]   SET     .S1     A5,0x1e,0x1e,A5
   [!B1]   MVKL    .S2     0x5e9ecd56,B4
           ; BRANCHCC OCCURS {$C$L15}  
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 74
           MV      .L2X    A5,B17            ; |53| 
           ZERO    .L2     B16               ; |53| 
           MVK     .L1     0x2,A11           ; |88| 
           NOP             3
           SUBDP   .L2X    A5:A4,B7:B6,B7:B6 ; |53| 
           NOP             6
           MPYDP   .M2     B5:B4,B7:B6,B5:B4 ; |53| 
           NOP             9
           MPYDP   .M2     B9:B8,B5:B4,B7:B6 ; |53| 
           NOP             9
           SUBDP   .L2     B17:B16,B7:B6,B7:B6 ; |53| 
           NOP             6
           MPYDP   .M2     B5:B4,B7:B6,B5:B4 ; |53| 
           NOP             9
           MPYDP   .M2     B9:B8,B5:B4,B7:B6 ; |53| 
           NOP             9
           SUBDP   .L2X    A5:A4,B7:B6,B7:B6 ; |53| 
           NOP             6
           MPYDP   .M2     B5:B4,B7:B6,B9:B8 ; |53| 
           NOP             5
           MVKL    .S2     0x5e9ecd56,B4
;** --------------------------------------------------------------------------*
$C$L15:    
;          EXCLUSIVE CPU CYCLES: 11
           MVKL    .S2     0x3fd12614,B5
           MVKH    .S2     0x3fd12614,B5
           MVKH    .S2     0x5e9ecd56,B4
           CMPGTDP .S2     B9:B8,B5:B4,B1    ; |91| 
           NOP             1

   [!B1]   B       .S1     $C$L16            ; |91| 
||         MVKL    .S2     0x3ffbb67a,B5

           MVKL    .S2     0xe8584caa,B4
           MVKH    .S2     0x3ffbb67a,B5
           MVKH    .S2     0xe8584caa,B4
           ADDDP   .L2     B5:B4,B9:B8,B5:B4 ; |53| 
           NOP             1
           ; BRANCHCC OCCURS {$C$L16}        ; |91| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 91
           ZERO    .L1     A4                ; |53| 
           ZERO    .L1     A5
           SET     .S1     A5,0x1e,0x1e,A5
           ZERO    .L1     A9
           ZERO    .L1     A8                ; |53| 
           RCPDP   .S2     B5:B4,B7:B6       ; |53| 
           SET     .S1     A9,0x1e,0x1e,A9
           MPYDP   .M2     B7:B6,B5:B4,B17:B16 ; |53| 
           ADD     .L1     1,A11,A11         ; |92| 
           NOP             9
           SUBDP   .L1X    A5:A4,B17:B16,A5:A4 ; |53| 
           NOP             6
           MPYDP   .M1X    B7:B6,A5:A4,A5:A4 ; |53| 
           NOP             9
           MPYDP   .M1X    A5:A4,B5:B4,A7:A6 ; |53| 
           ZERO    .L2     B6                ; |53| 
           MV      .L2X    A9,B7             ; |53| 
           NOP             7
           SUBDP   .L1     A9:A8,A7:A6,A7:A6 ; |53| 
           NOP             6
           MPYDP   .M1     A5:A4,A7:A6,A5:A4 ; |53| 
           NOP             9
           NOP             1
           MPYDP   .M2X    A5:A4,B5:B4,B5:B4 ; |53| 
           MVKL    .S1     0xe8584caa,A6
           MVKL    .S1     0x3ffbb67a,A7
           MVKH    .S1     0xe8584caa,A6
           MVKH    .S1     0x3ffbb67a,A7
           NOP             5

           SUBDP   .L2     B7:B6,B5:B4,B7:B6 ; |53| 
||         MPYDP   .M2X    A7:A6,B9:B8,B5:B4 ; |53| 

           NOP             5
           MV      .S2X    A8,B8             ; |53| 
           MPYDP   .M2X    A5:A4,B7:B6,B7:B6 ; |53| 
           MV      .L2     B13,B9            ; |53| 
           NOP             1
           SUBDP   .L2     B5:B4,B9:B8,B5:B4 ; |53| 
           NOP             6
           MPYDP   .M2     B5:B4,B7:B6,B9:B8 ; |53| 
;** --------------------------------------------------------------------------*
$C$L16:    
;          EXCLUSIVE CPU CYCLES: 22
           ZERO    .L1     A3                ; |99| 
           ZERO    .L1     A5:A4             ; |98| 
           SET     .S1     A3,31,31,A3       ; |99| 
           MVKL    .S2     0x3e4fffff,B7
           MVKH    .S2     0x3e4fffff,B7
           MVK     .S2     0xffffedec,B6     ; |102| 
           NOP             3

           MV      .L2     B9,B5             ; |96| 
||         MV      .S2     B8,B4             ; |96| 

           NOP             1
           CMPLTDP .S1X    B5:B4,A5:A4,A0    ; |98| 
           NOP             1
   [ A0]   XOR     .L2X    B5,A3,B5          ; |99| 

           CMPGTDP .S2     B5:B4,B7:B6,B1    ; |102| 
||         MPYDP   .M2     B5:B4,B5:B4,B5:B4 ; |53| 

           NOP             1

   [!B1]   BNOP    .S1     $C$L17,2          ; |102| 
|| [ B1]   MVKL    .S2     0x402e0c49,B7

   [ B1]   MVKL    .S2     0xe14ac710,B6
   [ B1]   MVKH    .S2     0x402e0c49,B7
   [ B1]   MVKH    .S2     0xe14ac710,B6
           ; BRANCHCC OCCURS {$C$L17}        ; |102| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 166
           MVKL    .S1     0x404dca0a,A5
           MVKL    .S1     0x320da3d7,A4
           ADDDP   .L2     B7:B6,B5:B4,B7:B6 ; |53| 
           MVKH    .S1     0x404dca0a,A5
           MVKH    .S1     0x320da3d7,A4
           ZERO    .L1     A16               ; |53| 
           ZERO    .L1     A17
           SET     .S1     A17,0x1e,0x1e,A17
           ZERO    .S2     B31
           MPYDP   .M2     B5:B4,B7:B6,B7:B6 ; |53| 
           ZERO    .L1     A31
           NOP             8
           ADDDP   .L2X    A5:A4,B7:B6,B7:B6 ; |53| 
           MVKL    .S1     0x4044887c,A5
           MVKL    .S1     0xbcc495a9,A4
           MVKH    .S1     0x4044887c,A5
           MVKH    .S1     0xbcc495a9,A4
           NOP             2
           MPYDP   .M2     B5:B4,B7:B6,B17:B16 ; |53| 
           NOP             5
           MVKL    .S2     0x40558a12,B7
           MVKL    .S2     0x40b6da5,B6
           MVKH    .S2     0x40558a12,B7
           MVKH    .S2     0x40b6da5,B6
           ADDDP   .L2     B7:B6,B17:B16,B7:B6 ; |53| 
           ZERO    .S2     B16               ; |53| 
           SET     .S2     B31,0x1e,0x1e,B17
           NOP             4
           MPYDP   .M2     B5:B4,B7:B6,B7:B6 ; |53| 
           NOP             9
           NOP             1
           ADDDP   .L1X    A5:A4,B7:B6,A5:A4 ; |53| 
           MVKL    .S2     0xbfeacd7a,B7
           MVKL    .S2     0xd9b187bd,B6
           MVKH    .S2     0xbfeacd7a,B7
           MVKH    .S2     0xd9b187bd,B6
           MPYDP   .M2     B7:B6,B5:B4,B7:B6 ; |53| 
           NOP             1
           RCPDP   .S1     A5:A4,A7:A6       ; |53| 
           NOP             1
           MPYDP   .M1     A7:A6,A5:A4,A9:A8 ; |53| 
           NOP             9
           SUBDP   .L1     A17:A16,A9:A8,A9:A8 ; |53| 
           MVKL    .S1     0xc020fd3f,A17
           MVKL    .S1     0x5c8d6a63,A16
           MVKH    .S1     0xc020fd3f,A17
           MVKH    .S1     0x5c8d6a63,A16
           NOP             2
           MPYDP   .M1     A7:A6,A9:A8,A7:A6 ; |53| 
           ADDDP   .L2X    A17:A16,B7:B6,B7:B6 ; |53| 
           ZERO    .L1     A16               ; |53| 
           SET     .S1     A31,0x1e,0x1e,A17
           NOP             6
           MPYDP   .M1     A7:A6,A5:A4,A9:A8 ; |53| 
           NOP             9
           SUBDP   .L1X    B17:B16,A9:A8,A9:A8 ; |53| 
           MPYDP   .M2     B5:B4,B7:B6,B17:B16 ; |53| 
           NOP             4
           MVKL    .S2     0xc034817f,B7
           MPYDP   .M1     A9:A8,A7:A6,A7:A6 ; |53| 
           MVKL    .S2     0xb9e2bccb,B6
           MVKH    .S2     0xc034817f,B7
           MVKH    .S2     0xb9e2bccb,B6
           ADDDP   .L2     B7:B6,B17:B16,B7:B6 ; |53| 
           MVKL    .S1     0xc02b60a6,A9
           MVKL    .S1     0x51061ce2,A8
           MVKH    .S1     0xc02b60a6,A9
           MVKH    .S1     0x51061ce2,A8
           NOP             1
           MPYDP   .M1     A7:A6,A5:A4,A5:A4 ; |53| 
           MPYDP   .M2     B5:B4,B7:B6,B7:B6 ; |53| 
           NOP             8
           SUBDP   .L1     A17:A16,A5:A4,A5:A4 ; |53| 
           ADDDP   .L2X    A9:A8,B7:B6,B7:B6 ; |53| 
           NOP             5
           MPYDP   .M1     A7:A6,A5:A4,A5:A4 ; |53| 
           MPYDP   .M2     B5:B4,B7:B6,B5:B4 ; |53| 
           NOP             9
           MPYDP   .M2X    B5:B4,A5:A4,B5:B4 ; |53| 
           NOP             9
           MPYDP   .M2     B5:B4,B9:B8,B5:B4 ; |107| 
           NOP             9
           ADDDP   .L2     B5:B4,B9:B8,B9:B8 ; |107| 
;** --------------------------------------------------------------------------*
$C$L17:    
;          EXCLUSIVE CPU CYCLES: 32
           MVKL    .S2     _output+12,B6
           CMPLT   .L1     A11,2,A0          ; |110| 
           LDDW    .D1T1   *+A12[A11],A5:A4  ; |114| 
           MVKH    .S2     _output+12,B6
           ZERO    .S2     B4                ; |111| 
           SET     .S2     B4,31,31,B4       ; |111| 
   [!A0]   XOR     .L2     B9,B4,B9          ; |111| 
           ADDDP   .L2X    A5:A4,B9:B8,B5:B4 ; |114| 
           LDW     .D2T2   *B6,B6            ; |176| 
   [!B0]   ZERO    .L2     B7                ; |117| 
   [!B0]   SET     .S2     B7,31,31,B7       ; |117| 
           MVKL    .S1     0xc000cccc,A5
           MVKL    .S1     0xcccccccd,A4
           ADD     .S2     B10,B6,B6         ; |176| 
   [!B0]   XOR     .L2     B5,B7,B5          ; |117| 
           STDW    .D2T2   B5:B4,*B6         ; |176| 
           LDDW    .D1T1   *A14,A7:A6        ; |177| 
           MVKH    .S1     0xc000cccc,A5
           MVKH    .S1     0xcccccccd,A4
           SUB     .L1     A15,1,A2          ; |172| 
           SUB     .L1     A15,1,A15         ; |172| 
           MPYDP   .M1     A5:A4,A7:A6,A5:A4 ; |177| 
           ADD     .L2     8,B10,B10         ; |172| 
           NOP             3
   [ A2]   BNOP    .S1     $C$L14,4          ; |172| 

   [ A2]   CALL    .S1     _atan             ; |173| 
||         STDW    .D1T1   A5:A4,*++A14      ; |177| 

           ; BRANCHCC OCCURS {$C$L14}        ; |172| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 6

           MV      .L1     A10,A3            ; |179| 
||         CALL    .S1     _atandp_v         ; |179| 

           LDW     .D1T2   *A3,B4            ; |179| 
           ADDKPC  .S2     $C$RL20,B3,2      ; |179| 

           MV      .L1     A13,A4
||         MVK     .S1     0x777,A6          ; |179| 

$C$RL20:   ; CALL OCCURS {_atandp_v} {0}     ; |179| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 16
           MVKL    .S2     0x3e5240ec,B5
           MVKL    .S2     0xa6a943fe,B4
           MVKH    .S2     0x3e5240ec,B5
           MVKH    .S2     0xa6a943fe,B4

           CALLP   .S2     _allequal,B3
||         MVK     .S1     0x777,A4          ; |185| 

$C$RL21:   ; CALL OCCURS {_allequal} {0}     ; |185| 

           CALLP   .S2     _print_test_results,B3
||         MVK     .L1     0x4,A4            ; |186| 

$C$RL22:   ; CALL OCCURS {_print_test_results} {0}  ; |186| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 16
           MVKL    .S1     _cycle_counts+24,A3

           MVKH    .S1     _cycle_counts+24,A3
||         ZERO    .L2     B4                ; |114| 
||         ZERO    .S2     B12               ; |114| 
||         ZERO    .D2     B13               ; |114| 

           MVC     .S2     B4,TSCL           ; |115| 
||         STDW    .D1T2   B13:B12,*A3       ; |114| 

           MVC     .S2     TSCL,B4           ; |116| 
           MVC     .S2     TSCH,B5           ; |116| 
           MVKL    .S1     _t_start,A3
           MVKH    .S1     _t_start,A3

           MVC     .S2     TSCL,B6           ; |117| 
||         STDW    .D1T2   B5:B4,*A3         ; |116| 

           MVC     .S2     TSCH,B8           ; |117| 
           SUBU    .L2     B6,B4,B7:B6       ; |117| 

           EXT     .S2     B7,24,24,B4       ; |117| 
||         SUB     .L2     B8,B5,B5          ; |117| 
||         MVKL    .S1     _t_offset,A3

           ADD     .L2     B5,B4,B7          ; |117| 
||         MVKH    .S1     _t_offset,A3

           MVKL    .S1     _input,A3
||         STDW    .D1T2   B7:B6,*A3         ; |117| 
||         MVK     .S2     0x80,B4

           CALL    .S2     _gimme_random     ; |196| 
||         MVKH    .S1     _input,A3

           LDW     .D1T1   *A3,A11           ; |196| 
||         MVKL    .S2     0x3fa6defc,B4
||         MV      .L1X    B4,A13            ; |117| 
||         MVKL    .S1     0x402921fb,A5

           MVKH    .S2     0x3fa6defc,B4
||         MVKH    .S1     0x402921fb,A5
||         MV      .L2     B12,B10           ; |117| 

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains control code
;*----------------------------------------------------------------------------*
$C$L18:    
;          EXCLUSIVE CPU CYCLES: 3
           MVKL    .S2     0xc01921fb,B5
           MVKH    .S2     0xc01921fb,B5

           MV      .L1X    B4,A4             ; |196| 
||         ADDKPC  .S2     $C$RL23,B3,0      ; |196| 

$C$RL23:   ; CALL OCCURS {_gimme_random} {0}  ; |196| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 23
           ADD     .L1X    A11,B10,A3        ; |196| 

           STDW    .D1T1   A5:A4,*A3         ; |196| 
||         MVC     .S2     TSCL,B4           ; |122| 

           NOP             1

           MV      .L1X    B4,A8             ; |122| Define a twin register
||         MVC     .S2     TSCH,B6           ; |122| 

           ZERO    .L1     A3                ; |82| 
||         ZERO    .L2     B17
||         ADD     .S2X    A11,B10,B4        ; |81| 

           LDDW    .D2T2   *B4,B5:B4         ; |81| 
           ZERO    .L2     B9:B8             ; |81| 
           MV      .L1X    B6,A9             ; |122| 
           ZERO    .L2     B16               ; |86| 
           SET     .S2     B17,0x14,0x1d,B17
           CMPLTDP .S2     B5:B4,B9:B8,B0    ; |81| 
           SET     .S1     A3,31,31,A3       ; |82| 
   [ B0]   MV      .L1X    B4,A4             ; |82| 

   [ B0]   XOR     .L1X    B5,A3,A5          ; |82| 
|| [ B0]   ZERO    .L2     B0                ; |83| 
|| [!B0]   MVK     .S2     0xffffffff,B0     ; |77| 

           RCPDP   .S1     A5:A4,A7:A6       ; |53| 
           CMPGTDP .S2X    A5:A4,B17:B16,B1  ; |86| 
           MPYDP   .M1     A5:A4,A7:A6,A17:A16 ; |53| 

   [!B1]   B       .S1     $C$L19
|| [ B1]   ZERO    .L2     B5
|| [!B1]   ZERO    .L1     A15               ; |79| 
|| [ B1]   ZERO    .S2     B4                ; |53| 

   [ B1]   SET     .S2     B5,0x1e,0x1e,B5
   [!B1]   MVKL    .S1     0x5e9ecd56,A6
   [!B1]   MVKL    .S1     0x3fd12614,A7
   [!B1]   MVKH    .S1     0x5e9ecd56,A6
   [!B1]   MVKH    .S1     0x3fd12614,A7
           ; BRANCHCC OCCURS {$C$L19}  
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 74
           MV      .L1X    B5,A19            ; |53| 
           ZERO    .L1     A18               ; |53| 
           MVK     .L1     0x2,A15           ; |88| 
           SUBDP   .L1X    B5:B4,A17:A16,A17:A16 ; |53| 
           ZERO    .L2     B4                ; |53| 
           NOP             5
           MPYDP   .M1     A7:A6,A17:A16,A7:A6 ; |53| 
           NOP             9
           MPYDP   .M1     A5:A4,A7:A6,A17:A16 ; |53| 
           NOP             9
           SUBDP   .L1     A19:A18,A17:A16,A17:A16 ; |53| 
           NOP             6
           MPYDP   .M1     A7:A6,A17:A16,A7:A6 ; |53| 
           NOP             9
           MPYDP   .M1     A5:A4,A7:A6,A5:A4 ; |53| 
           NOP             9
           SUBDP   .L1X    B5:B4,A5:A4,A5:A4 ; |53| 
           NOP             6
           MPYDP   .M1     A7:A6,A5:A4,A5:A4 ; |53| 
           NOP             5
           MVKL    .S1     0x5e9ecd56,A6
           MVKL    .S1     0x3fd12614,A7
           MVKH    .S1     0x5e9ecd56,A6
           MVKH    .S1     0x3fd12614,A7
;** --------------------------------------------------------------------------*
$C$L19:    
;          EXCLUSIVE CPU CYCLES: 8
           CMPGTDP .S1     A5:A4,A7:A6,A0    ; |91| 
           NOP             1

   [!A0]   B       .S2     $C$L20            ; |91| 
||         MVKL    .S1     0x3ffbb67a,A7
|| [!A0]   ZERO    .L1     A3                ; |99| 
|| [!A0]   ZERO    .L2     B5:B4             ; |98| 

           MVKL    .S1     0xe8584caa,A6
           MVKH    .S1     0x3ffbb67a,A7
           MVKH    .S1     0xe8584caa,A6

           ADDDP   .L1     A7:A6,A5:A4,A17:A16 ; |53| 
|| [!A0]   SET     .S1     A3,31,31,A3       ; |99| 

   [!A0]   MV      .S1     A4,A6             ; |96| 
|| [!A0]   MV      .D1     A5,A7             ; |96| 

           ; BRANCHCC OCCURS {$C$L20}        ; |91| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 105
           MV      .L2     B13,B4            ; |53| 
           ZERO    .L2     B5
           SET     .S2     B5,0x1e,0x1e,B5
           ZERO    .L2     B7
           MV      .L2     B13,B6            ; |53| 
           RCPDP   .S1     A17:A16,A7:A6     ; |53| 
           SET     .S2     B7,0x1e,0x1e,B7
           MPYDP   .M1     A7:A6,A17:A16,A19:A18 ; |53| 
           ZERO    .L1     A31
           ADD     .L1     1,A15,A15         ; |92| 
           ZERO    .L1     A3                ; |99| 
           SET     .S1     A3,31,31,A3       ; |99| 
           NOP             6
           SUBDP   .L2X    B5:B4,A19:A18,B5:B4 ; |53| 
           NOP             6
           MPYDP   .M2X    A7:A6,B5:B4,B5:B4 ; |53| 
           NOP             9
           NOP             1
           MPYDP   .M1X    B5:B4,A17:A16,A7:A6 ; |53| 
           NOP             9
           NOP             1
           SUBDP   .L2X    B7:B6,A7:A6,B7:B6 ; |53| 
           NOP             6
           MPYDP   .M2     B5:B4,B7:B6,B5:B4 ; |53| 
           NOP             9
           NOP             1
           MPYDP   .M1X    B5:B4,A17:A16,A7:A6 ; |53| 
           MVKL    .S2     0x3ffbb67a,B7
           MVKL    .S2     0xe8584caa,B6
           MVKH    .S2     0x3ffbb67a,B7
           MVKH    .S2     0xe8584caa,B6
           SET     .S1     A31,0x1e,0x1e,A17
           MV      .L1X    B16,A16           ; |53| 
           MPYDP   .M1X    B7:B6,A5:A4,A5:A4 ; |53| 
           NOP             2
           SUBDP   .L1     A17:A16,A7:A6,A7:A6 ; |53| 
           NOP             7
           MPYDP   .M2X    B5:B4,A7:A6,B5:B4 ; |53| 
           NOP             2

           MV      .L1     A16,A6            ; |53| 
||         MV      .S1X    B17,A7            ; |53| 

           SUBDP   .L1     A5:A4,A7:A6,A5:A4 ; |53| 
           NOP             6
           MPYDP   .M1X    A5:A4,B5:B4,A5:A4 ; |53| 
           NOP             8
           ZERO    .L2     B5:B4             ; |98| 

           MV      .L1     A4,A6             ; |96| 
||         MV      .S1     A5,A7             ; |96| 

;** --------------------------------------------------------------------------*
$C$L20:    
;          EXCLUSIVE CPU CYCLES: 12
           CMPLTDP .S1X    A7:A6,B5:B4,A0    ; |98| 
           MVKL    .S2     0x3e4fffff,B5

   [ A0]   XOR     .L1     A7,A3,A7          ; |99| 
||         MVKH    .S2     0x3e4fffff,B5

           MVK     .S2     0xffffedec,B4     ; |102| 

           CMPGTDP .S2X    A7:A6,B5:B4,B1    ; |102| 
||         MPYDP   .M1     A7:A6,A7:A6,A7:A6 ; |53| 

           NOP             1

   [!B1]   B       .S2     $C$L21            ; |102| 
|| [ B1]   MVKL    .S1     0x402e0c49,A17
|| [!B1]   MV      .D1X    B12,A3            ; |114| 
|| [!B1]   CMPLT   .L1     A15,2,A0          ; |110| 

   [ B1]   MVKL    .S1     0xe14ac710,A16
   [!B1]   SET     .S1     A3,31,31,A3       ; |111| 
   [ B1]   MVKH    .S1     0xe14ac710,A16
   [!B1]   LDDW    .D1T1   *+A12[A15],A7:A6  ; |114| 
   [ B1]   MVKH    .S1     0x402e0c49,A17
           ; BRANCHCC OCCURS {$C$L21}        ; |102| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 172
           MVKL    .S2     0x404dca0a,B5
           MVKL    .S2     0x320da3d7,B4
           ADDDP   .L1     A17:A16,A7:A6,A17:A16 ; |53| 
           MVKH    .S2     0x404dca0a,B5
           MVKH    .S2     0x320da3d7,B4
           ZERO    .L2     B16               ; |53| 
           ZERO    .L2     B17
           SET     .S2     B17,0x1e,0x1e,B17
           ZERO    .S1     A31
           MPYDP   .M1     A7:A6,A17:A16,A17:A16 ; |53| 
           ZERO    .L2     B31
           CMPLT   .L1     A15,2,A0          ; |110| 
           MV      .L1X    B12,A3            ; |114| 
           SET     .S1     A3,31,31,A3       ; |111| 
           NOP             5
           ADDDP   .L1X    B5:B4,A17:A16,A17:A16 ; |53| 
           MVKL    .S2     0x4044887c,B5
           MVKL    .S2     0xbcc495a9,B4
           MVKH    .S2     0x4044887c,B5
           MVKH    .S2     0xbcc495a9,B4
           NOP             2
           MPYDP   .M1     A7:A6,A17:A16,A19:A18 ; |53| 
           NOP             5
           MVKL    .S1     0x40b6da5,A16
           MVKL    .S1     0x40558a12,A17
           MVKH    .S1     0x40b6da5,A16
           MVKH    .S1     0x40558a12,A17
           ADDDP   .L1     A17:A16,A19:A18,A17:A16 ; |53| 
           ZERO    .S1     A18               ; |53| 
           SET     .S1     A31,0x1e,0x1e,A19
           NOP             4
           MPYDP   .M1     A7:A6,A17:A16,A17:A16 ; |53| 
           NOP             9
           NOP             1
           ADDDP   .L2X    B5:B4,A17:A16,B5:B4 ; |53| 
           MVKL    .S1     0xd9b187bd,A16
           MVKL    .S1     0xbfeacd7a,A17
           MVKH    .S1     0xd9b187bd,A16
           MVKH    .S1     0xbfeacd7a,A17
           MPYDP   .M1     A17:A16,A7:A6,A17:A16 ; |53| 
           NOP             1
           RCPDP   .S2     B5:B4,B7:B6       ; |53| 
           NOP             1
           MPYDP   .M2     B7:B6,B5:B4,B9:B8 ; |53| 
           NOP             9
           SUBDP   .L2     B17:B16,B9:B8,B9:B8 ; |53| 
           MVKL    .S2     0xc020fd3f,B17
           MVKL    .S2     0x5c8d6a63,B16
           MVKH    .S2     0xc020fd3f,B17
           MVKH    .S2     0x5c8d6a63,B16
           NOP             2
           MPYDP   .M2     B7:B6,B9:B8,B9:B8 ; |53| 
           ADDDP   .L1X    B17:B16,A17:A16,A17:A16 ; |53| 
           MVKL    .S2     0xc02b60a6,B17
           MVKL    .S2     0x51061ce2,B16
           MVKH    .S2     0xc02b60a6,B17
           MVKH    .S2     0x51061ce2,B16
           NOP             4
           MPYDP   .M2     B9:B8,B5:B4,B7:B6 ; |53| 
           MPYDP   .M1     A7:A6,A17:A16,A17:A16 ; |53| 
           NOP             8
           SUBDP   .L2X    A19:A18,B7:B6,B7:B6 ; |53| 
           MVKL    .S1     0xc034817f,A19
           MVKL    .S1     0xb9e2bccb,A18
           MVKH    .S1     0xc034817f,A19
           MVKH    .S1     0xb9e2bccb,A18
           ADDDP   .L1     A19:A18,A17:A16,A17:A16 ; |53| 
           NOP             1
           MPYDP   .M2     B7:B6,B9:B8,B7:B6 ; |53| 
           NOP             9
           MPYDP   .M2     B7:B6,B5:B4,B9:B8 ; |53| 
           MPYDP   .M1     A7:A6,A17:A16,A17:A16 ; |53| 
           NOP             6
           ZERO    .L2     B4                ; |53| 
           SET     .S2     B31,0x1e,0x1e,B5
           SUBDP   .L2     B5:B4,B9:B8,B5:B4 ; |53| 
           ADDDP   .L1X    B17:B16,A17:A16,A17:A16 ; |53| 
           NOP             5
           MPYDP   .M2     B7:B6,B5:B4,B5:B4 ; |53| 
           MPYDP   .M1     A7:A6,A17:A16,A7:A6 ; |53| 
           NOP             9
           MPYDP   .M1X    A7:A6,B5:B4,A7:A6 ; |53| 
           NOP             9
           MPYDP   .M1     A7:A6,A5:A4,A7:A6 ; |107| 
           NOP             9
           ADDDP   .L1     A7:A6,A5:A4,A5:A4 ; |107| 
           LDDW    .D1T1   *+A12[A15],A7:A6  ; |114| 
           NOP             5
;** --------------------------------------------------------------------------*
$C$L21:    
;          EXCLUSIVE CPU CYCLES: 28

   [!A0]   XOR     .L1     A5,A3,A5          ; |111| 
||         MVKL    .S2     _output+12,B4
|| [!B0]   MV      .L2     B13,B5            ; |200| 
||         MVKL    .S1     _t_start,A31

           MVKH    .S2     _output+12,B4
||         MVKH    .S1     _t_start,A31

           LDW     .D2T2   *B4,B4            ; |200| 
|| [!B0]   SET     .S2     B5,31,31,B5       ; |117| 
||         STDW    .D1T1   A9:A8,*A31

           ADDDP   .L1     A7:A6,A5:A4,A5:A4 ; |114| 
           NOP             3
           ADD     .L2     B10,B4,B4         ; |200| 
           NOP             2
   [!B0]   XOR     .L1X    A5,B5,A5          ; |117| 

           STDW    .D2T1   A5:A4,*B4         ; |200| 
||         MVC     .S2     TSCL,B8           ; |128| 

           MVC     .S2     TSCH,B9           ; |128| 

           MVKL    .S1     _t_offset,A3
||         MVKL    .S2     _cycle_counts+24,B4
||         SUB     .L1     A13,1,A0          ; |194| 

           MVKH    .S1     _t_offset,A3
||         MVKH    .S2     _cycle_counts+24,B4

           LDDW    .D1T1   *A3,A7:A6         ; |130| 
||         LDDW    .D2T2   *B4,B17:B16       ; |130| 
||         MVKL    .S2     _t_stop,B31

           MV      .L1X    B4,A14            ; |130| 
||         MVKH    .S2     _t_stop,B31

           STDW    .D2T2   B9:B8,*B31        ; |128| 
           NOP             2
           ADDU    .L1     A6,A8,A5:A4       ; |130| 

           ADD     .L1     A5,A7,A3          ; |130| 
|| [ A0]   MVKL    .S1     0x402921fb,A5

           ADD     .L1     A3,A9,A3          ; |130| 
||         SUBU    .L2X    B8,A4,B5:B4       ; |130| 
|| [ A0]   B       .S2     $C$L18            ; |194| 
|| [ A0]   MVKH    .S1     0x402921fb,A5

           ADDU    .L2     B16,B4,B7:B6      ; |130| 
||         EXT     .S2     B5,24,24,B5       ; |130| 

           SUB     .L2X    B9,A3,B4          ; |130| 
|| [ A0]   MVKL    .S1     _input,A3

   [ A0]   MVKH    .S1     _input,A3
|| [ A0]   CALL    .S2     _gimme_random     ; |196| 
||         ADD     .L2     B7,B17,B5         ; |130| 
||         ADD     .D2     B4,B5,B7          ; |130| 

   [ A0]   LDW     .D1T1   *A3,A11           ; |196| 
|| [ A0]   MVKL    .S2     0x3fa6defc,B4
||         ADD     .L2     B5,B7,B7          ; |130| 

   [ A0]   MVKH    .S2     0x3fa6defc,B4
||         STDW    .D1T2   B7:B6,*A14        ; |130| 
||         ADD     .L2     8,B10,B10         ; |194| 
||         SUB     .L1     A13,1,A13         ; |194| 

           ; BRANCHCC OCCURS {$C$L18}        ; |194| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 6

           CALLP   .S2     __fltllif,B3
||         LDDW    .D1T1   *A14,A5:A4        ; |135| 

$C$RL24:   ; CALL OCCURS {__fltllif} {0}     ; |135| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 16
           ZERO    .L1     A3
           SET     .S1     A3,0x1a,0x1d,A3
           MPYSP   .M1     A3,A4,A3          ; |135| 
           ZERO    .L1     A13
           SET     .S1     A13,0x15,0x1d,A13
           MV      .L1X    B12,A12           ; |135| 
           SPDP    .S1     A3,A5:A4          ; |135| 
           NOP             2
           ADDDP   .L1     A13:A12,A5:A4,A5:A4 ; |135| 
           CALLP   .S2     __fixdlli,B3
$C$RL25:   ; CALL OCCURS {__fixdlli} {0}     ; |135| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 18

           MVK     .S2     24,B10
||         MV      .L2X    A14,B4

           SUB     .L2X    A14,B10,B10
||         MV      .S2     B13,B5            ; |114| 
||         STDW    .D2T1   A5:A4,*B4         ; |135| 

           STDW    .D2T2   B13:B12,*B10      ; |114| 
||         MVC     .S2     B5,TSCL           ; |115| 

           MVC     .S2     TSCL,B4           ; |116| 
           MVC     .S2     TSCH,B5           ; |116| 
           MV      .L1X    B4,A14            ; |116| 
           MV      .L1X    B5,A12            ; |116| 
           MVC     .S2     TSCL,B5           ; |117| 
           MVC     .S2     TSCH,B4           ; |117| 

           SUBU    .L2X    B5,A14,B7:B6      ; |117| 
||         MVKL    .S1     _output,A31
||         MVK     .S2     0x80,B31

           SUB     .L1X    B4,A12,A4         ; |117| 
||         EXT     .S2     B7,24,24,B4       ; |117| 
||         MVKH    .S1     _output,A31

           MV      .L1X    B6,A3             ; |117| 
||         STW     .D2T2   B31,*+SP(12)      ; |117| 
||         LDW     .D1T1   *A31,A15

           ADD     .L1X    A4,B4,A30         ; |117| 
||         STW     .D2T1   A3,*+SP(16)       ; |117| 

           STW     .D2T1   A30,*+SP(20)      ; |117| 
||         CALL    .S1     _atan             ; |208| 

           LDDW    .D1T1   *A11++,A5:A4      ; |208| 
           NOP             3
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L22:    
;          EXCLUSIVE CPU CYCLES: 1
           ADDKPC  .S2     $C$RL26,B3,0      ; |208| 
$C$RL26:   ; CALL OCCURS {_atan} {0}         ; |208| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 12
           LDW     .D2T2   *+SP(12),B4       ; |208| 
           STDW    .D1T1   A5:A4,*A15++      ; |208| 
           NOP             3

           SUB     .L1X    B4,1,A0           ; |207| 
||         SUB     .L2     B4,1,B4           ; |207| 

   [ A0]   B       .S1     $C$L22            ; |207| 
||         STW     .D2T2   B4,*+SP(12)       ; |208| 

   [ A0]   CALL    .S1     _atan             ; |208| 
   [ A0]   LDDW    .D1T1   *A11++,A5:A4      ; |208| 
           NOP             3
           ; BRANCHCC OCCURS {$C$L22}        ; |207| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 14
           MVC     .S2     TSCL,B6           ; |128| 
           MVC     .S2     TSCH,B4           ; |128| 
           LDW     .D2T1   *+SP(16),A3       ; |128| 
           LDW     .D2T1   *+SP(20),A31      ; |128| 
           MV      .L2     B4,B7             ; |128| 
           LDDW    .D2T2   *B10,B5:B4        ; |130| 
           NOP             1
           ADDU    .L1     A3,A14,A5:A4      ; |130| 

           ADD     .S1     A5,A31,A3         ; |130| 
||         SUBU    .L1X    B6,A4,A5:A4       ; |130| 
||         CALL    .S2     __fltllif         ; |130| 

           ADD     .L1     A3,A12,A3         ; |130| 
||         EXT     .S1     A5,24,24,A30      ; |130| 

           ADDU    .L2X    B4,A4,B9:B8       ; |130| 
||         SUB     .L1X    B7,A3,A3          ; |130| 
||         MVKL    .S2     _t_stop,B4

           ADD     .L2     B9,B5,B5          ; |130| 
||         ADD     .L1     A3,A30,A3         ; |130| 
||         MVKH    .S2     _t_stop,B4

           STDW    .D2T2   B7:B6,*B4         ; |128| 
||         MV      .L1X    B8,A4             ; |130| 

           ADD     .L1X    B5,A3,A5          ; |130| 
||         ADDKPC  .S2     $C$RL27,B3,0      ; |130| 

$C$RL27:   ; CALL OCCURS {__fltllif} {0}     ; |130| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 15
           ZERO    .L1     A3
           SET     .S1     A3,0x1a,0x1d,A3
           MPYSP   .M1     A3,A4,A3          ; |130| 
           MV      .L1X    B12,A12           ; |130| 
           NOP             2
           SPDP    .S1     A3,A5:A4          ; |130| 
           NOP             1
           ADDDP   .L1     A13:A12,A5:A4,A5:A4 ; |130| 
           CALLP   .S2     __fixdlli,B3
$C$RL28:   ; CALL OCCURS {__fixdlli} {0}     ; |130| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 18

           ZERO    .L1     A15
||         MV      .L2     B13,B4            ; |114| 
||         STDW    .D2T2   B13:B12,*+B10(8)  ; |114| 

           SET     .S1     A15,0x1a,0x1d,A15
||         STDW    .D2T1   A5:A4,*B10        ; |130| 
||         MVC     .S2     B4,TSCL           ; |115| 

           MVC     .S2     TSCL,B4           ; |116| 
           MVC     .S2     TSCH,B5           ; |116| 
           MVKL    .S1     _t_start,A14
           MVKH    .S1     _t_start,A14

           STDW    .D1T2   B5:B4,*A14        ; |116| 
||         MVC     .S2     TSCL,B6           ; |117| 

           MVC     .S2     TSCH,B8           ; |117| 

           SUBU    .L2     B6,B4,B7:B6       ; |117| 
||         MVKL    .S2     _t_offset,B31

           EXT     .S2     B7,24,24,B4       ; |117| 
||         SUB     .L2     B8,B5,B5          ; |117| 

           ADD     .L2     B5,B4,B7          ; |117| 
||         MVKH    .S2     _t_offset,B31
||         MVKL    .S1     _input,A11

           STDW    .D2T2   B7:B6,*B31        ; |117| 
||         MVKH    .S1     _input,A11

           LDW     .D1T1   *A11,A3           ; |216| 
           MVK     .S2     0x80,B30
           STW     .D2T2   B30,*+SP(12)      ; |117| 
           NOP             2

           CALL    .S1     _atandp           ; |216| 
||         ADD     .L1     A12,A3,A3         ; |216| 

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L23:    
;          EXCLUSIVE CPU CYCLES: 5
           LDDW    .D1T1   *A3,A5:A4         ; |216| 
           ADDKPC  .S2     $C$RL29,B3,3      ; |216| 
$C$RL29:   ; CALL OCCURS {_atandp} {0}       ; |216| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 17
           LDW     .D2T2   *B11,B4           ; |216| 
           NOP             4

           ADD     .L1X    A12,B4,A3         ; |216| 
||         LDW     .D2T2   *+SP(12),B4       ; |216| 

           ADD     .L1     8,A12,A12         ; |215| 
           STDW    .D1T1   A5:A4,*A3         ; |216| 
           NOP             2

           SUB     .L1X    B4,1,A0           ; |215| 
||         SUB     .L2     B4,1,B4           ; |215| 

   [ A0]   BNOP    .S1     $C$L23,4          ; |215| 
|| [ A0]   LDW     .D1T1   *A11,A3           ; |216| 
||         STW     .D2T2   B4,*+SP(12)       ; |216| 

   [ A0]   CALL    .S1     _atandp           ; |216| 
||         ADD     .L1     A12,A3,A3         ; |216| 

           ; BRANCHCC OCCURS {$C$L23}        ; |215| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 19
           MVC     .S2     TSCL,B8           ; |128| 
           MVC     .S2     TSCH,B5           ; |128| 

           MVKL    .S2     _t_offset,B4
||         LDDW    .D1T1   *A14,A5:A4        ; |130| 

           MVKH    .S2     _t_offset,B4
           LDDW    .D2T2   *B4,B7:B6         ; |130| 
           MV      .L2     B5,B9             ; |128| 
           MVKL    .S2     _t_stop,B31
           MVKH    .S2     _t_stop,B31
           LDDW    .D2T2   *+B10(8),B5:B4    ; |130| 
           ADDU    .L1X    B6,A4,A7:A6       ; |130| 
           MV      .L1     A6,A3             ; |130| 
           ADD     .L1X    A7,B7,A4          ; |130| 

           SUBU    .L2X    B8,A3,B7:B6       ; |130| 
||         ADD     .L1     A4,A5,A3          ; |130| 

           EXT     .S2     B7,24,24,B16      ; |130| 
||         ADDU    .L2     B4,B6,B7:B6       ; |130| 
||         CALL    .S1     __fltllif         ; |130| 

           SUB     .L2X    B9,A3,B4          ; |130| 
||         ADD     .S2     B7,B5,B5          ; |130| 

           MV      .L1X    B6,A4             ; |130| 
||         ADD     .L2     B4,B16,B6         ; |130| 

           ADD     .L2     B5,B6,B4          ; |130| 
           STDW    .D2T2   B9:B8,*B31        ; |128| 

           MV      .L1X    B4,A5             ; |130| 
||         ADDKPC  .S2     $C$RL30,B3,0      ; |130| 

$C$RL30:   ; CALL OCCURS {__fltllif} {0}     ; |130| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 13
           MPYSP   .M1     A15,A4,A3         ; |130| 
           MV      .L1X    B12,A12           ; |130| 
           NOP             2
           SPDP    .S1     A3,A5:A4          ; |130| 
           NOP             1
           ADDDP   .L1     A13:A12,A5:A4,A5:A4 ; |130| 
           CALLP   .S2     __fixdlli,B3
$C$RL31:   ; CALL OCCURS {__fixdlli} {0}     ; |130| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 20
           STDW    .D2T2   B13:B12,*+B10(16) ; |114| 

           ADDAD   .D2     B10,1,B11
||         MV      .L2     B13,B4            ; |114| 

           STDW    .D2T1   A5:A4,*B11        ; |130| 
||         MVC     .S2     B4,TSCL           ; |115| 

           MVC     .S2     TSCL,B4           ; |116| 
           MVC     .S2     TSCH,B5           ; |116| 

           STDW    .D1T2   B5:B4,*A14        ; |116| 
||         MVC     .S2     TSCL,B6           ; |117| 

           MVC     .S2     TSCH,B8           ; |117| 
           LDW     .D2T1   *+SP(24),A3       ; |117| 
           SUBU    .L2     B6,B4,B7:B6       ; |117| 
           MVKL    .S2     _t_offset,B31
           EXT     .S2     B7,24,24,B4       ; |117| 
           SUB     .L2     B8,B5,B5          ; |117| 

           ADD     .L2     B5,B4,B7          ; |117| 
||         MVKH    .S2     _t_offset,B31
||         STW     .D2T1   A3,*+SP(16)

           STDW    .D2T2   B7:B6,*B31        ; |117| 
           LDW     .D1T1   *A11,A3           ; |224| 
           MVK     .S2     0x80,B30
           STW     .D2T2   B30,*+SP(12)      ; |117| 
           NOP             2

           CALL    .S1     _atandp_c         ; |224| 
||         ADD     .L1     A12,A3,A3         ; |224| 

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L24:    
;          EXCLUSIVE CPU CYCLES: 5
           LDDW    .D1T1   *A3,A5:A4         ; |224| 
           ADDKPC  .S2     $C$RL32,B3,3      ; |224| 
$C$RL32:   ; CALL OCCURS {_atandp_c} {0}     ; |224| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 22
           LDW     .D2T2   *+SP(16),B4       ; |224| 
           NOP             4
           LDW     .D2T2   *B4,B4            ; |224| 
           NOP             4

           ADD     .L1X    A12,B4,A3         ; |224| 
||         LDW     .D2T2   *+SP(12),B4       ; |224| 

           ADD     .L1     8,A12,A12         ; |223| 
           STDW    .D1T1   A5:A4,*A3         ; |224| 
           NOP             2

           SUB     .L1X    B4,1,A0           ; |223| 
||         SUB     .L2     B4,1,B4           ; |223| 

   [ A0]   BNOP    .S1     $C$L24,4          ; |223| 
|| [ A0]   LDW     .D1T1   *A11,A3           ; |224| 
||         STW     .D2T2   B4,*+SP(12)       ; |224| 

   [ A0]   CALL    .S1     _atandp_c         ; |224| 
||         ADD     .L1     A12,A3,A3         ; |224| 

           ; BRANCHCC OCCURS {$C$L24}        ; |223| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 17
           MVC     .S2     TSCL,B8           ; |128| 
           MVC     .S2     TSCH,B4           ; |128| 

           MVKL    .S2     _t_offset,B5
||         LDDW    .D1T1   *A14,A5:A4        ; |130| 
||         MV      .L2     B4,B9             ; |128| 

           MVKH    .S2     _t_offset,B5
           LDDW    .D2T2   *B5,B7:B6         ; |130| 
           MV      .L2     B10,B4            ; |128| 
           LDDW    .D2T2   *+B4(16),B17:B16  ; |130| 
           MVKL    .S2     _t_stop,B31
           MVKH    .S2     _t_stop,B31
           ADDU    .L2X    B6,A4,B5:B4       ; |130| 

           ADD     .S2     B5,B7,B6          ; |130| 
||         SUBU    .L2     B8,B4,B5:B4       ; |130| 

           ADD     .D2X    B6,A5,B6          ; |130| 
||         CALL    .S1     __fltllif         ; |130| 
||         EXT     .S2     B5,24,24,B7       ; |130| 
||         ADDU    .L2     B16,B4,B5:B4      ; |130| 

           SUB     .L2     B9,B6,B6          ; |130| 
||         ADD     .S2     B5,B17,B5         ; |130| 

           ADD     .L2     B6,B7,B6          ; |130| 
||         MV      .L1X    B4,A4             ; |130| 

           ADD     .L2     B5,B6,B4          ; |130| 
           STDW    .D2T2   B9:B8,*B31        ; |128| 

           MV      .L1X    B4,A5             ; |130| 
||         STW     .D2T2   B10,*+SP(12)      ; |130| 
||         ADDKPC  .S2     $C$RL33,B3,0      ; |130| 

$C$RL33:   ; CALL OCCURS {__fltllif} {0}     ; |130| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 109
           MPYSP   .M1     A15,A4,A3         ; |130| 
           MV      .L1X    B12,A12           ; |130| 
           NOP             3
           SPDP    .S2X    A3,B5:B4          ; |130| 
           NOP             2
           ADDDP   .L1X    A13:A12,B5:B4,A5:A4 ; |130| 
           CALLP   .S2     __fixdlli,B3
$C$RL34:   ; CALL OCCURS {__fixdlli} {0}     ; |130| 
           LDW     .D2T2   *+SP(12),B4
           ADDAD   .D2     B11,1,B10
           MV      .L2     B13,B31           ; |114| 
           STDW    .D2T1   A5:A4,*B10        ; |130| 
           NOP             1

           STDW    .D2T2   B13:B12,*+B4(32)  ; |114| 
||         MVC     .S2     B31,TSCL          ; |115| 

           MVC     .S2     TSCL,B4           ; |116| 
           MVC     .S2     TSCH,B5           ; |116| 

           STDW    .D1T2   B5:B4,*A14        ; |116| 
||         MVC     .S2     TSCL,B6           ; |117| 

           MVC     .S2     TSCH,B8           ; |117| 
           MVKL    .S1     _t_offset,A3

           MVKH    .S1     _t_offset,A3
||         SUBU    .L2     B6,B4,B7:B6       ; |117| 

           EXT     .S2     B7,24,24,B5       ; |117| 
||         SUB     .L2     B8,B5,B7          ; |117| 

           MVKL    .S1     _output,A12
||         MV      .L2X    A3,B11            ; |117| 
||         ADD     .S2     B7,B5,B5          ; |117| 
||         MV      .D2     B6,B4             ; |117| 

           MVKH    .S1     _output,A12
||         MV      .L2X    A11,B9            ; |231| 
||         STDW    .D2T2   B5:B4,*B11        ; |117| 

           CALLP   .S2     _atandp_v,B3
||         LDW     .D1T2   *+A12(16),B4      ; |231| 
||         LDW     .D2T1   *B9,A4            ; |231| 
||         MVK     .S1     0x80,A6           ; |231| 

$C$RL35:   ; CALL OCCURS {_atandp_v} {0}     ; |231| 
           MVC     .S2     TSCL,B8           ; |128| 
           MVC     .S2     TSCH,B4           ; |128| 

           LDDW    .D1T1   *A14,A7:A6        ; |130| 
||         LDDW    .D2T2   *B11,B7:B6        ; |130| 

           MVK     .S1     16,A11
           ADD     .L1X    B10,A11,A11
           MVKL    .S1     _t_stop,A3

           LDDW    .D1T1   *A11,A9:A8        ; |130| 
||         MVKH    .S1     _t_stop,A3

           ADDU    .L1X    B6,A6,A5:A4       ; |130| 

           MV      .L2     B4,B9             ; |128| 
||         MV      .S2X    A3,B4             ; |128| 
||         ADD     .L1X    A5,B7,A3          ; |130| 

           SUBU    .L1X    B8,A4,A17:A16     ; |130| 

           ADD     .L1     A3,A7,A3          ; |130| 
||         EXT     .S1     A17,24,24,A6      ; |130| 

           SUB     .S1X    B9,A3,A3          ; |130| 
||         ADDU    .L1     A8,A16,A5:A4      ; |130| 

           ADD     .L1     A5,A9,A3          ; |130| 
||         ADD     .S1     A3,A6,A5          ; |130| 

           CALLP   .S2     __fltllif,B3
||         ADD     .L1     A3,A5,A5          ; |130| 
||         STDW    .D2T2   B9:B8,*B4         ; |128| 

$C$RL36:   ; CALL OCCURS {__fltllif} {0}     ; |130| 
           MPYSP   .M1     A15,A4,A3         ; |130| 
           MV      .L1     A13,A5            ; |130| 
           MV      .L1X    B12,A4            ; |130| 
           NOP             2
           SPDP    .S1     A3,A7:A6          ; |130| 
           NOP             1
           ADDDP   .L1     A5:A4,A7:A6,A5:A4 ; |130| 
           CALLP   .S2     __fixdlli,B3
$C$RL37:   ; CALL OCCURS {__fixdlli} {0}     ; |130| 
           MVKL    .S2     0x3e112e0b,B7
           MVKL    .S2     0xe826d695,B6

           STDW    .D1T1   A5:A4,*A11        ; |130| 
||         MVKH    .S2     0x3e112e0b,B7

           LDW     .D1T2   *+A12(4),B4       ; |66| 
||         MVKH    .S2     0xe826d695,B6

           CALLP   .S2     _isequal,B3
||         LDW     .D1T1   *A12,A4           ; |66| 
||         MVK     .S1     0x80,A6           ; |66| 
||         MVK     .L1     0x1,A8            ; |66| 

$C$RL38:   ; CALL OCCURS {_isequal} {0}      ; |66| 

           MVKL    .S1     _fcn_pass,A11
||         MVKL    .S2     0xe826d695,B6

           MVKH    .S1     _fcn_pass,A11
||         MVKL    .S2     0x3e112e0b,B7

           MVKH    .S2     0xe826d695,B6

           MV      .L1     A4,A3             ; |66| 
||         LDW     .D1T1   *A12,A4           ; |67| 
||         MV      .L2X    A11,B10           ; |66| 
||         MVKH    .S2     0x3e112e0b,B7

           CALLP   .S2     _isequal,B3
||         LDW     .D1T2   *+A12(8),B4       ; |67| 
||         STW     .D2T1   A3,*+B10(4)       ; |66| 
||         MVK     .S1     0x80,A6           ; |67| 
||         MVK     .L1     0x1,A8            ; |67| 

$C$RL39:   ; CALL OCCURS {_isequal} {0}      ; |67| 
           MVKL    .S2     0x3e112e0b,B7
           MVKL    .S2     0xe826d695,B6
           MVKH    .S2     0x3e112e0b,B7

           STW     .D2T1   A4,*+B10(8)       ; |67| 
||         LDW     .D1T2   *+A12(12),B4      ; |68| 
||         MVKH    .S2     0xe826d695,B6

           CALLP   .S2     _isequal,B3
||         LDW     .D1T1   *A12,A4           ; |68| 
||         MVK     .S1     0x80,A6           ; |68| 
||         MVK     .L1     0x1,A8            ; |68| 

$C$RL40:   ; CALL OCCURS {_isequal} {0}      ; |68| 
           MVKL    .S2     0x3e112e0b,B7
           MVKL    .S2     0xe826d695,B6
           MVKH    .S2     0x3e112e0b,B7

           STW     .D2T1   A4,*+B10(12)      ; |68| 
||         LDW     .D1T2   *A10,B4           ; |69| 
||         MVKH    .S2     0xe826d695,B6

           CALLP   .S2     _isequal,B3
||         LDW     .D1T1   *A12,A4           ; |69| 
||         MVK     .S1     0x80,A6           ; |69| 
||         MVK     .L1     0x1,A8            ; |69| 

$C$RL41:   ; CALL OCCURS {_isequal} {0}      ; |69| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 12
           ADD     .L2X    4,A11,B5
           LDW     .D2T2   *B5,B0            ; |72| 
           MV      .L2X    A4,B4             ; |69| 
           STW     .D2T2   B4,*+B10(16)      ; |69| 
           ADD     .L2X    8,A11,B5
           NOP             1

   [!B0]   BNOP    .S1     $C$L25,4          ; |72| 
||         MV      .L2     B0,B1             ; guard predicate rewrite
|| [ B0]   LDW     .D2T2   *B5,B0            ; |72| 

   [ B1]   ADD     .L2     4,B5,B5
           ; BRANCHCC OCCURS {$C$L25}        ; |72| 
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

   [ B0]   B       .S1     $C$L26            ; |72| 
   [ B0]   CALL    .S1     _print_test_results ; |237| 
   [ B0]   MVKL    .S1     _all_pass,A4
   [ B0]   MVKH    .S1     _all_pass,A4
           NOP             2
           ; BRANCHCC OCCURS {$C$L26}        ; |72| 
;** --------------------------------------------------------------------------*
$C$L25:    
;          EXCLUSIVE CPU CYCLES: 5
           CALL    .S1     _print_test_results ; |237| 
           MVKL    .S1     _all_pass,A4
           MVKH    .S1     _all_pass,A4
           MV      .L1X    B13,A3
           NOP             1
;** --------------------------------------------------------------------------*
$C$L26:    
;          EXCLUSIVE CPU CYCLES: 1

           STW     .D1T1   A3,*A4            ; |72| 
||         MVK     .L1     0x2,A4            ; |237| 
||         ADDKPC  .S2     $C$RL42,B3,0      ; |237| 

$C$RL42:   ; CALL OCCURS {_print_test_results} {0}  ; |237| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 30
           MVKL    .S2     $C$SL2+0,B4
           MVKH    .S2     $C$SL2+0,B4

           CALLP   .S2     _printf,B3
||         STW     .D2T2   B4,*+SP(4)        ; |238| 

$C$RL43:   ; CALL OCCURS {_printf} {0}       ; |238| 
           MVKL    .S2     $C$SL3+0,B4
           MVKH    .S2     $C$SL3+0,B4

           CALLP   .S2     _printf,B3
||         STW     .D2T2   B4,*+SP(4)        ; |238| 

$C$RL44:   ; CALL OCCURS {_printf} {0}       ; |238| 
           MVKL    .S1     $C$SL1+0,A10
           MVKH    .S1     $C$SL1+0,A10

           CALLP   .S2     _print_profile_results,B3
||         MV      .L1     A10,A4            ; |245| 

$C$RL45:   ; CALL OCCURS {_print_profile_results} {0}  ; |245| 

           CALLP   .S2     _print_memory_results,B3
||         MV      .L1     A10,A4            ; |248| 

$C$RL46:   ; CALL OCCURS {_print_memory_results} {0}  ; |248| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 11
           LDW     .D2T2   *++SP(32),B3      ; |249| 
           LDDW    .D2T1   *++SP,A13:A12     ; |249| 
           LDDW    .D2T1   *++SP,A15:A14     ; |249| 
           LDDW    .D2T2   *++SP,B11:B10     ; |249| 
           LDDW    .D2T2   *++SP,B13:B12     ; |249| 

           LDW     .D2T1   *++SP(8),A10      ; |249| 
||         RET     .S2     B3                ; |249| 

           LDW     .D2T1   *++SP(8),A11      ; |249| 
           NOP             4
           ; BRANCH OCCURS {B3}              ; |249| 
;******************************************************************************
;* STRINGS                                                                    *
;******************************************************************************
	.sect	".const:.string"
$C$SL1:	.string	"atanDP",0
$C$SL2:	.string	"----------------------------------------",0
$C$SL3:	.string	"----------------------------------------",10,0
;*****************************************************************************
;* UNDEFINED EXTERNAL REFERENCES                                             *
;*****************************************************************************
	.global	_printf
	.global	_atan
	.global	_driver_init
	.global	_print_profile_results
	.global	_print_memory_results
	.global	_print_test_results
	.global	_gimme_random
	.global	_isequal
	.global	_atandp
	.global	_atandp_c
	.global	_atandp_v
	.global	_ti_math_vTable
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
