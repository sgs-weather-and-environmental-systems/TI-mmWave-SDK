;******************************************************************************
;* TMS320C6x C/C++ Codegen                                          PC v7.4.2 *
;* Date/Time created: Mon May 16 23:56:36 2016                                *
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
	.word	0f4178da3h,0bcafffffh		; _a[0] @ 0
	.word	091833afah,03cb3c733h		; _a[1] @ 64
	.word	04ea8c7feh,0bcb872cah		; _a[2] @ 128
	.word	081032491h,03cbe38b2h		; _a[3] @ 192
	.word	028cba780h,0bcc2adcbh		; _a[4] @ 256
	.word	0fd5ad3a1h,03cc716eeh		; _a[5] @ 320
	.word	0325f3490h,0bccc8ab3h		; _a[6] @ 384
	.word	0d847e7ddh,03cd1a406h		; _a[7] @ 448
	.word	0b64f2a37h,0bcd5ce68h		; _a[8] @ 512
	.word	07aaf3da9h,03cdaf499h		; _a[9] @ 576
	.word	0baab8567h,0bce0a907h		; _a[10] @ 640
	.word	0759a19ddh,03ce49825h		; _a[11] @ 704
	.word	0c1f80b97h,0bce97512h		; _a[12] @ 768
	.word	0475020f3h,03cef77f8h		; _a[13] @ 832
	.word	024bf278fh,0bcf37320h		; _a[14] @ 896
	.word	06f7ae299h,03cf80adch		; _a[15] @ 960
	.word	01d254e41h,0bcfdb83ah		; _a[16] @ 1024
	.word	0f07ed8f5h,03d025e63h		; _a[17] @ 1088
	.word	047f721c4h,0bd06b4c8h		; _a[18] @ 1152
	.word	0b7778b76h,03d0c115eh		; _a[19] @ 1216
	.word	04db44ac8h,0bd115909h		; _a[20] @ 1280
	.word	0ac4967f6h,03d1571b6h		; _a[21] @ 1344
	.word	0e8d71bfeh,0bd1a8203h		; _a[22] @ 1408
	.word	0751b448dh,03d206235h		; _a[23] @ 1472
	.word	09fe36970h,0bd244099h		; _a[24] @ 1536
	.word	01189a1b3h,03d2908dbh		; _a[25] @ 1600
	.word	0a2d50c04h,0bd2ef232h		; _a[26] @ 1664
	.word	00471105fh,03d332072h		; _a[27] @ 1728
	.word	062a5146fh,0bd37a4a8h		; _a[28] @ 1792
	.word	02ce2cee2h,03d3d39e4h		; _a[29] @ 1856
	.word	09164a44bh,0bd42104eh		; _a[30] @ 1920
	.word	0c2b8357ch,03d465441h		; _a[31] @ 1984
	.word	0dc2664e2h,0bd4b9a0dh		; _a[32] @ 2048
	.word	0b89f3d85h,03d510f4ah		; _a[33] @ 2112
	.word	010e5872ch,0bd55168eh		; _a[34] @ 2176
	.word	0cc85c453h,03d5a1154h		; _a[35] @ 2240
	.word	0f10193d4h,0bd601c8fh		; _a[36] @ 2304
	.word	00de439b7h,03d63ea82h		; _a[37] @ 2368
	.word	041b3e6a7h,0bd689e6fh		; _a[38] @ 2432
	.word	0b4e8fbe0h,03d6e6ea5h		; _a[39] @ 2496
	.word	0d985278ah,0bd72cf22h		; _a[40] @ 2560
	.word	0a2d84effh,03d774026h		; _a[41] @ 2624
	.word	0fdaf58cah,0bd7cbda6h		; _a[42] @ 2688
	.word	0cb8cf82dh,03d81c384h		; _a[43] @ 2752
	.word	035e563c2h,0bd85f556h		; _a[44] @ 2816
	.word	090bf2b8bh,03d8b24b8h		; _a[45] @ 2880
	.word	0aff6ceb2h,0bd90c6c5h		; _a[46] @ 2944
	.word	0e00e9907h,03d94bce8h		; _a[47] @ 3008
	.word	0a57fc089h,0bd99a284h		; _a[48] @ 3072
	.word	05f2cadcdh,03d9fb025h		; _a[49] @ 3136
	.word	07c12ab0bh,0bda395d8h		; _a[50] @ 3200
	.word	0d6f45158h,03da835c7h		; _a[51] @ 3264
	.word	0181759a5h,0bdaded48h		; _a[52] @ 3328
	.word	02b6607cfh,03db27f2eh		; _a[53] @ 3392
	.word	07a063f28h,0bdb6dd50h		; _a[54] @ 3456
	.word	0870f0f39h,03dbc4379h		; _a[55] @ 3520
	.word	066640b6ch,0bdc17801h		; _a[56] @ 3584
	.word	078a05728h,03dc597feh		; _a[57] @ 3648
	.word	0ec807b19h,0bdcab155h		; _a[58] @ 3712
	.word	0be348237h,03dd07f74h		; _a[59] @ 3776
	.word	0e7b78b8dh,0bdd464c0h		; _a[60] @ 3840
	.word	0b16ca45fh,03dd9358bh		; _a[61] @ 3904
	.word	0b4abbc7ch,0bddf2971h		; _a[62] @ 3968
	.word	012c543f8h,03de34297h		; _a[63] @ 4032
	.word	09a091a32h,0bde7ceddh		; _a[64] @ 4096
	.word	09567eb85h,03ded6e10h		; _a[65] @ 4160
	.word	099e8b4a8h,0bdf2308dh		; _a[66] @ 4224
	.word	08a00ebdah,03df67c1eh		; _a[67] @ 4288
	.word	01a95add1h,0bdfbcb54h		; _a[68] @ 4352
	.word	01ed70e0eh,03e012dbfh		; _a[69] @ 4416
	.word	03a90dcfbh,0be053c33h		; _a[70] @ 4480
	.word	0a9449850h,03e0a3fddh		; _a[71] @ 4544
	.word	0020a12f2h,0be103953h		; _a[72] @ 4608
	.word	04199c785h,03e140e0fh		; _a[73] @ 4672
	.word	090c97398h,0be18ca61h		; _a[74] @ 4736
	.word	0b328279bh,03e1ea4f8h		; _a[75] @ 4800
	.word	06ee94228h,0be22f0b7h		; _a[76] @ 4864
	.word	0649e9b03h,03e2769a8h		; _a[77] @ 4928
	.word	03c203caeh,0be2cf0f5h		; _a[78] @ 4992
	.word	0c2c90641h,03e31e33ah		; _a[79] @ 5056
	.word	05b3d1b07h,0be361c89h		; _a[80] @ 5120
	.word	03268f5b9h,03e3b552dh		; _a[81] @ 5184
	.word	07b3bef3fh,0be40e4b8h		; _a[82] @ 5248
	.word	013af1016h,03e44e1eeh		; _a[83] @ 5312
	.word	07f6616bah,0be49d047h		; _a[84] @ 5376
	.word	0312537beh,03e4fe8b6h		; _a[85] @ 5440
	.word	0180c0639h,0be53b8cfh		; _a[86] @ 5504
	.word	098afb4f3h,03e5860ffh		; _a[87] @ 5568
	.word	0f3b4059fh,0be5e22b4h		; _a[88] @ 5632
	.word	083668af5h,03e62a033h		; _a[89] @ 5696
	.word	0a1477bc1h,0be670621h		; _a[90] @ 5760
	.word	027c198f2h,03e6c75eeh		; _a[91] @ 5824
	.word	0a7b9bf33h,0be719730h		; _a[92] @ 5888
	.word	0ccacf285h,03e75be8ah		; _a[93] @ 5952
	.word	0fa168a5eh,0be7ae0fbh		; _a[94] @ 6016
	.word	0548f0887h,03e809ce8h		; _a[95] @ 6080
	.word	004cb0e8eh,0be848929h		; _a[96] @ 6144
	.word	0f1711a3ch,03e89628bh		; _a[97] @ 6208
	.word	0db05597ah,0be8f6111h		; _a[98] @ 6272
	.word	0cd899e77h,03e9364f8h		; _a[99] @ 6336
	.word	09cc013b4h,0be97f95dh		; _a[100] @ 6400
	.word	0dcd4f4dah,03e9da299h		; _a[101] @ 6464
	.word	00f76c1e3h,0bea25106h		; _a[102] @ 6528
	.word	0f5828c0fh,03ea6a441h		; _a[103] @ 6592
	.word	0302c5badh,0beabfcf2h		; _a[104] @ 6656
	.word	0743cafb5h,03eb14c69h		; _a[105] @ 6720
	.word	08cd119c6h,0beb5621bh		; _a[106] @ 6784
	.word	0ab485979h,03eba6eb9h		; _a[107] @ 6848
	.word	063f58bbfh,0bec05649h		; _a[108] @ 6912
	.word	0e527705fh,03ec431dch		; _a[109] @ 6976
	.word	07baf3722h,0bec8f6a3h		; _a[110] @ 7040
	.word	0fe3a090fh,03ecedbadh		; _a[111] @ 7104
	.word	00479812ah,0bed31287h		; _a[112] @ 7168
	.word	0120f7780h,03ed79374h		; _a[113] @ 7232
	.word	097a0500bh,0bedd249fh		; _a[114] @ 7296
	.word	066209a08h,03ee20329h		; _a[115] @ 7360
	.word	0bd0f849eh,0bee64401h		; _a[116] @ 7424
	.word	0111b1dcfh,03eeb85f8h		; _a[117] @ 7488
	.word	070cac3b5h,0bef102e0h		; _a[118] @ 7552
	.word	012db48c1h,03ef50735h		; _a[119] @ 7616
	.word	0a87eba1ch,0bef9fe5ch		; _a[120] @ 7680
	.word	07e5cc060h,03f0010d6h		; _a[121] @ 7744
	.word	010189b94h,0bf03dc04h		; _a[122] @ 7808
	.word	006541fefh,03f088c85h		; _a[123] @ 7872
	.word	080b6214eh,0bf0e5880h		; _a[124] @ 7936
	.word	08956d9c0h,03f12c173h		; _a[125] @ 8000
	.word	095cefd07h,0bf172f3bh		; _a[126] @ 8064
	.word	0a9117c6ch,03f1ca8bch		; _a[127] @ 8128
	.word	0c9634a78h,0bf21b697h		; _a[128] @ 8192
	.word	0c433e787h,03f25e55bh		; _a[129] @ 8256
	.word	056db8764h,0bf2b10f8h		; _a[130] @ 8320
	.word	05bc3a550h,03f30ba90h		; _a[131] @ 8384
	.word	0a8e25e70h,0bf34add1h		; _a[132] @ 8448
	.word	03b009d64h,03f398fddh		; _a[133] @ 8512
	.word	074b31ba6h,0bf3f9916h		; _a[134] @ 8576
	.word	02c8a8c30h,03f438798h		; _a[135] @ 8640
	.word	0db0ebcaeh,0bf482429h		; _a[136] @ 8704
	.word	024bb72c9h,03f4dd781h		; _a[137] @ 8768
	.word	0903b074eh,0bf5271b8h		; _a[138] @ 8832
	.word	00eb8ccddh,03f56ccadh		; _a[139] @ 8896
	.word	0536e9a9bh,0bf5c2ee8h		; _a[140] @ 8960
	.word	038c9b14bh,03f616b4bh		; _a[141] @ 9024
	.word	0b7a49c82h,0bf658847h		; _a[142] @ 9088
	.word	03d237f95h,03f6a9de9h		; _a[143] @ 9152
	.word	047d3dcbfh,0bf707373h		; _a[144] @ 9216
	.word	0db3f4529h,03f7455e9h		; _a[145] @ 9280
	.word	0bf52c451h,0bf792333h		; _a[146] @ 9344
	.word	016b49131h,03f7f12c4h		; _a[147] @ 9408
	.word	0fc1302deh,0bf833492h		; _a[148] @ 9472
	.word	08f908142h,03f87bd8ah		; _a[149] @ 9536
	.word	009698b34h,0bf8d58a6h		; _a[150] @ 9600
	.word	03de0355fh,03f922351h		; _a[151] @ 9664
	.word	06f209f32h,0bf966bc1h		; _a[152] @ 9728
	.word	05dfa3134h,03f9bb71ah		; _a[153] @ 9792
	.word	0e9f5a78ch,0bfa1213eh		; _a[154] @ 9856
	.word	050b85445h,03fa52cbfh		; _a[155] @ 9920
	.word	0d85c77fbh,0bfaa2cc3h		; _a[156] @ 9984
	.word	0c87c3027h,03fb02d84h		; _a[157] @ 10048
	.word	0c4dd951ch,0bfb3ff77h		; _a[158] @ 10112
	.word	0cac23092h,03fb8b857h		; _a[159] @ 10176
	.word	0ffcdab19h,0bfbe8eabh		; _a[160] @ 10240
	.word	077417ffdh,03fc2e2eeh		; _a[161] @ 10304
	.word	0fd86a8fch,0bfc7589eh		; _a[162] @ 10368
	.word	04543d6efh,03fccdbe6h		; _a[163] @ 10432
	.word	06d7a56deh,0bfd1d636h		; _a[164] @ 10496
	.word	069a9e7c5h,03fd60c72h		; _a[165] @ 10560
	.word	0766b9728h,0bfdb4149h		; _a[166] @ 10624
	.word	07f5f5bb0h,03fe0d86dh		; _a[167] @ 10688
	.word	0fa16b1f3h,0bfe4d2bbh		; _a[168] @ 10752
	.word	01c3fd1a7h,03fe9bd7fh		; _a[169] @ 10816
	.word	0ad8508e9h,0bfefd17eh		; _a[170] @ 10880
	.word	089efd86bh,03ff3aa75h		; _a[171] @ 10944
	.word	0f212d773h,0bff84f41h		; _a[172] @ 11008
	.word	0822ff089h,03ffe0cc6h		; _a[173] @ 11072
	.word	0a469d734h,0c00292a5h		; _a[174] @ 11136
	.word	084a515cfh,04006f560h		; _a[175] @ 11200
	.word	079c4113ch,0c00c6138h		; _a[176] @ 11264
	.word	0b688bda9h,040118a63h		; _a[177] @ 11328
	.word	00ecfa69ch,0c015aeb8h		; _a[178] @ 11392
	.word	07e889c1bh,0401acd6dh		; _a[179] @ 11456
	.word	073fb7a5fh,0c02090d1h		; _a[180] @ 11520
	.word	0e2eb1c43h,040247a36h		; _a[181] @ 11584
	.word	0a92a3055h,0c0295013h		; _a[182] @ 11648
	.word	021187e7ch,0402f4a3ch		; _a[183] @ 11712
	.word	0b59ddc1eh,0c03356dbh		; _a[184] @ 11776
	.word	0af102364h,04037e7ebh		; _a[185] @ 11840
	.word	017d6b65bh,0c03d8d09h		; _a[186] @ 11904
	.word	0031ceaf2h,0404243b2h		; _a[187] @ 11968
	.word	0f77af640h,0c04693c7h		; _a[188] @ 12032
	.word	01c8216c6h,0404be894h		; _a[189] @ 12096
	.word	0458cd20bh,0c0513fd3h		; _a[190] @ 12160
	.word	03f3e0371h,04055528ch		; _a[191] @ 12224
	.word	090ff9724h,0c05a5b7eh		; _a[192] @ 12288
	.word	066666666h,040604a66h		; _a[193] @ 12352
	.word	0020c49bah,0c064232bh		; _a[194] @ 12416
	.word	03dd97f63h,04068e479h		; _a[195] @ 12480
	.word	0c0ebedfah,0c06ec539h		; _a[196] @ 12544
	.word	0e353f7cfh,0407304a5h		; _a[197] @ 12608
	.word	02f837b4ah,0c077824ch		; _a[198] @ 12672
	.word	07ef9db23h,0407d0f6ah		; _a[199] @ 12736
	.word	0ed288ce7h,0c081f60dh		; _a[200] @ 12800
