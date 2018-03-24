;******************************************************************************
;* TMS320C6x C/C++ Codegen                                          PC v7.4.2 *
;* Date/Time created: Tue May 17 00:00:14 2016                                *
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
	.elfsym	a,SYM_SIZE(1608)
a:
	.word	000000000h,0c13fa464h		; a[0] @ 0
	.word	0619da9cah,03f2d4b6ah		; a[1] @ 64
	.word	02f9139bah,0bf305e4ch		; a[2] @ 128
	.word	0974ec0cch,03f324aa8h		; a[3] @ 192
	.word	0e70af974h,0bf3470deh		; a[4] @ 256
	.word	0ded5f343h,03f36d7bbh		; a[5] @ 320
	.word	065a623cbh,0bf3986d7h		; a[6] @ 384
	.word	09844c10bh,03f3c86afh		; a[7] @ 448
	.word	0689e20a8h,0bf3fe0c0h		; a[8] @ 512
	.word	0ea0c0599h,03f41cfd1h		; a[9] @ 576
	.word	043edc76dh,0bf43e799h		; a[10] @ 640
	.word	0d6446578h,03f463e54h		; a[11] @ 704
	.word	047bd1b0dh,0bf48db6ah		; a[12] @ 768
	.word	0f0b2ae5eh,03f4bc71dh		; a[13] @ 832
	.word	0324bcd4bh,0bf4f0aach		; a[14] @ 896
	.word	015fe9162h,03f515834h		; a[15] @ 960
	.word	0c1f61557h,0bf5361edh		; a[16] @ 1024
	.word	02a89c15fh,03f55a8f4h		; a[17] @ 1088
	.word	0fff814c7h,0bf58347bh		; a[18] @ 1152
	.word	0d7d5e1c1h,03f5b0c92h		; a[19] @ 1216
	.word	0b97dee20h,0bf5e3a35h		; a[20] @ 1280
	.word	0bd1461d1h,03f60e3b9h		; a[21] @ 1344
	.word	040ff4613h,0bf62dfc3h		; a[22] @ 1408
	.word	0ccb9ac8ah,03f65177eh		; a[23] @ 1472
	.word	0ac1fd90eh,0bf6791efh		; a[24] @ 1536
	.word	028904a99h,03f6a56ech		; a[25] @ 1600
	.word	04dfd9779h,0bf6d6f37h		; a[26] @ 1664
	.word	0580024c7h,03f70724dh		; a[27] @ 1728
	.word	0501698c9h,0bf726103h		; a[28] @ 1792
	.word	0005e6c13h,03f7489dah		; a[29] @ 1856
	.word	0443bb2f8h,0bf76f3a6h		; a[30] @ 1920
	.word	0c8087578h,03f79a609h		; a[31] @ 1984
	.word	0fffdfc9bh,0bf7ca98bh		; a[32] @ 2048
	.word	0c4cbe637h,03f8003dah		; a[33] @ 2112
	.word	04febae42h,0bf81e596h		; a[34] @ 2176
	.word	0ac329ad4h,03f83ffech		; a[35] @ 2240
	.word	05407ea04h,0bf865983h		; a[36] @ 2304
	.word	0b1bf8033h,03f88f9cah		; a[37] @ 2368
	.word	0a53ebe57h,0bf8be910h		; a[38] @ 2432
	.word	07e4b3487h,03f8f309bh		; a[39] @ 2496
	.word	05fdb5cddh,0bf916d66h		; a[40] @ 2560
	.word	04fdc8c32h,03f93799dh		; a[41] @ 2624
	.word	0d1ba7257h,0bf95c36ch		; a[42] @ 2688
	.word	019d8c427h,03f985211h		; a[43] @ 2752
	.word	022fad6cbh,0bf9b2da1h		; a[44] @ 2816
	.word	0d7045e34h,03f9e5f26h		; a[45] @ 2880
	.word	09f427afah,0bfa0f85dh		; a[46] @ 2944
	.word	00753b158h,03fa2f6d4h		; a[47] @ 3008
	.word	0475ce0d7h,0bfa53145h		; a[48] @ 3072
	.word	098267cech,03fa7aebdh		; a[49] @ 3136
	.word	0970f7b9eh,0bfaa771ch		; a[50] @ 3200
	.word	01dfff03bh,03fad9330h		; a[51] @ 3264
	.word	0b6ee3e37h,0bfb08666h		; a[52] @ 3328
	.word	03347ab0fh,03fb27779h		; a[53] @ 3392
	.word	0b56ee236h,0bfb4a2f3h		; a[54] @ 3456
	.word	0d0775145h,03fb70fb2h		; a[55] @ 3520
	.word	075401dfdh,0bfb9c562h		; a[56] @ 3584
	.word	0c1e943fch,03fbccc93h		; a[57] @ 3648
	.word	0040f5939h,0bfc0176dh		; a[58] @ 3712
	.word	056c431f4h,03fc1fb75h		; a[59] @ 3776
	.word	0c4d73506h,0bfc4185dh		; a[60] @ 3840
	.word	0e7734140h,03fc674d3h		; a[61] @ 3904
	.word	02f9d7c7dh,0bfc91851h		; a[62] @ 3968
	.word	083ec892bh,03fcc0b2ch		; a[63] @ 4032
	.word	020f89e0ch,0bfcf56bah		; a[64] @ 4096
	.word	0cd474610h,03fd182b2h		; a[65] @ 4160
	.word	0202f4a70h,0bfd3916ah		; a[66] @ 4224
	.word	06ed4c9f1h,03fd5de05h		; a[67] @ 4288
	.word	027d6de9fh,0bfd86fcah		; a[68] @ 4352
	.word	03fc7962ch,03fdb4ed8h		; a[69] @ 4416
	.word	09dbec248h,0bfde8444h		; a[70] @ 4480
	.word	0d065de81h,03fe10d1ah		; a[71] @ 4544
	.word	04a82db11h,0bfe30e01h		; a[72] @ 4608
	.word	0ad2cf455h,03fe54b2bh		; a[73] @ 4672
	.word	0f54b7118h,0bfe7cbaeh		; a[74] @ 4736
	.word	090cb94beh,03fea9774h		; a[75] @ 4800
	.word	0cb336f99h,0bfedb754h		; a[76] @ 4864
	.word	0676a7265h,03ff09a98h		; a[77] @ 4928
	.word	084be4042h,0bff28e0ah		; a[78] @ 4992
	.word	094d94079h,03ff4bc2bh		; a[79] @ 5056
	.word	0650a45d4h,0bff72be1h		; a[80] @ 5120
	.word	054690de1h,03ff9e4e0h		; a[81] @ 5184
	.word	08ab92c06h,0bffcefc5h		; a[82] @ 5248
	.word	08b370047h,040002b17h		; a[83] @ 5312
	.word	04384ba0fh,0c002116fh		; a[84] @ 5376
	.word	0b74ddf87h,0400430ech		; a[85] @ 5440
	.word	0fe111277h,0c0069045h		; a[86] @ 5504
	.word	0158fb43eh,0400936fch		; a[87] @ 5568
	.word	0f36262cch,0c00c2d71h		; a[88] @ 5632
	.word	0bbdbe3c1h,0400f7d06h		; a[89] @ 5696
	.word	008e581cfh,0c0119819h		; a[90] @ 5760
	.word	021c04428h,04013a954h		; a[91] @ 5824
	.word	0f8ceb357h,0c015f8beh		; a[92] @ 5888
	.word	02a7bd48dh,040188da7h		; a[93] @ 5952
	.word	09314445bh,0c01b7037h		; a[94] @ 6016
	.word	029ae4f33h,0401ea990h		; a[95] @ 6080
	.word	08c9fb613h,0c02121f1h		; a[96] @ 6144
	.word	0a10e0221h,04023254ah		; a[97] @ 6208
	.word	011f0c34ch,0c0256531h		; a[98] @ 6272
	.word	0f3e0370dh,04027e8c3h		; a[99] @ 6336
	.word	08c5436b9h,0c02ab7f3h		; a[100] @ 6400
	.word	0e353f7cfh,0402ddba5h		; a[101] @ 6464
	.word	092e1ef74h,0c030aee3h		; a[102] @ 6528
	.word	0d41743e9h,04032a4b7h		; a[103] @ 6592
	.word	0fd75e204h,0c034d582h		; a[104] @ 6656
	.word	01e3a7daah,040374833h		; a[105] @ 6720
	.word	005681ecdh,0c03a0486h		; a[106] @ 6784
	.word	0291fb3fah,0403d1322h		; a[107] @ 6848
	.word	0122fad6dh,0c0403edah		; a[108] @ 6912
	.word	0230fcf81h,040422784h		; a[109] @ 6976
	.word	09999999ah,0c0444999h		; a[110] @ 7040
	.word	0018e7579h,04046abd9h		; a[111] @ 7104
	.word	0b7d41744h,0c04955cch		; a[112] @ 7168
	.word	086983516h,0404c4fe1h		; a[113] @ 7232
	.word	0d7dbf488h,0c04fa381h		; a[114] @ 7296
	.word	06fa82e88h,04051ad99h		; a[115] @ 7360
	.word	081301648h,0c053c15bh		; a[116] @ 7424
	.word	0f1d3ed52h,040561398h		; a[117] @ 7488
	.word	0d64d7f0fh,0c058aba8h		; a[118] @ 7552
	.word	0487fcb92h,0405b91bfh		; a[119] @ 7616
	.word	09a027525h,0c05ecf08h		; a[120] @ 7680
	.word	047ae147bh,0406136e1h		; a[121] @ 7744
	.word	020c49ba6h,0c0633cb0h		; a[122] @ 7808
	.word	03eab367ah,040657f57h		; a[123] @ 7872
	.word	0e76c8b44h,0c06805fbh		; a[124] @ 7936
	.word	0d42c3c9fh,0406ad89ah		; a[125] @ 8000
	.word	039c0ebeeh,0c06e0023h		; a[126] @ 8064
	.word	0dc5d6388h,04070c346h		; a[127] @ 8128
	.word	0346dc5d6h,0c072bb80h		; a[128] @ 8192
	.word	0096bb98ch,04074eef9h		; a[129] @ 8256
	.word	01de69ad4h,0c07764a7h		; a[130] @ 8320
	.word	0eb851eb8h,0407a2451h		; a[131] @ 8384
	.word	0cd9e83e4h,0c07d36aah		; a[132] @ 8448
	.word	06dc5d639h,0408052b4h		; a[133] @ 8512
	.word	0d07c84b6h,0c0823db3h		; a[134] @ 8576
	.word	08e8a71deh,040846264h		; a[135] @ 8640
	.word	0ed288ce7h,0c086c78dh		; a[136] @ 8704
	.word	0f837b4a2h,0408974c2h		; a[137] @ 8768
	.word	015b573ebh,0c08c727bh		; a[138] @ 8832
	.word	00e560419h,0408fca2dh		; a[139] @ 8896
	.word	039581062h,0c091c334h		; a[140] @ 8960
	.word	000000000h,04093d980h		; a[141] @ 9024
	.word	074bc6a7fh,0c0962e93h		; a[142] @ 9088
	.word	0d916872bh,04098c9ceh		; a[143] @ 9152
	.word	0a9fbe76dh,0c09bb371h		; a[144] @ 9216
	.word	020c49ba6h,0409ef4b0h		; a[145] @ 9280
	.word	0020c49bah,0c0a14bebh		; a[146] @ 9344
	.word	033333333h,040a35433h		; a[147] @ 9408
	.word	0ac083127h,0c0a5999ch		; a[148] @ 9472
	.word	08d4fdf3bh,040a82357h		; a[149] @ 9536
	.word	0fbe76c8bh,0c0aaf969h		; a[150] @ 9600
	.word	0cccccccdh,040ae24cch		; a[151] @ 9664
	.word	053f7ced9h,0c0b0d7c3h		; a[152] @ 9728
	.word	01eb851ech,040b2d265h		; a[153] @ 9792
	.word	056041893h,0c0b5088eh		; a[154] @ 9856
	.word	0b22d0e56h,040b7813dh		; a[155] @ 9920
	.word	05a1cac08h,0c0ba4444h		; a[156] @ 9984
	.word	076c8b439h,040bd5a5eh		; a[157] @ 10048
	.word	04bc6a7f0h,0c0c066a7h		; a[158] @ 10112
	.word	0b851eb85h,040c253feh		; a[159] @ 10176
	.word	0147ae148h,0c0c47b4eh		; a[160] @ 10240
	.word	01eb851ech,040c6e365h		; a[161] @ 10304
	.word	0b851eb85h,0c0c993deh		; a[162] @ 10368
	.word	0b851eb85h,040cc953eh		; a[163] @ 10432
	.word	066666666h,0c0cff106h		; a[164] @ 10496
	.word	09999999ah,040d1d8e9h		; a[165] @ 10560
	.word	08f5c28f6h,0c0d3f1c2h		; a[166] @ 10624
	.word	05c28f5c3h,040d649afh		; a[167] @ 10688
	.word	03d70a3d7h,0c0d8e81ah		; a[168] @ 10752
	.word	0851eb852h,040dbd54bh		; a[169] @ 10816
	.word	07ae147aeh,0c0df1a84h		; a[170] @ 10880
	.word	066666666h,040e1610eh		; a[171] @ 10944
	.word	03d70a3d7h,0c0e36bd2h		; a[172] @ 11008
	.word	08f5c28f6h,040e5b402h		; a[173] @ 11072
	.word	05c28f5c3h,0c0e840d7h		; a[174] @ 11136
	.word	047ae147bh,040eb1a61h		; a[175] @ 11200
	.word	0d70a3d71h,0c0ee49a3h		; a[176] @ 11264
	.word	0a3d70a3dh,040f0ec58h		; a[177] @ 11328
	.word	09999999ah,0c0f2e965h		; a[178] @ 11392
	.word	0b851eb85h,040f52242h		; a[179] @ 11456
	.word	05c28f5c3h,0c0f79df7h		; a[180] @ 11520
	.word	066666666h,040fa645eh		; a[181] @ 11584
	.word	066666666h,0c0fd7e3eh		; a[182] @ 11648
	.word	066666666h,041007ab2h		; a[183] @ 11712
	.word	0cccccccdh,0c1026a64h		; a[184] @ 11776
	.word	09999999ah,041049455h		; a[185] @ 11840
	.word	09999999ah,0c106ff5dh		; a[186] @ 11904
	.word	09999999ah,04109b321h		; a[187] @ 11968
	.word	09999999ah,0c10cb82dh		; a[188] @ 12032
	.word	09999999ah,041100c07h		; a[189] @ 12096
	.word	033333333h,0c111eeb9h		; a[190] @ 12160
	.word	000000000h,041140a22h		; a[191] @ 12224
	.word	066666666h,0c11664ech		; a[192] @ 12288
	.word	0cccccccdh,04119068ah		; a[193] @ 12352
	.word	09999999ah,0c11bf74fh		; a[194] @ 12416
	.word	09999999ah,0411f4087h		; a[195] @ 12480
	.word	0cccccccdh,0c121764bh		; a[196] @ 12544
	.word	033333333h,04123838eh		; a[197] @ 12608
	.word	09999999ah,0c125ce88h		; a[198] @ 12672
	.word	033333333h,041285e7bh		; a[199] @ 12736
	.word	09999999ah,0c12b3b80h		; a[200] @ 12800