$C$IR_1:	.set	1608

	.global	_a
_a:	.usect	".far",1608,8
;	C:\MATHLIB_Tools\CCSV5_5_0\ccsv5\tools\compiler\c6000_7.4.2\bin\opt6x.exe C:\\Users\\gtbldadm\\AppData\\Local\\Temp\\028763 C:\\Users\\gtbldadm\\AppData\\Local\\Temp\\028765 
	.sect	".text:optci"
	.clink

;******************************************************************************
;* FUNCTION NAME: expdp_sinhdp_i                                              *
;*                                                                            *
;*   Regs Modified     : A3,A4,A5,A6,A7,A8,A9,B0,B4,B5,B6,B7,B8,B9,A16,A17,   *
;*                           A18,A19,B16,B17                                  *
;*   Regs Used         : A3,A4,A5,A6,A7,A8,A9,B0,B3,B4,B5,B6,B7,B8,B9,A16,A17,*
;*                           A18,A19,B16,B17                                  *
;*   Local Frame Size  : 0 Args + 0 Auto + 0 Save = 0 byte                    *
;******************************************************************************
_expdp_sinhdp_i:
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 240
           MVKL    .S1     0x3ff71547,A7
           MVKL    .S1     0x652b82fe,A6
           MVKH    .S1     0x3ff71547,A7
           MVKH    .S1     0x652b82fe,A6
           MPYDP   .M1     A7:A6,A5:A4,A7:A6 ; |96| 
           MVKL    .S2     0x3fe63000,B5
           MVKH    .S2     0x3fe63000,B5
           ZERO    .L2     B4                ; |101| 
           MVKL    .S2     0xbf2bd010,B7
           MVKL    .S2     0x5c610ca8,B6
           MVKH    .S2     0xbf2bd010,B7
           MVKH    .S2     0x5c610ca8,B6
           MVKL    .S2     0x3f7c70e4,B17
           MVKL    .S2     0x6fb3f6e0,B16
           DPINT   .L1     A7:A6,A3          ; |96| 
           MVKH    .S2     0x3f7c70e4,B17
           MVKH    .S2     0x6fb3f6e0,B16
           NOP             1
           INTDP   .L1     A3,A7:A6          ; |101| 
           NOP             5
           MPYDP   .M2X    B5:B4,A7:A6,B5:B4 ; |101| 
           MPYDP   .M1X    B7:B6,A7:A6,A7:A6 ; |101| 
           NOP             8
           SUBDP   .L2X    A5:A4,B5:B4,B5:B4 ; |101| 
           MVKL    .S1     0x3ef152a4,A5
           MVKL    .S1     0x6f58dc1c,A4
           MVKH    .S1     0x3ef152a4,A5
           MVKH    .S1     0x6f58dc1c,A4
           NOP             2
           SUBDP   .L2X    B5:B4,A7:A6,B7:B6 ; |101| 
           NOP             6
           MPYDP   .M2     B7:B6,B7:B6,B5:B4 ; |101| 
           NOP             9
           MPYDP   .M2X    A5:A4,B5:B4,B9:B8 ; |101| 
           NOP             2
           MVKL    .S1     0x6fde3809,A4
           MVKL    .S1     0x3f403f99,A5
           MVKH    .S1     0x6fde3809,A4
           MVKH    .S1     0x3f403f99,A5
           MPYDP   .M1X    A5:A4,B5:B4,A5:A4 ; |102| 
           NOP             3
           ADDDP   .L2     B17:B16,B9:B8,B9:B8 ; |101| 
           MVKL    .S2     0x3fac718e,B17
           MVKL    .S2     0x714251b3,B16
           MVKH    .S2     0x3fac718e,B17
           MVKH    .S2     0x714251b3,B16
           NOP             1
           ADDDP   .L1X    B17:B16,A5:A4,A5:A4 ; |102| 
           MPYDP   .M2     B5:B4,B9:B8,B9:B8 ; |101| 
           NOP             5
           MPYDP   .M1X    B5:B4,A5:A4,A7:A6 ; |102| 
           NOP             2
           ZERO    .L1     A5
           ZERO    .L1     A4                ; |101| 
           MVKH    .S1     0x3fd00000,A5
           ADDDP   .L1X    A5:A4,B9:B8,A5:A4 ; |101| 
           ZERO    .L2     B9
           ZERO    .L2     B8                ; |102| 
           SET     .S2     B9,0x1e,0x1e,B9
           NOP             3
           MPYDP   .M1X    B7:B6,A5:A4,A17:A16 ; |101| 
           NOP             2
           ZERO    .L1     A5
           ZERO    .L1     A4                ; |102| 
           SET     .S1     A5,0x15,0x1d,A5
           ADDDP   .L1     A5:A4,A7:A6,A7:A6 ; |102| 
           ZERO    .S1     A4                ; |116| 
           NOP             5
           SUBDP   .L1     A7:A6,A17:A16,A7:A6 ; |102| 
           NOP             6
           RCPDP   .S1     A7:A6,A9:A8       ; |65| 
           NOP             1
           MPYDP   .M1     A7:A6,A9:A8,A19:A18 ; |65| 
           NOP             9
           NOP             1
           SUBDP   .L2X    B9:B8,A19:A18,B5:B4 ; |65| 
           NOP             6
           MPYDP   .M2X    A9:A8,B5:B4,B5:B4 ; |65| 
           NOP             9
           MPYDP   .M2X    A7:A6,B5:B4,B7:B6 ; |65| 
           NOP             9
           SUBDP   .L2     B9:B8,B7:B6,B7:B6 ; |65| 
           NOP             6
           MPYDP   .M2     B5:B4,B7:B6,B7:B6 ; |65| 
           NOP             9
           NOP             1
           MPYDP   .M1X    A7:A6,B7:B6,A7:A6 ; |65| 
           MV      .L2     B8,B4             ; |65| 
           MV      .L2     B9,B5             ; |65| 
           NOP             8
           SUBDP   .L2X    B5:B4,A7:A6,B5:B4 ; |65| 
           NOP             6
           MPYDP   .M2     B7:B6,B5:B4,B5:B4 ; |65| 
           NOP             9
           NOP             1
           MPYDP   .M1X    A17:A16,B5:B4,A7:A6 ; |65| 
           NOP             6
           ZERO    .L2     B5:B4             ; |68| 
           CMPEQDP .S2X    A17:A16,B5:B4,B0  ; |68| 
           ZERO    .L2     B5
   [ B0]   ZERO    .L1     A7:A6             ; |69| 
           ADDDP   .L1     A5:A4,A7:A6,A5:A4 ; |116| 
           MVK     .S1     1022,A6           ; |116| 
           ADD     .L1     A6,A3,A3          ; |116| 
           SHL     .S1     A3,20,A7          ; |116| 
           ZERO    .L1     A6                ; |116| 
           MVKH    .S2     0x40100000,B5
           ZERO    .L2     B4                ; |116| 
           MPYDP   .M1     A7:A6,A5:A4,A5:A4 ; |116| 
           NOP             9
           MPYDP   .M1X    B5:B4,A5:A4,A5:A4 ; |116| 
           NOP             3
           RETNOP  .S2     B3,5              ; |117| 
           ; BRANCH OCCURS {B3}              ; |117| 
;**	Parameter deleted: req_flags == 9;
;**	Parameter deleted: tol == 1e-12;
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
||         MVKL    .S2     0x812dea11,B6

           STDW    .D2T1   A13:A12,*SP--     ; |63| 
||         MVKL    .S1     _output,A11
||         MVKL    .S2     0x3d719799,B7

           STW     .D2T1   A10,*SP--(8)      ; |63| 
||         MVKH    .S1     _output,A11
||         MVKH    .S2     0x812dea11,B6

           LDW     .D1T2   *+A11(4),B4       ; |66| 
||         MV      .L1     A4,A6             ; |63| 
||         MVKH    .S2     0x3d719799,B7
||         MVK     .S1     0x9,A8            ; |66| 

           MV      .L1X    B3,A13            ; |63| 
||         CALLP   .S2     _isequal,B3
||         MV      .S1     A4,A10            ; |63| 
||         LDW     .D1T1   *A11,A4           ; |66| 

$C$RL0:    ; CALL OCCURS {_isequal} {0}      ; |66| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 30
           MVKL    .S2     0x3d719799,B7
           MVKL    .S2     0x812dea11,B6

           LDW     .D1T2   *+A11(8),B4       ; |67| 
||         MVKL    .S1     _fcn_pass,A12
||         MVKH    .S2     0x3d719799,B7

           MV      .L1     A4,A3             ; |66| 
||         LDW     .D1T1   *A11,A4           ; |67| 
||         MVKH    .S1     _fcn_pass,A12
||         MVKH    .S2     0x812dea11,B6

           CALLP   .S2     _isequal,B3
||         STW     .D1T1   A3,*+A12(4)       ; |66| 
||         MV      .L1     A10,A6            ; |67| 
||         MVK     .S1     0x9,A8            ; |67| 

$C$RL1:    ; CALL OCCURS {_isequal} {0}      ; |67| 
           MVKL    .S2     0x812dea11,B6
           MVKL    .S2     0x3d719799,B7

           LDW     .D1T2   *+A11(12),B4      ; |68| 
||         MVKH    .S2     0x812dea11,B6

           MV      .L1     A4,A3             ; |67| 
||         LDW     .D1T1   *A11,A4           ; |68| 
||         MVKH    .S2     0x3d719799,B7

           CALLP   .S2     _isequal,B3
||         STW     .D1T1   A3,*+A12(8)       ; |67| 
||         MV      .L1     A10,A6            ; |68| 
||         MVK     .S1     0x9,A8            ; |68| 

$C$RL2:    ; CALL OCCURS {_isequal} {0}      ; |68| 
           MVKL    .S2     0x3d719799,B7
           MVKL    .S2     0x812dea11,B6

           STW     .D1T1   A4,*+A12(12)      ; |68| 
||         MVKH    .S2     0x3d719799,B7

           MV      .L1     A11,A3            ; |66| 
||         LDW     .D1T2   *+A11(16),B4      ; |69| 
||         MVKH    .S2     0x812dea11,B6

           CALLP   .S2     _isequal,B3
||         LDW     .D1T1   *A3,A4            ; |69| 
||         MV      .L1     A10,A6            ; |69| 
||         MVK     .S1     0x9,A8            ; |69| 

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

           MVKL    .S1     _a,A12
||         MVKL    .S2     _output,B10

           MVKH    .S1     _a,A12
||         MVKH    .S2     _output,B10

           MV      .L1     A12,A13
||         CALL    .S1     _sinh             ; |141| 
||         LDW     .D2T1   *B10,A11

           LDDW    .D1T1   *A13++,A5:A4      ; |141| 
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
$C$RL5:    ; CALL OCCURS {_sinh} {0}         ; |141| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 7

           SUB     .L1     A10,1,A0          ; |140| 
||         STDW    .D1T1   A5:A4,*A11++      ; |141| 
||         SUB     .S1     A10,1,A10         ; |140| 

   [!A0]   MVK     .S2     0xc9,B4
|| [!A0]   ADD     .L2     4,B10,B11
|| [ A0]   B       .S1     $C$L3             ; |140| 

   [ A0]   CALL    .S1     _sinh             ; |141| 
   [ A0]   LDDW    .D1T1   *A13++,A5:A4      ; |141| 
   [!A0]   MV      .L1     A12,A10
   [!A0]   ZERO    .L2     B10
   [!A0]   MV      .L1X    B4,A11
           ; BRANCHCC OCCURS {$C$L3}         ; |140| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 1
           CALL    .S1     _sinhdp           ; |144| 
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L4:    
;          EXCLUSIVE CPU CYCLES: 5
           LDDW    .D1T1   *A10++,A5:A4      ; |144| 
           ADDKPC  .S2     $C$RL6,B3,3       ; |144| 
$C$RL6:    ; CALL OCCURS {_sinhdp} {0}       ; |144| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 7

           LDW     .D2T2   *B11,B4           ; |144| 
||         SUB     .L1     A11,1,A0          ; |143| 
||         SUB     .S1     A11,1,A11         ; |143| 

   [ A0]   BNOP    .S1     $C$L4,3           ; |143| 

           ADD     .L2     B10,B4,B5         ; |144| 
||         ADD     .D2     8,B10,B10         ; |143| 
|| [!A0]   MVK     .S2     0xc9,B4

   [ A0]   CALL    .S1     _sinhdp           ; |144| 
||         STDW    .D2T1   A5:A4,*B5         ; |144| 

           ; BRANCHCC OCCURS {$C$L4}         ; |143| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 1

           CALL    .S1     _sinhdp_c         ; |147| 
||         MV      .L1X    B4,A10
||         ZERO    .L2     B10
||         MV      .D1     A12,A11
||         ADD     .S2     4,B11,B11

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L5:    
;          EXCLUSIVE CPU CYCLES: 5
           LDDW    .D1T1   *A11++,A5:A4      ; |147| 
           ADDKPC  .S2     $C$RL7,B3,3       ; |147| 
$C$RL7:    ; CALL OCCURS {_sinhdp_c} {0}     ; |147| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 7

           LDW     .D2T2   *B11,B4           ; |147| 
||         SUB     .L1     A10,1,A0          ; |146| 
||         SUB     .S1     A10,1,A10         ; |146| 

   [ A0]   BNOP    .S1     $C$L5,1           ; |146| 
|| [!A0]   ZERO    .L1     A11
|| [!A0]   SUB     .L2X    A12,8,B21
|| [!A0]   ZERO    .D2     B20
|| [!A0]   MVK     .S2     0xc9,B1
|| [!A0]   ZERO    .D1     A30

   [!A0]   ZERO    .L1     A10
   [!A0]   SET     .S1     A11,0x14,0x1e,A11

           ADD     .L2     B10,B4,B5         ; |147| 
||         ADD     .S2     8,B10,B10         ; |146| 

   [ A0]   CALL    .S1     _sinhdp_c         ; |147| 
||         STDW    .D2T1   A5:A4,*B5         ; |147| 

           ; BRANCHCC OCCURS {$C$L5}         ; |146| 
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains control code
;*----------------------------------------------------------------------------*
$C$L6:    
;          EXCLUSIVE CPU CYCLES: 15
           LDDW    .D2T2   *++B21,B5:B4      ; |192| 
           ZERO    .L1     A5:A4             ; |195| 
           ZERO    .L2     B6                ; |199| 
           ZERO    .L2     B7
           MVKH    .S2     0x40390000,B7

           ABSDP   .S2     B5:B4,B19:B18     ; |192| 
||         CMPLTDP .S1X    B5:B4,A5:A4,A0    ; |195| 

           ZERO    .L2     B5

           CMPGTDP .S2     B19:B18,B7:B6,B0  ; |199| 
|| [ A0]   ZERO    .L1     A21
|| [!A0]   ZERO    .S1     A21
|| [ A0]   ZERO    .D1     A20               ; |195| 

   [!A0]   SET     .S1     A21,0x14,0x1d,A21
|| [!A0]   ZERO    .L1     A20               ; |195| 

   [ B0]   B       .S1     $C$L8             ; |199| 
|| [!B0]   ZERO    .L2     B4                ; |203| 
||         SET     .S2     B5,0x14,0x1d,B5
||         MV      .D2     B0,B2             ; guard predicate rewrite

           MV      .L1X    B0,A1             ; branch predicate copy
||         CMPGTDP .S2     B19:B18,B5:B4,B0  ; |203| 

   [ A0]   MVKH    .S1     0xbff00000,A21

   [ B2]   MVK     .L2     0x1,B0            ; |203| nullify predicate
||         MVKL    .S2     0xfefa39ec,B4

           MVKH    .S2     0xfefa39ec,B4

   [!B0]   B       .S1     $C$L7             ; |203| 
||         MVKL    .S2     0x3fe62e42,B5

           ; BRANCHCC OCCURS {$C$L8}         ; |199| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
   [!B0]   MPYDP   .M2     B19:B18,B19:B18,B5:B4 ; |161| 
   [ B0]   CALL    .S1     _expdp_sinhdp_i   ; |207| 
           NOP             3
           ; BRANCHCC OCCURS {$C$L7}         ; |203| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 2
           MV      .L1X    B19,A5            ; |207| 

           MV      .L1X    B18,A4            ; |207| 
||         ADDKPC  .S2     $C$RL8,B3,0       ; |207| 

$C$RL8:    ; CALL OCCURS {_expdp_sinhdp_i} {0}  ; |207| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 93
           RCPDP   .S1     A5:A4,A7:A6       ; |209| 
           ZERO    .L1     A16               ; |209| 
           MPYDP   .M1     A5:A4,A7:A6,A9:A8 ; |209| 
           ZERO    .L1     A17
           SET     .S1     A17,0x1e,0x1e,A17
           ZERO    .L2     B4                ; |209| 
           MV      .L2X    A17,B5            ; |209| 
           ZERO    .L2     B8                ; |209| 
           MV      .L2X    A17,B9            ; |209| 
           MVKL    .S2     _output+12,B29
           MVKH    .S2     _output+12,B29
           LDW     .D2T1   *B29,A3
           SUBDP   .L1     A17:A16,A9:A8,A9:A8 ; |209| 
           ZERO    .S1     A31
           NOP             5
           MPYDP   .M1     A7:A6,A9:A8,A7:A6 ; |209| 
           ADD     .L1X    B20,A3,A3
           NOP             8
           MPYDP   .M1     A5:A4,A7:A6,A9:A8 ; |209| 
           NOP             9
           NOP             1
           SUBDP   .L2X    B5:B4,A9:A8,B5:B4 ; |209| 
           NOP             6
           MPYDP   .M2X    A7:A6,B5:B4,B5:B4 ; |209| 
           NOP             9
           MPYDP   .M2X    A5:A4,B5:B4,B7:B6 ; |209| 
           NOP             9
           SUBDP   .L2     B9:B8,B7:B6,B7:B6 ; |209| 
           NOP             6
           MPYDP   .M2     B5:B4,B7:B6,B5:B4 ; |209| 
           NOP             9
           NOP             1
           SUBDP   .L1X    A5:A4,B5:B4,A7:A6 ; |209| 

           SET     .S1     A31,0x15,0x1d,A5
||         ZERO    .D1     A4                ; |209| 

           BNOP    .S1     $C$L9,4           ; |209| 
           MPYDP   .M1     A5:A4,A7:A6,A5:A4 ; |209| 
           ; BRANCH OCCURS {$C$L9}           ; |209| 
;** --------------------------------------------------------------------------*
$C$L7:    
;          EXCLUSIVE CPU CYCLES: 72

           MVKL    .S1     0x3ec71de3,A5
||         MVKL    .S2     0x55555561,B22

           MVKL    .S1     0xa556c736,A4
||         MVKL    .S2     0x3fc55555,B23

           MVKH    .S2     0x55555561,B22
           MVKH    .S1     0x3ec71de3,A5
           MVKH    .S2     0x3fc55555,B23
           MPYDP   .M2     B5:B4,B5:B4,B7:B6 ; |161| 
           MVKH    .S1     0xa556c736,A4
           MVKL    .S1     0x1a01a00b,A6
           MVKL    .S2     0x13a86d04,B16
           MVKL    .S1     0x3f2a01a0,A7
           MVKL    .S2     0x3de61246,B17
           MPYDP   .M1X    A5:A4,B5:B4,A9:A8 ; |161| 
           MVKH    .S1     0x1a01a00b,A6
           MVKH    .S2     0x13a86d04,B16
           MVKH    .S1     0x3f2a01a0,A7
           MPYDP   .M2     B5:B4,B7:B6,B9:B8 ; |161| 
           MVKH    .S2     0x3de61246,B17
           MVKL    .S1     0x3e5ae645,A5
           MVKL    .S1     0x67f544de,A4
           MVKH    .S1     0x3e5ae645,A5
           MVKH    .S1     0x67f544de,A4
           MPYDP   .M2     B23:B22,B5:B4,B5:B4 ; |161| 
           ADDDP   .L1     A7:A6,A9:A8,A7:A6 ; |161| 
           MPYDP   .M1X    A5:A4,B7:B6,A5:A4 ; |161| 
           MVKL    .S2     0x1111110f,B22
           MPYDP   .M2     B17:B16,B9:B8,B17:B16 ; |161| 
           MVKL    .S2     0x3f811111,B23
           MVKH    .S2     0x1111110f,B22
           MVKH    .S2     0x3f811111,B23
           MPYDP   .M2     B23:B22,B7:B6,B7:B6 ; |161| 
           MPYDP   .M1X    B9:B8,A7:A6,A7:A6 ; |161| 
           MVKL    .S1     _output+12,A3
           MVKH    .S1     _output+12,A3
           LDW     .D1T1   *A3,A3
           NOP             3
           ADDDP   .L1X    B17:B16,A5:A4,A5:A4 ; |161| 
           NOP             1
           ADDDP   .L2     B7:B6,B5:B4,B5:B4 ; |161| 
           ADD     .L1X    B20,A3,A3
           NOP             3
           MPYDP   .M1X    B9:B8,A5:A4,A5:A4 ; |161| 
           NOP             1
           ADDDP   .L2X    A7:A6,B5:B4,B5:B4 ; |161| 
           NOP             7
           ADDDP   .L1X    A5:A4,B5:B4,A5:A4 ; |161| 
           NOP             6
           MPYDP   .M1X    B19:B18,A5:A4,A5:A4 ; |161| 
           NOP             4
           BNOP    .S1     $C$L9,4           ; |161| 
           ADDDP   .L1X    B19:B18,A5:A4,A5:A4 ; |161| 
           ; BRANCH OCCURS {$C$L9}           ; |161| 
;** --------------------------------------------------------------------------*
$C$L8:    
;          EXCLUSIVE CPU CYCLES: 234
           MVKH    .S2     0x3fe62e42,B5
           SUBDP   .L2     B19:B18,B5:B4,B9:B8 ; |96| 
           MVKL    .S1     0x3ff71547,A5
           MVKL    .S1     0x652b82fe,A4
           MVKH    .S1     0x3ff71547,A5
           MVKH    .S1     0x652b82fe,A4
           ZERO    .L1     A6                ; |101| 
           MVKL    .S1     0x3fe63000,A7
           MVKH    .S1     0x3fe63000,A7
           MPYDP   .M1X    A5:A4,B9:B8,A5:A4 ; |96| 
           MVKL    .S2     0x5c610ca8,B4
           MVKL    .S2     0xbf2bd010,B5
           MVKH    .S2     0x5c610ca8,B4
           MVKH    .S2     0xbf2bd010,B5
           MVKL    .S2     0x3f403f99,B17
           MVKL    .S2     0x6fde3809,B16
           MVKH    .S2     0x3f403f99,B17
           MVKH    .S2     0x6fde3809,B16
           ZERO    .L1     A31
           DPINT   .L1     A5:A4,A3          ; |96| 
           ZERO    .L2     B31
           ZERO    .L2     B30
           MVK     .S2     0x3fe,B29
           INTDP   .L1     A3,A5:A4          ; |101| 
           MVKL    .S2     _output+12,B28
           MVKH    .S2     _output+12,B28
           NOP             2
           MPYDP   .M1     A7:A6,A5:A4,A7:A6 ; |101| 
           MPYDP   .M2X    B5:B4,A5:A4,B7:B6 ; |101| 
           NOP             9
           SUBDP   .L2X    B9:B8,A7:A6,B5:B4 ; |101| 
           MVKL    .S1     0x3ef152a4,A5
           MVKL    .S1     0x6f58dc1c,A4
           MVKH    .S1     0x3ef152a4,A5
           MVKH    .S1     0x6f58dc1c,A4
           MVKL    .S2     0x3f7c70e4,B9
           MVKL    .S2     0x6fb3f6e0,B8
           SUBDP   .L2     B5:B4,B7:B6,B7:B6 ; |101| 
           MVKH    .S2     0x3f7c70e4,B9
           MVKH    .S2     0x6fb3f6e0,B8
           NOP             4
           MPYDP   .M2     B7:B6,B7:B6,B5:B4 ; |101| 
           NOP             9
           NOP             1
           MPYDP   .M1X    A5:A4,B5:B4,A5:A4 ; |101| 
           MPYDP   .M2     B17:B16,B5:B4,B17:B16 ; |102| 
           NOP             9
           ADDDP   .L2X    B9:B8,A5:A4,B9:B8 ; |101| 
           MVKL    .S1     0x3fac718e,A5
           MVKL    .S1     0x714251b3,A4
           MVKH    .S1     0x3fac718e,A5
           MVKH    .S1     0x714251b3,A4
           ADDDP   .L1X    A5:A4,B17:B16,A5:A4 ; |102| 
           NOP             1
           MPYDP   .M2     B5:B4,B9:B8,B9:B8 ; |101| 
           NOP             4
           MPYDP   .M1X    B5:B4,A5:A4,A7:A6 ; |102| 
           NOP             2
           ZERO    .L1     A4                ; |101| 
           ZERO    .L1     A5
           MVKH    .S1     0x3fd00000,A5
           ADDDP   .L1X    A5:A4,B9:B8,A5:A4 ; |101| 
           ZERO    .L2     B4                ; |65| 
           SET     .S2     B31,0x1e,0x1e,B5
           SET     .S2     B30,0x1e,0x1e,B9
           ZERO    .L2     B8                ; |65| 
           NOP             2
           MPYDP   .M1X    B7:B6,A5:A4,A9:A8 ; |101| 
           NOP             2

           SET     .S1     A31,0x15,0x1d,A5
||         ZERO    .L1     A4                ; |102| 

           ADDDP   .L1     A5:A4,A7:A6,A5:A4 ; |102| 
           NOP             6
           SUBDP   .L1     A5:A4,A9:A8,A5:A4 ; |102| 
           NOP             6
           RCPDP   .S1     A5:A4,A7:A6       ; |65| 
           NOP             1
           MPYDP   .M1     A5:A4,A7:A6,A17:A16 ; |65| 
           NOP             9
           NOP             1
           SUBDP   .L2X    B5:B4,A17:A16,B5:B4 ; |65| 
           NOP             6
           MPYDP   .M2X    A7:A6,B5:B4,B5:B4 ; |65| 
           NOP             9
           MPYDP   .M2X    A5:A4,B5:B4,B7:B6 ; |65| 
           ZERO    .L1     A6                ; |65| 
           MV      .L1X    B9,A7             ; |65| 
           NOP             7
           SUBDP   .L2     B9:B8,B7:B6,B7:B6 ; |65| 
           NOP             6
           MPYDP   .M2     B5:B4,B7:B6,B5:B4 ; |65| 
           NOP             9
           NOP             1
           MPYDP   .M1X    A5:A4,B5:B4,A5:A4 ; |65| 
           NOP             9
           SUBDP   .L1     A7:A6,A5:A4,A5:A4 ; |65| 
           ZERO    .S1     A6                ; |116| 
           SET     .S1     A30,0x15,0x1d,A7
           NOP             5
           MPYDP   .M2X    B5:B4,A5:A4,B5:B4 ; |65| 
           NOP             9
           NOP             1
           MPYDP   .M1X    A9:A8,B5:B4,A5:A4 ; |65| 
           NOP             6
           ZERO    .L2     B5:B4             ; |68| 
           CMPEQDP .S2X    A9:A8,B5:B4,B0    ; |68| 
           NOP             1
   [ B0]   ZERO    .L1     A5:A4             ; |69| 
           ADDDP   .L1     A7:A6,A5:A4,A5:A4 ; |116| 
           ADD     .L2X    B29,A3,B4         ; |116| 
           SHL     .S2     B4,20,B5          ; |116| 
           ZERO    .L2     B4                ; |116| 
           LDW     .D2T1   *B28,A3
           NOP             2
           MPYDP   .M1X    B5:B4,A5:A4,A5:A4 ; |116| 
           NOP             5
           ZERO    .L2     B4                ; |116| 
           ZERO    .L2     B5
           MVKH    .S2     0x40100000,B5
           ADD     .L1X    B20,A3,A3
           MPYDP   .M1X    B5:B4,A5:A4,A5:A4 ; |116| 
;** --------------------------------------------------------------------------*
$C$L9:    
;          EXCLUSIVE CPU CYCLES: 21
           ADD     .L2     8,B20,B20         ; |149| 
           SUB     .L2     B1,1,B1           ; |149| 
           MVKL    .S2     0x408633ce,B5
           MVKL    .S2     0x8fb9f87e,B4
           MVKH    .S2     0x408633ce,B5
           MVKH    .S2     0x8fb9f87e,B4
           CMPGTDP .S2     B19:B18,B5:B4,B0  ; |212| 
   [!B1]   ADDAD   .D2     B11,1,B10
           NOP             1

   [ B0]   MV      .L1     A11,A5            ; |213| 
|| [ B0]   MV      .S1     A10,A4            ; |213| 

           MPYDP   .M1     A21:A20,A5:A4,A5:A4 ; |150| 
           NOP             4
   [ B1]   BNOP    .S1     $C$L6,4           ; |149| 

   [!B1]   CALL    .S1     _sinhdp_v         ; |152| 
||         STDW    .D1T1   A5:A4,*A3         ; |150| 

           ; BRANCHCC OCCURS {$C$L6}         ; |149| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           LDW     .D2T2   *B10,B4           ; |152| 
           MV      .L1     A12,A4            ; |152| 
           MVK     .S1     0xc9,A6           ; |152| 
           ADDKPC  .S2     $C$RL9,B3,1       ; |152| 
$C$RL9:    ; CALL OCCURS {_sinhdp_v} {0}     ; |152| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 12

           CALLP   .S2     _allequal,B3
||         MVK     .S1     0xc9,A4           ; |157| 