;	C:\MATHLIB_Tools\CCSV5_5_0\ccsv5\tools\compiler\c6000_7.4.2\bin\opt6x.exe C:\\Users\\gtbldadm\\AppData\\Local\\Temp\\029886 C:\\Users\\gtbldadm\\AppData\\Local\\Temp\\029888 
;**	Parameter deleted: req_flags == 1;
;**	Parameter deleted: tol == 1e-09;
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
||         MVKL    .S2     0xe826d695,B6

           STDW    .D2T1   A13:A12,*SP--     ; |63| 
||         MVKL    .S1     output,A11
||         MVKL    .S2     0x3e112e0b,B7

           STW     .D2T1   A10,*SP--(8)      ; |63| 
||         MVKH    .S1     output,A11
||         MVKH    .S2     0xe826d695,B6

           LDW     .D1T2   *+A11(4),B4       ; |66| 
||         MV      .L1     A4,A6             ; |63| 
||         MVKH    .S2     0x3e112e0b,B7
||         MVK     .S1     0x1,A8            ; |66| 

           MV      .L1X    B3,A13            ; |63| 
||         CALLP   .S2     isequal,B3
||         MV      .S1     A4,A10            ; |63| 
||         LDW     .D1T1   *A11,A4           ; |66| 

$C$RL0:    ; CALL OCCURS {isequal} {0}       ; |66| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 30
           MVKL    .S2     0x3e112e0b,B7
           MVKL    .S2     0xe826d695,B6

           LDW     .D1T2   *+A11(8),B4       ; |67| 
||         MVKL    .S1     fcn_pass,A12
||         MVKH    .S2     0x3e112e0b,B7

           MV      .L1     A4,A3             ; |66| 
||         LDW     .D1T1   *A11,A4           ; |67| 
||         MVKH    .S1     fcn_pass,A12
||         MVKH    .S2     0xe826d695,B6

           CALLP   .S2     isequal,B3
||         STW     .D1T1   A3,*+A12(4)       ; |66| 
||         MV      .L1     A10,A6            ; |67| 
||         MVK     .S1     0x1,A8            ; |67| 

$C$RL1:    ; CALL OCCURS {isequal} {0}       ; |67| 
           MVKL    .S2     0xe826d695,B6
           MVKL    .S2     0x3e112e0b,B7

           LDW     .D1T2   *+A11(12),B4      ; |68| 
||         MVKH    .S2     0xe826d695,B6

           MV      .L1     A4,A3             ; |67| 
||         LDW     .D1T1   *A11,A4           ; |68| 
||         MVKH    .S2     0x3e112e0b,B7

           CALLP   .S2     isequal,B3
||         STW     .D1T1   A3,*+A12(8)       ; |67| 
||         MV      .L1     A10,A6            ; |68| 
||         MVK     .S1     0x1,A8            ; |68| 

$C$RL2:    ; CALL OCCURS {isequal} {0}       ; |68| 
           MVKL    .S2     0x3e112e0b,B7
           MVKL    .S2     0xe826d695,B6

           STW     .D1T1   A4,*+A12(12)      ; |68| 
||         MVKH    .S2     0x3e112e0b,B7

           MV      .L1     A11,A3            ; |66| 
||         LDW     .D1T2   *+A11(16),B4      ; |69| 
||         MVKH    .S2     0xe826d695,B6

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
;*   Local Frame Size  : 8 Args + 16 Auto + 56 Save = 80 byte                 *
;******************************************************************************
main:
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 12
           STW     .D2T1   A11,*SP--(8)      ; |124| 
           STW     .D2T1   A10,*SP--(8)      ; |124| 
           STDW    .D2T2   B13:B12,*SP--     ; |124| 
           STDW    .D2T2   B11:B10,*SP--     ; |124| 
           STDW    .D2T1   A15:A14,*SP--     ; |124| 

           STDW    .D2T1   A13:A12,*SP--     ; |124| 
||         MVKL    .S1     $C$SL1+0,A4

           STW     .D2T2   B3,*SP--(32)      ; |124| 
||         CALLP   .S2     driver_init,B3
||         MVKH    .S1     $C$SL1+0,A4

$C$RL4:    ; CALL OCCURS {driver_init} {0}   ; |132| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 7

           MVKL    .S1     a,A10
||         MVKL    .S2     output,B10

           MVKH    .S1     a,A10
||         MVKH    .S2     output,B10

           MV      .L1     A10,A13
||         CALL    .S1     tan               ; |141| 
||         LDW     .D2T1   *B10,A12

           LDDW    .D1T1   *A13++,A5:A4      ; |141| 
           MVK     .S2     0xc9,B4
           NOP             1
           MV      .L1X    B4,A11
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L3:    
;          EXCLUSIVE CPU CYCLES: 1
           ADDKPC  .S2     $C$RL5,B3,0       ; |141| 
$C$RL5:    ; CALL OCCURS {tan} {0}           ; |141| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 7

           SUB     .L1     A11,1,A0          ; |140| 
||         STDW    .D1T1   A5:A4,*A12++      ; |141| 
||         SUB     .S1     A11,1,A11         ; |140| 

   [!A0]   MVK     .S2     0xc9,B4
|| [!A0]   ADD     .L2     4,B10,B11
|| [ A0]   B       .S1     $C$L3             ; |140| 

   [ A0]   CALL    .S1     tan               ; |141| 
   [ A0]   LDDW    .D1T1   *A13++,A5:A4      ; |141| 
   [!A0]   MV      .L1     A10,A11
   [!A0]   ZERO    .L2     B10
   [!A0]   MV      .L1X    B4,A12
           ; BRANCHCC OCCURS {$C$L3}         ; |140| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 1
           CALL    .S1     tandp             ; |144| 
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L4:    
;          EXCLUSIVE CPU CYCLES: 5
           LDDW    .D1T1   *A11++,A5:A4      ; |144| 
           ADDKPC  .S2     $C$RL6,B3,3       ; |144| 
$C$RL6:    ; CALL OCCURS {tandp} {0}         ; |144| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 7

           LDW     .D2T2   *B11,B4           ; |144| 
||         SUB     .L1     A12,1,A0          ; |143| 
||         SUB     .S1     A12,1,A12         ; |143| 

   [ A0]   BNOP    .S1     $C$L4,3           ; |143| 

           ADD     .L2     B10,B4,B5         ; |144| 
||         ADD     .D2     8,B10,B10         ; |143| 
|| [!A0]   MVK     .S2     0xc9,B4

   [ A0]   CALL    .S1     tandp             ; |144| 
||         STDW    .D2T1   A5:A4,*B5         ; |144| 

           ; BRANCHCC OCCURS {$C$L4}         ; |143| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 1

           CALL    .S1     tandp_c           ; |147| 
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
$C$RL7:    ; CALL OCCURS {tandp_c} {0}       ; |147| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 7

           LDW     .D2T2   *B11,B4           ; |147| 
||         SUB     .L1     A11,1,A0          ; |146| 
||         SUB     .S1     A11,1,A11         ; |146| 

   [ A0]   BNOP    .S1     $C$L5,3           ; |146| 
|| [!A0]   ADD     .L1X    4,B11,A29

           ADD     .L2     B10,B4,B5         ; |147| 
||         ADD     .S2     8,B10,B10         ; |146| 

   [ A0]   CALL    .S1     tandp_c           ; |147| 
||         STDW    .D2T1   A5:A4,*B5         ; |147| 

           ; BRANCHCC OCCURS {$C$L5}         ; |146| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 1

           MV      .L1     A10,A28
||         MVK     .S2     0xc9,B0
||         LDW     .D1T1   *A29,A3

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains control code
;*----------------------------------------------------------------------------*
$C$L6:    
;          EXCLUSIVE CPU CYCLES: 73
           LDDW    .D1T1   *A28++,A7:A6      ; |165| 
           MVKL    .S1     0x3fd45f30,A5
           MVKL    .S1     0x6dc9c889,A4
           MVKH    .S1     0x3fd45f30,A5
           MVKH    .S1     0x6dc9c889,A4
           MPYDP   .M1     A5:A4,A7:A6,A5:A4 ; |165| 
           MVKL    .S2     0x400921fb,B5
           MVKL    .S2     0x54442c46,B4
           MVKH    .S2     0x400921fb,B5
           MVKH    .S2     0x54442c46,B4
           MVK     .L1     0xfffffffc,A8     ; |165| 
           MVKL    .S1     0x3d3a3fff,A9
           MVKH    .S1     0x3d3a3fff,A9
           ZERO    .L1     A31               ; |170| 
           MVKL    .S2     0x54442d18,B6
           DPINT   .L1     A5:A4,A4          ; |165| 
           MVKH    .S2     0x54442d18,B6
           MVKL    .S2     0x400921fb,B7
           MVKH    .S2     0x400921fb,B7
           INTDP   .L1     A4,A5:A4          ; |165| 
           NOP             5
           MPYDP   .M2X    B5:B4,A5:A4,B5:B4 ; |165| 
           MPYDP   .M1     A9:A8,A5:A4,A5:A4 ; |165| 
           NOP             8
           SUBDP   .L2X    A7:A6,B5:B4,B5:B4 ; |165| 
           MV      .L1X    B6,A6             ; |165| 
           MVKL    .S1     0x3fe921fb,A7
           MVKH    .S1     0x3fe921fb,A7
           NOP             3
           SUBDP   .L2X    B5:B4,A5:A4,B5:B4 ; |165| 
           MVKL    .S1     0x54442b65,A4
           MVKL    .S1     0x3ff921fb,A5
           MVKH    .S1     0x54442b65,A4
           MVKH    .S1     0x3ff921fb,A5
           NOP             3
           CMPGTDP .S1X    B5:B4,A5:A4,A0    ; |165| 
           ZERO    .L1     A5:A4             ; |168| 
   [ A0]   SUBDP   .L2     B5:B4,B7:B6,B25:B24 ; |165| 
   [!A0]   MV      .S2     B4,B24            ; |165| 
   [!A0]   MV      .L2     B5,B25            ; |165| 
           MVKL    .S2     0x54442b65,B4
           MVKL    .S2     0x3ff921fb,B5
           MVKH    .S2     0x54442b65,B4
           MVKH    .S2     0x3ff921fb,B5
           NOP             1
           CMPLTDP .S1X    B25:B24,A5:A4,A0  ; |168| 
           NOP             1

           SET     .S1     A31,31,31,A4      ; |170| 
|| [!A0]   ZERO    .L1     A9
|| [ A0]   ZERO    .D1     A9

   [!A0]   SET     .S1     A9,0x14,0x1d,A9
|| [!A0]   ZERO    .L1     A8                ; |154| 
|| [ A0]   ZERO    .D1     A8                ; |169| 

   [ A0]   XOR     .L2X    B25,A4,B25        ; |170| 
|| [ A0]   MVKH    .S1     0xbff00000,A9

           MPYDP   .M2     B25:B24,B25:B24,B7:B6 ; |125| 
||         CMPGTDP .S2X    B25:B24,A7:A6,B1  ; |174| 

           SUBDP   .L2     B5:B4,B25:B24,B5:B4 ; |177| 

   [ B1]   BNOP    .S2     $C$L7,2           ; |174| 
|| [ B1]   MVKL    .S1     0x3d3b3226,A5

   [ B1]   MVKL    .S1     0x3b981c8c,A4
   [ B1]   MVKH    .S1     0x3d3b3226,A5
   [ B1]   MVKH    .S1     0x3b981c8c,A4
           ; BRANCHCC OCCURS {$C$L7}         ; |174| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 88

           MVKL    .S2     0x63a94b17,B18
||         MVKL    .S1     0x3f25bf32,A5

           MVKL    .S2     0x3f2c5e5f,B19
||         MVKL    .S1     0x422069f7,A4

           MPYDP   .M2     B7:B6,B7:B6,B5:B4 ; |125| 
||         MVKH    .S2     0x63a94b17,B18
||         MVKH    .S1     0x3f25bf32,A5

           MVKH    .S2     0x3f2c5e5f,B19
||         MVKH    .S1     0x422069f7,A4

           MVKL    .S1     0x48036744,A20
           MVKL    .S1     0x3f435582,A21

           MPYDP   .M2     B19:B18,B7:B6,B23:B22 ; |125| 
||         MVKH    .S1     0x48036744,A20

           MVKH    .S1     0x3f435582,A21
           MVKL    .S1     0x3f8226e3,A7

           MVKL    .S2     0x452b75eb,B18
||         MVKL    .S1     0x55e6c23f,A6

           MVKL    .S2     0x3f57da36,B19
||         MVKL    .S1     0xe157ddd,A16

           MVKL    .S1     0x3f6d6d3d,A17
           MPYDP   .M2     B5:B4,B7:B6,B17:B16 ; |125| 
           MPYDP   .M1X    A5:A4,B5:B4,A5:A4 ; |125| 
           MVKH    .S2     0x452b75eb,B18
           MVKH    .S1     0x3f8226e3,A7
           MPYDP   .M2     B5:B4,B5:B4,B9:B8 ; |125| 
           MVKH    .S2     0x3f57da36,B19
           MVKH    .S1     0x55e6c23f,A6
           MPYDP   .M1X    A7:A6,B7:B6,A19:A18 ; |125| 
           MVKH    .S1     0xe157ddd,A16
           MVKH    .S1     0x3f6d6d3d,A17
           MPYDP   .M2     B19:B18,B17:B16,B19:B18 ; |125| 
           ADDDP   .L1X    A5:A4,B23:B22,A5:A4 ; |125| 
           MVKL    .S1     0x3f9664f4,A7
           MVKL    .S1     0x882c10f9,A6

           MPYDP   .M1X    A17:A16,B5:B4,A21:A20 ; |125| 
||         MPYDP   .M2X    A21:A20,B9:B8,B21:B20 ; |125| 

           MVKH    .S1     0x3f9664f4,A7
           MVKH    .S1     0x882c10f9,A6
           MVKL    .S1     0x5555554f,A16
           MPYDP   .M1X    B9:B8,A5:A4,A5:A4 ; |125| 
           MVKL    .S1     0x3fd55555,A17
           MVKH    .S1     0x5555554f,A16
           MVKH    .S1     0x3fd55555,A17
           MPYDP   .M1X    A7:A6,B9:B8,A7:A6 ; |125| 
           MPYDP   .M2X    A17:A16,B7:B6,B7:B6 ; |125| 

           ADDDP   .L2     B21:B20,B19:B18,B19:B18 ; |125| 
||         ADDDP   .L1     A21:A20,A19:A18,A21:A20 ; |125| 

           MVKL    .S2     0x11111105,B20
||         MVKL    .S1     0x1ba1ba20,A18

           MVKL    .S1     0x3faba1ba,A19
           MVKL    .S2     0x3fc11111,B21
           MVKH    .S1     0x1ba1ba20,A18
           MVKH    .S2     0x11111105,B20
           MVKH    .S1     0x3faba1ba,A19
           MVKH    .S2     0x3fc11111,B21
           ADDDP   .L1X    B19:B18,A21:A20,A17:A16 ; |125| 
           MPYDP   .M2     B21:B20,B5:B4,B5:B4 ; |125| 
           MPYDP   .M1X    A19:A18,B17:B16,A19:A18 ; |125| 
           NOP             5
           ADDDP   .L1     A5:A4,A17:A16,A5:A4 ; |125| 
           NOP             2
           ADDDP   .L2     B7:B6,B5:B4,B5:B4 ; |125| 
           ADDDP   .L1     A19:A18,A7:A6,A7:A6 ; |125| 
           NOP             2
           MPYDP   .M1X    B9:B8,A5:A4,A5:A4 ; |125| 
           NOP             3
           ADDDP   .L1X    B5:B4,A7:A6,A7:A6 ; |125| 
           NOP             6
           ADDDP   .L1     A5:A4,A7:A6,A5:A4 ; |125| 
           NOP             6
           MPYDP   .M1X    B25:B24,A5:A4,A5:A4 ; |125| 
           NOP             4
           BNOP    .S1     $C$L8,4           ; |125| 
           ADDDP   .L1X    B25:B24,A5:A4,A5:A4 ; |125| 
           ; BRANCH OCCURS {$C$L8}           ; |125| 