$C$RL10:   ; CALL OCCURS {_allequal} {0}     ; |157| 

           CALLP   .S2     _print_test_results,B3
||         MVK     .L1     0x1,A4            ; |158| 

$C$RL11:   ; CALL OCCURS {_print_test_results} {0}  ; |158| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 10
           MVKL    .S1     _a_sc,A13

           MVKH    .S1     _a_sc,A13
||         ZERO    .L2     B5

           STDW    .D1T1   A11:A10,*+A13(16) ; |167| 
||         MVKH    .S2     0x80000000,B5
||         MVK     .L1     0xffffffff,A4     ; |172| 
||         ZERO    .L2     B4                ; |166| 

           STDW    .D1T2   B5:B4,*+A13(8)    ; |166| 
||         MV      .L1     A4,A5             ; |172| 
||         ZERO    .L2     B9

           STDW    .D1T1   A5:A4,*+A13(56)   ; |172| 
||         SET     .S2     B9,0x14,0x1d,B9
||         ZERO    .L1     A6                ; |168| 
||         ZERO    .S1     A7
||         ZERO    .L2     B8                ; |169| 

           STDW    .D1T2   B9:B8,*+A13(32)   ; |169| 
||         MVKH    .S1     0xfff00000,A7
||         ZERO    .L1     A9

           STDW    .D1T1   A7:A6,*+A13(24)   ; |168| 
||         MVKH    .S1     0xbff00000,A9
||         ZERO    .L1     A8                ; |170| 

           MVK     .L2     0x8,B4
||         STDW    .D1T1   A9:A8,*+A13(40)   ; |170| 
||         ADD     .S2     -1,B5,B7
||         MV      .D2X    A4,B6

           ZERO    .L1     A5:A4             ; |165| 
||         STDW    .D1T2   B7:B6,*+A13(48)   ; |171| 

           STDW    .D1T1   A5:A4,*A13        ; |165| 
||         MV      .L1X    B4,A12            ; |166| 
||         SUB     .L2X    A13,8,B12
||         ZERO    .S2     B11

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
           LDDW    .D2T2   *++B12,B5:B4      ; |175| 
           CALL    .S1     _sinh             ; |175| 
           ADDKPC  .S2     $C$RL12,B3,2      ; |175| 
           MV      .L1X    B4,A4             ; |175| 
           MV      .L1X    B5,A5             ; |175| 
$C$RL12:   ; CALL OCCURS {_sinh} {0}         ; |175| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 34
           MVKL    .S1     _output,A14
           MVKH    .S1     _output,A14
           LDW     .D1T2   *A14,B4           ; |175| 
           NOP             4
           ADD     .L2     B11,B4,B4         ; |175| 
           STDW    .D2T1   A5:A4,*B4         ; |175| 

           CALLP   .S2     _sinhdp,B3
||         LDDW    .D2T1   *B12,A5:A4        ; |176| 

$C$RL13:   ; CALL OCCURS {_sinhdp} {0}       ; |176| 
           LDW     .D1T1   *+A14(4),A3       ; |176| 
           NOP             4
           ADD     .L2X    B11,A3,B4         ; |176| 
           STDW    .D2T1   A5:A4,*B4         ; |176| 
           LDDW    .D2T2   *B12,B5:B4        ; |177| 
           NOP             4
           MV      .L1X    B4,A4             ; |177| 

           CALLP   .S2     _sinhdp_c,B3
||         MV      .L1X    B5,A5             ; |177| 

$C$RL14:   ; CALL OCCURS {_sinhdp_c} {0}     ; |177| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 23
           LDW     .D1T1   *+A14(8),A3       ; |177| 
           NOP             4
           ADD     .L2X    B11,A3,B4         ; |177| 
           STDW    .D2T1   A5:A4,*B4         ; |177| 
           LDDW    .D2T1   *B12,A5:A4        ; |192| 
           ZERO    .L2     B5:B4             ; |195| 
           NOP             3

           ABSDP   .S1     A5:A4,A21:A20     ; |192| 
||         CMPLTDP .S2X    A5:A4,B5:B4,B0    ; |195| 

           ZERO    .L2     B5
||         ZERO    .D2     B4                ; |199| 
||         ZERO    .L1     A5

           MVKH    .S2     0x40390000,B5
||         SET     .S1     A5,0x14,0x1d,A5
|| [ B0]   ZERO    .L1     A23
|| [!B0]   ZERO    .D1     A23

   [!B0]   ZERO    .L1     A22               ; |195| 
||         CMPGTDP .S2X    A21:A20,B5:B4,B1  ; |199| 
|| [!B0]   SET     .S1     A23,0x14,0x1d,A23

   [ B0]   MVKH    .S1     0xbff00000,A23

   [ B1]   B       .S1     $C$L12            ; |199| 
|| [!B1]   MV      .L1     A10,A4            ; |203| 

           CMPGTDP .S1     A21:A20,A5:A4,A0  ; |203| 
   [ B0]   ZERO    .L1     A22               ; |195| 

   [ B1]   MVK     .L1     0x1,A0            ; |203| nullify predicate
||         MVKL    .S1     0xfefa39ec,A4

   [!A0]   B       .S2     $C$L11            ; |203| 
||         MVKL    .S1     0x3fe62e42,A5

           MVKH    .S1     0xfefa39ec,A4
           ; BRANCHCC OCCURS {$C$L12}        ; |199| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 4
   [ A0]   CALL    .S1     _expdp_sinhdp_i   ; |207| 
           NOP             3
           ; BRANCHCC OCCURS {$C$L11}        ; |203| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 2
           ADDKPC  .S2     $C$RL15,B3,0      ; |207| 

           MV      .L1     A21,A5            ; |207| 
||         MV      .S1     A20,A4            ; |207| 

$C$RL15:   ; CALL OCCURS {_expdp_sinhdp_i} {0}  ; |207| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 93
           RCPDP   .S1     A5:A4,A7:A6       ; |209| 
           MV      .L1     A10,A16           ; |209| 
           MPYDP   .M1     A5:A4,A7:A6,A9:A8 ; |209| 
           ZERO    .L1     A17
           SET     .S1     A17,0x1e,0x1e,A17
           MV      .L2X    A10,B4            ; |209| 
           MV      .L2X    A17,B5            ; |209| 
           MV      .L2X    A10,B8            ; |209| 
           MV      .L2X    A17,B9            ; |209| 
           ZERO    .L2     B29
           NOP             2
           SUBDP   .L1     A17:A16,A9:A8,A9:A8 ; |209| 
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
           NOP             9
           SUBDP   .L2     B9:B8,B7:B6,B7:B6 ; |209| 
           NOP             6
           MPYDP   .M2     B5:B4,B7:B6,B5:B4 ; |209| 
           NOP             9
           NOP             1
           SUBDP   .L1X    A5:A4,B5:B4,A5:A4 ; |209| 

           MV      .L2     B8,B4             ; |209| 
||         SET     .S2     B29,0x15,0x1d,B5

           BNOP    .S1     $C$L13,4          ; |209| 
           MPYDP   .M1X    B5:B4,A5:A4,A5:A4 ; |209| 
           ; BRANCH OCCURS {$C$L13}          ; |209| 
;** --------------------------------------------------------------------------*
$C$L11:    
;          EXCLUSIVE CPU CYCLES: 79
           MPYDP   .M1     A21:A20,A21:A20,A5:A4 ; |161| 
           MVKL    .S1     0x13a86d04,A16
           MVKL    .S2     0xa556c736,B4
           MVKL    .S1     0x3de61246,A17
           MVKL    .S2     0x3ec71de3,B5
           MVKH    .S1     0x13a86d04,A16
           MVKH    .S2     0xa556c736,B4
           MVKH    .S1     0x3de61246,A17
           MVKH    .S2     0x3ec71de3,B5
           MVKL    .S1     0x3fc55555,A19
           MPYDP   .M1     A5:A4,A5:A4,A9:A8 ; |161| 
           MVKL    .S2     0x3e5ae645,B7
           MVKL    .S1     0x55555561,A18
           MVKL    .S2     0x67f544de,B6
           MVKH    .S1     0x3fc55555,A19
           MPYDP   .M2X    B5:B4,A5:A4,B9:B8 ; |161| 
           MVKH    .S2     0x3e5ae645,B7
           MVKH    .S1     0x55555561,A18
           MVKH    .S2     0x67f544de,B6
           MVKL    .S2     0x1a01a00b,B4
           MPYDP   .M1     A5:A4,A9:A8,A7:A6 ; |161| 
           MVKL    .S2     0x3f2a01a0,B5
           MVKH    .S2     0x1a01a00b,B4
           MVKH    .S2     0x3f2a01a0,B5
           MPYDP   .M1     A19:A18,A5:A4,A5:A4 ; |161| 
           ADDDP   .L2     B5:B4,B9:B8,B5:B4 ; |161| 
           MPYDP   .M2X    B7:B6,A9:A8,B7:B6 ; |161| 
           NOP             3
           MPYDP   .M1     A17:A16,A7:A6,A25:A24 ; |161| 
           NOP             2
           MVKL    .S1     0x1111110f,A16
           MVKL    .S1     0x3f811111,A17
           MVKH    .S1     0x1111110f,A16
           MVKH    .S1     0x3f811111,A17
           MPYDP   .M1     A17:A16,A9:A8,A9:A8 ; |161| 
           MPYDP   .M2X    A7:A6,B5:B4,B9:B8 ; |161| 
           NOP             4
           ADDDP   .L2X    A25:A24,B7:B6,B5:B4 ; |161| 
           NOP             3
           ADDDP   .L1     A9:A8,A5:A4,A5:A4 ; |161| 
           NOP             2
           MPYDP   .M2X    A7:A6,B5:B4,B5:B4 ; |161| 
           NOP             3
           ADDDP   .L1X    B9:B8,A5:A4,A5:A4 ; |161| 
           NOP             6
           ADDDP   .L1X    B5:B4,A5:A4,A5:A4 ; |161| 
           NOP             6
           MPYDP   .M1     A21:A20,A5:A4,A5:A4 ; |161| 
           NOP             4
           BNOP    .S1     $C$L13,4          ; |161| 
           ADDDP   .L1     A21:A20,A5:A4,A5:A4 ; |161| 
           ; BRANCH OCCURS {$C$L13}          ; |161| 
;** --------------------------------------------------------------------------*
$C$L12:    
;          EXCLUSIVE CPU CYCLES: 232
           MVKH    .S1     0x3fe62e42,A5
           SUBDP   .L1     A21:A20,A5:A4,A5:A4 ; |96| 
           MVKL    .S2     0x652b82fe,B4
           MVKL    .S2     0x3ff71547,B5
           MVKH    .S2     0x652b82fe,B4
           MVKH    .S2     0x3ff71547,B5
           MV      .L2X    A10,B6            ; |101| 
           MVKL    .S2     0x3fe63000,B7
           MVKH    .S2     0x3fe63000,B7
           MPYDP   .M2X    B5:B4,A5:A4,B5:B4 ; |96| 
           MVKL    .S1     0xbf2bd010,A7
           MVKL    .S1     0x5c610ca8,A6
           MVKH    .S1     0xbf2bd010,A7
           MVKH    .S1     0x5c610ca8,A6
           MVKL    .S1     0x3f403f99,A17
           MVKL    .S1     0x6fde3809,A16
           MVKH    .S1     0x3f403f99,A17
           MVKH    .S1     0x6fde3809,A16
           ZERO    .L2     B17
           DPINT   .L2     B5:B4,B8          ; |96| 
           MV      .L2X    A10,B16           ; |101| 
           SET     .S2     B17,0x15,0x1d,B17
           MV      .L1     A10,A18           ; |65| 
           INTDP   .L2     B8,B5:B4          ; |101| 
           ZERO    .L1     A19
           SET     .S1     A19,0x1e,0x1e,A19
           MVK     .S1     0x3fe,A3
           NOP             1
           MPYDP   .M2     B7:B6,B5:B4,B7:B6 ; |101| 
           MPYDP   .M1X    A7:A6,B5:B4,A7:A6 ; |101| 
           ADD     .L2X    A3,B8,B31         ; |116| 
           NOP             8
           SUBDP   .L1X    A5:A4,B7:B6,A5:A4 ; |101| 
           MVKL    .S2     0x3ef152a4,B5
           MVKL    .S2     0x6f58dc1c,B4
           MVKH    .S2     0x3ef152a4,B5
           MVKH    .S2     0x6f58dc1c,B4
           NOP             2
           SUBDP   .L1     A5:A4,A7:A6,A9:A8 ; |101| 
           MVKL    .S1     0x3f7c70e4,A7
           MVKL    .S1     0x6fb3f6e0,A6
           MVKH    .S1     0x3f7c70e4,A7
           MVKH    .S1     0x6fb3f6e0,A6
           NOP             2
           MPYDP   .M1     A9:A8,A9:A8,A5:A4 ; |101| 
           NOP             9
           NOP             1
           MPYDP   .M2X    B5:B4,A5:A4,B5:B4 ; |101| 
           MPYDP   .M1     A17:A16,A5:A4,A17:A16 ; |102| 
           NOP             9
           ADDDP   .L1X    A7:A6,B5:B4,A7:A6 ; |101| 
           MVKL    .S2     0x3fac718e,B5
           MVKL    .S2     0x714251b3,B4
           MVKH    .S2     0x3fac718e,B5
           MVKH    .S2     0x714251b3,B4
           ADDDP   .L2X    B5:B4,A17:A16,B5:B4 ; |102| 
           NOP             1
           MPYDP   .M1     A5:A4,A7:A6,A7:A6 ; |101| 
           NOP             4
           MPYDP   .M2X    A5:A4,B5:B4,B7:B6 ; |102| 
           NOP             2
           ZERO    .L2     B5
           MV      .L2X    A10,B4            ; |101| 
           MVKH    .S2     0x3fd00000,B5
           ADDDP   .L2X    B5:B4,A7:A6,B5:B4 ; |101| 
           NOP             7
           MPYDP   .M1X    A9:A8,B5:B4,A7:A6 ; |101| 
           ADDDP   .L2     B17:B16,B7:B6,B5:B4 ; |102| 
           ZERO    .S2     B6                ; |116| 
           MV      .L2     B17,B7            ; |68| 
           NOP             6
           SUBDP   .L1X    B5:B4,A7:A6,A5:A4 ; |102| 
           MV      .L2X    A19,B5            ; |65| 
           MV      .L2     B16,B4            ; |65| 
           NOP             4
           RCPDP   .S1     A5:A4,A9:A8       ; |65| 
           NOP             1
           MPYDP   .M1     A5:A4,A9:A8,A17:A16 ; |65| 
           NOP             9
           SUBDP   .L1     A19:A18,A17:A16,A17:A16 ; |65| 
           NOP             6
           MPYDP   .M1     A9:A8,A17:A16,A9:A8 ; |65| 
           NOP             9
           MPYDP   .M1     A5:A4,A9:A8,A17:A16 ; |65| 
           NOP             9
           SUBDP   .L1     A19:A18,A17:A16,A17:A16 ; |65| 
           NOP             6
           MPYDP   .M1     A9:A8,A17:A16,A9:A8 ; |65| 
           NOP             9
           MPYDP   .M1     A5:A4,A9:A8,A5:A4 ; |65| 
           NOP             9
           NOP             1
           SUBDP   .L2X    B5:B4,A5:A4,B5:B4 ; |65| 
           ZERO    .L1     A5:A4             ; |68| 
           CMPEQDP .S1     A7:A6,A5:A4,A0    ; |68| 
           ZERO    .L1     A4                ; |116| 
           ZERO    .L1     A5
           MVKH    .S1     0x40100000,A5
           NOP             1
           MPYDP   .M2X    A9:A8,B5:B4,B5:B4 ; |65| 
           NOP             9
           MPYDP   .M2X    A7:A6,B5:B4,B5:B4 ; |65| 
           NOP             9
   [ A0]   ZERO    .L2     B5:B4             ; |69| 
           ADDDP   .L2     B7:B6,B5:B4,B7:B6 ; |116| 
           ZERO    .S2     B4                ; |116| 
           SHL     .S2     B31,20,B5         ; |116| 
           NOP             4
           MPYDP   .M2     B5:B4,B7:B6,B5:B4 ; |116| 
           NOP             9
           NOP             1
           MPYDP   .M1X    A5:A4,B5:B4,A5:A4 ; |116| 
;** --------------------------------------------------------------------------*
$C$L13:    
;          EXCLUSIVE CPU CYCLES: 21
           MVKL    .S1     0x408633ce,A7
           MVKL    .S1     0x8fb9f87e,A6
           MVK     .S2     12,B4
           MVKH    .S1     0x408633ce,A7
           ADD     .L2X    A14,B4,B4
           MVKH    .S1     0x8fb9f87e,A6
           CMPGTDP .S1     A21:A20,A7:A6,A0  ; |212| 
           LDW     .D2T2   *B4,B4            ; |178| 
           SUB     .L1     A12,1,A2          ; |174| 

   [ A0]   MV      .L1     A11,A5            ; |213| 
|| [ A0]   MV      .S1     A10,A4            ; |213| 

           MPYDP   .M1     A23:A22,A5:A4,A5:A4 ; |178| 
           SUB     .L1     A12,1,A12         ; |174| 
           ADD     .L2     B11,B4,B5         ; |178| 
           ADD     .L2     8,B11,B11         ; |174| 
           NOP             1
   [ A2]   BNOP    .S1     $C$L10,4          ; |174| 

   [!A2]   CALL    .S1     _sinhdp_v         ; |180| 
||         STDW    .D2T1   A5:A4,*B5         ; |178| 

           ; BRANCHCC OCCURS {$C$L10}        ; |174| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           LDW     .D2T2   *B10,B4           ; |180| 
           MV      .L1     A13,A4
           MVK     .L1     0x8,A6            ; |180| 
           ADDKPC  .S2     $C$RL16,B3,1      ; |180| 
$C$RL16:   ; CALL OCCURS {_sinhdp_v} {0}     ; |180| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 12

           CALLP   .S2     _allequal,B3
||         MVK     .L1     0x8,A4            ; |183| 

$C$RL17:   ; CALL OCCURS {_allequal} {0}     ; |183| 

           CALLP   .S2     _print_test_results,B3
||         MVK     .L1     0x3,A4            ; |184| 

$C$RL18:   ; CALL OCCURS {_print_test_results} {0}  ; |184| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5

           MVKL    .S1     _a_ext,A13
||         ZERO    .L2     B5

           MVKH    .S1     _a_ext,A13
||         SET     .S2     B5,0x14,0x14,B5
||         MV      .L2X    A10,B4            ; |187| 

           STDW    .D1T2   B5:B4,*A13        ; |187| 
||         MVK     .S2     0x3c5,B4

           MV      .L1     A13,A12           ; |187| 

           MV      .L2X    A10,B11
||         CALL    .S1     _sinh             ; |189| 
||         MV      .L1X    B4,A15            ; |187| 

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
           LDDW    .D1T1   *A12,A5:A4        ; |189| 
           ADDKPC  .S2     $C$RL19,B3,3      ; |189| 
$C$RL19:   ; CALL OCCURS {_sinh} {0}         ; |189| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 26
           LDW     .D1T1   *A14,A3           ; |189| 
           NOP             4
           ADD     .L1X    B11,A3,A3         ; |189| 
           STDW    .D1T1   A5:A4,*A3         ; |189| 

           CALLP   .S2     _sinhdp,B3
||         LDDW    .D1T1   *A12,A5:A4        ; |190| 

$C$RL20:   ; CALL OCCURS {_sinhdp} {0}       ; |190| 
           LDW     .D1T1   *+A14(4),A3       ; |190| 
           NOP             4
           ADD     .L1X    B11,A3,A3         ; |190| 
           STDW    .D1T1   A5:A4,*A3         ; |190| 

           CALLP   .S2     _sinhdp_c,B3
||         LDDW    .D1T1   *A12,A5:A4        ; |191| 

$C$RL21:   ; CALL OCCURS {_sinhdp_c} {0}     ; |191| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 22
           LDW     .D1T1   *+A14(8),A3       ; |191| 
           MV      .L2X    A10,B6            ; |192| 
           ZERO    .L2     B7
           MVKH    .S2     0x40390000,B7
           NOP             1
           ADD     .L2X    B11,A3,B4         ; |191| 
           STDW    .D2T1   A5:A4,*B4         ; |191| 
           LDDW    .D1T2   *A12,B5:B4        ; |192| 
           ZERO    .L1     A5:A4             ; |195| 
           NOP             3

           ABSDP   .S2     B5:B4,B19:B18     ; |192| 
||         CMPLTDP .S1X    B5:B4,A5:A4,A0    ; |195| 

           ZERO    .L2     B5

           CMPGTDP .S2     B19:B18,B7:B6,B0  ; |199| 
|| [ A0]   ZERO    .L2     B21
|| [!A0]   ZERO    .D2     B21

   [ A0]   ZERO    .L2     B20               ; |195| 

   [ B0]   B       .S1     $C$L16            ; |199| 
|| [!B0]   ZERO    .L2     B4                ; |203| 
||         SET     .S2     B5,0x14,0x1d,B5
||         MV      .D2     B0,B1             ; guard predicate rewrite

           MV      .L2     B0,B2             ; |195| branch predicate copy
||         CMPGTDP .S2     B19:B18,B5:B4,B0  ; |203| 

   [!A0]   ZERO    .L2     B20               ; |195| 

   [ B1]   MVK     .L2     0x1,B0            ; |203| nullify predicate
|| [ B2]   MVKL    .S2     0xfefa39ec,B4

   [!B0]   B       .S1     $C$L15            ; |203| 
|| [ A0]   MVKH    .S2     0xbff00000,B21

   [!A0]   SET     .S2     B21,0x14,0x1d,B21
           ; BRANCHCC OCCURS {$C$L16}        ; |199| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 4
   [ B0]   CALL    .S1     _expdp_sinhdp_i   ; |207| 
           NOP             3
           ; BRANCHCC OCCURS {$C$L15}        ; |203| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 2
           MV      .L1X    B18,A4            ; |207| 

           MV      .L1X    B19,A5            ; |207| 
||         ADDKPC  .S2     $C$RL22,B3,0      ; |207| 

$C$RL22:   ; CALL OCCURS {_expdp_sinhdp_i} {0}  ; |207| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 93
           RCPDP   .S1     A5:A4,A7:A6       ; |209| 
           ZERO    .L1     A16               ; |209| 
           MPYDP   .M1     A5:A4,A7:A6,A9:A8 ; |209| 
           ZERO    .L1     A17
           SET     .S1     A17,0x1e,0x1e,A17
           ZERO    .L2     B4                ; |209| 
           MV      .L2X    A17,B5            ; |209| 
           ZERO    .L2     B8                ; |209| 
           MV      .L2X    A17,B9            ; |209| 
           ZERO    .L1     A31
           NOP             2
           SUBDP   .L1     A17:A16,A9:A8,A9:A8 ; |209| 
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
           NOP             9
           SUBDP   .L2     B9:B8,B7:B6,B7:B6 ; |209| 
           NOP             6
           MPYDP   .M2     B5:B4,B7:B6,B5:B4 ; |209| 
           NOP             9
           NOP             1
           SUBDP   .L1X    A5:A4,B5:B4,A7:A6 ; |209| 

           SET     .S1     A31,0x15,0x1d,A5
||         ZERO    .D1     A4                ; |209| 

           BNOP    .S1     $C$L17,4          ; |209| 
           MPYDP   .M1     A5:A4,A7:A6,A5:A4 ; |209| 
           ; BRANCH OCCURS {$C$L17}          ; |209| 
;** --------------------------------------------------------------------------*
$C$L15:    
;          EXCLUSIVE CPU CYCLES: 77
           MPYDP   .M2     B19:B18,B19:B18,B7:B6 ; |161| 
           MVKL    .S2     0x55555561,B22
           MVKL    .S1     0x3ec71de3,A5
           MVKL    .S2     0x3fc55555,B23
           MVKL    .S1     0xa556c736,A4
           MVKH    .S2     0x55555561,B22
           MVKH    .S1     0x3ec71de3,A5
           MVKH    .S2     0x3fc55555,B23
           MVKH    .S1     0xa556c736,A4
           MVKL    .S1     0x1a01a00b,A6
           MPYDP   .M2     B7:B6,B7:B6,B5:B4 ; |161| 
           MVKL    .S2     0x13a86d04,B16
           MVKL    .S1     0x3f2a01a0,A7
           MVKL    .S2     0x3de61246,B17
           MVKH    .S1     0x1a01a00b,A6
           MPYDP   .M1X    A5:A4,B7:B6,A9:A8 ; |161| 
           MVKH    .S2     0x13a86d04,B16
           MVKH    .S1     0x3f2a01a0,A7
           MVKH    .S2     0x3de61246,B17
           MVKL    .S1     0x3e5ae645,A5
           MPYDP   .M2     B7:B6,B5:B4,B9:B8 ; |161| 
           MVKL    .S1     0x67f544de,A4
           MVKH    .S1     0x3e5ae645,A5
           MVKH    .S1     0x67f544de,A4
           MPYDP   .M2     B23:B22,B7:B6,B7:B6 ; |161| 
           ADDDP   .L1     A7:A6,A9:A8,A7:A6 ; |161| 
           MPYDP   .M1X    A5:A4,B5:B4,A5:A4 ; |161| 
           MVKL    .S2     0x1111110f,B22
           MVKL    .S2     0x3f811111,B23
           MVKH    .S2     0x1111110f,B22
           MPYDP   .M2     B17:B16,B9:B8,B17:B16 ; |161| 
           MVKH    .S2     0x3f811111,B23
           MPYDP   .M1X    B9:B8,A7:A6,A7:A6 ; |161| 
           NOP             1
           MPYDP   .M2     B23:B22,B5:B4,B5:B4 ; |161| 
           NOP             7
           ADDDP   .L1X    B17:B16,A5:A4,A5:A4 ; |161| 
           NOP             1
           ADDDP   .L2     B5:B4,B7:B6,B5:B4 ; |161| 
           NOP             4
           MPYDP   .M1X    B9:B8,A5:A4,A5:A4 ; |161| 
           NOP             1
           ADDDP   .L2X    A7:A6,B5:B4,B5:B4 ; |161| 
           NOP             7
           ADDDP   .L1X    A5:A4,B5:B4,A5:A4 ; |161| 
           NOP             6
           MPYDP   .M1X    B19:B18,A5:A4,A5:A4 ; |161| 
           NOP             4
           BNOP    .S1     $C$L17,4          ; |161| 
           ADDDP   .L1X    B19:B18,A5:A4,A5:A4 ; |161| 
           ; BRANCH OCCURS {$C$L17}          ; |161| 
;** --------------------------------------------------------------------------*
$C$L16:    
;          EXCLUSIVE CPU CYCLES: 236
           MVKL    .S2     0x3fe62e42,B5
           MVKH    .S2     0x3fe62e42,B5
           MVKH    .S2     0xfefa39ec,B4
           SUBDP   .L2     B19:B18,B5:B4,B5:B4 ; |96| 
           MVKL    .S1     0x3ff71547,A5
           MVKL    .S1     0x652b82fe,A4
           MVKH    .S1     0x3ff71547,A5
           MVKH    .S1     0x652b82fe,A4
           ZERO    .L1     A6                ; |101| 
           MVKL    .S1     0x3fe63000,A7
           MVKH    .S1     0x3fe63000,A7
           MPYDP   .M1X    A5:A4,B5:B4,A5:A4 ; |96| 
           MVKL    .S2     0x5c610ca8,B6
           MVKL    .S2     0xbf2bd010,B7
           MVKH    .S2     0x5c610ca8,B6
           MVKH    .S2     0xbf2bd010,B7
           MVKL    .S2     0x3f403f99,B9
           MVKL    .S2     0x6fde3809,B8
           MVKH    .S2     0x3f403f99,B9
           MVKH    .S2     0x6fde3809,B8
           MVKL    .S2     0x3f7c70e4,B17
           DPINT   .L1     A5:A4,A3          ; |96| 
           MVKL    .S2     0x6fb3f6e0,B16
           MVKH    .S2     0x3f7c70e4,B17
           MVKH    .S2     0x6fb3f6e0,B16
           INTDP   .L1     A3,A5:A4          ; |101| 
           ZERO    .L1     A31
           ZERO    .L2     B31
           ZERO    .L2     B30
           ZERO    .S1     A30
           MPYDP   .M1     A7:A6,A5:A4,A7:A6 ; |101| 
           MPYDP   .M2X    B7:B6,A5:A4,B7:B6 ; |101| 
           MVK     .S2     0x3fe,B29
           NOP             8
           SUBDP   .L2X    B5:B4,A7:A6,B5:B4 ; |101| 
           MVKL    .S1     0x3ef152a4,A5
           MVKL    .S1     0x6f58dc1c,A4
           MVKH    .S1     0x3ef152a4,A5
           MVKH    .S1     0x6f58dc1c,A4
           NOP             2
           SUBDP   .L2     B5:B4,B7:B6,B7:B6 ; |101| 
           NOP             6
           MPYDP   .M2     B7:B6,B7:B6,B5:B4 ; |101| 
           NOP             9
           NOP             1
           MPYDP   .M1X    A5:A4,B5:B4,A5:A4 ; |101| 
           MPYDP   .M2     B9:B8,B5:B4,B23:B22 ; |102| 
           NOP             9
           ADDDP   .L2X    B17:B16,A5:A4,B9:B8 ; |101| 
           MVKL    .S1     0x3fac718e,A5
           MVKL    .S1     0x714251b3,A4
           MVKH    .S1     0x3fac718e,A5
           MVKH    .S1     0x714251b3,A4
           ADDDP   .L1X    A5:A4,B23:B22,A5:A4 ; |102| 
           NOP             1
           MPYDP   .M2     B5:B4,B9:B8,B9:B8 ; |101| 
           NOP             4
           MPYDP   .M1X    B5:B4,A5:A4,A7:A6 ; |102| 
           NOP             2
           ZERO    .L1     A4                ; |101| 
           ZERO    .L1     A5
           MVKH    .S1     0x3fd00000,A5
           ADDDP   .L1X    A5:A4,B9:B8,A5:A4 ; |101| 
           ZERO    .L2     B4                ; |65| 
           SET     .S2     B31,0x1e,0x1e,B5
           ZERO    .L2     B8                ; |65| 
           SET     .S2     B30,0x1e,0x1e,B9
           NOP             2
           MPYDP   .M1X    B7:B6,A5:A4,A9:A8 ; |101| 
           NOP             2

           SET     .S1     A31,0x15,0x1d,A5