;** --------------------------------------------------------------------------*
$C$L7:    
;          EXCLUSIVE CPU CYCLES: 186
           ADDDP   .L1X    A5:A4,B5:B4,A21:A20 ; |177| 
           MVKL    .S2     0x48036744,B8
           MVKL    .S1     0x3f2c5e5f,A23
           MVKL    .S2     0x422069f7,B4
           MVKL    .S1     0x63a94b17,A22
           MVKL    .S2     0x3f25bf32,B5
           MVKH    .S1     0x3f2c5e5f,A23
           MPYDP   .M1     A21:A20,A21:A20,A5:A4 ; |177| 
           MVKH    .S2     0x422069f7,B4
           MVKH    .S1     0x63a94b17,A22
           MVKH    .S2     0x3f25bf32,B5
           MVKL    .S2     0x3f435582,B9
           MVKL    .S2     0x3f8226e3,B7
           MVKL    .S2     0x55e6c23f,B6
           MVKH    .S2     0x48036744,B8
           MVKH    .S2     0x3f435582,B9
           MVKH    .S2     0x3f8226e3,B7
           MPYDP   .M1     A5:A4,A5:A4,A17:A16 ; |177| 
           MVKH    .S2     0x55e6c23f,B6
           MPYDP   .M2X    B7:B6,A5:A4,B17:B16 ; |177| 
           MVKL    .S2     0x3fd55555,B21
           MPYDP   .M1     A23:A22,A5:A4,A27:A26 ; |177| 
           MVKL    .S2     0x5555554f,B20
           MVKL    .S2     0x3f6d6d3d,B19
           MVKL    .S2     0xe157ddd,B18
           MVKH    .S2     0x3f6d6d3d,B19
           MVKH    .S2     0xe157ddd,B18
           MPYDP   .M1     A17:A16,A5:A4,A7:A6 ; |177| 
           MPYDP   .M2X    B5:B4,A17:A16,B5:B4 ; |177| 
           MVKH    .S2     0x3fd55555,B21
           MVKH    .S2     0x5555554f,B20
           MPYDP   .M1     A17:A16,A17:A16,A19:A18 ; |177| 
           MPYDP   .M2X    B19:B18,A17:A16,B19:B18 ; |177| 
           MVKL    .S1     0x3f57da36,A23
           MVKL    .S1     0x452b75eb,A22
           MVKH    .S1     0x3f57da36,A23
           MVKH    .S1     0x452b75eb,A22
           MVKL    .S2     0x3f9664f4,B7
           ADDDP   .L2X    B5:B4,A27:A26,B5:B4 ; |177| 
           MVKL    .S2     0x882c10f9,B6
           MVKH    .S2     0x3f9664f4,B7

           MPYDP   .M2X    B21:B20,A5:A4,B9:B8 ; |177| 
||         MPYDP   .M1X    B9:B8,A19:A18,A25:A24 ; |177| 

           MVKH    .S2     0x882c10f9,B6
           ADDDP   .L2     B19:B18,B17:B16,B17:B16 ; |177| 
           MVKL    .S2     0x3faba1ba,B21
           MPYDP   .M1     A23:A22,A7:A6,A5:A4 ; |177| 
           MVKL    .S2     0x1ba1ba20,B20
           MVKH    .S2     0x3faba1ba,B21
           MVKH    .S2     0x1ba1ba20,B20
           MPYDP   .M2X    B21:B20,A7:A6,B21:B20 ; |177| 
           ZERO    .L1     A31
           NOP             2
           MPYDP   .M2X    A19:A18,B5:B4,B5:B4 ; |177| 
           NOP             1
           ADDDP   .L1     A25:A24,A5:A4,A7:A6 ; |177| 
           MVKL    .S1     0x11111105,A4
           MPYDP   .M2X    B7:B6,A19:A18,B7:B6 ; |177| 
           MVKL    .S1     0x3fc11111,A5
           MVKH    .S1     0x11111105,A4
           MVKH    .S1     0x3fc11111,A5
           MPYDP   .M1     A5:A4,A17:A16,A5:A4 ; |177| 
           NOP             1
           ADDDP   .L2X    A7:A6,B17:B16,B17:B16 ; |177| 
           NOP             6
           ADDDP   .L2     B5:B4,B17:B16,B5:B4 ; |177| 
           NOP             2

           ADDDP   .L2     B21:B20,B7:B6,B9:B8 ; |177| 
||         ADDDP   .S2X    B9:B8,A5:A4,B7:B6 ; |177| 

           NOP             4
           MPYDP   .M1X    A19:A18,B5:B4,A5:A4 ; |177| 
           NOP             1
           ADDDP   .L2     B7:B6,B9:B8,B5:B4 ; |177| 
           ZERO    .L1     A18               ; |65| 
           SET     .S1     A31,0x1e,0x1e,A19
           NOP             5
           ADDDP   .L1X    A5:A4,B5:B4,A5:A4 ; |177| 
           NOP             6
           MPYDP   .M1     A21:A20,A5:A4,A5:A4 ; |177| 
           NOP             9
           ADDDP   .L1     A21:A20,A5:A4,A17:A16 ; |177| 
           NOP             6
           RCPDP   .S1     A17:A16,A5:A4     ; |65| 
           NOP             1
           MPYDP   .M1     A17:A16,A5:A4,A7:A6 ; |65| 
           NOP             9
           SUBDP   .L1     A19:A18,A7:A6,A7:A6 ; |65| 
           NOP             6
           MPYDP   .M1     A5:A4,A7:A6,A5:A4 ; |65| 
           NOP             9
           MPYDP   .M1     A17:A16,A5:A4,A7:A6 ; |65| 
           NOP             9
           SUBDP   .L1     A19:A18,A7:A6,A7:A6 ; |65| 
           ABSDP   .S1     A17:A16,A19:A18   ; |65| 
           NOP             5
           MPYDP   .M1     A5:A4,A7:A6,A5:A4 ; |65| 
           NOP             3
           MVKL    .S1     0x47efffff,A7
           ZERO    .L1     A6
           MVKH    .S1     0x47efffff,A7
           MVKH    .S1     0xe0000000,A6
           CMPGTDP .S1     A19:A18,A7:A6,A0  ; |65| 
           NOP             1
   [!A0]   MPYDP   .M1     A17:A16,A5:A4,A7:A6 ; |65| 
   [ A0]   ZERO    .L1     A5:A4             ; |65| 
           NOP             5
           ZERO    .L1     A16               ; |65| 
   [!A0]   ZERO    .L1     A17
   [!A0]   SET     .S1     A17,0x1e,0x1e,A17
   [!A0]   SUBDP   .L1     A17:A16,A7:A6,A7:A6 ; |65| 
           NOP             6
   [!A0]   MPYDP   .M1     A5:A4,A7:A6,A5:A4 ; |65| 
;** --------------------------------------------------------------------------*
$C$L8:    
;          EXCLUSIVE CPU CYCLES: 20
           SUB     .L2     B0,1,B0           ; |149| 
   [!B0]   ADD     .L1     4,A29,A12
           NOP             7
           MPYDP   .M1     A9:A8,A5:A4,A5:A4 ; |150| 
           NOP             4
   [ B0]   BNOP    .S1     $C$L6,4           ; |149| 

   [!B0]   CALL    .S1     tandp_v           ; |152| 
||         STDW    .D1T1   A5:A4,*A3++       ; |150| 

           ; BRANCHCC OCCURS {$C$L6}         ; |149| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           LDW     .D1T2   *A12,B4           ; |152| 
           MV      .L1     A10,A4            ; |152| 
           MVK     .S1     0xc9,A6           ; |152| 
           ADDKPC  .S2     $C$RL8,B3,1       ; |152| 
$C$RL8:    ; CALL OCCURS {tandp_v} {0}       ; |152| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 12

           CALLP   .S2     allequal,B3
||         MVK     .S1     0xc9,A4           ; |157| 

$C$RL9:    ; CALL OCCURS {allequal} {0}      ; |157| 

           CALLP   .S2     print_test_results,B3
||         MVK     .L1     0x1,A4            ; |158| 

$C$RL10:   ; CALL OCCURS {print_test_results} {0}  ; |158| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 10

           MVKL    .S1     a_sc,A10
||         ZERO    .L2     B5

           MVKH    .S1     a_sc,A10
||         MVKH    .S2     0x80000000,B5
||         MVK     .L2     0xffffffff,B7     ; |172| 
||         ZERO    .D2     B4                ; |170| 

           STDW    .D1T2   B5:B4,*+A10(8)    ; |166| 
||         MV      .L2     B7,B6             ; |172| 
||         ZERO    .L1     A7

           STDW    .D1T2   B7:B6,*+A10(56)   ; |172| 
||         SET     .S1     A7,0x14,0x1d,A7
||         ZERO    .L2     B17
||         ZERO    .L1     A6                ; |170| 

           STDW    .D1T1   A7:A6,*+A10(32)   ; |169| 
||         MVKH    .S2     0xfff00000,B17
||         ZERO    .L1     A9
||         ZERO    .L2     B16               ; |170| 

           STDW    .D1T2   B17:B16,*+A10(24) ; |168| 
||         SET     .S1     A9,0x14,0x1e,A9
||         ZERO    .L2     B9
||         ZERO    .L1     A8                ; |170| 

           STDW    .D1T1   A9:A8,*+A10(16)   ; |167| 
||         MVKH    .S2     0xbff00000,B9
||         ZERO    .L2     B8                ; |170| 

           MVK     .L2     0x8,B4
||         STDW    .D1T2   B9:B8,*+A10(40)   ; |170| 
||         ZERO    .L1     A5:A4             ; |165| 

           ADD     .L2     -1,B5,B7
||         STDW    .D1T1   A5:A4,*A10        ; |165| 

           CALL    .S2     tan               ; |175| 
||         STDW    .D1T2   B7:B6,*+A10(48)   ; |171| 
||         MV      .L1X    B4,A13            ; |166| 
||         SUB     .S1     A10,8,A11
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
;          EXCLUSIVE CPU CYCLES: 5
           LDDW    .D1T1   *++A11,A5:A4      ; |175| 
           ADDKPC  .S2     $C$RL11,B3,3      ; |175| 
$C$RL11:   ; CALL OCCURS {tan} {0}           ; |175| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 29
           MVKL    .S1     output,A3
           MVKH    .S1     output,A3
           MV      .L1     A3,A14            ; |175| 
           LDW     .D1T1   *A14,A3           ; |175| 
           MV      .L2X    A5,B5             ; |175| 
           MV      .L2X    A4,B4             ; |175| 
           NOP             2
           ADD     .L2X    B10,A3,B6         ; |175| 
           STDW    .D2T2   B5:B4,*B6         ; |175| 

           CALLP   .S2     tandp,B3
||         LDDW    .D1T1   *A11,A5:A4        ; |176| 

$C$RL12:   ; CALL OCCURS {tandp} {0}         ; |176| 
           LDW     .D1T1   *+A14(4),A3       ; |176| 
           NOP             4
           ADD     .L2X    B10,A3,B4         ; |176| 
           STDW    .D2T1   A5:A4,*B4         ; |176| 

           CALLP   .S2     tandp_c,B3
||         LDDW    .D1T1   *A11,A5:A4        ; |177| 

$C$RL13:   ; CALL OCCURS {tandp_c} {0}       ; |177| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 77
           LDW     .D1T1   *+A14(8),A3       ; |177| 
           MVKL    .S2     0x400921fb,B5
           MVKH    .S2     0x400921fb,B5
           MVK     .L1     0xfffffffc,A8     ; |162| 
           MVKL    .S1     0x3d3a3fff,A9
           ADD     .L2X    B10,A3,B4         ; |177| 
           STDW    .D2T1   A5:A4,*B4         ; |177| 
           LDDW    .D1T1   *A11,A7:A6        ; |162| 
           MVKL    .S1     0x3fd45f30,A5
           MVKL    .S1     0x6dc9c889,A4
           MVKH    .S1     0x3fd45f30,A5
           MVKH    .S1     0x6dc9c889,A4
           MPYDP   .M1     A5:A4,A7:A6,A5:A4 ; |162| 
           MVKL    .S2     0x54442c46,B4
           MVKH    .S2     0x54442c46,B4
           MVKH    .S1     0x3d3a3fff,A9
           MVKL    .S2     0x3ff921fb,B9
           MVKL    .S2     0x54442b65,B8
           MVKH    .S2     0x3ff921fb,B9
           MVKH    .S2     0x54442b65,B8
           ZERO    .L1     A31               ; |170| 
           NOP             1
           DPINT   .L1     A5:A4,A3          ; |162| 
           NOP             3
           INTDP   .L1     A3,A5:A4          ; |162| 
           SET     .S1     A31,31,31,A3      ; |170| 
           NOP             4
           MPYDP   .M2X    B5:B4,A5:A4,B5:B4 ; |162| 
           MPYDP   .M1     A9:A8,A5:A4,A5:A4 ; |162| 
           NOP             8
           SUBDP   .L2X    A7:A6,B5:B4,B5:B4 ; |162| 
           MVKL    .S1     0x3fe921fb,A9
           MVKH    .S1     0x3fe921fb,A9
           NOP             4
           SUBDP   .L2X    B5:B4,A5:A4,B7:B6 ; |162| 
           MVKL    .S2     0x400921fb,B5
           MVKL    .S2     0x54442d18,B4
           MVKH    .S2     0x400921fb,B5
           MVKH    .S2     0x54442d18,B4
           ZERO    .L1     A5:A4             ; |168| 
           MV      .L1X    B4,A8             ; |174| 
           CMPGTDP .S2     B7:B6,B9:B8,B0    ; |164| 
           NOP             1
   [ B0]   SUBDP   .L2     B7:B6,B5:B4,B7:B6 ; |165| 
           MV      .S2     B9,B5
           MV      .L2     B8,B4
           NOP             5
           CMPLTDP .S1X    B7:B6,A5:A4,A0    ; |168| 
           NOP             1

   [ A0]   XOR     .L2X    B7,A3,B7          ; |170| 
|| [ A0]   ZERO    .L1     A7
|| [!A0]   ZERO    .S1     A7
|| [ A0]   ZERO    .D1     A6                ; |169| 

           MPYDP   .M2     B7:B6,B7:B6,B9:B8 ; |125| 
||         CMPGTDP .S2X    B7:B6,A9:A8,B0    ; |174| 
||         SUBDP   .L2     B5:B4,B7:B6,B5:B4 ; |175| 
|| [!A0]   SET     .S1     A7,0x14,0x1d,A7
|| [!A0]   ZERO    .L1     A6                ; |154| 

   [ A0]   MVKH    .S1     0xbff00000,A7

   [!B0]   BNOP    .S2     $C$L10,2          ; |174| 