||         ZERO    .L1     A4                ; |102| 

           ADDDP   .L1     A5:A4,A7:A6,A5:A4 ; |102| 
           NOP             6
           SUBDP   .L1     A5:A4,A9:A8,A7:A6 ; |102| 
           NOP             6
           RCPDP   .S1     A7:A6,A5:A4       ; |65| 
           NOP             1
           MPYDP   .M1     A7:A6,A5:A4,A17:A16 ; |65| 
           NOP             9
           NOP             1
           SUBDP   .L2X    B5:B4,A17:A16,B5:B4 ; |65| 
           NOP             6
           MPYDP   .M2X    A5:A4,B5:B4,B5:B4 ; |65| 
           NOP             9
           MPYDP   .M2X    A7:A6,B5:B4,B7:B6 ; |65| 
           NOP             9
           SUBDP   .L2     B9:B8,B7:B6,B7:B6 ; |65| 
           NOP             6
           MPYDP   .M2     B5:B4,B7:B6,B5:B4 ; |65| 
           NOP             9
           NOP             1
           MPYDP   .M1X    A7:A6,B5:B4,A5:A4 ; |65| 
           NOP             7
           ZERO    .L1     A6                ; |65| 
           MV      .L1X    B9,A7             ; |65| 
           SUBDP   .L1     A7:A6,A5:A4,A5:A4 ; |65| 
           ZERO    .S1     A6                ; |116| 
           SET     .S1     A30,0x15,0x1d,A7
           NOP             5
           MPYDP   .M2X    B5:B4,A5:A4,B5:B4 ; |65| 
           NOP             9
           NOP             1
           MPYDP   .M1X    A9:A8,B5:B4,A5:A4 ; |65| 
           NOP             6
           ZERO    .L2     B5:B4             ; |68| 
           CMPEQDP .S2X    A9:A8,B5:B4,B0    ; |68| 
           NOP             1
   [ B0]   ZERO    .L1     A5:A4             ; |69| 
           ADDDP   .L1     A7:A6,A5:A4,A5:A4 ; |116| 
           ADD     .L2X    B29,A3,B4         ; |116| 
           SHL     .S2     B4,20,B5          ; |116| 
           ZERO    .L2     B4                ; |116| 
           NOP             3
           MPYDP   .M1X    B5:B4,A5:A4,A5:A4 ; |116| 
           NOP             5
           ZERO    .L2     B4                ; |116| 
           ZERO    .L2     B5
           MVKH    .S2     0x40100000,B5
           NOP             1
           MPYDP   .M1X    B5:B4,A5:A4,A5:A4 ; |116| 
;** --------------------------------------------------------------------------*
$C$L17:    
;          EXCLUSIVE CPU CYCLES: 38
           MVK     .S2     12,B6
           ADD     .L2X    A14,B6,B6
           MVKL    .S2     0x408633ce,B5
           MVKL    .S2     0x8fb9f87e,B4
           MVKH    .S2     0x408633ce,B5
           MVKH    .S2     0x8fb9f87e,B4
           CMPGTDP .S2     B19:B18,B5:B4,B0  ; |212| 
           LDW     .D2T2   *B6,B6            ; |192| 
           SUB     .L1     A15,1,A0          ; |188| 

   [ B0]   MV      .L1     A11,A5            ; |213| 
|| [ B0]   MV      .S1     A10,A4            ; |213| 

           SUB     .L1     A15,1,A15         ; |188| 
           MPYDP   .M2X    B21:B20,A5:A4,B5:B4 ; |192| 
           ADD     .L2     B11,B6,B6         ; |192| 
           ADD     .L2     8,B11,B11         ; |188| 
           MVKL    .S1     0xc000cccc,A5
           MVKL    .S1     0xcccccccd,A4
           MVKH    .S1     0xc000cccc,A5
           MVKH    .S1     0xcccccccd,A4
           NOP             3
           STDW    .D2T2   B5:B4,*B6         ; |192| 
           LDDW    .D1T1   *A12,A7:A6        ; |193| 
           NOP             4
           MPYDP   .M1     A5:A4,A7:A6,A5:A4 ; |193| 
           NOP             4
   [ A0]   BNOP    .S1     $C$L14,4          ; |188| 

   [ A0]   CALL    .S1     _sinh             ; |189| 
||         STDW    .D1T1   A5:A4,*++A12      ; |193| 

           ; BRANCHCC OCCURS {$C$L14}        ; |188| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 6
           CALL    .S1     _sinhdp_v         ; |195| 
           LDW     .D2T2   *B10,B4           ; |195| 
           ADDKPC  .S2     $C$RL23,B3,2      ; |195| 

           MV      .L1     A13,A4
||         MVK     .S1     0x3c5,A6          ; |195| 

$C$RL23:   ; CALL OCCURS {_sinhdp_v} {0}     ; |195| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 12

           CALLP   .S2     _allequal,B3
||         MVK     .S1     0x3c5,A4          ; |198| 

$C$RL24:   ; CALL OCCURS {_allequal} {0}     ; |198| 

           CALLP   .S2     _print_test_results,B3
||         MVK     .L1     0x4,A4            ; |199| 

$C$RL25:   ; CALL OCCURS {_print_test_results} {0}  ; |199| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 14
           MVKL    .S1     _cycle_counts+24,A3

           MVKH    .S1     _cycle_counts+24,A3
||         MV      .L2X    A10,B4            ; |114| 
||         MV      .L1     A10,A12           ; |114| 
||         MV      .D1     A10,A13           ; |114| 

           MVC     .S2     B4,TSCL           ; |115| 
||         STDW    .D1T1   A13:A12,*A3       ; |114| 

           MVC     .S2     TSCL,B4           ; |116| 
           MVC     .S2     TSCH,B5           ; |116| 
           MVKL    .S1     _t_start,A3
           MVKH    .S1     _t_start,A3

           MVC     .S2     TSCL,B6           ; |117| 
||         STDW    .D1T2   B5:B4,*A3         ; |116| 

           MVC     .S2     TSCH,B7           ; |117| 

           CALL    .S1     _gimme_random     ; |209| 
||         SUBU    .L2     B6,B4,B9:B8       ; |117| 

           EXT     .S2     B9,24,24,B6       ; |117| 
||         SUB     .L2     B7,B5,B5          ; |117| 
||         MVKL    .S1     _t_offset,A3

           ADD     .L2     B5,B6,B5          ; |117| 
||         MV      .D2     B8,B4             ; |117| 
||         MVKH    .S1     _t_offset,A3
||         MVK     .S2     0x80,B11

           MVKL    .S2     0xc0863000,B5
||         STDW    .D1T2   B5:B4,*A3         ; |117| 
||         MV      .L2X    A10,B12           ; |117| 
||         MVKL    .S1     0x40963000,A5

           MVKH    .S2     0xc0863000,B5
||         MV      .L2X    A10,B4            ; |209| 
||         MVKH    .S1     0x40963000,A5
||         MV      .L1     A12,A4            ; |209| 

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains control code
;*----------------------------------------------------------------------------*
$C$L18:    
;          EXCLUSIVE CPU CYCLES: 1
           ADDKPC  .S2     $C$RL26,B3,0      ; |209| 
$C$RL26:   ; CALL OCCURS {_gimme_random} {0}  ; |209| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 22
           MVKL    .S1     _input,A3
           MVKH    .S1     _input,A3
           LDW     .D1T1   *A3,A3            ; |209| 
           NOP             4
           ADD     .L2X    B12,A3,B4         ; |209| 

           STDW    .D2T1   A5:A4,*B4         ; |209| 
||         MVC     .S2     TSCL,B4           ; |122| 

           NOP             1

           MV      .L1X    B4,A20            ; |122| Define a twin register
||         MVC     .S2     TSCH,B4           ; |122| 

           ABSDP   .S1     A5:A4,A23:A22     ; |192| 
||         ZERO    .L2     B7
||         ZERO    .S2     B6                ; |199| 
||         ZERO    .L1     A7:A6             ; |195| 

           MVKH    .S2     0x40390000,B7
||         CMPLTDP .S1     A5:A4,A7:A6,A0    ; |195| 

           ZERO    .L1     A5

           CMPGTDP .S2X    A23:A22,B7:B6,B0  ; |199| 
|| [ A0]   ZERO    .L1     A25
|| [!A0]   ZERO    .D1     A25
||         SET     .S1     A5,0x14,0x1d,A5

   [!A0]   SET     .S1     A25,0x14,0x1d,A25
|| [ A0]   ZERO    .L1     A24               ; |195| 
|| [!A0]   ZERO    .D1     A24               ; |195| 

   [!B0]   ZERO    .L1     A4                ; |203| 
|| [ B0]   B       .S2     $C$L20            ; |199| 
|| [ A0]   MVKH    .S1     0xbff00000,A25

           CMPGTDP .S1     A23:A22,A5:A4,A0  ; |203| 
           MV      .L1X    B4,A21            ; |122| 

   [ B0]   MVK     .L1     0x1,A0            ; |203| nullify predicate
||         MVKL    .S1     0xfefa39ec,A4

   [!A0]   B       .S2     $C$L19            ; |203| 
||         MVKL    .S1     0x3fe62e42,A5

           MVKH    .S1     0xfefa39ec,A4
           ; BRANCHCC OCCURS {$C$L20}        ; |199| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 4
   [ A0]   CALL    .S1     _expdp_sinhdp_i   ; |207| 
           NOP             3
           ; BRANCHCC OCCURS {$C$L19}        ; |203| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 2
           ADDKPC  .S2     $C$RL27,B3,0      ; |207| 

           MV      .L1     A23,A5            ; |207| 
||         MV      .S1     A22,A4            ; |207| 

$C$RL27:   ; CALL OCCURS {_expdp_sinhdp_i} {0}  ; |207| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 93
           RCPDP   .S1     A5:A4,A7:A6       ; |209| 
           ZERO    .L1     A16               ; |209| 
           MPYDP   .M1     A5:A4,A7:A6,A9:A8 ; |209| 
           ZERO    .L1     A17
           SET     .S1     A17,0x1e,0x1e,A17
           ZERO    .L2     B4                ; |209| 
           MV      .L2X    A17,B5            ; |209| 
           ZERO    .L2     B8                ; |209| 
           MV      .L2X    A17,B9            ; |209| 
           ZERO    .L2     B29
           NOP             2
           SUBDP   .L1     A17:A16,A9:A8,A9:A8 ; |209| 
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
           NOP             9
           SUBDP   .L2     B9:B8,B7:B6,B7:B6 ; |209| 
           NOP             6
           MPYDP   .M2     B5:B4,B7:B6,B5:B4 ; |209| 
           NOP             9
           NOP             1
           SUBDP   .L1X    A5:A4,B5:B4,A5:A4 ; |209| 

           SET     .S2     B29,0x15,0x1d,B5
||         ZERO    .L2     B4                ; |209| 

           BNOP    .S1     $C$L21,4          ; |209| 
           MPYDP   .M1X    B5:B4,A5:A4,A5:A4 ; |209| 
           ; BRANCH OCCURS {$C$L21}          ; |209| 
;** --------------------------------------------------------------------------*
$C$L19:    
;          EXCLUSIVE CPU CYCLES: 79
           MPYDP   .M1     A23:A22,A23:A22,A9:A8 ; |161| 
           MVKL    .S1     0x13a86d04,A16
           MVKL    .S2     0xa556c736,B4
           MVKL    .S1     0x3de61246,A17
           MVKL    .S2     0x3ec71de3,B5
           MVKH    .S1     0x13a86d04,A16
           MVKH    .S2     0xa556c736,B4
           MVKH    .S1     0x3de61246,A17
           MVKH    .S2     0x3ec71de3,B5
           MVKL    .S1     0x3fc55555,A19
           MPYDP   .M1     A9:A8,A9:A8,A7:A6 ; |161| 
           MVKL    .S2     0x3e5ae645,B7
           MVKL    .S1     0x55555561,A18
           MVKL    .S2     0x67f544de,B6
           MVKH    .S1     0x3fc55555,A19
           MPYDP   .M2X    B5:B4,A9:A8,B5:B4 ; |161| 
           MVKH    .S2     0x3e5ae645,B7
           MVKH    .S1     0x55555561,A18
           MVKH    .S2     0x67f544de,B6
           MVKL    .S2     0x1a01a00b,B8
           MPYDP   .M1     A9:A8,A7:A6,A5:A4 ; |161| 
           MVKL    .S2     0x3f2a01a0,B9
           MVKH    .S2     0x1a01a00b,B8
           MVKH    .S2     0x3f2a01a0,B9
           MPYDP   .M1     A19:A18,A9:A8,A9:A8 ; |161| 
           ADDDP   .L2     B9:B8,B5:B4,B5:B4 ; |161| 
           MPYDP   .M2X    B7:B6,A7:A6,B7:B6 ; |161| 
           MVKL    .S1     _t_start,A3
           MVKH    .S1     _t_start,A3
           STDW    .D1T1   A21:A20,*A3
           MPYDP   .M1     A17:A16,A5:A4,A27:A26 ; |161| 
           MVK     .S2     12,B31
           MPYDP   .M2X    A5:A4,B5:B4,B9:B8 ; |161| 
           MVKL    .S1     0x1111110f,A16
           MVKL    .S1     0x3f811111,A17
           MVKH    .S1     0x1111110f,A16
           MVKH    .S1     0x3f811111,A17
           MPYDP   .M1     A17:A16,A7:A6,A7:A6 ; |161| 
           NOP             5
           ADDDP   .L2X    A27:A26,B7:B6,B5:B4 ; |161| 
           NOP             3
           ADDDP   .L1     A7:A6,A9:A8,A7:A6 ; |161| 
           NOP             2
           MPYDP   .M2X    A5:A4,B5:B4,B5:B4 ; |161| 
           NOP             3
           ADDDP   .L1X    B9:B8,A7:A6,A5:A4 ; |161| 
           NOP             6
           ADDDP   .L1X    B5:B4,A5:A4,A5:A4 ; |161| 
           MVKL    .S2     0x8fb9f87e,B4
           MVKL    .S2     0x408633ce,B5
           MVKH    .S2     0x8fb9f87e,B4
           MVKH    .S2     0x408633ce,B5
           NOP             2
           MPYDP   .M1     A23:A22,A5:A4,A5:A4 ; |161| 
           CMPGTDP .S1X    A23:A22,B5:B4,A0  ; |212| 
           ADD     .L2X    A14,B31,B4
           LDW     .D2T2   *B4,B4            ; |213| 
           NOP             1
           BNOP    .S1     $C$L22,3          ; |161| 
           ADD     .L2     B12,B4,B4         ; |213| 
           ADDDP   .L1     A23:A22,A5:A4,A5:A4 ; |161| 
           ; BRANCH OCCURS {$C$L22}          ; |161| 