|| [ B0]   MVKL    .S1     0x3d3b3226,A5

   [ B0]   MVKL    .S1     0x3b981c8c,A4
   [ B0]   MVKH    .S1     0x3d3b3226,A5
   [ B0]   MVKH    .S1     0x3b981c8c,A4
           ; BRANCHCC OCCURS {$C$L10}        ; |174| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 196
           ADDDP   .L1X    A5:A4,B5:B4,A19:A18 ; |175| 
           MVKL    .S2     0x3f435582,B17
           MVKL    .S1     0x63a94b17,A22
           MVKL    .S2     0x3f25bf32,B5
           MVKL    .S1     0x3f2c5e5f,A23
           MVKL    .S2     0x422069f7,B4
           MVKH    .S1     0x63a94b17,A22
           MPYDP   .M1     A19:A18,A19:A18,A5:A4 ; |177| 
           MVKH    .S2     0x3f25bf32,B5
           MVKH    .S1     0x3f2c5e5f,A23
           MVKH    .S2     0x422069f7,B4
           MVKL    .S2     0x48036744,B16
           MVKH    .S2     0x3f435582,B17
           MVKH    .S2     0x48036744,B16
           MVKL    .S2     0x5555554f,B20
           MVKL    .S2     0x3fd55555,B21
           MVKL    .S2     0x55e6c23f,B18
           MPYDP   .M1     A5:A4,A5:A4,A9:A8 ; |177| 
           MVKL    .S2     0x3f8226e3,B19
           MVKH    .S2     0x5555554f,B20
           MVKL    .S2     0x3f6d6d3d,B7
           MPYDP   .M1     A23:A22,A5:A4,A27:A26 ; |177| 
           MVKL    .S2     0xe157ddd,B6
           MVKH    .S2     0x3f6d6d3d,B7
           MVKH    .S2     0xe157ddd,B6
           MVKH    .S2     0x3fd55555,B21
           MVKH    .S2     0x55e6c23f,B18
           MPYDP   .M1     A9:A8,A5:A4,A21:A20 ; |177| 
           MPYDP   .M2X    B5:B4,A9:A8,B9:B8 ; |177| 
           MVKH    .S2     0x3f8226e3,B19
           MVKL    .S1     0x452b75eb,A22
           MPYDP   .M1     A9:A8,A9:A8,A17:A16 ; |177| 
           MPYDP   .M2X    B7:B6,A9:A8,B7:B6 ; |177| 
           MVKL    .S1     0x3f57da36,A23
           MVKH    .S1     0x452b75eb,A22
           MVKH    .S1     0x3f57da36,A23
           ZERO    .L1     A31
           NOP             2
           ADDDP   .L2X    B9:B8,A27:A26,B9:B8 ; |177| 
           NOP             1

           MPYDP   .M1X    B17:B16,A17:A16,A25:A24 ; |177| 
||         MPYDP   .M2X    B21:B20,A5:A4,B17:B16 ; |177| 

           NOP             3

           MPYDP   .M1     A23:A22,A21:A20,A5:A4 ; |177| 
||         MPYDP   .M2X    B19:B18,A5:A4,B5:B4 ; |177| 

           MVKL    .S2     0x1ba1ba20,B20
           MVKL    .S2     0x3faba1ba,B21
           MVKH    .S2     0x1ba1ba20,B20
           MVKH    .S2     0x3faba1ba,B21
           MPYDP   .M2X    B21:B20,A21:A20,B21:B20 ; |177| 
           MVKL    .S2     0x882c10f9,B18
           MVKL    .S2     0x3f9664f4,B19
           MVKH    .S2     0x882c10f9,B18
           MVKH    .S2     0x3f9664f4,B19

           ADDDP   .L1     A25:A24,A5:A4,A21:A20 ; |177| 
||         ADDDP   .L2     B7:B6,B5:B4,B7:B6 ; |177| 
||         MPYDP   .M2X    A17:A16,B9:B8,B5:B4 ; |177| 

           MVKL    .S1     0x11111105,A4
           MVKL    .S1     0x3fc11111,A5
           MVKH    .S1     0x11111105,A4
           MPYDP   .M2X    B19:B18,A17:A16,B19:B18 ; |177| 
           MVKH    .S1     0x3fc11111,A5
           MPYDP   .M1     A5:A4,A9:A8,A5:A4 ; |177| 
           NOP             1
           ADDDP   .L2X    A21:A20,B7:B6,B7:B6 ; |177| 
           NOP             6
           ADDDP   .L2     B5:B4,B7:B6,B5:B4 ; |177| 
           ADDDP   .S2     B21:B20,B19:B18,B9:B8 ; |177| 
           ADDDP   .L2X    B17:B16,A5:A4,B7:B6 ; |177| 
           NOP             5
           MPYDP   .M1X    A17:A16,B5:B4,A5:A4 ; |177| 
           ADDDP   .L2     B7:B6,B9:B8,B5:B4 ; |177| 
           NOP             8
           ADDDP   .L1X    A5:A4,B5:B4,A5:A4 ; |177| 
           NOP             6
           MPYDP   .M1     A19:A18,A5:A4,A5:A4 ; |177| 
           NOP             9
           ADDDP   .L1     A19:A18,A5:A4,A9:A8 ; |177| 
           ZERO    .S1     A18               ; |65| 
           SET     .S1     A31,0x1e,0x1e,A19
           NOP             4
           RCPDP   .S1     A9:A8,A5:A4       ; |65| 
           NOP             1
           MPYDP   .M1     A9:A8,A5:A4,A17:A16 ; |65| 
           NOP             9
           SUBDP   .L1     A19:A18,A17:A16,A17:A16 ; |65| 
           NOP             6
           MPYDP   .M1     A5:A4,A17:A16,A5:A4 ; |65| 
           NOP             9
           MPYDP   .M1     A9:A8,A5:A4,A17:A16 ; |65| 
           NOP             9
           SUBDP   .L1     A19:A18,A17:A16,A17:A16 ; |65| 
           NOP             6
           MPYDP   .M1     A5:A4,A17:A16,A5:A4 ; |65| 
           NOP             9
           MPYDP   .M1     A9:A8,A5:A4,A17:A16 ; |65| 
           NOP             9
           SUBDP   .L1     A19:A18,A17:A16,A17:A16 ; |65| 
           ABSDP   .S1     A9:A8,A9:A8       ; |67| 
           NOP             5
           MPYDP   .M1     A5:A4,A17:A16,A5:A4 ; |65| 
           NOP             2

           MVKL    .S1     0x47efffff,A17
||         ZERO    .L1     A16

           MVKH    .S1     0xe0000000,A16

           BNOP    .S2     $C$L11,2          ; |71| 
||         MVKH    .S1     0x47efffff,A17

           CMPGTDP .S1     A9:A8,A17:A16,A0  ; |67| 
           NOP             1
   [ A0]   ZERO    .L1     A5:A4             ; |68| 
           ; BRANCH OCCURS {$C$L11}          ; |71| 
;** --------------------------------------------------------------------------*
$C$L10:    
;          EXCLUSIVE CPU CYCLES: 92

           MVKL    .S2     0x3f2c5e5f,B5
||         MVKL    .S1     0x3f25bf32,A9

           MVKL    .S2     0x63a94b17,B4
||         MVKL    .S1     0x422069f7,A8

           MPYDP   .M2     B9:B8,B9:B8,B17:B16 ; |125| 
||         MVKH    .S2     0x3f2c5e5f,B5
||         MVKH    .S1     0x3f25bf32,A9

           MVKH    .S2     0x63a94b17,B4
||         MVKH    .S1     0x422069f7,A8

           MVKL    .S1     0x3f435582,A19
           MVKL    .S1     0x48036744,A18

           MPYDP   .M2     B5:B4,B9:B8,B25:B24 ; |125| 
||         MVKH    .S1     0x3f435582,A19

           MVKH    .S1     0x48036744,A18
           MVKL    .S1     0x3f6d6d3d,A17

           MVKL    .S2     0x3f57da36,B5
||         MVKL    .S1     0xe157ddd,A16

           MVKL    .S2     0x452b75eb,B4
||         MVKL    .S1     0x3f8226e3,A5

           MVKL    .S1     0x55e6c23f,A4
           MPYDP   .M2     B17:B16,B9:B8,B21:B20 ; |125| 
           MVKH    .S2     0x3f57da36,B5
           MVKH    .S1     0x3f6d6d3d,A17
           MVKH    .S2     0x452b75eb,B4
           MPYDP   .M2     B17:B16,B17:B16,B19:B18 ; |125| 
           MVKH    .S1     0xe157ddd,A16
           MPYDP   .M1X    A9:A8,B17:B16,A9:A8 ; |125| 
           MVKH    .S1     0x3f8226e3,A5
           MVKH    .S1     0x55e6c23f,A4
           MVKL    .S1     0x3fd55555,A21
           MPYDP   .M2     B5:B4,B21:B20,B5:B4 ; |125| 
           MPYDP   .M1X    A5:A4,B9:B8,A5:A4 ; |125| 
           MVKL    .S1     0x5555554f,A20
           MVKH    .S1     0x3fd55555,A21
           MPYDP   .M2X    A19:A18,B19:B18,B23:B22 ; |125| 
           MPYDP   .M1X    A17:A16,B17:B16,A19:A18 ; |125| 
           MVKH    .S1     0x5555554f,A20
           NOP             1
           MPYDP   .M2X    A21:A20,B9:B8,B9:B8 ; |125| 
           ADDDP   .L1X    A9:A8,B25:B24,A17:A16 ; |125| 
           MVKL    .S1     0x3f9664f4,A9
           MVKL    .S1     0x882c10f9,A8
           MVKH    .S1     0x3f9664f4,A9
           MVKH    .S1     0x882c10f9,A8
           ADDDP   .L2     B23:B22,B5:B4,B23:B22 ; |125| 
           ADDDP   .L1     A19:A18,A5:A4,A19:A18 ; |125| 
           MVKL    .S1     0x3faba1ba,A5
           MPYDP   .M1X    B19:B18,A17:A16,A17:A16 ; |125| 
           MVKL    .S2     0x3fc11111,B5
           MVKL    .S1     0x1ba1ba20,A4
           MVKL    .S2     0x11111105,B4
           MVKH    .S1     0x3faba1ba,A5
           ADDDP   .L1X    B23:B22,A19:A18,A19:A18 ; |125| 
           MVKH    .S1     0x1ba1ba20,A4
           MPYDP   .M1X    A5:A4,B21:B20,A5:A4 ; |125| 
           MVKH    .S2     0x3fc11111,B5
           MVKH    .S2     0x11111105,B4
           MPYDP   .M2     B5:B4,B17:B16,B5:B4 ; |125| 
           MPYDP   .M1X    A9:A8,B19:B18,A9:A8 ; |125| 
           ADDDP   .L1     A17:A16,A19:A18,A17:A16 ; |125| 
           NOP             7
           ADDDP   .L2     B9:B8,B5:B4,B5:B4 ; |125| 
           ADDDP   .L1     A5:A4,A9:A8,A5:A4 ; |125| 
           MPYDP   .M1X    B19:B18,A17:A16,A9:A8 ; |125| 
           NOP             5
           ADDDP   .L1X    B5:B4,A5:A4,A5:A4 ; |125| 
           NOP             6
           ADDDP   .L1     A9:A8,A5:A4,A5:A4 ; |125| 
           NOP             6
           MPYDP   .M1X    B7:B6,A5:A4,A5:A4 ; |125| 
           NOP             9
           ADDDP   .L1X    B7:B6,A5:A4,A5:A4 ; |125| 
;** --------------------------------------------------------------------------*
$C$L11:    
;          EXCLUSIVE CPU CYCLES: 17
           MVK     .S2     12,B4
           ADD     .L2X    A14,B4,B4
           LDW     .D2T2   *B4,B4            ; |178| 
           SUB     .L1     A13,1,A0          ; |174| 
           SUB     .S1     A13,1,A13         ; |174| 
           NOP             1
           MPYDP   .M1     A7:A6,A5:A4,A5:A4 ; |178| 
           ADD     .L2     B10,B4,B5         ; |178| 
           ADD     .L2     8,B10,B10         ; |174| 
           NOP             2
   [ A0]   BNOP    .S1     $C$L9,4           ; |174| 

   [ A0]   CALL    .S1     tan               ; |175| 
||         STDW    .D2T1   A5:A4,*B5         ; |178| 

           ; BRANCHCC OCCURS {$C$L9}         ; |174| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 6

           MV      .L1     A12,A3            ; |180| 
||         CALL    .S1     tandp_v           ; |180| 

           LDW     .D1T2   *A3,B4            ; |180| 
           ADDKPC  .S2     $C$RL14,B3,2      ; |180| 

           MV      .L1     A10,A4
||         MVK     .S1     0x8,A6            ; |180| 
||         STW     .D2T1   A12,*+SP(24)      ; |180| 

$C$RL14:   ; CALL OCCURS {tandp_v} {0}       ; |180| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 12

           CALLP   .S2     allequal,B3
||         MVK     .L1     0x8,A4            ; |183| 

$C$RL15:   ; CALL OCCURS {allequal} {0}      ; |183| 

           CALLP   .S2     print_test_results,B3
||         MVK     .L1     0x3,A4            ; |184| 

$C$RL16:   ; CALL OCCURS {print_test_results} {0}  ; |184| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5

           MVKL    .S1     a_ext,A10
||         ZERO    .L2     B5

           MVKH    .S1     a_ext,A10
||         SET     .S2     B5,0x14,0x14,B5
||         ZERO    .L2     B4                ; |187| 

           STDW    .D1T2   B5:B4,*A10        ; |187| 
||         MVK     .S2     0x6f4,B4

           MV      .L1     A10,A11           ; |187| 

           ZERO    .L2     B10
||         CALL    .S1     tan               ; |189| 
||         MV      .L1X    B4,A13            ; |187| 

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
$C$L12:    
;          EXCLUSIVE CPU CYCLES: 5
           LDDW    .D1T1   *A11,A5:A4        ; |189| 
           ADDKPC  .S2     $C$RL17,B3,3      ; |189| 
$C$RL17:   ; CALL OCCURS {tan} {0}           ; |189| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 28
           MV      .L1     A14,A3            ; |189| 
           LDW     .D1T1   *A3,A3            ; |189| 
           NOP             4
           ADD     .L2X    B10,A3,B4         ; |189| 
           STDW    .D2T1   A5:A4,*B4         ; |189| 

           CALLP   .S2     tandp,B3
||         LDDW    .D1T1   *A11,A5:A4        ; |190| 

$C$RL18:   ; CALL OCCURS {tandp} {0}         ; |190| 
           MV      .L1     A14,A3            ; |190| 
           LDW     .D1T1   *+A3(4),A3        ; |190| 
           NOP             4
           ADD     .L2X    B10,A3,B4         ; |190| 
           STDW    .D2T1   A5:A4,*B4         ; |190| 

           CALLP   .S2     tandp_c,B3
||         LDDW    .D1T1   *A11,A5:A4        ; |191| 

$C$RL19:   ; CALL OCCURS {tandp_c} {0}       ; |191| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 78
           MV      .L1     A14,A3            ; |191| 
           LDW     .D1T1   *+A3(8),A3        ; |191| 
           MVKL    .S2     0x400921fb,B5
           MVKH    .S2     0x400921fb,B5
           MVK     .L1     0xfffffffc,A8     ; |162| 
           MVKL    .S1     0x3d3a3fff,A9
           ADD     .L2X    B10,A3,B4         ; |191| 
           STDW    .D2T1   A5:A4,*B4         ; |191| 
           LDDW    .D1T1   *A11,A7:A6        ; |162| 
           MVKL    .S1     0x3fd45f30,A5
           MVKL    .S1     0x6dc9c889,A4
           MVKH    .S1     0x3fd45f30,A5
           MVKH    .S1     0x6dc9c889,A4
           MPYDP   .M1     A5:A4,A7:A6,A5:A4 ; |162| 
           MVKL    .S2     0x54442c46,B4
           MVKH    .S2     0x54442c46,B4
           MVKH    .S1     0x3d3a3fff,A9
           MVKL    .S2     0x3ff921fb,B7
           MVKL    .S2     0x54442b65,B6
           MVKH    .S2     0x3ff921fb,B7
           MVKH    .S2     0x54442b65,B6
           ZERO    .L1     A31               ; |170| 
           NOP             1
           DPINT   .L1     A5:A4,A3          ; |162| 
           NOP             3
           INTDP   .L1     A3,A5:A4          ; |162| 
           SET     .S1     A31,31,31,A3      ; |170| 
           NOP             4
           MPYDP   .M2X    B5:B4,A5:A4,B5:B4 ; |162| 
           MPYDP   .M1     A9:A8,A5:A4,A5:A4 ; |162| 
           NOP             8
           SUBDP   .L2X    A7:A6,B5:B4,B5:B4 ; |162| 
           MVKL    .S1     0x3fe921fb,A7
           MVKH    .S1     0x3fe921fb,A7
           NOP             4
           SUBDP   .L2X    B5:B4,A5:A4,B25:B24 ; |162| 
           MVKL    .S2     0x400921fb,B5
           MVKL    .S2     0x54442d18,B4
           MVKH    .S2     0x400921fb,B5
           MVKH    .S2     0x54442d18,B4
           ZERO    .L1     A5:A4             ; |168| 
           MV      .L1X    B4,A6             ; |174| 
           CMPGTDP .S2     B25:B24,B7:B6,B0  ; |164| 
           NOP             1
   [ B0]   SUBDP   .L2     B25:B24,B5:B4,B25:B24 ; |165| 
           MV      .S2     B7,B5
           MV      .L2     B6,B4
           NOP             5
           CMPLTDP .S1X    B25:B24,A5:A4,A0  ; |168| 
           NOP             1

   [ A0]   XOR     .L2X    B25,A3,B25        ; |170| 
|| [ A0]   ZERO    .S2     B21
|| [!A0]   ZERO    .D2     B21

           CMPGTDP .S2X    B25:B24,A7:A6,B0  ; |174| 
||         SUBDP   .L2     B5:B4,B25:B24,B5:B4 ; |175| 
|| [ A0]   ZERO    .D2     B20               ; |169| 

   [!A0]   ZERO    .D2     B20               ; |154| 

   [!B0]   B       .S2     $C$L13            ; |174| 
|| [!B0]   MPYDP   .M2     B25:B24,B25:B24,B5:B4 ; |125| 
|| [ B0]   MVKL    .S1     0x3d3b3226,A5

   [!A0]   SET     .S2     B21,0x14,0x1d,B21
   [ B0]   MVKL    .S1     0x3b981c8c,A4
   [ A0]   MVKH    .S2     0xbff00000,B21
   [ B0]   MVKH    .S1     0x3d3b3226,A5
   [ B0]   MVKH    .S1     0x3b981c8c,A4
           ; BRANCHCC OCCURS {$C$L13}        ; |174| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 198
           ADDDP   .L1X    A5:A4,B5:B4,A17:A16 ; |175| 
           MVKL    .S2     0x422069f7,B8
           MVKL    .S1     0x63a94b17,A20
           MVKL    .S2     0x3f25bf32,B9
           MVKL    .S1     0x3f2c5e5f,A21
           MVKH    .S2     0x422069f7,B8
           MVKH    .S1     0x63a94b17,A20
           MVKH    .S2     0x3f25bf32,B9
           MPYDP   .M1     A17:A16,A17:A16,A5:A4 ; |177| 
           MVKH    .S1     0x3f2c5e5f,A21
           MVKL    .S2     0x3f435582,B17
           MVKL    .S2     0x48036744,B16
           MVKL    .S2     0x3f8226e3,B5
           MVKL    .S2     0x55e6c23f,B4
           MVKH    .S2     0x3f435582,B17
           MVKH    .S2     0x48036744,B16
           MVKL    .S2     0x5555554f,B18
           MVKL    .S2     0x3fd55555,B19
           MPYDP   .M1     A5:A4,A5:A4,A7:A6 ; |177| 
           MVKH    .S2     0x3f8226e3,B5
           MVKH    .S2     0x55e6c23f,B4
           MVKH    .S2     0x5555554f,B18
           MVKH    .S2     0x3fd55555,B19
           MVKL    .S2     0xe157ddd,B6
           MVKL    .S2     0x3f6d6d3d,B7
           MPYDP   .M2X    B5:B4,A5:A4,B5:B4 ; |177| 
           MPYDP   .M1     A21:A20,A5:A4,A25:A24 ; |177| 
           MVKH    .S2     0xe157ddd,B6
           MVKH    .S2     0x3f6d6d3d,B7
           MPYDP   .M2X    B9:B8,A7:A6,B9:B8 ; |177| 
           MPYDP   .M1     A7:A6,A7:A6,A9:A8 ; |177| 
           MVKL    .S2     0x882c10f9,B22
           MVKL    .S2     0x3f9664f4,B23
           MVKH    .S2     0x882c10f9,B22
           MPYDP   .M1     A7:A6,A5:A4,A19:A18 ; |177| 
           MPYDP   .M2X    B7:B6,A7:A6,B7:B6 ; |177| 
           MVKH    .S2     0x3f9664f4,B23
           MVKL    .S1     0x452b75eb,A20
           MVKL    .S1     0x3f57da36,A21
           ADDDP   .L2X    B9:B8,A25:A24,B9:B8 ; |177| 
           MPYDP   .M1X    B17:B16,A9:A8,A23:A22 ; |177| 
           MPYDP   .M2X    B19:B18,A5:A4,B17:B16 ; |177| 
           MVKH    .S1     0x452b75eb,A20
           MVKH    .S1     0x3f57da36,A21
           MPYDP   .M1     A21:A20,A19:A18,A5:A4 ; |177| 
           MPYDP   .M2X    B23:B22,A9:A8,B19:B18 ; |177| 
           ADDDP   .L2     B7:B6,B5:B4,B5:B4 ; |177| 
           ZERO    .L1     A31
           MVKL    .S2     0x1ba1ba20,B22
           MVKL    .S2     0x3faba1ba,B23
           MVKH    .S2     0x1ba1ba20,B22
           MVKH    .S2     0x3faba1ba,B23
           MPYDP   .M2X    B23:B22,A19:A18,B23:B22 ; |177| 
           NOP             1
           ADDDP   .L1     A23:A22,A5:A4,A19:A18 ; |177| 
           MVKL    .S1     0x11111105,A4
           MPYDP   .M2X    A9:A8,B9:B8,B7:B6 ; |177| 
           MVKL    .S1     0x3fc11111,A5
           MVKH    .S1     0x11111105,A4
           MVKH    .S1     0x3fc11111,A5
           MPYDP   .M1     A5:A4,A7:A6,A5:A4 ; |177| 
           NOP             1
           ADDDP   .L2X    A19:A18,B5:B4,B5:B4 ; |177| 
           NOP             6
           ADDDP   .L2     B7:B6,B5:B4,B5:B4 ; |177| 
           ADDDP   .S2     B23:B22,B19:B18,B7:B6 ; |177| 
           ADDDP   .L2X    B17:B16,A5:A4,B9:B8 ; |177| 
           NOP             5
           MPYDP   .M1X    A9:A8,B5:B4,A5:A4 ; |177| 
           ADDDP   .L2     B9:B8,B7:B6,B5:B4 ; |177| 
           NOP             8
           ADDDP   .L1X    A5:A4,B5:B4,A5:A4 ; |177| 
           NOP             6
           MPYDP   .M1     A17:A16,A5:A4,A5:A4 ; |177| 
           NOP             9
           ADDDP   .L1     A17:A16,A5:A4,A7:A6 ; |177| 
           ZERO    .S1     A16               ; |65| 
           SET     .S1     A31,0x1e,0x1e,A17
           NOP             4
           RCPDP   .S1     A7:A6,A5:A4       ; |65| 
           NOP             1
           MPYDP   .M1     A7:A6,A5:A4,A9:A8 ; |65| 
           NOP             9
           SUBDP   .L1     A17:A16,A9:A8,A9:A8 ; |65| 
           NOP             6
           MPYDP   .M1     A5:A4,A9:A8,A5:A4 ; |65| 
           NOP             9
           MPYDP   .M1     A7:A6,A5:A4,A9:A8 ; |65| 
           NOP             9
           SUBDP   .L1     A17:A16,A9:A8,A9:A8 ; |65| 
           NOP             6
           MPYDP   .M1     A5:A4,A9:A8,A5:A4 ; |65| 
           NOP             9
           MPYDP   .M1     A7:A6,A5:A4,A9:A8 ; |65| 
           NOP             9
           SUBDP   .L1     A17:A16,A9:A8,A9:A8 ; |65| 
           ABSDP   .S1     A7:A6,A7:A6       ; |67| 
           NOP             5
           MPYDP   .M1     A5:A4,A9:A8,A5:A4 ; |65| 
           NOP             2
           MVKL    .S1     0x47efffff,A9
           ZERO    .L1     A8
           MVKH    .S1     0x47efffff,A9
           MVKH    .S1     0xe0000000,A8
           CMPGTDP .S1     A7:A6,A9:A8,A0    ; |67| 
           BNOP    .S2     $C$L14,1          ; |71| 
   [ A0]   ZERO    .L1     A5:A4             ; |68| 
           NOP             1
           MV      .L2X    A5,B5             ; |71| 
           MV      .L2X    A4,B4             ; |71| 
           ; BRANCH OCCURS {$C$L14}          ; |71| 
;** --------------------------------------------------------------------------*
$C$L13:    
;          EXCLUSIVE CPU CYCLES: 90

           MVKL    .S2     0x3f2c5e5f,B19
||         MVKL    .S1     0x3f25bf32,A7

           MVKL    .S2     0x63a94b17,B18
||         MVKL    .S1     0x422069f7,A6

           MVKH    .S2     0x3f2c5e5f,B19
||         MVKH    .S1     0x3f25bf32,A7

           MVKH    .S1     0x422069f7,A6
           MPYDP   .M2     B5:B4,B5:B4,B7:B6 ; |125| 
           MVKH    .S2     0x63a94b17,B18
           MVKL    .S1     0x3f435582,A17
           MVKL    .S1     0x48036744,A16

           MPYDP   .M2     B19:B18,B5:B4,B27:B26 ; |125| 
||         MVKL    .S1     0x3f8226e3,A5

           MVKL    .S1     0x55e6c23f,A4
           MVKL    .S1     0xe157ddd,A8
           MVKL    .S1     0x3f6d6d3d,A9
           MVKL    .S2     0x3f57da36,B19
           MVKH    .S1     0x3f8226e3,A5
           MPYDP   .M2     B7:B6,B5:B4,B17:B16 ; |125| 
           MVKL    .S2     0x452b75eb,B18
           MPYDP   .M1X    A7:A6,B7:B6,A7:A6 ; |125| 
           MVKH    .S1     0x55e6c23f,A4
           MPYDP   .M2     B7:B6,B7:B6,B9:B8 ; |125| 
           MVKH    .S2     0x3f57da36,B19
           MPYDP   .M1X    A5:A4,B5:B4,A5:A4 ; |125| 
           MVKH    .S1     0xe157ddd,A8
           MVKH    .S2     0x452b75eb,B18
           MVKH    .S1     0x3f6d6d3d,A9

           MPYDP   .M2     B19:B18,B17:B16,B19:B18 ; |125| 
||         MPYDP   .M1X    A9:A8,B7:B6,A19:A18 ; |125| 

           MVKH    .S1     0x3f435582,A17
           MVKH    .S1     0x48036744,A16
           MVKL    .S1     0x882c10f9,A8

           ADDDP   .L1X    A7:A6,B27:B26,A7:A6 ; |125| 
||         MVKL    .S1     0x3f9664f4,A9
||         MPYDP   .M2X    A17:A16,B9:B8,B23:B22 ; |125| 

           MVKH    .S1     0x882c10f9,A8
           MVKH    .S1     0x3f9664f4,A9

           MVKL    .S1     0x3fd55555,A17
||         MPYDP   .M1X    A9:A8,B9:B8,A9:A8 ; |125| 

           MVKL    .S1     0x5555554f,A16
           MVKH    .S1     0x3fd55555,A17

           ADDDP   .L1     A19:A18,A5:A4,A19:A18 ; |125| 
||         MVKH    .S1     0x5555554f,A16

           MVKL    .S1     0x3faba1ba,A5
           MPYDP   .M1X    B9:B8,A7:A6,A7:A6 ; |125| 
           MPYDP   .M2X    A17:A16,B5:B4,B5:B4 ; |125| 
           ADDDP   .L2     B23:B22,B19:B18,B19:B18 ; |125| 
           MVKL    .S1     0x1ba1ba20,A4
           MVKH    .S1     0x3faba1ba,A5
           MVKH    .S1     0x1ba1ba20,A4
           MPYDP   .M1X    A5:A4,B17:B16,A5:A4 ; |125| 
           MVKL    .S2     0x11111105,B22
           MVKL    .S2     0x3fc11111,B23
           MVKH    .S2     0x11111105,B22
           ADDDP   .L1X    B19:B18,A19:A18,A17:A16 ; |125| 
           MVKH    .S2     0x3fc11111,B23
           MPYDP   .M2     B23:B22,B7:B6,B7:B6 ; |125| 
           NOP             4
           ADDDP   .L1     A7:A6,A17:A16,A7:A6 ; |125| 
           ADDDP   .S1     A5:A4,A9:A8,A5:A4 ; |125| 
           NOP             3
           ADDDP   .L2     B5:B4,B7:B6,B5:B4 ; |125| 
           NOP             2
           MPYDP   .M2X    B9:B8,A7:A6,B7:B6 ; |125| 
           NOP             3
           ADDDP   .L2X    B5:B4,A5:A4,B5:B4 ; |125| 
           NOP             6
           ADDDP   .L2     B7:B6,B5:B4,B5:B4 ; |125| 
           NOP             6
           MPYDP   .M2     B25:B24,B5:B4,B5:B4 ; |125| 
           NOP             9
           ADDDP   .L2     B25:B24,B5:B4,B5:B4 ; |125| 
;** --------------------------------------------------------------------------*
$C$L14:    
;          EXCLUSIVE CPU CYCLES: 33
           MVK     .S2     12,B6
           ADD     .L2X    A14,B6,B6
           LDW     .D2T2   *B6,B6            ; |192| 
           ZERO    .L1     A6                ; |193| 
           ZERO    .L1     A7
           MVKH    .S1     0xbff80000,A7
           MPYDP   .M2     B21:B20,B5:B4,B5:B4 ; |192| 
           ADD     .L2     B10,B6,B6         ; |192| 
           SUB     .L1     A13,1,A0          ; |188| 
           SUB     .L1     A13,1,A13         ; |188| 
           ADD     .L2     8,B10,B10         ; |188| 
           NOP             5
           STDW    .D2T2   B5:B4,*B6         ; |192| 
           LDDW    .D1T1   *A11,A5:A4        ; |193| 
           NOP             4
           MPYDP   .M1     A7:A6,A5:A4,A5:A4 ; |193| 
           NOP             4
   [ A0]   BNOP    .S1     $C$L12,4          ; |188| 

   [ A0]   CALL    .S1     tan               ; |189| 