;** --------------------------------------------------------------------------*
$C$L20:    
;          EXCLUSIVE CPU CYCLES: 232
           MVKH    .S1     0x3fe62e42,A5
           SUBDP   .L1     A23:A22,A5:A4,A5:A4 ; |96| 
           MVKL    .S2     0x3ff71547,B5
           MVKL    .S2     0x652b82fe,B4
           MVKH    .S2     0x3ff71547,B5
           MVKH    .S2     0x652b82fe,B4
           ZERO    .L2     B6                ; |101| 
           MVKL    .S2     0x3fe63000,B7
           MVKH    .S2     0x3fe63000,B7
           MPYDP   .M2X    B5:B4,A5:A4,B5:B4 ; |96| 
           MVKL    .S1     0xbf2bd010,A7
           MVKL    .S1     0x5c610ca8,A6
           MVKH    .S1     0xbf2bd010,A7
           MVKH    .S1     0x5c610ca8,A6
           MVKL    .S1     0x3f403f99,A17
           MVKL    .S1     0x6fde3809,A16
           MVKH    .S1     0x3f403f99,A17
           MVKH    .S1     0x6fde3809,A16
           MVKL    .S1     0x3f7c70e4,A9
           DPINT   .L2     B5:B4,B8          ; |96| 
           MVKL    .S1     0x6fb3f6e0,A8
           MVKH    .S1     0x3f7c70e4,A9
           MVKH    .S1     0x6fb3f6e0,A8
           INTDP   .L2     B8,B5:B4          ; |101| 
           ZERO    .L2     B17
           ZERO    .L2     B16               ; |102| 
           SET     .S2     B17,0x15,0x1d,B17
           ZERO    .L1     A18               ; |65| 
           MPYDP   .M2     B7:B6,B5:B4,B7:B6 ; |101| 
           MPYDP   .M1X    A7:A6,B5:B4,A7:A6 ; |101| 
           ZERO    .L1     A19
           SET     .S1     A19,0x1e,0x1e,A19
           MVKL    .S2     0x3ef152a4,B5
           MVKL    .S2     0x6f58dc1c,B4
           MVKH    .S2     0x3ef152a4,B5
           MVKH    .S2     0x6f58dc1c,B4
           MVK     .S1     0x3fe,A3
           NOP             2
           SUBDP   .L1X    A5:A4,B7:B6,A5:A4 ; |101| 
           ADD     .L2X    A3,B8,B31         ; |116| 
           NOP             5
           SUBDP   .L1     A5:A4,A7:A6,A7:A6 ; |101| 
           NOP             6
           MPYDP   .M1     A7:A6,A7:A6,A5:A4 ; |101| 
           NOP             9
           NOP             1
           MPYDP   .M2X    B5:B4,A5:A4,B5:B4 ; |101| 
           MPYDP   .M1     A17:A16,A5:A4,A17:A16 ; |102| 
           NOP             9
           ADDDP   .L1X    A9:A8,B5:B4,A9:A8 ; |101| 
           MVKL    .S2     0x3fac718e,B5
           MVKL    .S2     0x714251b3,B4
           MVKH    .S2     0x3fac718e,B5
           MVKH    .S2     0x714251b3,B4
           ADDDP   .L2X    B5:B4,A17:A16,B5:B4 ; |102| 
           NOP             1
           MPYDP   .M1     A5:A4,A9:A8,A9:A8 ; |101| 
           NOP             4
           MPYDP   .M2X    A5:A4,B5:B4,B7:B6 ; |102| 
           NOP             2
           ZERO    .L2     B4                ; |101| 
           ZERO    .L2     B5
           MVKH    .S2     0x3fd00000,B5
           ADDDP   .L2X    B5:B4,A9:A8,B5:B4 ; |101| 
           NOP             7
           MPYDP   .M1X    A7:A6,B5:B4,A7:A6 ; |101| 
           ADDDP   .L2     B17:B16,B7:B6,B5:B4 ; |102| 
           ZERO    .S2     B6                ; |116| 
           MV      .L2     B17,B7            ; |68| 
           NOP             6
           SUBDP   .L1X    B5:B4,A7:A6,A5:A4 ; |102| 
           ZERO    .L2     B4                ; |65| 
           MV      .L2X    A19,B5            ; |65| 
           NOP             4
           RCPDP   .S1     A5:A4,A9:A8       ; |65| 
           NOP             1
           MPYDP   .M1     A5:A4,A9:A8,A17:A16 ; |65| 
           NOP             9
           SUBDP   .L1     A19:A18,A17:A16,A17:A16 ; |65| 
           ZERO    .S1     A18               ; |65| 
           NOP             5
           MPYDP   .M1     A9:A8,A17:A16,A9:A8 ; |65| 
           NOP             9
           MPYDP   .M1     A5:A4,A9:A8,A17:A16 ; |65| 
           NOP             9
           SUBDP   .L1     A19:A18,A17:A16,A17:A16 ; |65| 
           NOP             6
           MPYDP   .M1     A9:A8,A17:A16,A9:A8 ; |65| 
           NOP             9
           MPYDP   .M1     A5:A4,A9:A8,A5:A4 ; |65| 
           NOP             9
           NOP             1
           SUBDP   .L2X    B5:B4,A5:A4,B5:B4 ; |65| 
           ZERO    .L1     A5:A4             ; |68| 
           CMPEQDP .S1     A7:A6,A5:A4,A0    ; |68| 
           ZERO    .L1     A4                ; |116| 
           ZERO    .L1     A5
           MVKH    .S1     0x40100000,A5
           NOP             1
           MPYDP   .M2X    A9:A8,B5:B4,B5:B4 ; |65| 
           NOP             9
           MPYDP   .M2X    A7:A6,B5:B4,B5:B4 ; |65| 
           NOP             9
   [ A0]   ZERO    .L2     B5:B4             ; |69| 
           ADDDP   .L2     B7:B6,B5:B4,B7:B6 ; |116| 
           ZERO    .S2     B4                ; |116| 
           SHL     .S2     B31,20,B5         ; |116| 
           NOP             4
           MPYDP   .M2     B5:B4,B7:B6,B5:B4 ; |116| 
           NOP             9
           NOP             1
           MPYDP   .M1X    A5:A4,B5:B4,A5:A4 ; |116| 
;** --------------------------------------------------------------------------*
$C$L21:    
;          EXCLUSIVE CPU CYCLES: 15
           MVK     .S2     12,B31
           MVKL    .S1     _t_start,A3
           MVKL    .S2     0x8fb9f87e,B4
           MVKL    .S2     0x408633ce,B5
           MVKH    .S2     0x8fb9f87e,B4
           MVKH    .S2     0x408633ce,B5
           MVKH    .S1     _t_start,A3
           CMPGTDP .S1X    A23:A22,B5:B4,A0  ; |212| 
           ADD     .L2X    A14,B31,B4
           LDW     .D2T2   *B4,B4            ; |213| 
           STDW    .D1T1   A21:A20,*A3
           NOP             3
           ADD     .L2     B12,B4,B4         ; |213| 
;** --------------------------------------------------------------------------*
$C$L22:    
;          EXCLUSIVE CPU CYCLES: 34
           NOP             6

   [ A0]   MV      .L1     A11,A5            ; |213| 
|| [ A0]   MV      .S1     A10,A4            ; |213| 

           MPYDP   .M1     A25:A24,A5:A4,A5:A4 ; |213| 
           NOP             9

           STDW    .D2T1   A5:A4,*B4         ; |213| 
||         MVC     .S2     TSCL,B6           ; |128| 

           MVC     .S2     TSCH,B4           ; |128| 

           MVKL    .S1     _t_offset,A3
||         MVKL    .S2     _cycle_counts+24,B5
||         MV      .L2     B4,B7             ; |128| 
||         SUB     .L1X    B11,1,A0          ; |207| 
||         ADD     .D2     8,B12,B12         ; |207| 

           MVKH    .S1     _t_offset,A3
||         MVKH    .S2     _cycle_counts+24,B5
||         SUB     .L2     B11,1,B11         ; |207| 

           LDDW    .D1T1   *A3,A7:A6         ; |130| 
||         LDDW    .D2T2   *B5,B5:B4         ; |130| 
||         MVKL    .S1     _cycle_counts+24,A15

           MVKL    .S1     _t_stop,A31
           MVKH    .S1     _t_stop,A31
           STDW    .D1T2   B7:B6,*A31        ; |128| 
           MVKH    .S1     _cycle_counts+24,A15
           ADDU    .L1     A6,A20,A5:A4      ; |130| 
           ADD     .L1     A5,A7,A5          ; |130| 

           SUBU    .L2X    B6,A4,B9:B8       ; |130| 
||         ADD     .L1     A5,A21,A4         ; |130| 
|| [ A0]   B       .S2     $C$L18            ; |207| 
|| [ A0]   MVKL    .S1     0x40963000,A5

   [ A0]   CALL    .S1     _gimme_random     ; |209| 
||         EXT     .S2     B9,24,24,B16      ; |130| 
||         ADDU    .L2     B4,B8,B9:B8       ; |130| 

           SUB     .L2X    B7,A4,B4          ; |130| 
|| [ A0]   MV      .L1     A12,A4            ; |209| 
|| [ A0]   MVKH    .S1     0x40963000,A5

           ADD     .L2     B9,B5,B4          ; |130| 
||         ADD     .S2     B4,B16,B5         ; |130| 

           ADD     .L2     B4,B5,B9          ; |130| 
|| [ A0]   MVKL    .S2     0xc0863000,B5
|| [ A0]   MV      .D2X    A10,B4            ; |209| 

   [!A0]   CALL    .S1     __fltllif         ; |135| 
||         STDW    .D1T2   B9:B8,*A15        ; |130| 
|| [ A0]   MVKH    .S2     0xc0863000,B5

           ; BRANCHCC OCCURS {$C$L18}        ; |207| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           LDDW    .D1T1   *A15,A5:A4        ; |135| 
           ADDKPC  .S2     $C$RL28,B3,3      ; |135| 
$C$RL28:   ; CALL OCCURS {__fltllif} {0}     ; |135| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 16
           ZERO    .L1     A3
           SET     .S1     A3,0x1a,0x1d,A3
           MPYSP   .M1     A3,A4,A3          ; |135| 
           ZERO    .L1     A11
           SET     .S1     A11,0x15,0x1d,A11
           NOP             1
           SPDP    .S1     A3,A5:A4          ; |135| 
           NOP             2
           ADDDP   .L1     A11:A10,A5:A4,A5:A4 ; |135| 
           CALLP   .S2     __fixdlli,B3
$C$RL29:   ; CALL OCCURS {__fixdlli} {0}     ; |135| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 14
           MV      .L2X    A15,B4

           MV      .L2X    A10,B31           ; |114| 
||         MVK     .S2     24,B5

           SUB     .L2X    A15,B5,B5
||         STDW    .D2T1   A5:A4,*B4         ; |135| 

           MVC     .S2     B31,TSCL          ; |115| 
||         STDW    .D2T1   A13:A12,*B5       ; |114| 

           MVC     .S2     TSCL,B5           ; |116| 
           MVC     .S2     TSCH,B4           ; |116| 
           MVC     .S2     TSCL,B7           ; |117| 
           MVC     .S2     TSCH,B6           ; |117| 
           MVKL    .S1     _input,A3
           MVKH    .S1     _input,A3

           SUBU    .L2     B7,B5,B9:B8       ; |117| 
||         MV      .L1     A14,A4            ; |117| 
||         MVKL    .S1     _t_offset,A31

           EXT     .S2     B9,24,24,B5       ; |117| 
||         MV      .L2X    A3,B16
||         LDW     .D1T1   *A4,A10
||         SUB     .D2     B6,B4,B4          ; |117| 
||         MVK     .S1     0x80,A30

           ADD     .L2     B4,B5,B9          ; |117| 
||         LDW     .D2T1   *B16,A14
||         MVKH    .S1     _t_offset,A31

           STDW    .D1T2   B9:B8,*A31        ; |117| 
||         MV      .L1     A30,A15           ; |117| 

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
           CALL    .S1     _sinh             ; |222| 
           LDDW    .D1T1   *A14++,A5:A4      ; |222| 
           MVKL    .S2     _t_start,B6
           MVKH    .S2     _t_start,B6
           STDW    .D2T2   B5:B4,*B6         ; |122| 
           ADDKPC  .S2     $C$RL30,B3,0      ; |222| 
$C$RL30:   ; CALL OCCURS {_sinh} {0}         ; |222| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 20

           STDW    .D1T1   A5:A4,*A10++      ; |222| 
||         MVC     .S2     TSCL,B8           ; |128| 

           MVC     .S2     TSCH,B4           ; |128| 

           MVKL    .S1     _t_start,A3
||         MVKL    .S2     _t_offset,B11
||         MV      .L2     B4,B9             ; |128| 
||         SUB     .L1     A15,1,A0          ; |220| 
||         SUB     .D1     A15,1,A15         ; |220| 

           MVKH    .S1     _t_start,A3
||         MVKH    .S2     _t_offset,B11

           LDDW    .D1T1   *A3,A7:A6         ; |130| 
||         LDDW    .D2T2   *B11,B7:B6        ; |130| 
||         MVKL    .S1     _cycle_counts,A31

           MVKH    .S1     _cycle_counts,A31
           MVKL    .S1     _t_stop,A30
           MVKH    .S1     _t_stop,A30
           STDW    .D1T2   B9:B8,*A30        ; |128| 

           ADDU    .L1X    B6,A6,A5:A4       ; |130| 
||         MVKL    .S2     _cycle_counts,B6

           ADD     .L1X    A5,B7,A6          ; |130| 
||         MVKH    .S2     _cycle_counts,B6

           SUBU    .L2X    B8,A4,B5:B4       ; |130| 
||         LDDW    .D1T1   *A31,A5:A4        ; |130| 
||         ADD     .L1     A6,A7,A6          ; |130| 

           EXT     .S2     B5,24,24,B5       ; |130| 
|| [!A0]   MV      .L1X    B6,A14

           SUB     .L2X    B9,A6,B31         ; |130| 

   [ A0]   BNOP    .S1     $C$L23,1          ; |220| 
||         ADD     .L2     B31,B5,B5         ; |130| 

           ADDU    .L2X    A4,B4,B17:B16     ; |130| 
           ADD     .L2X    B17,A5,B4         ; |130| 
           ADD     .L2     B4,B5,B17         ; |130| 

   [!A0]   CALL    .S1     __fltllif         ; |135| 
||         STDW    .D2T2   B17:B16,*B6       ; |130| 

           ; BRANCHCC OCCURS {$C$L23}        ; |220| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           LDDW    .D1T1   *A14,A5:A4        ; |135| 
           ADDKPC  .S2     $C$RL31,B3,3      ; |135| 
$C$RL31:   ; CALL OCCURS {__fltllif} {0}     ; |135| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 15
           ZERO    .L1     A3
           SET     .S1     A3,0x1a,0x1d,A3
           MPYSP   .M1     A3,A4,A3          ; |135| 
           MV      .L1     A12,A10           ; |135| 
           NOP             2
           SPDP    .S1     A3,A5:A4          ; |135| 
           NOP             1
           ADDDP   .L1     A11:A10,A5:A4,A5:A4 ; |135| 
           CALLP   .S2     __fixdlli,B3
$C$RL32:   ; CALL OCCURS {__fixdlli} {0}     ; |135| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 10

           STDW    .D1T1   A13:A12,*+A14(16) ; |114| 
||         MV      .L2X    A13,B4            ; |114| 

           MVC     .S2     B4,TSCL           ; |115| 