||         STDW    .D1T1   A5:A4,*++A11      ; |193| 

           ; BRANCHCC OCCURS {$C$L12}        ; |188| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 6
           CALL    .S1     tandp_v           ; |195| 
           LDW     .D1T2   *A12,B4           ; |195| 
           ADDKPC  .S2     $C$RL20,B3,2      ; |195| 

           MV      .L1     A10,A4
||         MVK     .S1     0x6f4,A6          ; |195| 

$C$RL20:   ; CALL OCCURS {tandp_v} {0}       ; |195| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 12

           CALLP   .S2     allequal,B3
||         MVK     .S1     0x6f4,A4          ; |198| 

$C$RL21:   ; CALL OCCURS {allequal} {0}      ; |198| 

           CALLP   .S2     print_test_results,B3
||         MVK     .L1     0x4,A4            ; |199| 

$C$RL22:   ; CALL OCCURS {print_test_results} {0}  ; |199| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 16
           MVKL    .S1     cycle_counts+24,A3

           MVKH    .S1     cycle_counts+24,A3
||         ZERO    .L2     B4                ; |114| 
||         ZERO    .L1     A10               ; |114| 
||         ZERO    .D1     A11               ; |114| 

           MVC     .S2     B4,TSCL           ; |115| 
||         STDW    .D1T1   A11:A10,*A3       ; |114| 

           MVC     .S2     TSCL,B4           ; |116| 
           MVC     .S2     TSCH,B5           ; |116| 
           MVKL    .S1     t_start,A3
           MVKH    .S1     t_start,A3

           MVC     .S2     TSCL,B6           ; |117| 
||         STDW    .D1T2   B5:B4,*A3         ; |116| 

           MVC     .S2     TSCH,B8           ; |117| 
           SUBU    .L2     B6,B4,B7:B6       ; |117| 

           EXT     .S2     B7,24,24,B4       ; |117| 
||         SUB     .L2     B8,B5,B5          ; |117| 
||         MVKL    .S1     t_offset,A3

           ADD     .L2     B5,B4,B7          ; |117| 
||         MVKH    .S1     t_offset,A3

           MVKL    .S1     input,A3
||         STDW    .D1T2   B7:B6,*A3         ; |117| 

           CALL    .S2     gimme_random      ; |209| 
||         MVKH    .S1     input,A3

           LDW     .D1T1   *A3,A13           ; |209| 
||         ZERO    .L1     A5

           MV      .L2X    A11,B4            ; |209| 
||         ZERO    .D2     B5
||         MVKH    .S1     0x40690000,A5
||         MV      .L1     A10,A4            ; |209| 
||         MV      .D1     A10,A12           ; |117| 
||         MVK     .S2     0x80,B10

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains control code
;*----------------------------------------------------------------------------*
$C$L15:    
;          EXCLUSIVE CPU CYCLES: 3
           MVKH    .S2     0xc0590000,B5
           ADDKPC  .S2     $C$RL23,B3,1      ; |209| 
$C$RL23:   ; CALL OCCURS {gimme_random} {0}  ; |209| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 75
           ADD     .L1     A13,A12,A3        ; |209| 

           STDW    .D1T1   A5:A4,*A3         ; |209| 
||         MVC     .S2     TSCL,B4           ; |122| 

           NOP             1

           MV      .L1X    B4,A22            ; |122| Define a twin register
||         MVC     .S2     TSCH,B6           ; |122| 

           ADD     .L1     A13,A12,A3        ; |164| 
           LDDW    .D1T1   *A3,A9:A8         ; |164| 
           MVKL    .S2     0x6dc9c889,B4
           MVKL    .S2     0x3fd45f30,B5
           MVKH    .S2     0x6dc9c889,B4
           MVKH    .S2     0x3fd45f30,B5
           MPYDP   .M2X    B5:B4,A9:A8,B9:B8 ; |164| 
           MPYDP   .M1X    B5:B4,A5:A4,A17:A16 ; |162| 
           MVKL    .S1     0x54442c46,A6
           MVKL    .S1     0x400921fb,A7
           MVKH    .S1     0x54442c46,A6
           MVKH    .S1     0x400921fb,A7
           MV      .L1     A13,A15           ; |164| 
           ZERO    .L2     B31               ; |170| 
           MV      .L1X    B6,A23            ; |122| 
           SET     .S2     B31,31,31,B7      ; |170| 
           DPINT   .L2     B9:B8,B4          ; |164| 
           DPINT   .L1     A17:A16,A3        ; |162| 
           MVKL    .S1     0x400921fb,A17
           MVKL    .S1     0x54442c46,A16
           INTDP   .L2     B4,B5:B4          ; |164| 
           MVK     .L2     0xfffffffc,B8     ; |164| 
           MVKL    .S2     0x3d3a3fff,B9
           MVKH    .S1     0x400921fb,A17
           MVKH    .S2     0x3d3a3fff,B9
           MVKH    .S1     0x54442c46,A16

           MPYDP   .M1X    A7:A6,B5:B4,A19:A18 ; |164| 
||         INTDP   .L1     A3,A7:A6          ; |162| 

           MPYDP   .M2     B9:B8,B5:B4,B9:B8 ; |164| 
           NOP             3
           MPYDP   .M1     A17:A16,A7:A6,A17:A16 ; |162| 
           MVK     .L2     0xfffffffc,B4     ; |162| 
           MVKL    .S2     0x3d3a3fff,B5
           MVKH    .S2     0x3d3a3fff,B5
           MPYDP   .M2X    B5:B4,A7:A6,B5:B4 ; |162| 
           SUBDP   .L1     A9:A8,A19:A18,A9:A8 ; |164| 
           NOP             4
           SUBDP   .L1     A5:A4,A17:A16,A5:A4 ; |162| 
           MVKL    .S1     0x3ff921fb,A17

           SUBDP   .L1X    A9:A8,B9:B8,A7:A6 ; |164| 
||         MVKL    .S1     0x54442b65,A16

           MVKH    .S1     0x3ff921fb,A17
           MVKH    .S1     0x54442b65,A16
           MVKL    .S1     0x400921fb,A9
           MVKL    .S1     0x54442d18,A8

           SUBDP   .L1X    A5:A4,B5:B4,A5:A4 ; |162| 
||         MVKH    .S1     0x400921fb,A9

           MVKH    .S1     0x54442d18,A8
           CMPGTDP .S1     A7:A6,A17:A16,A0  ; |164| 
           MVKL    .S2     0x3fe921fb,B5
   [ A0]   SUBDP   .S1     A7:A6,A9:A8,A5:A4 ; |165| 
           MVKH    .S2     0x3fe921fb,B5
           MV      .L2X    A8,B4             ; |170| 
           MV      .L1     A16,A8
           ZERO    .L1     A7:A6             ; |168| 
           MV      .L1     A17,A9
           NOP             1
           CMPLTDP .S1     A5:A4,A7:A6,A0    ; |168| 
           NOP             1

   [ A0]   XOR     .L1X    A5,B7,A5          ; |170| 
|| [ A0]   ZERO    .S1     A7
|| [!A0]   ZERO    .D1     A7

   [!A0]   SET     .S1     A7,0x14,0x1d,A7
|| [!A0]   ZERO    .L1     A6                ; |154| 
|| [ A0]   ZERO    .D1     A6                ; |169| 

           CMPGTDP .S2X    A5:A4,B5:B4,B0    ; |174| 
   [ A0]   MVKH    .S1     0xbff00000,A7

   [!B0]   BNOP    .S1     $C$L16,2          ; |174| 
|| [ B0]   SUBDP   .L1     A9:A8,A5:A4,A5:A4 ; |175| 
|| [!B0]   MPYDP   .M1     A5:A4,A5:A4,A9:A8 ; |125| 
|| [ B0]   MVKL    .S2     0x3d3b3226,B5

   [ B0]   MVKL    .S2     0x3b981c8c,B4
   [ B0]   MVKH    .S2     0x3d3b3226,B5
   [ B0]   MVKH    .S2     0x3b981c8c,B4
           ; BRANCHCC OCCURS {$C$L16}        ; |174| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 200
           MVKL    .S1     0x3f435582,A9
           ADDDP   .L2X    B5:B4,A5:A4,B9:B8 ; |175| 
           MVKL    .S2     0x63a94b17,B20
           MVKL    .S1     0x48036744,A8
           MVKL    .S2     0x3f2c5e5f,B21
           MVKH    .S2     0x63a94b17,B20
           MVKL    .S1     0x3f25bf32,A5
           MVKH    .S2     0x3f2c5e5f,B21
           MPYDP   .M2     B9:B8,B9:B8,B19:B18 ; |177| 
           MVKL    .S1     0x422069f7,A4
           MVKL    .S2     0x452b75eb,B24
           MVKH    .S1     0x3f25bf32,A5
           MVKL    .S2     0x3f57da36,B25
           MVKL    .S1     0x3f6d6d3d,A19
           MVKL    .S1     0x55e6c23f,A20
           MVKL    .S1     0x3f8226e3,A21
           MVKH    .S1     0x55e6c23f,A20
           MVKH    .S1     0x3f8226e3,A21
           MPYDP   .M2     B19:B18,B19:B18,B5:B4 ; |177| 
           MPYDP   .M1X    A21:A20,B19:B18,A21:A20 ; |177| 
           MVKL    .S1     0xe157ddd,A18
           MVKH    .S1     0x3f6d6d3d,A19
           MPYDP   .M2     B21:B20,B19:B18,B23:B22 ; |177| 
           MVKH    .S1     0xe157ddd,A18
           MVKH    .S1     0x422069f7,A4
           MVKH    .S1     0x3f435582,A9
           MVKH    .S1     0x48036744,A8
           MVKL    .S1     0x5555554f,A16
           MPYDP   .M2     B5:B4,B19:B18,B17:B16 ; |177| 
           MPYDP   .M1X    A19:A18,B5:B4,A25:A24 ; |177| 
           MVKL    .S1     0x3fd55555,A17
           MVKH    .S1     0x5555554f,A16
           MPYDP   .M2     B5:B4,B5:B4,B7:B6 ; |177| 
           MPYDP   .M1X    A5:A4,B5:B4,A5:A4 ; |177| 
           MVKH    .S1     0x3fd55555,A17
           MVKH    .S2     0x452b75eb,B24
           MVKH    .S2     0x3f57da36,B25
           MPYDP   .M1X    A17:A16,B19:B18,A19:A18 ; |177| 
           MPYDP   .M2     B25:B24,B17:B16,B19:B18 ; |177| 
           ADDDP   .L1     A25:A24,A21:A20,A21:A20 ; |177| 
           ZERO    .L2     B31
           NOP             1
           MPYDP   .M2X    A9:A8,B7:B6,B21:B20 ; |177| 
           ADDDP   .L1X    A5:A4,B23:B22,A5:A4 ; |177| 
           NOP             1
           MVKL    .S1     0x3f9664f4,A9
           MVKL    .S1     0x882c10f9,A8
           MVKH    .S1     0x3f9664f4,A9
           MVKH    .S1     0x882c10f9,A8
           MPYDP   .M1X    A9:A8,B7:B6,A17:A16 ; |177| 
           NOP             2
           MVKL    .S1     0x3faba1ba,A9
           MVKL    .S1     0x1ba1ba20,A8
           MVKH    .S1     0x3faba1ba,A9
           MVKH    .S1     0x1ba1ba20,A8

           ADDDP   .L2     B21:B20,B19:B18,B17:B16 ; |177| 
||         MPYDP   .M1X    A9:A8,B17:B16,A9:A8 ; |177| 

           MVKL    .S2     0x11111105,B18
           MVKL    .S2     0x3fc11111,B19
           MVKH    .S2     0x11111105,B18
           MPYDP   .M1X    B7:B6,A5:A4,A5:A4 ; |177| 
           MVKH    .S2     0x3fc11111,B19
           MPYDP   .M2     B19:B18,B5:B4,B5:B4 ; |177| 
           NOP             1
           ADDDP   .L1X    B17:B16,A21:A20,A21:A20 ; |177| 
           MV      .L2X    A10,B16           ; |65| 
           ADDDP   .L1     A9:A8,A17:A16,A9:A8 ; |177| 
           SET     .S2     B31,0x1e,0x1e,B17
           NOP             3
           ADDDP   .L1     A5:A4,A21:A20,A5:A4 ; |177| 
           NOP             2
           ADDDP   .L1X    A19:A18,B5:B4,A17:A16 ; |177| 
           NOP             4
           MPYDP   .M2X    B7:B6,A5:A4,B5:B4 ; |177| 
           NOP             1
           ADDDP   .L1     A17:A16,A9:A8,A5:A4 ; |177| 
           NOP             7
           ADDDP   .L2X    B5:B4,A5:A4,B5:B4 ; |177| 
           NOP             6
           MPYDP   .M2     B9:B8,B5:B4,B5:B4 ; |177| 
           NOP             9
           ADDDP   .L2     B9:B8,B5:B4,B7:B6 ; |177| 
           NOP             6
           RCPDP   .S2     B7:B6,B5:B4       ; |65| 
           NOP             1
           MPYDP   .M2     B7:B6,B5:B4,B9:B8 ; |65| 
           NOP             9
           SUBDP   .L2     B17:B16,B9:B8,B9:B8 ; |65| 
           NOP             6
           MPYDP   .M2     B5:B4,B9:B8,B5:B4 ; |65| 
           NOP             9
           MPYDP   .M2     B7:B6,B5:B4,B9:B8 ; |65| 
           NOP             9
           SUBDP   .L2     B17:B16,B9:B8,B9:B8 ; |65| 
           NOP             6
           MPYDP   .M2     B5:B4,B9:B8,B5:B4 ; |65| 
           NOP             9
           MPYDP   .M2     B7:B6,B5:B4,B9:B8 ; |65| 
           NOP             9
           SUBDP   .L2     B17:B16,B9:B8,B9:B8 ; |65| 
           ABSDP   .S2     B7:B6,B7:B6       ; |67| 
           NOP             5
           MPYDP   .M2     B5:B4,B9:B8,B5:B4 ; |65| 
           NOP             2
           MVKL    .S2     0x47efffff,B9
           ZERO    .L2     B8
           MVKH    .S2     0x47efffff,B9
           MVKH    .S2     0xe0000000,B8
           CMPGTDP .S2     B7:B6,B9:B8,B0    ; |67| 
           BNOP    .S1     $C$L17,1          ; |71| 
   [ B0]   ZERO    .L2     B5:B4             ; |68| 
           NOP             1
           MV      .L1X    B5,A5             ; |71| 
           MV      .L1X    B4,A4             ; |71| 
           ; BRANCH OCCURS {$C$L17}          ; |71| 
;** --------------------------------------------------------------------------*
$C$L16:    
;          EXCLUSIVE CPU CYCLES: 91

           MVKL    .S1     0x3f2c5e5f,A25
||         MVKL    .S2     0x3f25bf32,B7

           MVKL    .S1     0x63a94b17,A24
||         MVKL    .S2     0x422069f7,B6

           MVKH    .S1     0x3f2c5e5f,A25
||         MVKH    .S2     0x3f25bf32,B7

           MVKH    .S1     0x63a94b17,A24
||         MVKH    .S2     0x422069f7,B6

           MPYDP   .M1     A9:A8,A9:A8,A17:A16 ; |125| 
||         MVKL    .S2     0x3f435582,B17

           MVKL    .S2     0x48036744,B16
           MVKH    .S2     0x3f435582,B17
           MVKH    .S2     0x48036744,B16

           MPYDP   .M1     A25:A24,A9:A8,A29:A28 ; |125| 
||         MVKL    .S2     0x3f8226e3,B5

           MVKL    .S2     0x55e6c23f,B4
           MVKH    .S2     0x3f8226e3,B5

           MVKL    .S1     0x3f57da36,A25
||         MVKH    .S2     0x55e6c23f,B4

           MVKL    .S2     0x3f9664f4,B19
           MVKL    .S1     0x452b75eb,A24
           MPYDP   .M1     A17:A16,A9:A8,A21:A20 ; |125| 
           MVKL    .S2     0x882c10f9,B18
           MVKH    .S1     0x3f57da36,A25
           MPYDP   .M2X    B7:B6,A17:A16,B9:B8 ; |125| 
           MPYDP   .M1     A17:A16,A17:A16,A19:A18 ; |125| 
           MVKL    .S2     0x3faba1ba,B21
           MVKH    .S1     0x452b75eb,A24
           MVKL    .S2     0x3f6d6d3d,B7
           MVKL    .S2     0xe157ddd,B6
           MPYDP   .M2X    B5:B4,A9:A8,B5:B4 ; |125| 
           MPYDP   .M1     A25:A24,A21:A20,A25:A24 ; |125| 
           MVKH    .S2     0x3f6d6d3d,B7
           MVKH    .S2     0xe157ddd,B6
           MPYDP   .M2X    B7:B6,A17:A16,B7:B6 ; |125| 
           MPYDP   .M1X    B17:B16,A19:A18,A27:A26 ; |125| 
           MVKL    .S2     0x1ba1ba20,B20
           MVKH    .S2     0x3f9664f4,B19
           ADDDP   .L2X    B9:B8,A29:A28,B9:B8 ; |125| 
           MVKH    .S2     0x882c10f9,B18
           MVKH    .S2     0x3faba1ba,B21
           MVKL    .S2     0x3fd55555,B17
           MVKL    .S2     0x5555554f,B16
           MVKH    .S2     0x3fd55555,B17
           MVKH    .S2     0x5555554f,B16

           ADDDP   .L1     A27:A26,A25:A24,A27:A26 ; |125| 
||         MPYDP   .M2X    A19:A18,B9:B8,B9:B8 ; |125| 

           ADDDP   .L2     B7:B6,B5:B4,B7:B6 ; |125| 
           MVKH    .S2     0x1ba1ba20,B20
           MPYDP   .M1X    B17:B16,A9:A8,A9:A8 ; |125| 
           MPYDP   .M2X    B21:B20,A21:A20,B17:B16 ; |125| 
           MVKL    .S1     0x3fc11111,A25
           MVKL    .S1     0x11111105,A24
           MVKH    .S1     0x3fc11111,A25
           ADDDP   .L2X    A27:A26,B7:B6,B7:B6 ; |125| 
           MVKH    .S1     0x11111105,A24
           MPYDP   .M2X    B19:B18,A19:A18,B5:B4 ; |125| 
           MPYDP   .M1     A25:A24,A17:A16,A17:A16 ; |125| 
           NOP             4
           ADDDP   .L2     B9:B8,B7:B6,B7:B6 ; |125| 
           NOP             3
           ADDDP   .L2     B17:B16,B5:B4,B5:B4 ; |125| 
           ADDDP   .L1     A9:A8,A17:A16,A9:A8 ; |125| 
           NOP             2
           MPYDP   .M1X    A19:A18,B7:B6,A17:A16 ; |125| 
           NOP             3
           ADDDP   .L1X    A9:A8,B5:B4,A9:A8 ; |125| 
           NOP             6
           ADDDP   .L1     A17:A16,A9:A8,A9:A8 ; |125| 
           NOP             6
           MPYDP   .M1     A5:A4,A9:A8,A9:A8 ; |125| 
           NOP             9
           ADDDP   .L1     A5:A4,A9:A8,A5:A4 ; |125| 
;** --------------------------------------------------------------------------*
$C$L17:    
;          EXCLUSIVE CPU CYCLES: 33
           MVKL    .S2     output+12,B4
           MVKH    .S2     output+12,B4
           LDW     .D2T2   *B4,B4            ; |213| 
           MVKL    .S1     t_start,A3
           MVKH    .S1     t_start,A3
           STDW    .D1T1   A23:A22,*A3
           MPYDP   .M1     A7:A6,A5:A4,A5:A4 ; |213| 
           ADD     .L1X    A12,B4,A3         ; |213| 
           NOP             8

           STDW    .D1T1   A5:A4,*A3         ; |213| 
||         MVC     .S2     TSCL,B8           ; |128| 

           MVC     .S2     TSCH,B4           ; |128| 

           MVKL    .S1     t_offset,A3
||         MVKL    .S2     cycle_counts+24,B5
||         SUB     .L1X    B10,1,A0          ; |207| 
||         MV      .L2     B4,B9             ; |128| 
||         ADD     .D1     8,A12,A12         ; |207| 
||         SUB     .D2     B10,1,B10         ; |207| 

           MVKH    .S1     t_offset,A3
||         MVKH    .S2     cycle_counts+24,B5

           MVKL    .S1     t_stop,A31
||         LDDW    .D1T1   *A3,A5:A4         ; |130| 

           LDDW    .D2T2   *B5,B7:B6         ; |130| 
           MVKH    .S1     t_stop,A31
           MV      .L1X    B5,A14            ; |130| 
           STDW    .D1T2   B9:B8,*A31        ; |128| 

           ADDU    .L1     A4,A22,A7:A6      ; |130| 
|| [ A0]   MV      .S1     A10,A4            ; |209| 

           ADD     .L1     A7,A5,A3          ; |130| 
|| [ A0]   ZERO    .S1     A5

           ADD     .L1     A3,A23,A3         ; |130| 
|| [ A0]   B       .S2     $C$L15            ; |207| 
||         SUBU    .L2X    B8,A6,B5:B4       ; |130| 
|| [ A0]   MVKH    .S1     0x40690000,A5

           EXT     .S2     B5,24,24,B16      ; |130| 
||         ADDU    .L2     B6,B4,B5:B4       ; |130| 

           SUB     .L2X    B9,A3,B6          ; |130| 
|| [ A0]   MVKL    .S1     input,A3
||         ADD     .S2     B5,B7,B5          ; |130| 

   [ A0]   CALL    .S2     gimme_random      ; |209| 
|| [ A0]   MVKH    .S1     input,A3
||         ADD     .L2     B6,B16,B6         ; |130| 

   [ A0]   LDW     .D1T1   *A3,A13           ; |209| 
||         ADD     .L2     B5,B6,B5          ; |130| 

   [!A0]   CALL    .S1     __c6xabi_fltllif  ; |135| 
||         STDW    .D1T2   B5:B4,*A14        ; |130| 
|| [ A0]   ZERO    .L2     B5
|| [ A0]   MV      .S2X    A11,B4            ; |209| 

           ; BRANCHCC OCCURS {$C$L15}        ; |207| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           LDDW    .D1T1   *A14,A5:A4        ; |135| 
           ADDKPC  .S2     $C$RL24,B3,3      ; |135| 
$C$RL24:   ; CALL OCCURS {__c6xabi_fltllif} {0}  ; |135| 
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
$C$RL25:   ; CALL OCCURS {__c6xabi_fixdlli} {0}  ; |135| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 13
           MV      .L2X    A14,B4
           MVK     .S1     24,A14

           SUB     .L1X    B4,A14,A14
||         STDW    .D2T1   A5:A4,*B4         ; |135| 
||         MV      .L2X    A10,B5            ; |114| 

           MVC     .S2     B5,TSCL           ; |115| 
||         STDW    .D1T1   A11:A10,*A14      ; |114| 

           MVC     .S2     TSCL,B5           ; |116| 
           MVC     .S2     TSCH,B4           ; |116| 
           MVC     .S2     TSCL,B6           ; |117| 
           MVC     .S2     TSCH,B8           ; |117| 
           SUBU    .L2     B6,B5,B7:B6       ; |117| 
           MVK     .S1     0x80,A30

           EXT     .S2     B7,24,24,B4       ; |117| 
||         SUB     .L2     B8,B4,B5          ; |117| 
||         MV      .L1X    B6,A3             ; |117| 
||         STW     .D2T1   A30,*+SP(12)      ; |117| 
||         MVKL    .S1     output,A31

           ADD     .L2     B5,B4,B4          ; |117| 
||         STW     .D2T1   A3,*+SP(16)       ; |117| 
||         MVKH    .S1     output,A31
||         MV      .S2X    A10,B12

           STW     .D2T2   B4,*+SP(20)       ; |117| 
||         LDW     .D1T1   *A31,A12
||         MV      .L2X    A10,B10

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
;          EXCLUSIVE CPU CYCLES: 8
           MVC     .S2     TSCL,B11          ; |122| 
           MVC     .S2     TSCH,B13          ; |122| 
           CALL    .S1     tan               ; |222| 
           LDDW    .D1T1   *A15++,A5:A4      ; |222| 
           ADDKPC  .S2     $C$RL26,B3,3      ; |222| 
$C$RL26:   ; CALL OCCURS {tan} {0}           ; |222| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 14

           STDW    .D1T1   A5:A4,*A12++      ; |222| 
||         MVC     .S2     TSCL,B8           ; |128| 

           MVC     .S2     TSCH,B6           ; |128| 

           LDW     .D2T1   *+SP(12),A3       ; |130| 
||         MV      .L2     B6,B9             ; |128| 

           LDW     .D2T2   *+SP(16),B4       ; |128| 
           LDW     .D2T2   *+SP(20),B31      ; |130| 
           NOP             2
           SUB     .L1     A3,1,A0           ; |220| 

           ADDU    .L2     B4,B11,B5:B4      ; |130| 
||         STW     .D2T1   A0,*+SP(12)       ; |130| 
|| [ A0]   B       .S2     $C$L18            ; |220| 
|| [!A0]   MVKL    .S1     t_stop,A3

           MV      .L2     B4,B7             ; |130| 
||         ADD     .S2     B5,B31,B4         ; |130| 
|| [!A0]   MVKH    .S1     t_stop,A3

           ADD     .S2     B4,B13,B7         ; |130| 
||         SUBU    .L2     B8,B7,B5:B4       ; |130| 
|| [!A0]   CALL    .S1     __c6xabi_fltllif  ; |135| 

           ADDU    .L2     B10,B4,B11:B10    ; |130| 
||         EXT     .S2     B5,24,24,B5       ; |130| 
||         SUB     .D2     B6,B7,B4          ; |130| 

           ADD     .L2     B4,B5,B5          ; |130| 
||         ADD     .S2     B11,B12,B4        ; |130| 

           ADD     .L2     B4,B5,B12         ; |130| 
           ; BRANCHCC OCCURS {$C$L18}        ; |220| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 2
           MV      .L1X    B10,A4            ; |135| 

           MV      .L1X    B12,A5            ; |135| 
||         ADDKPC  .S2     $C$RL27,B3,0      ; |135| 
||         STDW    .D1T2   B9:B8,*A3

$C$RL27:   ; CALL OCCURS {__c6xabi_fltllif} {0}  ; |135| 
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
$C$RL28:   ; CALL OCCURS {__c6xabi_fixdlli} {0}  ; |135| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 12

           MV      .L2X    A11,B4            ; |114| 
||         STDW    .D1T1   A11:A10,*+A14(16) ; |114| 

           MVC     .S2     B4,TSCL           ; |115| 
||         STDW    .D1T1   A5:A4,*A14        ; |135| 

           MVC     .S2     TSCL,B4           ; |116| 
           MVC     .S2     TSCH,B6           ; |116| 
           MVC     .S2     TSCL,B5           ; |117| 
           MVC     .S2     TSCH,B7           ; |117| 
           MVKL    .S1     t_offset,A3
           MVKH    .S1     t_offset,A3
           SUBU    .L2     B5,B4,B5:B4       ; |117| 

           MVK     .S1     0x80,A3
||         MV      .L2X    A3,B8             ; |117| 
||         EXT     .S2     B5,24,24,B5       ; |117| 
||         SUB     .D2     B7,B6,B6          ; |117| 

           ADD     .L2     B6,B5,B5          ; |117| 

           STDW    .D2T2   B5:B4,*B8         ; |117| 
||         MV      .L2X    A3,B10            ; |117| 

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
           LDW     .D1T1   *A3,A3            ; |231| 
           MVKL    .S2     t_start,B6
           MVKH    .S2     t_start,B6
           STDW    .D2T2   B5:B4,*B6         ; |122| 
           NOP             1

           ADD     .L1     A12,A3,A3         ; |231| 
||         CALL    .S1     tandp_c           ; |231| 

           LDDW    .D1T1   *A3,A5:A4         ; |231| 
           ADDKPC  .S2     $C$RL29,B3,3      ; |231| 
$C$RL29:   ; CALL OCCURS {tandp_c} {0}       ; |231| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 24
           MVKL    .S2     output+8,B4
           MVKH    .S2     output+8,B4
           LDW     .D2T2   *B4,B4            ; |231| 
           NOP             4
           ADD     .L1X    A12,B4,A3         ; |231| 

           STDW    .D1T1   A5:A4,*A3         ; |231| 
||         MVC     .S2     TSCL,B16          ; |128| 

           MVC     .S2     TSCH,B6           ; |128| 

           MVKL    .S2     t_start,B11
||         MVKL    .S1     t_offset,A15
||         SUB     .L1X    B10,1,A0          ; |229| 
||         MV      .L2     B6,B17            ; |128| 
||         ADD     .D1     8,A12,A12         ; |229| 
||         SUB     .D2     B10,1,B10         ; |229| 

           MVKH    .S2     t_start,B11
||         MVKH    .S1     t_offset,A15

           LDDW    .D1T1   *A15,A5:A4        ; |130| 
||         LDDW    .D2T2   *B11,B9:B8        ; |130| 
||         MVKL    .S1     cycle_counts+16,A3

           MVKH    .S1     cycle_counts+16,A3

           LDDW    .D1T1   *A3,A7:A6         ; |130| 
||         MVKL    .S1     t_stop,A31

           MV      .L2X    A3,B12            ; |128| 
||         MVKH    .S1     t_stop,A31

           STDW    .D1T2   B17:B16,*A31      ; |128| 
           ADDU    .L2X    A4,B8,B5:B4       ; |130| 

   [ A0]   B       .S1     $C$L19            ; |229| 
||         ADD     .S2X    B5,A5,B6          ; |130| 
||         SUBU    .L2     B16,B4,B5:B4      ; |130| 

           ADD     .D2     B6,B9,B6          ; |130| 
||         EXT     .S2     B5,24,24,B7       ; |130| 
||         ADDU    .L2X    A6,B4,B5:B4       ; |130| 

           SUB     .L2     B17,B6,B6         ; |130| 
||         ADD     .S2X    B5,A7,B5          ; |130| 

           ADD     .L2     B6,B7,B6          ; |130| 
           ADD     .L2     B5,B6,B5          ; |130| 

   [!A0]   CALL    .S1     __c6xabi_fltllif  ; |135| 