||         STDW    .D1T1   A5:A4,*A14        ; |135| 

           MVC     .S2     TSCL,B5           ; |116| 
           MVC     .S2     TSCH,B4           ; |116| 
           MVC     .S2     TSCL,B6           ; |117| 
           MVC     .S2     TSCH,B8           ; |117| 
           SUBU    .L2     B6,B5,B7:B6       ; |117| 

           EXT     .S2     B7,24,24,B5       ; |117| 
||         SUB     .L2     B8,B4,B4          ; |117| 
||         MVK     .S1     0x80,A3

           ADD     .L2     B4,B5,B7          ; |117| 

           MV      .L2X    A3,B11            ; |117| 
||         STDW    .D2T2   B7:B6,*B11        ; |117| 

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
           LDW     .D1T1   *A3,A3            ; |231| 
           MVKL    .S2     _t_start,B6
           MVKH    .S2     _t_start,B6
           STDW    .D2T2   B5:B4,*B6         ; |122| 
           NOP             1

           ADD     .L1     A10,A3,A3         ; |231| 
||         CALL    .S1     _sinhdp_c         ; |231| 

           LDDW    .D1T1   *A3,A5:A4         ; |231| 
           ADDKPC  .S2     $C$RL33,B3,3      ; |231| 
$C$RL33:   ; CALL OCCURS {_sinhdp_c} {0}     ; |231| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 24
           MVKL    .S2     _output+8,B4
           MVKH    .S2     _output+8,B4
           LDW     .D2T2   *B4,B4            ; |231| 
           NOP             4
           ADD     .L1X    A10,B4,A3         ; |231| 

           STDW    .D1T1   A5:A4,*A3         ; |231| 
||         MVC     .S2     TSCL,B16          ; |128| 

           MVC     .S2     TSCH,B6           ; |128| 

           MVKL    .S1     _t_offset,A15
||         MVKL    .S2     _t_start,B4
||         ADDAD   .D1     A14,2,A3
||         SUB     .L1X    B11,1,A0          ; |229| 
||         MV      .L2     B6,B17            ; |128| 
||         SUB     .D2     B11,1,B11         ; |229| 

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

   [ A0]   B       .S1     $C$L24            ; |229| 
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
||         ADD     .L1     8,A10,A10         ; |229| 

           ; BRANCHCC OCCURS {$C$L24}        ; |229| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           LDDW    .D1T1   *+A3(16),A5:A4    ; |135| 
           ADDKPC  .S2     $C$RL34,B3,3      ; |135| 
$C$RL34:   ; CALL OCCURS {__fltllif} {0}     ; |135| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 15
           ZERO    .L1     A3
           SET     .S1     A3,0x1a,0x1d,A3
           MPYSP   .M1     A3,A4,A3          ; |135| 
           MV      .L1     A12,A10           ; |135| 
           NOP             2
           SPDP    .S1     A3,A5:A4          ; |135| 
           NOP             1
           ADDDP   .L1     A11:A10,A5:A4,A5:A4 ; |135| 
           CALLP   .S2     __fixdlli,B3
$C$RL35:   ; CALL OCCURS {__fixdlli} {0}     ; |135| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 10

           MV      .L1     A14,A3            ; |135| 
||         STDW    .D2T1   A5:A4,*B12        ; |135| 
||         MV      .L2X    A13,B4            ; |114| 

           MVC     .S2     B4,TSCL           ; |115| 
||         STDW    .D1T1   A13:A12,*+A3(8)   ; |114| 

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
           LDW     .D1T1   *A3,A3            ; |240| 
           MVKL    .S2     _t_start,B6
           MVKH    .S2     _t_start,B6
           STDW    .D2T2   B5:B4,*B6         ; |122| 
           NOP             1

           ADD     .L1     A10,A3,A3         ; |240| 
||         CALL    .S1     _sinhdp           ; |240| 

           LDDW    .D1T1   *A3,A5:A4         ; |240| 
           ADDKPC  .S2     $C$RL36,B3,3      ; |240| 
$C$RL36:   ; CALL OCCURS {_sinhdp} {0}       ; |240| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 24
           MVKL    .S2     _output+4,B4
           MVKH    .S2     _output+4,B4
           LDW     .D2T2   *B4,B4            ; |240| 
           NOP             4
           ADD     .L1X    A10,B4,A3         ; |240| 

           STDW    .D1T1   A5:A4,*A3         ; |240| 
||         MVC     .S2     TSCL,B16          ; |128| 

           MVC     .S2     TSCH,B4           ; |128| 

           MVKL    .S2     _t_start,B11
||         MVKL    .S1     _t_offset,A14
||         SUB     .L1X    B13,1,A0          ; |238| 
||         MV      .L2     B4,B17            ; |128| 
||         ADD     .D1     8,A10,A10         ; |238| 
||         SUB     .D2     B13,1,B13         ; |238| 

           MVKH    .S2     _t_start,B11
||         MVKH    .S1     _t_offset,A14

           LDDW    .D1T1   *A14,A5:A4        ; |130| 
||         LDDW    .D2T2   *B11,B7:B6        ; |130| 
||         MVKL    .S1     _cycle_counts+8,A3

           MVKH    .S1     _cycle_counts+8,A3

           LDDW    .D1T1   *A3,A7:A6         ; |130| 
||         MVKL    .S1     _t_stop,A15

           MV      .L2X    A3,B12            ; |128| 
||         MVKH    .S1     _t_stop,A15

   [!A0]   MVKL    .S1     _cycle_counts,A3
||         STDW    .D1T2   B17:B16,*A15      ; |128| 

           ADDU    .L2X    A4,B6,B9:B8       ; |130| 
|| [!A0]   MVKH    .S1     _cycle_counts,A3

           ADD     .S2X    B9,A5,B6          ; |130| 
|| [ A0]   B       .S1     $C$L25            ; |238| 
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
||         STDW    .D2T2   B7:B6,*B12        ; |130| 

           ; BRANCHCC OCCURS {$C$L25}        ; |238| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           LDDW    .D1T1   *+A3(8),A5:A4     ; |135| 
           ADDKPC  .S2     $C$RL37,B3,3      ; |135| 
$C$RL37:   ; CALL OCCURS {__fltllif} {0}     ; |135| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 111
           ZERO    .L1     A3
           SET     .S1     A3,0x1a,0x1d,A3
           MPYSP   .M1     A3,A4,A3          ; |135| 
           MV      .L1     A12,A10           ; |135| 
           NOP             2
           SPDP    .S1     A3,A5:A4          ; |135| 
           NOP             1
           ADDDP   .L1     A11:A10,A5:A4,A5:A4 ; |135| 
           CALLP   .S2     __fixdlli,B3
$C$RL38:   ; CALL OCCURS {__fixdlli} {0}     ; |135| 
           MV      .L1X    B12,A10           ; |135| 
           SUBAW   .D1     A10,2,A3

           MV      .L2X    A13,B4            ; |114| 
||         STDW    .D1T1   A5:A4,*A10        ; |135| 

           STDW    .D1T1   A13:A12,*+A3(32)  ; |114| 
||         MVC     .S2     B4,TSCL           ; |115| 

           MVC     .S2     TSCL,B8           ; |116| 
           MVC     .S2     TSCH,B4           ; |116| 
           MV      .L2     B4,B9             ; |116| 

           STDW    .D2T2   B9:B8,*B11        ; |116| 
||         MVC     .S2     TSCL,B4           ; |117| 

           MVC     .S2     TSCH,B7           ; |117| 

           MVKL    .S1     _input,A3
||         SUBU    .L2     B4,B8,B5:B4       ; |117| 

           MVKH    .S1     _input,A3
||         EXT     .S2     B5,24,24,B7       ; |117| 
||         SUB     .L2     B7,B9,B5          ; |117| 

           MVKL    .S1     _output,A12
||         ADD     .L2     B5,B7,B5          ; |117| 

           MV      .L2X    A3,B6             ; |247| 
||         MVKH    .S1     _output,A12
||         STDW    .D1T2   B5:B4,*A14        ; |117| 

           CALLP   .S2     _sinhdp_v,B3
||         LDW     .D2T1   *B6,A4            ; |247| 
||         LDW     .D1T2   *+A12(16),B4      ; |247| 
||         MVK     .S1     0x80,A6           ; |247| 

$C$RL39:   ; CALL OCCURS {_sinhdp_v} {0}     ; |247| 
           MVC     .S2     TSCL,B16          ; |128| 
           MVC     .S2     TSCH,B6           ; |128| 

           LDDW    .D1T1   *A14,A7:A6        ; |130| 
||         LDDW    .D2T2   *B11,B5:B4        ; |130| 

           MVK     .S2     24,B11
           ADD     .L2X    A10,B11,B11
           MV      .L2     B6,B17            ; |128| 
           LDDW    .D2T2   *B11,B7:B6        ; |130| 
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

$C$RL40:   ; CALL OCCURS {__fltllif} {0}     ; |130| 
           ZERO    .L1     A3
           SET     .S1     A3,0x1a,0x1d,A3
           MPYSP   .M1     A3,A4,A3          ; |130| 
           MV      .L1     A13,A10           ; |130| 
           NOP             2
           SPDP    .S1     A3,A5:A4          ; |130| 
           NOP             1
           ADDDP   .L1     A11:A10,A5:A4,A5:A4 ; |130| 
           CALLP   .S2     __fixdlli,B3
$C$RL41:   ; CALL OCCURS {__fixdlli} {0}     ; |130| 
           MVKL    .S2     0x812dea11,B6
           MVKL    .S2     0x3d719799,B7
           MVKH    .S2     0x812dea11,B6

           MV      .L1     A4,A6             ; |130| 
||         LDW     .D1T1   *A12,A4           ; |66| 
||         MV      .S1     A5,A7             ; |130| 
||         MVKH    .S2     0x3d719799,B7

           CALLP   .S2     _isequal,B3
||         LDW     .D1T2   *+A12(4),B4       ; |66| 
||         STDW    .D2T1   A7:A6,*B11        ; |130| 
||         MVK     .S1     0x80,A6           ; |66| 
||         MVK     .L1     0x9,A8            ; |66| 

$C$RL42:   ; CALL OCCURS {_isequal} {0}      ; |66| 
           MVKL    .S2     0x812dea11,B6
           MVKL    .S2     0x3d719799,B7

           LDW     .D1T2   *+A12(8),B4       ; |67| 
||         MVKL    .S1     _fcn_pass,A10
||         MVKH    .S2     0x812dea11,B6

           MV      .L1     A4,A5             ; |66| 
||         LDW     .D1T1   *A12,A4           ; |67| 
||         MVKH    .S1     _fcn_pass,A10
||         MVKH    .S2     0x3d719799,B7

           CALLP   .S2     _isequal,B3
||         STW     .D1T1   A5,*+A10(4)       ; |66| 
||         MVK     .S1     0x80,A6           ; |67| 
||         MVK     .L1     0x9,A8            ; |67| 

$C$RL43:   ; CALL OCCURS {_isequal} {0}      ; |67| 
           MVKL    .S2     0x3d719799,B7
           MVKL    .S2     0x812dea11,B6

           STW     .D1T1   A4,*+A10(8)       ; |67| 
||         MVKH    .S2     0x3d719799,B7

           MV      .L1     A12,A3            ; |68| 
||         LDW     .D1T2   *+A12(12),B4      ; |68| 
||         MVKH    .S2     0x812dea11,B6

           CALLP   .S2     _isequal,B3
||         LDW     .D1T1   *A3,A4            ; |68| 
||         MVK     .S1     0x80,A6           ; |68| 
||         MVK     .L1     0x9,A8            ; |68| 

$C$RL44:   ; CALL OCCURS {_isequal} {0}      ; |68| 
           MVKL    .S2     0x3d719799,B7
           MVKL    .S2     0x812dea11,B6
           MVKH    .S2     0x3d719799,B7

           MV      .L1     A12,A3            ; |68| 
||         STW     .D1T1   A4,*+A10(12)      ; |68| 
||         MVKH    .S2     0x812dea11,B6

           CALLP   .S2     _isequal,B3
||         LDW     .D1T1   *A3,A4            ; |69| 
||         LDW     .D2T2   *B10,B4           ; |69| 
||         MVK     .S1     0x80,A6           ; |69| 
||         MVK     .L1     0x9,A8            ; |69| 

$C$RL45:   ; CALL OCCURS {_isequal} {0}      ; |69| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 12
           ADD     .L2X    4,A10,B4
           LDW     .D2T2   *B4,B0            ; |72| 
           STW     .D1T1   A4,*+A10(16)      ; |69| 
           ADD     .L2X    8,A10,B4
           NOP             2

   [!B0]   BNOP    .S1     $C$L26,4          ; |72| 
||         MV      .L2     B0,B1             ; guard predicate rewrite
|| [ B0]   LDW     .D2T2   *B4,B0            ; |72| 

   [ B1]   ADD     .L2     4,B4,B4
           ; BRANCHCC OCCURS {$C$L26}        ; |72| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 15
   [ B0]   LDW     .D2T2   *B4,B4            ; |72| 
   [!B0]   MV      .L1     A13,A0            ; |72| 
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
           MV      .L1     A13,A4
           NOP             1
;** --------------------------------------------------------------------------*
$C$L27:    
;          EXCLUSIVE CPU CYCLES: 1

           STW     .D1T1   A4,*A3            ; |72| 
||         MVK     .L1     0x2,A4            ; |253| 
||         ADDKPC  .S2     $C$RL46,B3,0      ; |253| 

$C$RL46:   ; CALL OCCURS {_print_test_results} {0}  ; |253| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 30
           MVKL    .S2     $C$SL2+0,B4
           MVKH    .S2     $C$SL2+0,B4

           CALLP   .S2     _printf,B3
||         STW     .D2T2   B4,*+SP(4)        ; |254| 

$C$RL47:   ; CALL OCCURS {_printf} {0}       ; |254| 
           MVKL    .S2     $C$SL3+0,B4
           MVKH    .S2     $C$SL3+0,B4

           CALLP   .S2     _printf,B3
||         STW     .D2T2   B4,*+SP(4)        ; |254| 

$C$RL48:   ; CALL OCCURS {_printf} {0}       ; |254| 
           MVKL    .S1     $C$SL1+0,A10
           MVKH    .S1     $C$SL1+0,A10

           CALLP   .S2     _print_profile_results,B3
||         MV      .L1     A10,A4            ; |261| 

$C$RL49:   ; CALL OCCURS {_print_profile_results} {0}  ; |261| 

           CALLP   .S2     _print_memory_results,B3
||         MV      .L1     A10,A4            ; |264| 

$C$RL50:   ; CALL OCCURS {_print_memory_results} {0}  ; |264| 
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
$C$SL1:	.string	"sinhDP",0
$C$SL2:	.string	"----------------------------------------",0
$C$SL3:	.string	"----------------------------------------",10,0
;*****************************************************************************
;* UNDEFINED EXTERNAL REFERENCES                                             *
;*****************************************************************************
	.global	_printf
	.global	_sinh
	.global	_driver_init
	.global	_print_profile_results
	.global	_print_memory_results
	.global	_print_test_results
	.global	_gimme_random
	.global	_isequal
	.global	_sinhdp_c
	.global	_sinhdp
	.global	_sinhdp_v
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