||         STDW    .D2T2   B5:B4,*B12        ; |130| 

           ; BRANCHCC OCCURS {$C$L19}        ; |229| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           LDDW    .D1T1   *+A14(16),A5:A4   ; |135| 
           ADDKPC  .S2     $C$RL30,B3,3      ; |135| 
$C$RL30:   ; CALL OCCURS {__c6xabi_fltllif} {0}  ; |135| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 69
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

           MV      .L2X    A10,B4            ; |114| 
||         MV      .L1X    B12,A12           ; |135| 
||         STDW    .D1T1   A11:A10,*+A14(32) ; |114| 

           STDW    .D1T1   A5:A4,*A12        ; |135| 
||         MVC     .S2     B4,TSCL           ; |115| 

           MVC     .S2     TSCL,B4           ; |116| 
           MVC     .S2     TSCH,B5           ; |116| 

           STDW    .D2T2   B5:B4,*B11        ; |116| 
||         MVC     .S2     TSCL,B6           ; |117| 

           MVC     .S2     TSCH,B8           ; |117| 
           LDW     .D2T1   *+SP(24),A3       ; |117| 

           SUBU    .L2     B6,B4,B7:B6       ; |117| 
||         MVKL    .S1     input,A4

           EXT     .S2     B7,24,24,B4       ; |117| 
||         MVKH    .S1     input,A4
||         SUB     .L2     B8,B5,B5          ; |117| 

           ADD     .L2     B5,B4,B7          ; |117| 
||         LDW     .D1T1   *A4,A4            ; |238| 

           STDW    .D1T2   B7:B6,*A15        ; |117| 

           CALLP   .S2     tandp_v,B3
||         LDW     .D1T2   *A3,B4            ; |238| 
||         MVK     .S1     0x80,A6           ; |238| 

$C$RL32:   ; CALL OCCURS {tandp_v} {0}       ; |238| 
           MVC     .S2     TSCL,B4           ; |128| 
           MVC     .S2     TSCH,B5           ; |128| 

           LDDW    .D1T1   *A15,A5:A4        ; |130| 
||         LDDW    .D2T2   *B11,B7:B6        ; |130| 

           MVK     .S2     16,B10
           ADD     .L2X    A12,B10,B10
           LDDW    .D2T2   *B10,B9:B8        ; |130| 
           NOP             1
           ADDU    .L1X    A4,B6,A7:A6       ; |130| 
           ADD     .L1     A7,A5,A3          ; |130| 
           SUBU    .L1X    B4,A6,A5:A4       ; |130| 

           ADD     .L2X    A3,B7,B7          ; |130| 
||         EXT     .S1     A5,24,24,A3       ; |130| 

           ADDU    .L1X    B8,A4,A5:A4       ; |130| 
||         SUB     .L2     B5,B7,B7          ; |130| 

           MVKL    .S2     t_stop,B6
||         ADD     .L2X    B7,A3,B7          ; |130| 

           ADD     .L2X    A5,B9,B8          ; |130| 
||         MVKH    .S2     t_stop,B6

           STDW    .D2T2   B5:B4,*B6         ; |128| 
||         ADD     .L2     B8,B7,B4          ; |130| 

           NOP             1

           CALLP   .S2     __c6xabi_fltllif,B3
||         MV      .L1X    B4,A5             ; |130| 

$C$RL33:   ; CALL OCCURS {__c6xabi_fltllif} {0}  ; |130| 
           ZERO    .L1     A3
           SET     .S1     A3,0x1a,0x1d,A3
           MPYSP   .M1     A3,A4,A3          ; |130| 
           MV      .L1     A11,A12           ; |130| 
           NOP             2
           SPDP    .S1     A3,A5:A4          ; |130| 
           NOP             1
           ADDDP   .L1     A13:A12,A5:A4,A5:A4 ; |130| 
           CALLP   .S2     __c6xabi_fixdlli,B3
$C$RL34:   ; CALL OCCURS {__c6xabi_fixdlli} {0}  ; |130| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 10

           MV      .L2X    A10,B4            ; |114| 
||         STDW    .D1T1   A11:A10,*+A14(8)  ; |114| 

           MVC     .S2     B4,TSCL           ; |115| 
||         STDW    .D2T1   A5:A4,*B10        ; |130| 

           MVC     .S2     TSCL,B5           ; |116| 
           MVC     .S2     TSCH,B4           ; |116| 
           MVC     .S2     TSCL,B6           ; |117| 
           MVC     .S2     TSCH,B8           ; |117| 
           SUBU    .L2     B6,B5,B7:B6       ; |117| 

           EXT     .S2     B7,24,24,B5       ; |117| 
||         SUB     .L2     B8,B4,B31         ; |117| 

           ADD     .L2     B31,B5,B5         ; |117| 
||         MV      .S2     B6,B4             ; |117| 

           STDW    .D1T2   B5:B4,*A15        ; |117| 
||         MVK     .S1     0x80,A10

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
           LDW     .D1T1   *A3,A3            ; |247| 
           MV      .L2     B11,B6            ; |247| 
           STDW    .D2T2   B5:B4,*B6         ; |122| 
           NOP             2

           ADD     .L1     A11,A3,A3         ; |247| 
||         CALL    .S1     tandp             ; |247| 

           LDDW    .D1T1   *A3,A5:A4         ; |247| 
           ADDKPC  .S2     $C$RL35,B3,3      ; |247| 
$C$RL35:   ; CALL OCCURS {tandp} {0}         ; |247| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 23
           MVKL    .S2     output+4,B4
           MVKH    .S2     output+4,B4
           LDW     .D2T2   *B4,B4            ; |247| 
           NOP             4
           ADD     .L1X    A11,B4,A3         ; |247| 

           STDW    .D1T1   A5:A4,*A3         ; |247| 
||         MVC     .S2     TSCL,B8           ; |128| 

           MVC     .S2     TSCH,B6           ; |128| 

           MV      .L2     B11,B4            ; |128| 
||         MV      .L1     A15,A3            ; |128| 
||         MVK     .S1     8,A31
||         SUB     .D1     A10,1,A0          ; |245| 
||         MV      .S2     B6,B9             ; |128| 
||         SUBAW   .D2     B12,2,B10

           LDDW    .D1T1   *A3,A5:A4         ; |130| 
||         LDDW    .D2T2   *B4,B17:B16       ; |130| 
||         SUB     .L1X    B12,A31,A3
||         MVKL    .S1     t_stop,A30

           MVKH    .S1     t_stop,A30
||         SUB     .L1     A10,1,A10         ; |245| 

           LDDW    .D1T1   *A3,A7:A6         ; |130| 
           ADD     .L1     8,A11,A11         ; |245| 
           STDW    .D1T2   B9:B8,*A30        ; |128| 
           ADDU    .L2X    A4,B16,B5:B4      ; |130| 

   [ A0]   B       .S1     $C$L20            ; |245| 
||         ADD     .S2X    B5,A5,B6          ; |130| 
||         SUBU    .L2     B8,B4,B5:B4       ; |130| 

           ADD     .D2     B6,B17,B6         ; |130| 
||         EXT     .S2     B5,24,24,B7       ; |130| 
||         ADDU    .L2X    A6,B4,B5:B4       ; |130| 

           SUB     .L2     B9,B6,B6          ; |130| 
||         ADD     .S2X    B5,A7,B5          ; |130| 

           ADD     .L2     B6,B7,B6          ; |130| 
           ADD     .L2     B5,B6,B5          ; |130| 

   [!A0]   CALL    .S1     __c6xabi_fltllif  ; |135| 
||         STDW    .D2T2   B5:B4,*B10        ; |130| 
|| [!A0]   MV      .L2     B10,B4

           ; BRANCHCC OCCURS {$C$L20}        ; |245| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           LDDW    .D2T1   *B4,A5:A4         ; |135| 
           ADDKPC  .S2     $C$RL36,B3,3      ; |135| 
$C$RL36:   ; CALL OCCURS {__c6xabi_fltllif} {0}  ; |135| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 55
           ZERO    .L1     A3
           SET     .S1     A3,0x1a,0x1d,A3
           MPYSP   .M1     A3,A4,A3          ; |135| 
           NOP             3
           SPDP    .S1     A3,A5:A4          ; |135| 
           NOP             1
           ADDDP   .L1     A13:A12,A5:A4,A5:A4 ; |135| 
           CALLP   .S2     __c6xabi_fixdlli,B3
$C$RL37:   ; CALL OCCURS {__c6xabi_fixdlli} {0}  ; |135| 

           MVKL    .S1     output,A3
||         MVKL    .S2     0xe826d695,B6

           MVKH    .S1     output,A3
||         MVKL    .S2     0x3e112e0b,B7

           MV      .L1     A3,A11            ; |135| 
||         MV      .S1     A4,A6             ; |135| 
||         MV      .D1     A5,A7             ; |135| 
||         MVKH    .S2     0xe826d695,B6

           LDW     .D1T2   *+A11(4),B4       ; |66| 
||         STDW    .D2T1   A7:A6,*B10        ; |135| 
||         MVKH    .S2     0x3e112e0b,B7

           CALLP   .S2     isequal,B3
||         LDW     .D1T1   *A11,A4           ; |66| 
||         MVK     .S1     0x80,A6           ; |66| 
||         MVK     .L1     0x1,A8            ; |66| 

$C$RL38:   ; CALL OCCURS {isequal} {0}       ; |66| 
           MVKL    .S2     0xe826d695,B6

           MVKL    .S1     fcn_pass,A10
||         MVKL    .S2     0x3e112e0b,B7

           MV      .L1     A4,A5             ; |66| 
||         LDW     .D1T2   *+A11(8),B4       ; |67| 
||         MVKH    .S1     fcn_pass,A10
||         MVKH    .S2     0xe826d695,B6

           STW     .D1T1   A5,*+A10(4)       ; |66| 
||         MVKH    .S2     0x3e112e0b,B7

           CALLP   .S2     isequal,B3
||         LDW     .D1T1   *A11,A4           ; |67| 
||         MVK     .S1     0x80,A6           ; |67| 
||         MVK     .L1     0x1,A8            ; |67| 

$C$RL39:   ; CALL OCCURS {isequal} {0}       ; |67| 
           MVKL    .S2     0xe826d695,B6
           MVKL    .S2     0x3e112e0b,B7

           MV      .L1     A4,A3             ; |67| 
||         LDW     .D1T2   *+A11(12),B4      ; |68| 
||         MVKH    .S2     0xe826d695,B6

           STW     .D1T1   A3,*+A10(8)       ; |67| 
||         MVKH    .S2     0x3e112e0b,B7

           CALLP   .S2     isequal,B3
||         LDW     .D1T1   *A11,A4           ; |68| 
||         MVK     .S1     0x80,A6           ; |68| 
||         MVK     .L1     0x1,A8            ; |68| 

$C$RL40:   ; CALL OCCURS {isequal} {0}       ; |68| 
           MVKL    .S2     0x3e112e0b,B7
           MVKL    .S2     0xe826d695,B6
           MVKH    .S2     0x3e112e0b,B7

           MV      .L2X    A11,B5            ; |68| 
||         STW     .D1T1   A4,*+A10(12)      ; |68| 
||         MVKH    .S2     0xe826d695,B6

           CALLP   .S2     isequal,B3
||         LDW     .D1T2   *+A11(16),B4      ; |69| 
||         LDW     .D2T1   *B5,A4            ; |69| 
||         MVK     .S1     0x80,A6           ; |69| 
||         MVK     .L1     0x1,A8            ; |69| 

$C$RL41:   ; CALL OCCURS {isequal} {0}       ; |69| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 12
           ADD     .L2X    4,A10,B4
           LDW     .D2T2   *B4,B0            ; |72| 
           STW     .D1T1   A4,*+A10(16)      ; |69| 
           ADD     .L2X    8,A10,B4
           NOP             2

   [!B0]   BNOP    .S1     $C$L21,4          ; |72| 
||         MV      .L2     B0,B1             ; guard predicate rewrite
|| [ B0]   LDW     .D2T2   *B4,B0            ; |72| 

   [ B1]   ADD     .L2     4,B4,B4
           ; BRANCHCC OCCURS {$C$L21}        ; |72| 
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
   [ A0]   B       .S1     $C$L22            ; |72| 
   [ A0]   CALL    .S1     print_test_results ; |254| 
   [ A0]   MVKL    .S1     all_pass,A3
   [ A0]   MVKH    .S1     all_pass,A3
           NOP             2
           ; BRANCHCC OCCURS {$C$L22}        ; |72| 
;** --------------------------------------------------------------------------*
$C$L21:    
;          EXCLUSIVE CPU CYCLES: 5
           CALL    .S1     print_test_results ; |254| 
           MVKL    .S1     all_pass,A3
           MVKH    .S1     all_pass,A3
           MV      .L1     A12,A4
           NOP             1
;** --------------------------------------------------------------------------*
$C$L22:    
;          EXCLUSIVE CPU CYCLES: 1

           STW     .D1T1   A4,*A3            ; |72| 
||         MVK     .L1     0x2,A4            ; |254| 
||         ADDKPC  .S2     $C$RL42,B3,0      ; |254| 

$C$RL42:   ; CALL OCCURS {print_test_results} {0}  ; |254| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 30
           MVKL    .S2     $C$SL2+0,B4
           MVKH    .S2     $C$SL2+0,B4

           CALLP   .S2     printf,B3
||         STW     .D2T2   B4,*+SP(4)        ; |255| 

$C$RL43:   ; CALL OCCURS {printf} {0}        ; |255| 
           MVKL    .S2     $C$SL3+0,B4
           MVKH    .S2     $C$SL3+0,B4

           CALLP   .S2     printf,B3
||         STW     .D2T2   B4,*+SP(4)        ; |255| 

$C$RL44:   ; CALL OCCURS {printf} {0}        ; |255| 
           MVKL    .S1     $C$SL1+0,A10
           MVKH    .S1     $C$SL1+0,A10

           CALLP   .S2     print_profile_results,B3
||         MV      .L1     A10,A4            ; |262| 

$C$RL45:   ; CALL OCCURS {print_profile_results} {0}  ; |262| 

           CALLP   .S2     print_memory_results,B3
||         MV      .L1     A10,A4            ; |265| 

$C$RL46:   ; CALL OCCURS {print_memory_results} {0}  ; |265| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 11
           LDW     .D2T2   *++SP(32),B3      ; |266| 
           LDDW    .D2T1   *++SP,A13:A12     ; |266| 
           LDDW    .D2T1   *++SP,A15:A14     ; |266| 
           LDDW    .D2T2   *++SP,B11:B10     ; |266| 
           LDDW    .D2T2   *++SP,B13:B12     ; |266| 

           LDW     .D2T1   *++SP(8),A10      ; |266| 
||         RET     .S2     B3                ; |266| 

           LDW     .D2T1   *++SP(8),A11      ; |266| 
           NOP             4
           ; BRANCH OCCURS {B3}              ; |266| 
;******************************************************************************
;* STRINGS                                                                    *
;******************************************************************************
	.sect	".const:.string"
$C$SL1:	.string	"tanDP",0
$C$SL2:	.string	"----------------------------------------",0
$C$SL3:	.string	"----------------------------------------",10,0
;*****************************************************************************
;* UNDEFINED EXTERNAL REFERENCES                                             *
;*****************************************************************************
	.global	printf
	.global	tan
	.global	driver_init
	.global	print_profile_results
	.global	print_memory_results
	.global	print_test_results
	.global	gimme_random
	.global	isequal
	.global	tandp_c
	.global	tandp
	.global	tandp_v
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
