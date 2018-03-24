;******************************************************************************
;* TMS320C6x C/C++ Codegen                                          PC v7.4.2 *
;* Date/Time created: Mon May 16 23:36:58 2016                                *
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
	.word	040141102h		; a[0] @ 0
	.word	03ff2cc5fh		; a[1] @ 32
	.word	0bd9afc70h		; a[2] @ 64
	.word	03f630582h		; a[3] @ 96
	.word	0bf7ae4ddh		; a[4] @ 128
	.word	03e3b0dc4h		; a[5] @ 160
	.word	0bf8ecb9eh		; a[6] @ 192
	.word	0bf862ef5h		; a[7] @ 224
	.word	03fd2c2fbh		; a[8] @ 256
	.word	0bf5d3b44h		; a[9] @ 288
	.word	0bf5a521eh		; a[10] @ 320
	.word	0bff8f7e8h		; a[11] @ 352
	.word	0c028e5cbh		; a[12] @ 384
	.word	03f05aedch		; a[13] @ 416
	.word	040349a02h		; a[14] @ 448
	.word	0bf7b0dd5h		; a[15] @ 480
	.word	0c0489c2fh		; a[16] @ 512
	.word	0bff40f1fh		; a[17] @ 544
	.word	0c0148a69h		; a[18] @ 576
	.word	03f837bf8h		; a[19] @ 608
	.word	04034b16ah		; a[20] @ 640
	.word	04028e5cbh		; a[21] @ 672
	.word	03f9052a0h		; a[22] @ 704
	.word	03facbc6eh		; a[23] @ 736
	.word	0c03a6b74h		; a[24] @ 768
	.word	0bffb8b20h		; a[25] @ 800
	.word	0c0241c63h		; a[26] @ 832
	.word	03ff23fbeh		; a[27] @ 864
	.word	0c0139c36h		; a[28] @ 896
	.word	0c0086c78h		; a[29] @ 928
	.word	03ef8a5d2h		; a[30] @ 960
	.word	0402fff6ah		; a[31] @ 992
	.word	03ff56ed3h		; a[32] @ 1024
	.word	03fa84667h		; a[33] @ 1056
	.word	0c031e957h		; a[34] @ 1088
	.word	040101cabh		; a[35] @ 1120
	.word	0bf8a2045h		; a[36] @ 1152
	.word	0beee6efch		; a[37] @ 1184
	.word	0bff745cah		; a[38] @ 1216
	.word	0c043d863h		; a[39] @ 1248
	.word	03fb67eaeh		; a[40] @ 1280
	.word	03f4cd165h		; a[41] @ 1312
	.word	0bf7a76ceh		; a[42] @ 1344
	.word	03efca8aah		; a[43] @ 1376
	.word	03faf06b9h		; a[44] @ 1408
	.word	0bf8070b2h		; a[45] @ 1440
	.word	03f221c4bh		; a[46] @ 1472
	.word	0beb221cfh		; a[47] @ 1504
	.word	03fc89346h		; a[48] @ 1536
	.word	0bf90ac19h		; a[49] @ 1568
	.word	03fd57c03h		; a[50] @ 1600
	.word	0bfe72e3fh		; a[51] @ 1632
	.word	040421ccfh		; a[52] @ 1664
	.word	0c03e3049h		; a[53] @ 1696
	.word	0bf6c2573h		; a[54] @ 1728
	.word	0bfe252d7h		; a[55] @ 1760
	.word	0bf9ec3c7h		; a[56] @ 1792
	.word	03f7db67dh		; a[57] @ 1824
	.word	03f39a260h		; a[58] @ 1856
	.word	03d88180ah		; a[59] @ 1888
	.word	0bf990bffh		; a[60] @ 1920
	.word	0c01bdc68h		; a[61] @ 1952
	.word	03dae4367h		; a[62] @ 1984
	.word	0400d71deh		; a[63] @ 2016
	.word	0bf8b9257h		; a[64] @ 2048
	.word	0c0421635h		; a[65] @ 2080
	.word	03fb2897ch		; a[66] @ 2112
	.word	03fae65d8h		; a[67] @ 2144
	.word	0bf31ad8dh		; a[68] @ 2176
	.word	03fad5a88h		; a[69] @ 2208
	.word	03f60a26eh		; a[70] @ 2240
	.word	0bf8ef2bah		; a[71] @ 2272
	.word	0bfc515cah		; a[72] @ 2304
	.word	0bfbaacb1h		; a[73] @ 2336
	.word	0bf3b5b36h		; a[74] @ 2368
	.word	03efdd954h		; a[75] @ 2400
	.word	0bf1989ceh		; a[76] @ 2432
	.word	0be88f66eh		; a[77] @ 2464
	.word	03fee7a9fh		; a[78] @ 2496
	.word	0c0111941h		; a[79] @ 2528
	.word	0c03eecd0h		; a[80] @ 2560
	.word	03fe562adh		; a[81] @ 2592
	.word	0bf00c3a0h		; a[82] @ 2624
	.word	0bf7540c6h		; a[83] @ 2656
	.word	0c03a72fbh		; a[84] @ 2688
	.word	0be50031fh		; a[85] @ 2720
	.word	03e74f498h		; a[86] @ 2752
	.word	0bfa2acb6h		; a[87] @ 2784
	.word	0c02e7a83h		; a[88] @ 2816
	.word	0bec72cbah		; a[89] @ 2848
	.word	0c0135e0fh		; a[90] @ 2880
	.word	03fdea935h		; a[91] @ 2912
	.word	0be305af7h		; a[92] @ 2944
	.word	0bf5dd04ch		; a[93] @ 2976
	.word	0402c1e8bh		; a[94] @ 3008
	.word	0bfa5d41dh		; a[95] @ 3040
	.word	0bf8e9d33h		; a[96] @ 3072
	.word	03f270a01h		; a[97] @ 3104
	.word	0bf8076ech		; a[98] @ 3136
	.word	0c0223030h		; a[99] @ 3168
	.word	0bf1a6328h		; a[100] @ 3200
	.word	0bfbe071eh		; a[101] @ 3232
	.word	03e3d223ch		; a[102] @ 3264
	.word	0c01301bch		; a[103] @ 3296
	.word	0bfdd3c40h		; a[104] @ 3328
	.word	0c00ab180h		; a[105] @ 3360
	.word	0bf6a900bh		; a[106] @ 3392
	.word	0c02c477ah		; a[107] @ 3424
	.word	0c045ee9eh		; a[108] @ 3456
	.word	03ff38b66h		; a[109] @ 3488
	.word	0bf1da479h		; a[110] @ 3520
	.word	0bf9bbd79h		; a[111] @ 3552
	.word	03fa7f865h		; a[112] @ 3584
	.word	0be787322h		; a[113] @ 3616
	.word	0403f4496h		; a[114] @ 3648
	.word	04032c682h		; a[115] @ 3680
	.word	040408298h		; a[116] @ 3712
	.word	0c0220964h		; a[117] @ 3744
	.word	0c01f60f5h		; a[118] @ 3776
	.word	03ffe9ff0h		; a[119] @ 3808
	.word	0bfe982eeh		; a[120] @ 3840
	.word	0bf220d76h		; a[121] @ 3872
	.word	03dffd6bdh		; a[122] @ 3904
	.word	0be760cc6h		; a[123] @ 3936
	.word	0bc6c397ah		; a[124] @ 3968
	.word	03fdc80c7h		; a[125] @ 4000
	.word	03f9f5b94h		; a[126] @ 4032
	.word	0c00af55eh		; a[127] @ 4064
	.word	03f825607h		; a[128] @ 4096
	.word	0bf7bee44h		; a[129] @ 4128
	.word	03ff2a09eh		; a[130] @ 4160
	.word	04018840eh		; a[131] @ 4192
	.word	0bfcad2a3h		; a[132] @ 4224
	.word	04035b6a6h		; a[133] @ 4256
	.word	03fc177cfh		; a[134] @ 4288
	.word	0bf8d3ea5h		; a[135] @ 4320
	.word	03d0524b2h		; a[136] @ 4352
	.word	0c0083c8ch		; a[137] @ 4384
	.word	0c016f98ch		; a[138] @ 4416
	.word	0402d00e8h		; a[139] @ 4448
	.word	0bf0a48c2h		; a[140] @ 4480
	.word	0bfc5fabdh		; a[141] @ 4512
	.word	0bfa0f0c2h		; a[142] @ 4544
	.word	0400330b1h		; a[143] @ 4576
	.word	03f8cbab1h		; a[144] @ 4608
	.word	0bfd80afeh		; a[145] @ 4640
	.word	0bf9b0e88h		; a[146] @ 4672
	.word	040161731h		; a[147] @ 4704
	.word	03f989c3ch		; a[148] @ 4736
	.word	03ffb2fe6h		; a[149] @ 4768
	.word	0402be9b4h		; a[150] @ 4800
	.word	03f75626ah		; a[151] @ 4832
	.word	03f235413h		; a[152] @ 4864
	.word	0bef08c72h		; a[153] @ 4896
	.word	03f744441h		; a[154] @ 4928
	.word	0be8e0396h		; a[155] @ 4960
	.word	0bfc65bach		; a[156] @ 4992
	.word	0bfd93023h		; a[157] @ 5024
	.word	03f998784h		; a[158] @ 5056
	.word	0bfa2787ah		; a[159] @ 5088
	.word	0bfdf8dffh		; a[160] @ 5120
	.word	0c01c7b18h		; a[161] @ 5152
	.word	0403f5566h		; a[162] @ 5184
	.word	0402a6365h		; a[163] @ 5216
	.word	03fede744h		; a[164] @ 5248
	.word	03f78e526h		; a[165] @ 5280
	.word	0c00e17f3h		; a[166] @ 5312
	.word	03fdae686h		; a[167] @ 5344
	.word	04040e434h		; a[168] @ 5376
	.word	0c0049ee9h		; a[169] @ 5408
	.word	03f02cb32h		; a[170] @ 5440
	.word	0c03fd7d5h		; a[171] @ 5472
	.word	0bd39889dh		; a[172] @ 5504
	.word	03f973ab0h		; a[173] @ 5536
	.word	0bf5d45eeh		; a[174] @ 5568
	.word	03ecf53c9h		; a[175] @ 5600
	.word	03ff017e9h		; a[176] @ 5632
	.word	0403b70b0h		; a[177] @ 5664
	.word	0bfaa4494h		; a[178] @ 5696
	.word	0c046c3e3h		; a[179] @ 5728
	.word	0c037415ah		; a[180] @ 5760
	.word	0be4a1f08h		; a[181] @ 5792
	.word	0401a8b1dh		; a[182] @ 5824
	.word	03f8e0b51h		; a[183] @ 5856
	.word	0c0192808h		; a[184] @ 5888
	.word	0bf407130h		; a[185] @ 5920
	.word	0bf1e200fh		; a[186] @ 5952
	.word	03f46ac43h		; a[187] @ 5984
	.word	03f44b835h		; a[188] @ 6016
	.word	03f326639h		; a[189] @ 6048
	.word	03fe651f1h		; a[190] @ 6080
	.word	03f2e745ah		; a[191] @ 6112
	.word	040174a65h		; a[192] @ 6144
	.word	03fe54c4eh		; a[193] @ 6176
	.word	03fbce58eh		; a[194] @ 6208
	.word	0c01b3b2bh		; a[195] @ 6240
	.word	040297d09h		; a[196] @ 6272
	.word	0bfd1a2dbh		; a[197] @ 6304
	.word	03f4faffdh		; a[198] @ 6336
	.word	0bf757f2fh		; a[199] @ 6368
	.word	03d825fcfh		; a[200] @ 6400

	.global	b
	.sect	".fardata:b", RW
	.clink
	.align	8
	.elfsym	b,SYM_SIZE(804)
b:
	.word	0c2b683bch		; b[0] @ 0
	.word	04195ed44h		; b[1] @ 32
	.word	0c25775ceh		; b[2] @ 64
	.word	0c297838bh		; b[3] @ 96
	.word	042c09d8eh		; b[4] @ 128
	.word	0c0f37dbfh		; b[5] @ 160
	.word	0c199a89fh		; b[6] @ 192
	.word	042b432d0h		; b[7] @ 224
	.word	0410d4ae1h		; b[8] @ 256
	.word	04268494eh		; b[9] @ 288
	.word	0c25c9d54h		; b[10] @ 320
	.word	042a4640ah		; b[11] @ 352
	.word	042b5959eh		; b[12] @ 384
	.word	0428ccb6fh		; b[13] @ 416
	.word	04259921dh		; b[14] @ 448
	.word	041df7614h		; b[15] @ 480
	.word	0c28dba63h		; b[16] @ 512
	.word	041e63291h		; b[17] @ 544
	.word	04287fd6bh		; b[18] @ 576
	.word	0c08cc4c1h		; b[19] @ 608
	.word	042618a9eh		; b[20] @ 640
	.word	042917751h		; b[21] @ 672
	.word	042b3977dh		; b[22] @ 704
	.word	03f268ffch		; b[23] @ 736
	.word	0c255070eh		; b[24] @ 768
	.word	042b50013h		; b[25] @ 800
	.word	0c2098defh		; b[26] @ 832
	.word	03e3f2e56h		; b[27] @ 864
	.word	041935516h		; b[28] @ 896
	.word	0c2b32720h		; b[29] @ 928
	.word	042ac1e05h		; b[30] @ 960
	.word	042c04168h		; b[31] @ 992
	.word	0420694bch		; b[32] @ 1024
	.word	0c2bb29e7h		; b[33] @ 1056
	.word	0c157272ah		; b[34] @ 1088
	.word	0c2832e79h		; b[35] @ 1120
	.word	0c2c7827ch		; b[36] @ 1152
	.word	0c08b363ah		; b[37] @ 1184
	.word	0c26264cch		; b[38] @ 1216
	.word	0c2c2bd18h		; b[39] @ 1248
	.word	04285dc4bh		; b[40] @ 1280
	.word	0421d2da4h		; b[41] @ 1312
	.word	0c19f8576h		; b[42] @ 1344
	.word	0c2827706h		; b[43] @ 1376
	.word	0c2900951h		; b[44] @ 1408
	.word	04223f8f9h		; b[45] @ 1440
	.word	04279c314h		; b[46] @ 1472
	.word	0c2bb1348h		; b[47] @ 1504
	.word	041a14752h		; b[48] @ 1536
	.word	0c2450d45h		; b[49] @ 1568
	.word	042c2af39h		; b[50] @ 1600
	.word	04218a5cbh		; b[51] @ 1632
	.word	041c7f5f4h		; b[52] @ 1664
	.word	042676d1eh		; b[53] @ 1696
	.word	0c26ee426h		; b[54] @ 1728
	.word	042bca442h		; b[55] @ 1760
	.word	0c205fc92h		; b[56] @ 1792
	.word	03ff97658h		; b[57] @ 1824
	.word	0c152347dh		; b[58] @ 1856
	.word	0c18acb4eh		; b[59] @ 1888
	.word	0417d2263h		; b[60] @ 1920
	.word	0c2219988h		; b[61] @ 1952
	.word	0c1ad8e03h		; b[62] @ 1984
	.word	0c23acd68h		; b[63] @ 2016
	.word	042a6dea1h		; b[64] @ 2048
	.word	0426066cch		; b[65] @ 2080
	.word	0bf751dach		; b[66] @ 2112
	.word	040649886h		; b[67] @ 2144
	.word	041d16bdbh		; b[68] @ 2176
	.word	0c229789ch		; b[69] @ 2208
	.word	04297efc5h		; b[70] @ 2240
	.word	0428f4fb4h		; b[71] @ 2272
	.word	0422d64f1h		; b[72] @ 2304
	.word	04294cbb0h		; b[73] @ 2336
	.word	0c18d3ce4h		; b[74] @ 2368
	.word	042223569h		; b[75] @ 2400
	.word	0429e13dch		; b[76] @ 2432
	.word	0c2142594h		; b[77] @ 2464
	.word	04201461eh		; b[78] @ 2496
	.word	0c2809734h		; b[79] @ 2528
	.word	041aaecdch		; b[80] @ 2560
	.word	0c29e6d44h		; b[81] @ 2592
	.word	042ae6160h		; b[82] @ 2624
	.word	0c2914731h		; b[83] @ 2656
	.word	0c2c632bbh		; b[84] @ 2688
	.word	0c12a7837h		; b[85] @ 2720
	.word	0c24e87f9h		; b[86] @ 2752
	.word	0c2894aabh		; b[87] @ 2784
	.word	042ba0450h		; b[88] @ 2816
	.word	0c234555dh		; b[89] @ 2848
	.word	0c214ae5fh		; b[90] @ 2880
	.word	040a61ac0h		; b[91] @ 2912
	.word	0c2a764e0h		; b[92] @ 2944
	.word	0c250d13bh		; b[93] @ 2976
	.word	041acbeb9h		; b[94] @ 3008
	.word	0c24cb5dbh		; b[95] @ 3040
	.word	042027dc6h		; b[96] @ 3072
	.word	04222eee8h		; b[97] @ 3104
	.word	0c2246a33h		; b[98] @ 3136
	.word	0c2b86405h		; b[99] @ 3168
	.word	0423f5449h		; b[100] @ 3200
	.word	0424d201eh		; b[101] @ 3232
	.word	0c23bf573h		; b[102] @ 3264
	.word	0c1dc377dh		; b[103] @ 3296
	.word	0c2aece51h		; b[104] @ 3328
	.word	0c26f173eh		; b[105] @ 3360
	.word	0c295258fh		; b[106] @ 3392
	.word	0c1cf8a20h		; b[107] @ 3424
	.word	0c29cce9ch		; b[108] @ 3456
	.word	041460eb2h		; b[109] @ 3488
	.word	0c269560dh		; b[110] @ 3520
	.word	042b2c2e4h		; b[111] @ 3552
	.word	0c2b3322dh		; b[112] @ 3584
	.word	0c2ab8fe6h		; b[113] @ 3616
	.word	04140d9dfh		; b[114] @ 3648
	.word	042203cc4h		; b[115] @ 3680
	.word	04276f4eeh		; b[116] @ 3712
	.word	04223bbd8h		; b[117] @ 3744
	.word	042af95fdh		; b[118] @ 3776
	.word	042b1330ch		; b[119] @ 3808
	.word	0c2c672cdh		; b[120] @ 3840
	.word	0c2937a28h		; b[121] @ 3872
	.word	042867b66h		; b[122] @ 3904
	.word	0422c62a6h		; b[123] @ 3936
	.word	042bb2c6dh		; b[124] @ 3968
	.word	0424c5640h		; b[125] @ 4000
	.word	0c10c94edh		; b[126] @ 4032
	.word	0425e9e73h		; b[127] @ 4064
	.word	0425bc1d5h		; b[128] @ 4096
	.word	04217d664h		; b[129] @ 4128
	.word	04225a6d9h		; b[130] @ 4160
	.word	041acf3edh		; b[131] @ 4192
	.word	0c26adb28h		; b[132] @ 4224
	.word	04255d546h		; b[133] @ 4256
	.word	0c248be6bh		; b[134] @ 4288
	.word	0c1a9990eh		; b[135] @ 4320
	.word	0424e229ch		; b[136] @ 4352
	.word	041285b06h		; b[137] @ 4384
	.word	0c169e801h		; b[138] @ 4416
	.word	0c2b2d75eh		; b[139] @ 4448
	.word	041e4ce12h		; b[140] @ 4480
	.word	0c2173961h		; b[141] @ 4512
	.word	0c20f25d1h		; b[142] @ 4544
	.word	0c25e982ch		; b[143] @ 4576
	.word	042771bd1h		; b[144] @ 4608
	.word	0c2b9c8bbh		; b[145] @ 4640
	.word	0423cdef7h		; b[146] @ 4672
	.word	0c24b2d28h		; b[147] @ 4704
	.word	042a40ae0h		; b[148] @ 4736
	.word	0c1416669h		; b[149] @ 4768
	.word	0c2812cc3h		; b[150] @ 4800
	.word	0c270d684h		; b[151] @ 4832
	.word	0c2181ec4h		; b[152] @ 4864
	.word	042b36d3fh		; b[153] @ 4896
	.word	0429856fdh		; b[154] @ 4928
	.word	0429271f0h		; b[155] @ 4960
	.word	0c2988201h		; b[156] @ 4992
	.word	04229aba7h		; b[157] @ 5024
	.word	0427396d1h		; b[158] @ 5056
	.word	0424dae9bh		; b[159] @ 5088
	.word	0c28ff3e5h		; b[160] @ 5120
	.word	0419f91b6h		; b[161] @ 5152
	.word	041b54811h		; b[162] @ 5184
	.word	0c2a0f0dfh		; b[163] @ 5216
	.word	042a08998h		; b[164] @ 5248
	.word	0c2722d80h		; b[165] @ 5280
	.word	042239685h		; b[166] @ 5312
	.word	042857107h		; b[167] @ 5344
	.word	041fc564eh		; b[168] @ 5376
	.word	04272439bh		; b[169] @ 5408
	.word	0c27d1f7eh		; b[170] @ 5440
	.word	041d17b8ch		; b[171] @ 5472
	.word	0c1c53359h		; b[172] @ 5504
	.word	0c12bdd89h		; b[173] @ 5536
	.word	042980fa8h		; b[174] @ 5568
	.word	0429321aeh		; b[175] @ 5600
	.word	04244e286h		; b[176] @ 5632
	.word	042925e11h		; b[177] @ 5664
	.word	0c2033509h		; b[178] @ 5696
	.word	041f0beebh		; b[179] @ 5728
	.word	0c2829bb0h		; b[180] @ 5760
	.word	0409982ffh		; b[181] @ 5792
	.word	0428057fdh		; b[182] @ 5824
	.word	04267807bh		; b[183] @ 5856
	.word	0425f28bch		; b[184] @ 5888
	.word	041a491c9h		; b[185] @ 5920
	.word	0c20f7a13h		; b[186] @ 5952
	.word	042877c72h		; b[187] @ 5984
	.word	0c1959ce3h		; b[188] @ 6016
	.word	042c54d4ch		; b[189] @ 6048
	.word	040d6f915h		; b[190] @ 6080
	.word	0c2b5d831h		; b[191] @ 6112
	.word	041c68c81h		; b[192] @ 6144
	.word	0c211d454h		; b[193] @ 6176
	.word	0429a4f9eh		; b[194] @ 6208
	.word	0c1b96ba4h		; b[195] @ 6240
	.word	042236af1h		; b[196] @ 6272
	.word	042a4701dh		; b[197] @ 6304
	.word	040158158h		; b[198] @ 6336
	.word	041386e65h		; b[199] @ 6368
	.word	041f85132h		; b[200] @ 6400

;	C:\MATHLIB_Tools\CCSV5_5_0\ccsv5\tools\compiler\c6000_7.4.2\bin\opt6x.exe C:\\Users\\gtbldadm\\AppData\\Local\\Temp\\023245 C:\\Users\\gtbldadm\\AppData\\Local\\Temp\\023247 
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
;*   Local Frame Size  : 8 Args + 88 Auto + 56 Save = 152 byte                *
;******************************************************************************
main:
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 12
           STW     .D2T1   A11,*SP--(8)      ; |135| 
           STW     .D2T1   A10,*SP--(8)      ; |135| 
           STDW    .D2T2   B13:B12,*SP--     ; |135| 
           STDW    .D2T2   B11:B10,*SP--     ; |135| 
           STDW    .D2T1   A15:A14,*SP--     ; |135| 

           STDW    .D2T1   A13:A12,*SP--     ; |135| 
||         MVKL    .S1     $C$SL1+0,A4

           STW     .D2T2   B3,*SP--(104)     ; |135| 
||         CALLP   .S2     driver_init,B3
||         MVKH    .S1     $C$SL1+0,A4

$C$RL0:    ; CALL OCCURS {driver_init} {0}   ; |144| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 4

           MVKL    .S2     b,B10
||         MVKL    .S1     a,A12

           MVK     .S1     0xc9,A11
||         MVKL    .S2     output,B12

           MVKH    .S2     b,B10
||         MVKH    .S1     a,A12

           CALL    .S1     atan2f            ; |153| 
||         MV      .L2     B10,B13
||         MV      .L1     A12,A13
||         MVKH    .S2     output,B12
||         ZERO    .D2     B11

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L1:    
;          EXCLUSIVE CPU CYCLES: 5

           LDW     .D1T1   *A13++,A4         ; |153| 
||         LDW     .D2T2   *B13++,B4         ; |153| 

           ADDKPC  .S2     $C$RL1,B3,3       ; |153| 
$C$RL1:    ; CALL OCCURS {atan2f} {0}        ; |153| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 7

           LDW     .D2T2   *B12,B4           ; |153| 
||         SUB     .L1     A11,1,A0          ; |152| 
||         SUB     .S1     A11,1,A11         ; |152| 

   [ A0]   BNOP    .S1     $C$L1,3           ; |152| 

           ADD     .L2     B11,B4,B4         ; |153| 
||         ADD     .S2     4,B11,B11         ; |152| 

   [ A0]   CALL    .S1     atan2f            ; |153| 
||         STW     .D2T1   A4,*B4            ; |153| 
|| [!A0]   ADD     .L2     4,B12,B4

           ; BRANCHCC OCCURS {$C$L1}         ; |152| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 1

           CALL    .S2     atan2sp           ; |156| 
||         ZERO    .L2     B11
||         MV      .L1X    B10,A11
||         MV      .D1     A12,A10
||         MVK     .S1     0xc9,A13
||         STW     .D2T2   B4,*+SP(72)

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L2:    
;          EXCLUSIVE CPU CYCLES: 5

           LDW     .D1T1   *A12++,A4         ; |156| 
||         LDW     .D2T2   *B10++,B4         ; |156| 

           ADDKPC  .S2     $C$RL2,B3,3       ; |156| 
$C$RL2:    ; CALL OCCURS {atan2sp} {0}       ; |156| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 12
           LDW     .D2T2   *+SP(72),B4       ; |156| 
           SUB     .L1     A13,1,A0          ; |155| 
           SUB     .L1     A13,1,A13         ; |155| 
           NOP             2
           LDW     .D2T2   *B4,B4            ; |156| 
   [ A0]   BNOP    .S1     $C$L2,3           ; |155| 

           ADD     .L2     B11,B4,B4         ; |156| 
||         ADD     .S2     4,B11,B11         ; |155| 

   [ A0]   CALL    .S1     atan2sp           ; |156| 
||         STW     .D2T1   A4,*B4            ; |156| 

           ; BRANCHCC OCCURS {$C$L2}         ; |155| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 7
           LDW     .D2T2   *+SP(72),B4
           MV      .L2X    A11,B11
           MV      .L1     A10,A13
           MVK     .S1     0xc9,A12
           ZERO    .L2     B10
           ADD     .L2     4,B4,B4

           STW     .D2T2   B4,*+SP(76)
||         CALL    .S1     atan2sp_c         ; |159| 

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L3:    
;          EXCLUSIVE CPU CYCLES: 5

           LDW     .D1T1   *A13++,A4         ; |159| 
||         LDW     .D2T2   *B11++,B4         ; |159| 

           ADDKPC  .S2     $C$RL3,B3,3       ; |159| 
$C$RL3:    ; CALL OCCURS {atan2sp_c} {0}     ; |159| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 12

           LDW     .D2T2   *+SP(76),B4       ; |159| 
||         SUB     .L1     A12,1,A0          ; |158| 

           SUB     .L1     A12,1,A12         ; |158| 
   [!A0]   MVKL    .S1     0x3b16d624,A3
   [!A0]   MVKL    .S2     0x3e4cb0c1,B20
   [!A0]   LDW     .D2T2   *+SP(76),B8
           LDW     .D2T2   *B4,B4            ; |159| 
   [ A0]   BNOP    .S1     $C$L3,3           ; |158| 

           ADD     .L2     B10,B4,B4         ; |159| 
||         ADD     .S2     4,B10,B10         ; |158| 

   [ A0]   CALL    .S2     atan2sp_c         ; |159| 
||         STW     .D2T1   A4,*B4            ; |159| 
|| [!A0]   MVKL    .S1     0xbeaaaa23,A4

           ; BRANCHCC OCCURS {$C$L3}         ; |158| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 17

           MVKL    .S2     0xbc647bb5,B4
||         MVKL    .S1     0xbd942fbf,A5
||         ZERO    .L1     A16
||         ADD     .L2     4,B8,B11
||         MV      .D2X    A10,B16
||         ZERO    .D1     A19               ; |111| 

           MVKL    .S2     0x40490fdb,B7
||         MVKL    .S1     0xff7fffff,A15
||         LDW     .D2T2   *B11,B18
||         MV      .L2X    A11,B17

           MVKL    .S2     0x3fc90fdb,B9
||         MVKL    .S1     0xbfc90fdb,A6

           MVKL    .S2     0x7f7fffff,B13
||         MVKH    .S1     0x3b16d624,A3

           MVKL    .S2     0xbe11271d,B6
||         MVKH    .S1     0xbd942fbf,A5
||         STW     .D2T1   A3,*+SP(24)

           MVKL    .S2     0x3dd77af5,B5
||         MVKH    .S1     0xff7fffff,A15
||         MV      .L2X    A3,B22
||         STW     .D2T1   A5,*+SP(12)

           MVKH    .S2     0x3e4cb0c1,B20
||         MVKH    .S1     0xbfc90fdb,A6
||         MV      .L2X    A5,B24

           MVKH    .S2     0xbc647bb5,B4
||         SET     .S1     A16,0x1e,0x1e,A17
||         STW     .D2T1   A6,*+SP(56)

           MVKH    .S2     0x40490fdb,B7
||         MVKH    .S1     0xbeaaaa23,A4
||         MV      .L1X    B20,A3
||         STW     .D2T2   B4,*+SP(20)

           MVKH    .S2     0x3fc90fdb,B9
||         MV      .L1X    B20,A17
||         STW     .D2T1   A3,*+SP(32)
||         ZERO    .S1     A3                ; |111| 
||         MV      .L2X    A17,B25

           MVKH    .S2     0x7f7fffff,B13
||         MV      .L1X    B4,A18
||         STW     .D2T2   B7,*+SP(48)
||         MV      .L2X    A6,B20

           MVKH    .S2     0xbe11271d,B6
||         MV      .L1X    B7,A7
||         STW     .D2T2   B9,*+SP(44)
||         MV      .L2X    A4,B21

           MVKH    .S2     0x3dd77af5,B5
||         MV      .L1X    B9,A8
||         STW     .D2T2   B13,*+SP(52)

           MVKL    .S2     0x3d21435c,B19
||         MV      .L1X    B6,A16
||         STW     .D2T2   B6,*+SP(36)

           MVKH    .S2     0x3d21435c,B19
||         MV      .L1X    B13,A6
||         STW     .D2T2   B5,*+SP(40)

           MV      .L1X    B5,A9
||         STW     .D2T2   B19,*+SP(16)
||         MVK     .S2     0xc9,B1
||         MV      .L2     B19,B23

           STW     .D2T1   A4,*+SP(28)
||         MV      .L2X    A15,B19
||         DINT                              ; interrupts off

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*
;*      Loop found in file               : C:/nightlybuilds/mathlib/ti/mathlib/src/atan2sp/atan2sp_d.c
;*      Loop source line                 : 161
;*      Loop opening brace source line   : 161
;*      Loop closing brace source line   : 163
;*      Known Minimum Trip Count         : 201                    
;*      Known Maximum Trip Count         : 201                    
;*      Known Max Trip Count Factor      : 201
;*      Loop Carried Dependency Bound(^) : 86
;*      Unpartitioned Resource Bound     : 10
;*      Partitioned Resource Bound(*)    : 16
;*      Resource Partition:
;*                                A-side   B-side
;*      .L units                     0        0     
;*      .S units                     7        6     
;*      .D units                     0        3     
;*      .M units                     4       16*    
;*      .X cross paths              11        8     
;*      .T address paths             0        3     
;*      Long read paths              0        0     
;*      Long write paths             0        0     
;*      Logical  ops (.LS)           3        9     (.L or .S unit)
;*      Addition ops (.LSD)         12       14     (.L or .S or .D unit)
;*      Bound(.L .S .LS)             5        8     
;*      Bound(.L .S .D .LS .LSD)     8       11     
;*
;*      Searching for software pipeline schedule at ...
;*         ii = 86 Did not find schedule
;*         ii = 87 Did not find schedule
;*         ii = 89 Schedule found with 1 iterations in parallel
;*
;*      Register Usage Table:
;*          +-----------------------------------------------------------------+
;*          |AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA|BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB|
;*          |00000000001111111111222222222233|00000000001111111111222222222233|
;*          |01234567890123456789012345678901|01234567890123456789012345678901|
;*          |--------------------------------+--------------------------------|
;*       0: |   * *****      ****            | *       *      **********      |
;*       1: |   * *****      ****            | *       *      **********      |
;*       2: |   * *****      ****            | *       *      **********      |
;*       3: |   * *****      ****            | *       *      **********      |
;*       4: |   * *****      ****            | *       *      **********      |
;*       5: |   * *****      ****            | *    *  *      **********      |
;*       6: |   * *****      ****            | *   *** *      **********      |
;*       7: |   * *****      ****            | *  **** *      **********      |
;*       8: |   * *****      ****            |**   **  *      **********      |
;*       9: |   * *****      *****           |**  ***  *      ***********     |
;*      10: |   * *****      *****           |**  *** **      ***********     |
;*      11: |   * *****      *****           |**  *** **      ***********     |
;*      12: |   * *****      *****           |**  *** **      ***********     |
;*      13: |   * *****      *****           |**  *** **      ***********     |
;*      14: |   * *****      *****           |**  ******      ***********     |
;*      15: |   * *****      *****           |**  *** **      ***********     |
;*      16: |   * *****      *****           |**  *** **      ***********     |
;*      17: |   * *****      *****           |**  *** **      ***********     |
;*      18: |   * *****      *****           |**  ******      ***********     |
;*      19: |   * *****      *****           |**  ***  *      ***********     |
;*      20: |   * *****      *****           |**  ***  *      ***********     |
;*      21: |   * *****      *****           |**  ***  *      ***********     |
;*      22: |   * *****      *****           |**  **** *      ***********     |
;*      23: |   * *****      *****           |**  * ** *      ***********     |
;*      24: |   * *****      *****           |**  * ** *      ***********     |
;*      25: |   * *****      *****           |**  * ** *      ***********     |
;*      26: |   * *****      *****           |**  **** *      ***********     |
;*      27: |   * *****      *****           |**  * ** *      ***********     |
;*      28: |   * *****      *****           |**  * ** *      ***********     |
;*      29: |   * *****      *****           |**  * ** *      ***********     |
;*      30: |   * *****      *****           |**  **** *      ***********     |
;*      31: |   * *****      *****           |**  * *  *      ***********     |
;*      32: |   * *****      *****           |**  * *  *      ***********     |
;*      33: |   * *****      *****           |**  * *  *      ***********     |
;*      34: | * * *****      *****           |**  * *  *      ************    |
;*      35: | * * *****      *****           |**       *      ************    |
;*      36: | * * *****      *****           |**       *      ************    |
;*      37: | * * *****      *****           |**       *      ************    |
;*      38: | * * *****      *****           |**      **      ************    |
;*      39: | * * *****      *****           |**      **      ************    |
;*      40: | * * *****      *****           |**      **      ************    |
;*      41: | * * *****      *****           |**      **      ************    |
;*      42: | * * *****      *****           |**   *  **      ************    |
;*      43: | * * *****      *****           |**   *  **      ************    |
;*      44: | * * *****      *****           |**   *  **      ************    |
;*      45: | * * *****      *****           |**   *  **      ************    |
;*      46: | * * *****      *****           |**  **  **      ************    |
;*      47: | * * *****      *****           |**  **  **      ************    |
;*      48: | * * *****      *****           |**  **  **      ************    |
;*      49: | * *******      *****           |**  **  **      ************    |
;*      50: | * *******      *****           |**  *** **      ************    |
;*      51: | * * *****      *****           |**  *** **      ************    |
;*      52: | * * *****      *****           |**  ******      ************    |
;*      53: | * * *****      *****           |**  * ****      ************    |
;*      54: | * * *****      *****           |**  ** ***      ************    |
;*      55: | * * *****      ***** *         |**      **      ************    |
;*      56: | * *******      ***** *         |**   *  **      ************    |
;*      57: | * *******      *******         |**  **  **      ************    |
;*      58: | * * *****      *****           |**  **  **      ************    |
;*      59: | * * *****      *****           |**      **      ************    |
;*      60: | * * *****      *****           |**      **      ************    |
;*      61: | * *******      ******          |**  *   **      ************    |
;*      62: | * * *****      *****           |**  **  **      ************    |
;*      63: | * * *****      *****           |**      **      ************    |
;*      64: | * * *****      *****           |**      **      ************    |
;*      65: | * *******      *****           |**      **      ************    |
;*      66: | * *******      *****           |**  *   **      ************    |
;*      67: | * * *****      *****           |**      **      ************    |
;*      68: | * * *****      *****           |**      **      ************    |
;*      69: | * * *****      *****           |**      **      ************    |
;*      70: | * * *****      *****           |**  *   **      ************    |
;*      71: | * * *****      *****           |**      **      ************    |
;*      72: | * * *****      *****           |**      **      ************    |
;*      73: | * * *****      *****           |**      **      ************    |
;*      74: | *** *****      *****           | *  *   **      ************    |
;*      75: |**** *****      ****            | *      **      ************    |
;*      76: | *********      *****           | *      **      ************    |
;*      77: |  ********      ****            | *      **      ************    |
;*      78: |  ********      ****            | *  *   **      ************    |
;*      79: |  ********      ****            | *  *   **      ************    |
;*      80: |   *******      ****            | *      **      ************    |
;*      81: |   *******      *****           | *      **      ************    |
;*      82: |   *******      ******          | *  *   **      **********      |
;*      83: |*  *******      *****           | *  *   **      **********      |
;*      84: |*  *******      ****            | *    * **      **********      |
;*      85: |*  *******      ****            | *   ** **      **********      |
;*      86: |   *******      ****            |**  ***  *      **********      |
;*      87: |   *******      ****            | *  **** *      **********      |
;*      88: |                                |                                |
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
;*      Total cycles (est.)         : -1 + min_trip_cnt * 89 = 17888        
;*----------------------------------------------------------------------------*
;*        SINGLE SCHEDULED ITERATION
;*
;*        $C$C219:
;*   0              LDW     .D2T2   *B16++,B6         ; |162|  ^ 
;*   1              LDW     .D2T2   *B17++,B5         ; |162|  ^ 
;*   2              NOP             3
;*   5              ABSSP   .S2     B6,B7             ; |136|  ^ 
;*   6              ABSSP   .S2     B5,B4             ; |136|  ^ 
;*   7              CMPGTSP .S2     B7,B4,B0          ; |136|  ^ 
;*   8              MV      .L2     B5,B26            ; |131| 
;*     ||           MV      .S2     B5,B4             ; |131| 
;*     ||           CMPLTSP .S1X    B5,A3,A20         ; |133| 
;*     ||   [ B0]   MV      .D2     B6,B5             ; |138|  ^ 
;*   9              RCPSP   .S2     B5,B8             ; |99|  ^ 
;*  10              MPYSP   .M2     B5,B8,B7          ; |99|  ^ 
;*  11              NOP             3
;*  14              SUBSP   .L2     B25,B7,B7         ; |99|  ^ 
;*  15              NOP             3
;*  18              MPYSP   .M2     B8,B7,B7          ; |99|  ^ 
;*  19              NOP             3
;*  22              MPYSP   .M2     B5,B7,B5          ; |99|  ^ 
;*  23              NOP             3
;*  26              SUBSP   .L2     B25,B5,B5         ; |99|  ^ 
;*  27              NOP             3
;*  30              MPYSP   .M2     B7,B5,B4          ; |99|  ^ 
;*  31              NOP             2
;*  33              MV      .L2     B6,B27            ; |130| 
;*     ||           CMPLTSP .S1X    B6,A3,A1          ; |132| 
;*     ||   [ B0]   MV      .S2     B4,B6             ; |139| 
;*  34              MPYSP   .M2     B6,B4,B8          ; |99|  ^ 
;*  35              NOP             3
;*  38              MPYSP   .M2     B8,B8,B5          ; |99|  ^ 
;*  39              NOP             3
;*  42              MPYSP   .M2     B5,B5,B4          ; |99|  ^ 
;*  43              NOP             2
;*  45              MPYSP   .M1X    A18,B5,A4         ; |108| 
;*  46              MPYSP   .M2     B22,B4,B6         ; |108|  ^ 
;*  47              MPYSP   .M2     B4,B5,B6          ; |108| 
;*  48              MPYSP   .M2     B4,B4,B7          ; |108| 
;*  49              NOP             1
;*  50              ADDSP   .L2X    A4,B6,B5          ; |108|  ^ 
;*  51              MPYSP   .M1X    A17,B4,A22        ; |108| 
;*  52              MPYSP   .M1X    A16,B6,A4         ; |108| 
;*     ||           MPYSP   .M2     B21,B5,B5         ; |108| 
;*  53              MPYSP   .M1X    A9,B7,A21         ; |108| 
;*     ||           MPYSP   .M2     B4,B6,B4          ; |108| 
;*  54              ADDSP   .L2     B23,B5,B5         ; |108|  ^ 
;*     ||           MPYSP   .M2     B4,B7,B4          ; |108| 
;*  55              NOP             2
;*  57              ADDSP   .L1     A4,A21,A4         ; |108| 
;*     ||           ADDSP   .S1X    B5,A22,A21        ; |108| 
;*     ||           MPYSP   .M2     B24,B4,B4         ; |108| 
;*  58              MPYSP   .M2     B4,B5,B5          ; |108|  ^ 
;*  59              NOP             2
;*  61              ADDSP   .L1     A21,A4,A4         ; |108| 
;*  62              ADDSP   .L2     B4,B5,B4          ; |108|  ^ 
;*  63              NOP             3
;*  66              ADDSP   .L2X    B4,A4,B4          ; |108|  ^ 
;*  67              NOP             3
;*  70              MPYSP   .M2     B8,B4,B4          ; |108|  ^ 
;*  71              NOP             2
;*  73      [!B0]   ZERO    .L1     A2                ; |128| 
;*     ||   [ B0]   MVK     .S1     0x1,A2            ; |140| 
;*  74              ADDSP   .L2     B8,B4,B4          ; |108|  ^ 
;*     ||   [!A2]   MV      .S1     A7,A5             ; |111| 
;*     ||   [ A2]   MV      .D1     A8,A5             ; |111| 
;*     ||           OR      .L1     A20,A2,A0         ; |111| 
;*  75      [ A0]   MV      .L1     A5,A4             ; |111| 
;*     ||   [!A0]   MV      .D1     A3,A4             ; |111| 
;*     ||           SET     .S1     A19,31,31,A20     ; |111| 
;*  76      [ A1]   XOR     .L1     A4,A20,A4         ; |111| 
;*  77              NOP             1
;*  78      [ A2]   SUBSP   .L2X    A4,B4,B9          ; |111|  ^ 
;*  79      [!A2]   ADDSP   .L2X    B4,A4,B9          ; |111|  ^ 
;*  80              CMPLTSP .S1X    B26,A3,A20        ; |111| 
;*  81              CMPEQSP .S1X    B27,A3,A20        ; |111| 
;*     ||           XOR     .L1     1,A20,A21         ; |111| 
;*     ||           CMPLTSP .S2X    B26,A3,B4         ; |111| 
;*     ||   [ B1]   SUB     .D2     B1,1,B1           ; |161| 
;*  82              AND     .L1     A20,A21,A0        ; |111| 
;*     ||   [ B1]   B       .S1     $C$C219           ; |161| 
;*  83      [!A0]   MV      .S2     B9,B6             ; |111|  ^ 
;*     ||   [ A0]   MV      .L2X    A3,B6             ; |111| 
;*     ||           AND     .L1X    A20,B4,A0         ; |111| 
;*  84      [!A0]   MV      .S2     B6,B5             ; |111|  ^ 
;*     ||   [ A0]   MV      .L2X    A7,B5             ; |111| 
;*     ||           CMPGTSP .S1X    B8,A6,A0          ; |111| 
;*  85      [!A0]   MV      .D2     B5,B4             ; |111|  ^ 
;*     ||   [ A0]   MV      .L2X    A8,B4             ; |111| 
;*     ||           CMPLTSP .S2     B8,B19,B0         ; |111| 
;*  86      [!B0]   MV      .S2     B4,B7             ; |111|  ^ 
;*     ||   [ B0]   MV      .L2     B20,B7            ; |111| 
;*  87              STW     .D2T2   B7,*B18++         ; |111|  ^ 
;*  88              ; BRANCHCC OCCURS {$C$C219}       ; |161| 
;*----------------------------------------------------------------------------*
$C$L4:    ; PIPED LOOP PROLOG
;** --------------------------------------------------------------------------*
$C$L5:    ; PIPED LOOP KERNEL
;          EXCLUSIVE CPU CYCLES: 89
           LDW     .D2T2   *B16++,B6         ; |162| <0,0>  ^ 
           LDW     .D2T2   *B17++,B5         ; |162| <0,1>  ^ 
           NOP             3
           ABSSP   .S2     B6,B7             ; |136| <0,5>  ^ 
           ABSSP   .S2     B5,B4             ; |136| <0,6>  ^ 
           CMPGTSP .S2     B7,B4,B0          ; |136| <0,7>  ^ 

           MV      .L2     B5,B26            ; |131| <0,8> 
||         MV      .S2     B5,B4             ; |131| <0,8> 
||         CMPLTSP .S1X    B5,A3,A20         ; |133| <0,8> 
|| [ B0]   MV      .D2     B6,B5             ; |138| <0,8>  ^ 

           RCPSP   .S2     B5,B8             ; |99| <0,9>  ^ 
           MPYSP   .M2     B5,B8,B7          ; |99| <0,10>  ^ 
           NOP             3
           SUBSP   .L2     B25,B7,B7         ; |99| <0,14>  ^ 
           NOP             3
           MPYSP   .M2     B8,B7,B7          ; |99| <0,18>  ^ 
           NOP             3
           MPYSP   .M2     B5,B7,B5          ; |99| <0,22>  ^ 
           NOP             3
           SUBSP   .L2     B25,B5,B5         ; |99| <0,26>  ^ 
           NOP             3
           MPYSP   .M2     B7,B5,B4          ; |99| <0,30>  ^ 
           NOP             2

           MV      .L2     B6,B27            ; |130| <0,33> 
||         CMPLTSP .S1X    B6,A3,A1          ; |132| <0,33> 
|| [ B0]   MV      .S2     B4,B6             ; |139| <0,33> 

           MPYSP   .M2     B6,B4,B8          ; |99| <0,34>  ^ 
           NOP             3
           MPYSP   .M2     B8,B8,B5          ; |99| <0,38>  ^ 
           NOP             3
           MPYSP   .M2     B5,B5,B4          ; |99| <0,42>  ^ 
           NOP             2
           MPYSP   .M1X    A18,B5,A4         ; |108| <0,45> 
           MPYSP   .M2     B22,B4,B6         ; |108| <0,46>  ^ 
           MPYSP   .M2     B4,B5,B6          ; |108| <0,47> 
           MPYSP   .M2     B4,B4,B7          ; |108| <0,48> 
           NOP             1
           ADDSP   .L2X    A4,B6,B5          ; |108| <0,50>  ^ 
           MPYSP   .M1X    A17,B4,A22        ; |108| <0,51> 

           MPYSP   .M2     B21,B5,B5         ; |108| <0,52> 
||         MPYSP   .M1X    A16,B6,A4         ; |108| <0,52> 

           MPYSP   .M2     B4,B6,B4          ; |108| <0,53> 
||         MPYSP   .M1X    A9,B7,A21         ; |108| <0,53> 

           MPYSP   .M2     B4,B7,B4          ; |108| <0,54> 
||         ADDSP   .L2     B23,B5,B5         ; |108| <0,54>  ^ 

           NOP             2

           ADDSP   .S1X    B5,A22,A21        ; |108| <0,57> 
||         MPYSP   .M2     B24,B4,B4         ; |108| <0,57> 
||         ADDSP   .L1     A4,A21,A4         ; |108| <0,57> 

           MPYSP   .M2     B4,B5,B5          ; |108| <0,58>  ^ 
           NOP             2
           ADDSP   .L1     A21,A4,A4         ; |108| <0,61> 
           ADDSP   .L2     B4,B5,B4          ; |108| <0,62>  ^ 
           NOP             3
           ADDSP   .L2X    B4,A4,B4          ; |108| <0,66>  ^ 
           NOP             3
           MPYSP   .M2     B8,B4,B4          ; |108| <0,70>  ^ 
           NOP             2

   [!B0]   ZERO    .L1     A2                ; |128| <0,73> 
|| [ B0]   MVK     .S1     0x1,A2            ; |140| <0,73> 

           OR      .L1     A20,A2,A0         ; |111| <0,74> 
|| [!A2]   MV      .S1     A7,A5             ; |111| <0,74> 
|| [ A2]   MV      .D1     A8,A5             ; |111| <0,74> 
||         ADDSP   .L2     B8,B4,B4          ; |108| <0,74>  ^ 

           SET     .S1     A19,31,31,A20     ; |111| <0,75> 
|| [ A0]   MV      .L1     A5,A4             ; |111| <0,75> 
|| [!A0]   MV      .D1     A3,A4             ; |111| <0,75> 

   [ A1]   XOR     .L1     A4,A20,A4         ; |111| <0,76> 
           NOP             1
   [ A2]   SUBSP   .L2X    A4,B4,B9          ; |111| <0,78>  ^ 
   [!A2]   ADDSP   .L2X    B4,A4,B9          ; |111| <0,79>  ^ 
           CMPLTSP .S1X    B26,A3,A20        ; |111| <0,80> 

   [ B1]   SUB     .D2     B1,1,B1           ; |161| <0,81> 
||         CMPLTSP .S2X    B26,A3,B4         ; |111| <0,81> 
||         CMPEQSP .S1X    B27,A3,A20        ; |111| <0,81> 
||         XOR     .L1     1,A20,A21         ; |111| <0,81> 

   [ B1]   B       .S1     $C$L5             ; |161| <0,82> 
||         AND     .L1     A20,A21,A0        ; |111| <0,82> 

           AND     .L1X    A20,B4,A0         ; |111| <0,83> 
|| [ A0]   MV      .L2X    A3,B6             ; |111| <0,83> 
|| [!A0]   MV      .S2     B9,B6             ; |111| <0,83>  ^ 

   [ A0]   MV      .L2X    A7,B5             ; |111| <0,84> 
||         CMPGTSP .S1X    B8,A6,A0          ; |111| <0,84> 
|| [!A0]   MV      .S2     B6,B5             ; |111| <0,84>  ^ 

           CMPLTSP .S2     B8,B19,B0         ; |111| <0,85> 
|| [ A0]   MV      .L2X    A8,B4             ; |111| <0,85> 
|| [!A0]   MV      .D2     B5,B4             ; |111| <0,85>  ^ 

   [ B0]   MV      .L2     B20,B7            ; |111| <0,86> 
|| [!B0]   MV      .S2     B4,B7             ; |111| <0,86>  ^ 

           STW     .D2T2   B7,*B18++         ; |111| <0,87>  ^ 
           NOP             1
;** --------------------------------------------------------------------------*
$C$L6:    ; PIPED LOOP EPILOG
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 18
           STW     .D2T1   A6,*+SP(52)
           STW     .D2T2   B22,*+SP(24)
           STW     .D2T2   B21,*+SP(28)
           STW     .D2T2   B20,*+SP(56)
           STW     .D2T1   A18,*+SP(20)
           STW     .D2T1   A17,*+SP(32)
           STW     .D2T1   A16,*+SP(36)
           STW     .D2T1   A9,*+SP(40)
           STW     .D2T1   A8,*+SP(44)
           STW     .D2T1   A7,*+SP(48)

           STW     .D2T2   B23,*+SP(16)
||         MVK     .S2     0xc9,B6           ; |164| 

           RINT                              ; interrupts on
||         MV      .L1X    B19,A15
||         STW     .D2T2   B24,*+SP(12)
||         MV      .L2X    A11,B4            ; |164| 

           CALLP   .S2     atan2sp_v,B3
||         LDW     .D2T1   *+B12(16),A6      ; |164| 
||         MV      .L1     A10,A4            ; |164| 
||         MV      .L2X    A3,B10
||         MV      .S1X    B25,A14

$C$RL4:    ; CALL OCCURS {atan2sp_v} {0}     ; |164| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 46
           MVKL    .S2     0x3eb0c6f7,B7
           MVKL    .S2     0xa0b5ed8d,B6
           MVKH    .S2     0x3eb0c6f7,B7

           LDW     .D2T2   *+B12(4),B4       ; |66| 
||         MVKH    .S2     0xa0b5ed8d,B6

           CALLP   .S2     isequal,B3
||         LDW     .D2T1   *B12,A4           ; |66| 
||         MVK     .S1     0xc9,A6           ; |66| 
||         MVK     .L1     0x1,A8            ; |66| 

$C$RL5:    ; CALL OCCURS {isequal} {0}       ; |66| 
           MVKL    .S2     fcn_pass,B5
           MVKL    .S2     0x3eb0c6f7,B7
           MVKH    .S2     fcn_pass,B5
           MVKL    .S2     0xa0b5ed8d,B6

           LDW     .D2T2   *+B12(8),B4       ; |67| 
||         MVKH    .S2     0x3eb0c6f7,B7

           STW     .D2T1   A4,*+B5(4)        ; |66| 
||         MVKH    .S2     0xa0b5ed8d,B6

           CALLP   .S2     isequal,B3
||         LDW     .D2T1   *B12,A4           ; |67| 
||         MVK     .S1     0xc9,A6           ; |67| 
||         MVK     .L1     0x1,A8            ; |67| 

$C$RL6:    ; CALL OCCURS {isequal} {0}       ; |67| 
           MVKL    .S2     fcn_pass,B5
           MVKL    .S2     0x3eb0c6f7,B7
           MVKL    .S2     0xa0b5ed8d,B6
           MVKH    .S2     fcn_pass,B5

           LDW     .D2T2   *+B12(12),B4      ; |68| 
||         MVKH    .S2     0x3eb0c6f7,B7

           MV      .L2     B12,B8
||         STW     .D2T1   A4,*+B5(8)        ; |67| 
||         MVKH    .S2     0xa0b5ed8d,B6

           CALLP   .S2     isequal,B3
||         LDW     .D2T1   *B8,A4            ; |68| 
||         MVK     .S1     0xc9,A6           ; |68| 
||         MVK     .L1     0x1,A8            ; |68| 

$C$RL7:    ; CALL OCCURS {isequal} {0}       ; |68| 
           MVKL    .S2     fcn_pass,B4
           MVKL    .S2     0xa0b5ed8d,B6
           MVKL    .S2     0x3eb0c6f7,B7
           MVKH    .S2     fcn_pass,B4

           ADD     .L1X    4,B11,A3
||         STW     .D2T1   A4,*+B4(12)       ; |68| 
||         MVKH    .S2     0xa0b5ed8d,B6

           STW     .D2T1   A3,*+SP(64)
||         MVKH    .S2     0x3eb0c6f7,B7

           CALLP   .S2     isequal,B3
||         LDW     .D2T1   *B12,A4           ; |69| 
||         LDW     .D1T2   *A3,B4            ; |69| 
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
           STW     .D2T2   B4,*+SP(80)       ; |69| 
           STW     .D2T1   A3,*+SP(68)

   [!A0]   B       .S1     $C$L7             ; |72| 
|| [ A0]   LDW     .D2T2   *B4,B0            ; |72| 

   [!A0]   CALL    .S1     print_test_results ; |168| 
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
           CALL    .S1     print_test_results ; |168| 
           MVKL    .S1     all_pass,A4
           MVKH    .S1     all_pass,A4
           NOP             2
;** --------------------------------------------------------------------------*
$C$L7:    
;          EXCLUSIVE CPU CYCLES: 1

           STW     .D1T1   A3,*A4            ; |72| 
||         MVK     .L1     0x1,A4            ; |168| 
||         ADDKPC  .S2     $C$RL9,B3,0       ; |168| 

$C$RL9:    ; CALL OCCURS {print_test_results} {0}  ; |168| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 10
           MVKL    .S2     b_sc,B16

           MVKL    .S2     0xff7fffff,B7
||         ZERO    .L2     B5

           MVKH    .S2     0xbf800000,B5

           MVKH    .S2     b_sc,B16
||         MVKL    .S1     a_sc,A3
||         ZERO    .L2     B4
||         ZERO    .L1     A5

           MVKH    .S1     0x80000000,A5
||         SET     .S2     B4,0x17,0x1d,B4

           STDW    .D2T2   B5:B4,*+B16(16)   ; |180| 
||         MVKH    .S1     a_sc,A3
||         MVKH    .S2     0xff7fffff,B7
||         ADD     .L2     1,B13,B8
||         MV      .L1X    B10,A4            ; |176| 

           STDW    .D2T1   A5:A4,*B16        ; |176| 
||         ADD     .L2     1,B7,B9
||         MVK     .S2     0x5,B31           ; |182| 

           STDW    .D2T2   B9:B8,*+B16(8)    ; |178| 
||         MV      .L2X    A3,B17            ; |176| 

           MVK     .L2     0x6,B4            ; |183| 
||         STDW    .D2T2   B5:B4,*+B17(16)   ; |180| 
||         MV      .L1X    B31,A1            ; |182| 

           MVC     .S2     B4,RILC
||         MVK     .L2     5,B9              ; |183| 
||         STDW    .D2T2   B9:B8,*+B17(8)    ; |178| 
||         SUB     .L1     A1,1,A1           ; |182| 

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*
;*      Loop found in file               : C:/nightlybuilds/mathlib/ti/mathlib/src/atan2sp/atan2sp_d.c
;*      Loop source line                 : 183
;*      Loop opening brace source line   : 183
;*      Loop closing brace source line   : 187
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
;*       0: |   ****                         |     ***                        |
;*       1: |   *****                        |     ***                        |
;*       2: |*  ****                         |    ****                        |
;*       3: |   *****                        |     ***                        |
;*       4: |   *****                        |    ****                        |
;*       5: |   *****                        |     ***                        |
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
;*        $C$C166:
;*   0              ADD     .L1     A4,A3,A7          ; |185| 
;*   1              CMPLT   .L1     A7,6,A0           ; |185| 
;*   2      [!A0]   MVK     .S1     0xffffffe8,A7     ; |185| 
;*     ||   [ A0]   ZERO    .D1     A7                ; |185| 
;*   3              LDW     .D2T2   *B5++,B4          ; |184|  ^ 
;*     ||           ADD     .L1     A5,A7,A7          ; |185| 
;*   4              ADD     .L1     A6,A7,A7          ; |185| 
;*   5              LDW     .D1T2   *A7,B4            ; |185|  ^ 
;*     ||           ADD     .L1     1,A4,A4           ; |183| 
;*   6              NOP             2
;*   8              STW     .D2T2   B4,*B7++          ; |184|  ^ 
;*     ||           ADD     .L1     4,A5,A5           ; |183| 
;*   9              NOP             1
;*  10              STW     .D2T2   B4,*B6++          ; |185|  ^ 
;*     ||           SPBR            $C$C166
;*  11              NOP             1
;*  12              ; BRANCHCC OCCURS {$C$C166}       ; |183| 
;*----------------------------------------------------------------------------*
$C$L8:    ; PIPED LOOP PROLOG
;          EXCLUSIVE CPU CYCLES: 7

   [ A1]   SPLOOPD 6       ;12               ; SPRELOAD
||         MVK     .L1     0x1,A3            ; |182| 
||         STDW    .D2T1   A5:A4,*B17        ; |176| 
||         ZERO    .S1     A4                ; |183| 
||         MVC     .S2     B9,ILC

;** --------------------------------------------------------------------------*
$C$L9:    ; PIPED LOOP KERNEL
;          EXCLUSIVE CPU CYCLES: 6

           SPMASK          L2
||         MVK     .L2     0x4,B8
||         ADD     .L1     A4,A3,A7          ; |185| (P) <0,0> 

           SPMASK          S1,S2
||         MV      .S1X    B16,A10           ; |176| 
||         MVKL    .S2     a_sc,B5
||         CMPLT   .L1     A7,6,A0           ; |185| (P) <0,1> 

           SPMASK          L1,S2
||         MVKH    .S2     a_sc,B5
||         MV      .L1X    B8,A5
|| [ A0]   ZERO    .D1     A7                ; |185| (P) <0,2> 
|| [!A0]   MVK     .S1     0xffffffe8,A7     ; |185| (P) <0,2> 

           SPMASK          S1
||         MV      .S1     A10,A6
||         LDW     .D2T2   *B5++,B4          ; |184| (P) <0,3>  ^ 
||         ADD     .L1     A5,A7,A7          ; |185| (P) <0,3> 

           SPMASK          D2
||         ADD     .D2     B16,24,B6
||         ADD     .L1     A6,A7,A7          ; |185| (P) <0,4> 

           SPMASK          D2
||         ADD     .D2     B17,24,B7
||         ADD     .L1     1,A4,A4           ; |183| (P) <0,5> 
||         LDW     .D1T2   *A7,B4            ; |185| (P) <0,5>  ^ 

           NOP             2

           STW     .D2T2   B4,*B7++          ; |184| <0,8>  ^ 
||         ADD     .L1     4,A5,A5           ; |183| <0,8> 

           NOP             1

           SPKERNEL 0,0
||         STW     .D2T2   B4,*B6++          ; |185| <0,10>  ^ 

;** --------------------------------------------------------------------------*
$C$L10:    ; PIPED LOOP EPILOG AND PROLOG
;          EXCLUSIVE CPU CYCLES: 9
           NOP             2

           SPMASKR         ;$C$L10
||         ADD     .S1     1,A3,A3           ; |182| 
||         ZERO    .D1     A4                ; |183| 

           ADD     .L2     4,B8,B8           ; |182| 
|| [ A1]   B       .S2     $C$L10            ; |182| 

           MV      .S1     A6,A10
||         MVKL    .S2     a_sc,B5
||         SUB     .D1     A1,1,A1           ; |182| 

           MVKH    .S2     a_sc,B5
||         MV      .L1X    B8,A5

           MV      .S1     A10,A6
||         MVK     .L2     0x6,B4            ; |183| 

           NOP             2
           ; BRANCHCC OCCURS {$C$L10}        ; |182| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 6
           MVKL    .S1     a_sc,A3
           MVKH    .S1     a_sc,A3
           SUB     .L1     A3,4,A11
           SUB     .L1     A10,4,A13
           MVK     .S2     0x24,B4           ; |190| 

           ZERO    .L1     A12
||         STW     .D2T2   B4,*+SP(60)

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains control code
;*----------------------------------------------------------------------------*
$C$L11:    
;          EXCLUSIVE CPU CYCLES: 10
           LDW     .D1T1   *++A13,A3         ; |192| 
           LDW     .D1T1   *++A11,A4         ; |192| 
           NOP             2
           CALL    .S1     atan2             ; |192| 
           SPDP    .S1     A3,A7:A6          ; |192| 
           ADDKPC  .S2     $C$RL10,B3,0      ; |192| 
           SPDP    .S1     A4,A5:A4          ; |192| 
           MV      .L2X    A6,B4             ; |192| 
           MV      .L2X    A7,B5             ; |192| 
$C$RL10:   ; CALL OCCURS {atan2} {0}         ; |192| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 21
           MVKL    .S2     output,B4
           MVKH    .S2     output,B4
           LDW     .D2T2   *B4,B4            ; |192| 
           DPSP    .L1     A5:A4,A3          ; |192| 
           NOP             3
           ADD     .L1X    A12,B4,A4         ; |192| 
           STW     .D1T1   A3,*A4            ; |192| 
           LDW     .D1T1   *A13,A3           ; |193| 
           NOP             4
           CMPLTSP .S2X    A3,B10,B0         ; |193| 

   [!B0]   BNOP    .S1     $C$L12,1          ; |193| 
|| [ B0]   LDW     .D1T1   *A11,A4           ; |193| 

   [ B0]   CALL    .S1     atan2             ; |193| 
   [ B0]   SPDP    .S1     A3,A7:A6          ; |193| 
   [!B0]   CALL    .S2     atan2sp           ; |193| 

           SPDP    .S1     A4,A5:A4          ; |193| 
|| [!B0]   LDW     .D1T1   *A11,A4           ; |193| 

           ; BRANCHCC OCCURS {$C$L12}        ; |193| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 2
           MV      .L2X    A6,B4             ; |193| 

           MV      .L2X    A7,B5             ; |193| 
||         ADDKPC  .S2     $C$RL11,B3,0      ; |193| 

$C$RL11:   ; CALL OCCURS {atan2} {0}         ; |193| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 6

           B       .S2     $C$L13            ; |193| 
||         MVKL    .S1     output,A3

           MVKH    .S1     output,A3
           LDW     .D1T1   *+A3(4),A3        ; |193| 
           DPSP    .L1     A5:A4,A4          ; |193| 
           NOP             2
           ; BRANCH OCCURS {$C$L13}          ; |193| 
;** --------------------------------------------------------------------------*
$C$L12:    
;          EXCLUSIVE CPU CYCLES: 4
           MV      .L2X    A3,B4             ; |193| 
           ADDKPC  .S2     $C$RL12,B3,2      ; |193| 
$C$RL12:   ; CALL OCCURS {atan2sp} {0}       ; |193| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 8
           SPDP    .S1     A4,A5:A4          ; |193| 
           NOP             1
           MVKL    .S1     output,A3
           MVKH    .S1     output,A3
           LDW     .D1T1   *+A3(4),A3        ; |193| 
           DPSP    .L1     A5:A4,A4          ; |193| 
           NOP             2
;** --------------------------------------------------------------------------*
$C$L13:    
;          EXCLUSIVE CPU CYCLES: 9
           NOP             1
           ADD     .L1     A12,A3,A3         ; |193| 
           STW     .D1T1   A4,*A3            ; |193| 

           CALL    .S1     atan2sp_c         ; |194| 
||         LDW     .D1T1   *A11,A4           ; |194| 

           LDW     .D1T2   *A13,B4           ; |194| 
           ADDKPC  .S2     $C$RL13,B3,3      ; |194| 
$C$RL13:   ; CALL OCCURS {atan2sp_c} {0}     ; |194| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 101
           MVKL    .S1     output,A3
           MVKH    .S1     output,A3
           LDW     .D1T1   *+A3(8),A3        ; |194| 
           ZERO    .L2     B26               ; |94| 
           LDW     .D2T1   *+SP(24),A31
           LDW     .D2T2   *+SP(20),B6       ; |108| 
           LDW     .D2T2   *+SP(32),B31      ; |108| 
           ADD     .L1     A12,A3,A3         ; |194| 
           STW     .D1T1   A4,*A3            ; |194| 
           LDW     .D1T1   *A13,A4           ; |195| 
           LDW     .D1T1   *A11,A3           ; |195| 
           LDW     .D2T1   *+SP(28),A30      ; |108| 
           LDW     .D2T2   *+SP(40),B30      ; |108| 
           LDW     .D2T2   *+SP(36),B29      ; |108| 

           MV      .L1     A4,A5             ; |131| 
||         MV      .L2X    A4,B4             ; |131| 

           ABSSP   .S1     A5,A6             ; |136| 
           ABSSP   .S1     A3,A7             ; |136| 
           CMPGTSP .S1     A7,A6,A0          ; |136| 
   [ A0]   MV      .L1     A3,A4             ; |138| 
           RCPSP   .S1     A4,A6             ; |53| 
           MPYSP   .M1     A4,A6,A7          ; |53| 
           LDW     .D2T2   *+SP(16),B28      ; |108| 
           LDW     .D2T1   *+SP(12),A26      ; |108| 
           LDW     .D2T2   *+SP(52),B22      ; |149| 
           SUBSP   .L1     A14,A7,A7         ; |53| 
           CMPLTSP .S2     B4,B10,B27        ; |133| 
           MV      .L2X    A3,B5             ; |130| 
           CMPLTSP .S2     B4,B10,B24        ; |150| 
           MPYSP   .M1     A6,A7,A6          ; |53| 
   [ A0]   MV      .L1     A5,A3             ; |139| 
           CMPLTSP .S2     B4,B10,B25        ; |149| 
           LDW     .D2T2   *+SP(60),B4       ; |156| 
           MPYSP   .M1     A4,A6,A4          ; |53| 
           CMPLTSP .S2     B5,B10,B0         ; |132| 
           CMPEQSP .S2     B5,B10,B23        ; |149| 

   [ A0]   MVK     .L1     0x1,A0            ; |140| 
|| [!A0]   ZERO    .S1     A0                ; |128| 

           SUBSP   .L1     A14,A4,A4         ; |53| 
           SUB     .L2     B4,1,B21          ; |190| 
           SUB     .L1X    B4,1,A1           ; |190| 
           STW     .D2T2   B21,*+SP(60)      ; |195| 
           MPYSP   .M1     A6,A4,A4          ; |53| 
           NOP             3
           MPYSP   .M1     A3,A4,A4          ; |53| 
           NOP             3
           MPYSP   .M1     A4,A4,A7          ; |108| 
           CMPLTSP .S1     A4,A15,A2         ; |155| 
           NOP             2
           MPYSP   .M1     A7,A7,A6          ; |108| 
           MPYSP   .M2X    B6,A7,B6          ; |108| 
           NOP             2
           MPYSP   .M1     A31,A6,A3         ; |108| 
           MPYSP   .M1     A6,A6,A8          ; |108| 
           MPYSP   .M1     A6,A7,A5          ; |108| 
           MPYSP   .M2X    B31,A6,B9         ; |108| 
           NOP             1

           ADDSP   .L2X    B6,A3,B8          ; |108| 
||         MPYSP   .M1     A30,A7,A3         ; |108| 

           MPYSP   .M1     A6,A8,A29         ; |108| 
||         MPYSP   .M2X    B30,A8,B16        ; |108| 

           MPYSP   .M1     A6,A5,A28         ; |108| 
||         MPYSP   .M2X    B29,A5,B7         ; |108| 
||         MVKL    .S1     output+12,A5

           MVKH    .S1     output+12,A5

           ADDSP   .L2     B28,B8,B6         ; |108| 
||         ADDSP   .L1X    A3,B9,A27         ; |108| 

           LDW     .D1T1   *A5,A25           ; |195| 
           ADDSP   .L2     B7,B16,B7         ; |108| 
           MPYSP   .M1     A26,A28,A3        ; |108| 
           MPYSP   .M2X    A29,B6,B6         ; |108| 
           MV      .S2     B27,B8            ; |146| 
           OR      .L2X    B8,A0,B1          ; |90| 
           ADDSP   .L2X    A27,B7,B7         ; |108| 
           ADDSP   .L2X    A3,B6,B6          ; |108| 
   [!A0]   LDW     .D2T1   *+SP(48),A3       ; |83| 
   [ A0]   LDW     .D2T1   *+SP(44),A3       ; |195| 
           ADD     .L1     A12,A25,A24       ; |195| 
           ADDSP   .L2     B6,B7,B7          ; |108| 
           ADD     .L1     4,A12,A12         ; |196| 
   [!A0]   MV      .L2X    A3,B12            ; |83| 
   [ A0]   MV      .S2X    A3,B12            ; |83| 
           MPYSP   .M2X    A4,B7,B6          ; |108| 
   [!B1]   MV      .L2     B10,B12           ; |91| 
           CMPGTSP .S2X    A4,B22,B1         ; |152| 
           SET     .S2     B26,31,31,B7      ; |94| 
           ADDSP   .L2X    A4,B6,B6          ; |108| 
   [ B0]   XOR     .L2     B12,B7,B12        ; |94| 
           AND     .L2     B23,B24,B0        ; |150| 
           XOR     .S2     1,B25,B7          ; |149| 

   [!A0]   ADDSP   .L2     B6,B12,B13        ; |111| 
|| [ A0]   SUBSP   .S2     B12,B6,B13        ; |111| 

   [!A1]   MVK     .S2     12,B12
   [!A1]   SUB     .L2X    A5,B12,B12
           AND     .D2     B23,B7,B2         ; |149| 

   [ B2]   MV      .L2     B10,B13           ; |150| 
|| [ B0]   LDW     .D2T2   *+SP(48),B13      ; |150| 

   [ B1]   LDW     .D2T2   *+SP(44),B13      ; |150| 

   [ A1]   BNOP    .S1     $C$L11,4          ; |190| 
|| [ A2]   LDW     .D2T2   *+SP(56),B13      ; |153| 

   [!A1]   CALL    .S1     atan2sp_v         ; |199| 
||         STW     .D1T2   B13,*A24          ; |195| 

           ; BRANCHCC OCCURS {$C$L11}        ; |190| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           LDW     .D2T1   *+B12(16),A6      ; |199| 
           MVKL    .S1     a_sc,A4
           MVKH    .S1     a_sc,A4
           MVK     .S2     0x24,B6           ; |199| 

           MV      .L2X    A10,B4            ; |199| 
||         ADDKPC  .S2     $C$RL14,B3,0      ; |199| 

$C$RL14:   ; CALL OCCURS {atan2sp_v} {0}     ; |199| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 46
           MVKL    .S2     0x3eb0c6f7,B7
           MVKL    .S2     0xa0b5ed8d,B6
           MVKH    .S2     0x3eb0c6f7,B7

           LDW     .D2T1   *B12,A4           ; |66| 
||         MVKH    .S2     0xa0b5ed8d,B6

           CALLP   .S2     isequal,B3
||         LDW     .D2T2   *+B12(4),B4       ; |66| 
||         MVK     .S1     0x24,A6           ; |66| 
||         MVK     .L1     0x1,A8            ; |66| 

$C$RL15:   ; CALL OCCURS {isequal} {0}       ; |66| 
           MVKL    .S2     fcn_pass,B5
           MVKL    .S2     0x3eb0c6f7,B7
           MVKH    .S2     fcn_pass,B5
           MVKL    .S2     0xa0b5ed8d,B6

           LDW     .D2T2   *+B12(8),B4       ; |67| 
||         MVKH    .S2     0x3eb0c6f7,B7

           STW     .D2T1   A4,*+B5(4)        ; |66| 
||         MVKH    .S2     0xa0b5ed8d,B6

           CALLP   .S2     isequal,B3
||         LDW     .D2T1   *B12,A4           ; |67| 
||         MVK     .S1     0x24,A6           ; |67| 
||         MVK     .L1     0x1,A8            ; |67| 

$C$RL16:   ; CALL OCCURS {isequal} {0}       ; |67| 
           MVKL    .S2     fcn_pass,B5
           MVKL    .S2     0x3eb0c6f7,B7
           MVKL    .S2     0xa0b5ed8d,B6
           MVKH    .S2     fcn_pass,B5
           MVKH    .S2     0x3eb0c6f7,B7

           MV      .L1X    B12,A3            ; |67| 
||         STW     .D2T1   A4,*+B5(8)        ; |67| 
||         MVKH    .S2     0xa0b5ed8d,B6

           CALLP   .S2     isequal,B3
||         LDW     .D1T1   *A3,A4            ; |68| 
||         LDW     .D2T2   *+B12(12),B4      ; |68| 
||         MVK     .S1     0x24,A6           ; |68| 
||         MVK     .L1     0x1,A8            ; |68| 

$C$RL17:   ; CALL OCCURS {isequal} {0}       ; |68| 
           MVKL    .S2     fcn_pass,B4

           LDW     .D2T1   *+SP(64),A13      ; |68| 
||         MVKL    .S2     0xa0b5ed8d,B6

           MVKL    .S2     0x3eb0c6f7,B7
           MVKH    .S2     fcn_pass,B4

           MV      .L1X    B12,A3            ; |69| 
||         STW     .D2T1   A4,*+B4(12)       ; |68| 
||         MVKH    .S2     0xa0b5ed8d,B6

           LDW     .D1T1   *A3,A4            ; |69| 
||         MVKH    .S2     0x3eb0c6f7,B7

           CALLP   .S2     isequal,B3
||         LDW     .D1T2   *A13,B4           ; |69| 
||         MVK     .S1     0x24,A6           ; |69| 
||         MVK     .L1     0x1,A8            ; |69| 

$C$RL18:   ; CALL OCCURS {isequal} {0}       ; |69| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 16
           LDW     .D2T1   *+SP(68),A12      ; |69| 
           ZERO    .L2     B12
           MVKL    .S2     fcn_pass,B4
           LDW     .D2T1   *+SP(80),A3
           MVKH    .S2     fcn_pass,B4
           LDW     .D1T1   *A12,A0           ; |72| 
           SET     .S2     B12,0x17,0x1d,B12
           STW     .D2T1   A4,*+B4(16)       ; |69| 
           STW     .D2T1   A3,*+SP(84)       ; |72| 
           NOP             1

   [!A0]   B       .S1     $C$L14            ; |72| 
|| [ A0]   MV      .L2X    A3,B4

   [!A0]   CALL    .S1     print_test_results ; |203| 
|| [ A0]   LDW     .D2T2   *B4,B0            ; |72| 

   [!A0]   ZERO    .L1     A4                ; |72| 
   [!A0]   MVKL    .S1     all_pass,A3
   [!A0]   MVKH    .S1     all_pass,A3
   [ A0]   ADD     .L2     4,B4,B4
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
           CALL    .S1     print_test_results ; |203| 
           MVKL    .S1     all_pass,A3
           MVKH    .S1     all_pass,A3
           NOP             2
;** --------------------------------------------------------------------------*
$C$L14:    
;          EXCLUSIVE CPU CYCLES: 1

           STW     .D1T1   A4,*A3            ; |72| 
||         MVK     .L1     0x3,A4            ; |203| 
||         ADDKPC  .S2     $C$RL19,B3,0      ; |203| 

$C$RL19:   ; CALL OCCURS {print_test_results} {0}  ; |203| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 14
           MVKL    .S2     0x4000cccc,B4
           MVKL    .S2     0xcccccccd,B31
           MVKL    .S2     b_ext,B5

           MVKH    .S2     0x4000cccc,B4
||         MVK     .S1     0xed,A31
||         STW     .D2T2   B11,*+SP(88)      ; |94| 

           MVKL    .S1     a_ext,A10
||         MVKH    .S2     0xcccccccd,B31
||         STW     .D2T1   A31,*+SP(60)      ; |206| 

           MVKH    .S1     a_ext,A10
||         MVKH    .S2     b_ext,B5
||         ZERO    .L1     A4
||         STW     .D2T2   B4,*+SP(96)       ; |213| 

           MV      .L1     A10,A3            ; |207| 
||         MV      .L2     B5,B30            ; |207| 
||         SET     .S1     A4,0x17,0x17,A4
||         STW     .D2T2   B31,*+SP(92)      ; |213| 

           MV      .L1X    B5,A11            ; |207| 
||         STW     .D1T1   A4,*A3            ; |206| 
||         STW     .D2T2   B12,*B30          ; |207| 

           LDW     .D1T1   *A11,A3           ; |209| 
           LDW     .D1T1   *A10,A4           ; |209| 
           ZERO    .L2     B12
           NOP             2

           CALL    .S2     atan2             ; |209| 
||         SPDP    .S1     A3,A7:A6          ; |209| 

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L15:    
;          EXCLUSIVE CPU CYCLES: 5
           ADDKPC  .S2     $C$RL20,B3,2      ; |209| 

           SPDP    .S1     A4,A5:A4          ; |209| 
||         MV      .L2X    A7,B5             ; |209| 

           MV      .L2X    A6,B4             ; |209| 
$C$RL20:   ; CALL OCCURS {atan2} {0}         ; |209| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 32
           MVKL    .S2     output,B4
           MVKH    .S2     output,B4
           LDW     .D2T2   *B4,B4            ; |209| 
           DPSP    .L1     A5:A4,A3          ; |209| 
           NOP             3
           ADD     .L2     B12,B4,B4         ; |209| 
           STW     .D2T1   A3,*B4            ; |209| 
           LDW     .D1T1   *A10,A4           ; |210| 

           CALLP   .S2     atan2sp,B3
||         LDW     .D1T2   *A11,B4           ; |210| 

$C$RL21:   ; CALL OCCURS {atan2sp} {0}       ; |210| 
           MVKL    .S2     output,B4
           MVKH    .S2     output,B4
           LDW     .D2T2   *+B4(4),B4        ; |210| 
           NOP             4
           ADD     .L2     B12,B4,B4         ; |210| 
           STW     .D2T1   A4,*B4            ; |210| 
           LDW     .D1T2   *A11,B4           ; |211| 

           CALLP   .S2     atan2sp_c,B3
||         LDW     .D1T1   *A10,A4           ; |211| 

$C$RL22:   ; CALL OCCURS {atan2sp_c} {0}     ; |211| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 122
           MVKL    .S2     output,B4
           MVKH    .S2     output,B4
           LDW     .D2T2   *+B4(8),B4        ; |211| 
           ZERO    .L2     B28               ; |94| 
           LDW     .D2T1   *+SP(24),A31
           LDW     .D2T2   *+SP(20),B31      ; |108| 
           LDW     .D2T2   *+SP(32),B30      ; |108| 
           ADD     .L2     B12,B4,B4         ; |211| 
           STW     .D2T1   A4,*B4            ; |211| 
           LDW     .D1T1   *A11,A3           ; |212| 
           LDW     .D1T1   *A10,A4           ; |212| 
           LDW     .D2T1   *+SP(28),A30      ; |108| 
           LDW     .D2T2   *+SP(40),B29      ; |108| 
           LDW     .D2T2   *+SP(36),B5       ; |108| 
           MV      .L1     A3,A7             ; |131| 
           MV      .L1     A3,A9             ; |131| 
           ABSSP   .S2X    A7,B4             ; |136| 
           ABSSP   .S1     A4,A5             ; |136| 
           CMPGTSP .S1X    A5,B4,A0          ; |136| 
   [ A0]   MV      .L1     A4,A3             ; |138| 
           RCPSP   .S1     A3,A5             ; |53| 
           MPYSP   .M1     A3,A5,A6          ; |53| 
           MV      .L2X    A4,B9             ; |130| 
   [ A0]   MV      .L1     A7,A4             ; |139| 
           LDW     .D2T2   *+SP(16),B8       ; |108| 
           SUBSP   .L1     A14,A6,A6         ; |53| 
           LDW     .D2T2   *+SP(52),B23      ; |149| 
           LDW     .D2T2   *+SP(88),B27      ; |94| 
           LDW     .D2T1   *+SP(12),A27      ; |108| 
           MPYSP   .M1     A5,A6,A5          ; |53| 
           CMPLTSP .S2     B9,B10,B0         ; |132| 
           CMPLTSP .S2X    A9,B10,B26        ; |149| 
           CMPLTSP .S2X    A9,B10,B25        ; |150| 
           MPYSP   .M1     A3,A5,A3          ; |53| 
           CMPEQSP .S2     B9,B10,B24        ; |149| 

   [!A0]   ZERO    .L1     A0                ; |128| 
|| [ A0]   MVK     .S1     0x1,A0            ; |140| 

           ZERO    .L2     B22               ; |94| 
           SUBSP   .L1     A14,A3,A3         ; |53| 
           SET     .S2     B22,31,31,B21     ; |214| 
           NOP             2
           MPYSP   .M1     A5,A3,A3          ; |53| 
           NOP             3
           MPYSP   .M1     A4,A3,A4          ; |53| 
           NOP             3
           MPYSP   .M1     A4,A4,A5          ; |108| 
           CMPLTSP .S1     A4,A15,A2         ; |155| 
           CMPGTSP .S2X    A4,B23,B1         ; |152| 
           NOP             1
           MPYSP   .M1     A5,A5,A3          ; |108| 
           MPYSP   .M2X    B31,A5,B4         ; |108| 
           NOP             2
           MPYSP   .M1     A31,A3,A8         ; |108| 
           MPYSP   .M1     A3,A3,A7          ; |108| 
           MPYSP   .M2X    B30,A3,B6         ; |108| 
           MPYSP   .M1     A3,A5,A6          ; |108| 
           MPYSP   .M1     A30,A5,A5         ; |108| 

           ADDSP   .L2X    B4,A8,B7          ; |108| 
||         MPYSP   .M1     A3,A7,A29         ; |108| 

           MPYSP   .M2X    B29,A7,B4         ; |108| 
           MPYSP   .M1     A3,A6,A28         ; |108| 
           MPYSP   .M2X    B5,A6,B5          ; |108| 
           ADDSP   .L2     B8,B7,B7          ; |108| 
           ADDSP   .L1X    A5,B6,A5          ; |108| 
           MPYSP   .M1     A27,A28,A3        ; |108| 
           ADDSP   .L2     B5,B4,B4          ; |108| 
           MPYSP   .M2X    A29,B7,B5         ; |108| 
           XOR     .L2     1,B26,B7          ; |149| 
           AND     .S2     B24,B7,B2         ; |149| 
           ADDSP   .L2X    A5,B4,B4          ; |108| 
           ADDSP   .L2X    A3,B5,B5          ; |108| 
   [ A0]   LDW     .D2T1   *+SP(44),A3       ; |146| 
   [!A0]   LDW     .D2T1   *+SP(48),A3       ; |83| 
           NOP             1
           ADDSP   .L2     B5,B4,B5          ; |108| 
           CMPLTSP .S2X    A9,B10,B4         ; |133| 
   [ A0]   MV      .L2X    A3,B13            ; |83| 
           MV      .L1X    B4,A5             ; |146| 
           MPYSP   .M2X    A4,B5,B4          ; |108| 
   [!A0]   MV      .L2X    A3,B13            ; |83| 
           OR      .L1     A5,A0,A1          ; |90| 
           SET     .S2     B28,31,31,B5      ; |94| 
           ADDSP   .L2X    A4,B4,B4          ; |108| 
   [!A1]   MV      .L2     B10,B13           ; |91| 
   [ B0]   XOR     .L2     B13,B5,B13        ; |94| 
           LDW     .D2T2   *B27,B5           ; |212| 

   [!A0]   ADDSP   .L2     B4,B13,B11        ; |111| 
|| [ A0]   SUBSP   .S2     B13,B4,B11        ; |111| 

           AND     .L2     B24,B25,B0        ; |150| 
           NOP             2

   [ B2]   MV      .L2     B10,B11           ; |150| 
|| [ B0]   LDW     .D2T2   *+SP(48),B11      ; |150| 

   [ B1]   LDW     .D2T2   *+SP(44),B11      ; |150| 
   [ A2]   LDW     .D2T2   *+SP(56),B11      ; |153| 
           ADD     .L2     B12,B5,B4         ; |212| 
           LDW     .D2T2   *+SP(96),B5
           ADD     .L2     4,B12,B12         ; |208| 
           NOP             1
           STW     .D2T2   B11,*B4           ; |212| 

           LDW     .D1T1   *A11,A3           ; |214| 
||         LDW     .D2T2   *+SP(92),B4

           LDW     .D1T2   *A10,B6           ; |213| 
           NOP             3
           XOR     .L1X    A3,B21,A3         ; |214| 

           MPYSPDP .M2     B6,B5:B4,B5:B4    ; |213| 
||         STW     .D1T1   A3,*++A11         ; |214| 

           LDW     .D2T1   *+SP(60),A3       ; |214| 
           NOP             4
           SUB     .L1     A3,1,A0           ; |208| 

           DPSP    .L2     B5:B4,B5          ; |213| 
|| [ A0]   LDW     .D1T1   *A11,A3           ; |209| 
|| [!A0]   MVKL    .S2     output,B11

   [ A0]   BNOP    .S1     $C$L15,2          ; |208| 
|| [!A0]   MVKH    .S2     output,B11

           STW     .D1T2   B5,*++A10         ; |213| 

   [ A0]   LDW     .D1T1   *A10,A4           ; |209| 
|| [ A0]   SPDP    .S1     A3,A7:A6          ; |209| 

   [ A0]   CALL    .S2     atan2             ; |209| 
||         STW     .D2T1   A0,*+SP(60)       ; |213| 

           ; BRANCHCC OCCURS {$C$L15}        ; |208| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 6

           CALL    .S1     atan2sp_v         ; |216| 
||         MVKL    .S2     b_ext,B4

           MVKH    .S2     b_ext,B4
||         LDW     .D2T1   *+B11(16),A6      ; |216| 

           MVKL    .S1     a_ext,A4
           MVKH    .S1     a_ext,A4
           MVK     .S2     0xed,B6           ; |216| 
           ADDKPC  .S2     $C$RL23,B3,0      ; |216| 
$C$RL23:   ; CALL OCCURS {atan2sp_v} {0}     ; |216| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 42
           MVKL    .S2     0x3eb0c6f7,B7
           MVKL    .S2     0xa0b5ed8d,B6
           MVKH    .S2     0x3eb0c6f7,B7

           LDW     .D2T1   *B11,A4           ; |66| 
||         MVKH    .S2     0xa0b5ed8d,B6

           CALLP   .S2     isequal,B3
||         LDW     .D2T2   *+B11(4),B4       ; |66| 
||         MVK     .S1     0xed,A6           ; |66| 
||         MVK     .L1     0x1,A8            ; |66| 

$C$RL24:   ; CALL OCCURS {isequal} {0}       ; |66| 
           MVKL    .S2     fcn_pass,B12
           MVKL    .S2     0x3eb0c6f7,B7
           MVKH    .S2     fcn_pass,B12
           MVKL    .S2     0xa0b5ed8d,B6

           LDW     .D2T2   *+B11(8),B4       ; |67| 
||         MVKH    .S2     0x3eb0c6f7,B7

           STW     .D2T1   A4,*+B12(4)       ; |66| 
||         MVKH    .S2     0xa0b5ed8d,B6

           CALLP   .S2     isequal,B3
||         LDW     .D2T1   *B11,A4           ; |67| 
||         MVK     .S1     0xed,A6           ; |67| 
||         MVK     .L1     0x1,A8            ; |67| 

$C$RL25:   ; CALL OCCURS {isequal} {0}       ; |67| 
           MVKL    .S2     0x3eb0c6f7,B7
           MVKL    .S2     0xa0b5ed8d,B6
           MVKH    .S2     0x3eb0c6f7,B7

           MV      .L1X    B11,A3            ; |67| 
||         STW     .D2T1   A4,*+B12(8)       ; |67| 
||         MVKH    .S2     0xa0b5ed8d,B6

           CALLP   .S2     isequal,B3
||         LDW     .D1T1   *A3,A4            ; |68| 
||         LDW     .D2T2   *+B11(12),B4      ; |68| 
||         MVK     .S1     0xed,A6           ; |68| 
||         MVK     .L1     0x1,A8            ; |68| 

$C$RL26:   ; CALL OCCURS {isequal} {0}       ; |68| 
           MVKL    .S2     0x3eb0c6f7,B7
           MVKL    .S2     0xa0b5ed8d,B6
           MVKH    .S2     0x3eb0c6f7,B7

           MV      .L1     A13,A3            ; |68| 
||         MV      .L2     B11,B4            ; |68| 
||         STW     .D2T1   A4,*+B12(12)      ; |68| 
||         MVKH    .S2     0xa0b5ed8d,B6

           CALLP   .S2     isequal,B3
||         LDW     .D2T1   *B4,A4            ; |69| 
||         LDW     .D1T2   *A3,B4            ; |69| 
||         MVK     .S1     0xed,A6           ; |69| 
||         MVK     .L1     0x1,A8            ; |69| 

$C$RL27:   ; CALL OCCURS {isequal} {0}       ; |69| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 12

           MV      .L1     A12,A3            ; |69| 
||         LDW     .D2T2   *+SP(80),B4

           LDW     .D1T1   *A3,A0            ; |72| 
           STW     .D2T1   A4,*+B12(16)      ; |69| 
           NOP             3

   [!A0]   B       .S1     $C$L16            ; |72| 
|| [ A0]   LDW     .D2T2   *B4,B0            ; |72| 

   [!A0]   CALL    .S1     print_test_results ; |220| 
   [ A0]   ADD     .L2     4,B4,B4
   [!A0]   ZERO    .L1     A3                ; |72| 
   [!A0]   MVKL    .S1     all_pass,A4
   [!A0]   MVKH    .S1     all_pass,A4
           ; BRANCHCC OCCURS {$C$L16}        ; |72| 
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
           CALL    .S1     print_test_results ; |220| 
           MVKL    .S1     all_pass,A4
           MVKH    .S1     all_pass,A4
           NOP             2
;** --------------------------------------------------------------------------*
$C$L16:    
;          EXCLUSIVE CPU CYCLES: 1

           STW     .D1T1   A3,*A4            ; |72| 
||         MVK     .L1     0x4,A4            ; |220| 
||         ADDKPC  .S2     $C$RL28,B3,0      ; |220| 

$C$RL28:   ; CALL OCCURS {print_test_results} {0}  ; |220| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 14

           ZERO    .L2     B9                ; |114| 
||         MVKL    .S2     cycle_counts+24,B5

           MVKH    .S2     cycle_counts+24,B5
||         ZERO    .L2     B4                ; |114| 
||         ZERO    .D2     B8                ; |114| 

           MVC     .S2     B4,TSCL           ; |115| 
||         STDW    .D2T2   B9:B8,*B5         ; |114| 

           MVC     .S2     TSCL,B6           ; |116| 
           MVC     .S2     TSCH,B7           ; |116| 
           MVKL    .S1     t_start,A3
           MVKH    .S1     t_start,A3

           MVC     .S2     TSCL,B4           ; |117| 
||         STDW    .D1T2   B7:B6,*A3         ; |116| 

           MVC     .S2     TSCH,B16          ; |117| 

           CALL    .S1     gimme_random      ; |230| 
||         SUBU    .L2     B4,B6,B5:B4       ; |117| 

           EXT     .S2     B5,24,24,B6       ; |117| 
||         SUB     .L2     B16,B7,B31        ; |117| 
||         STW     .D2T2   B9,*+SP(64)       ; |114| 
||         MVKL    .S1     t_offset,A5

           ADD     .L2     B31,B6,B5         ; |117| 
||         MVKH    .S1     t_offset,A5
||         STW     .D2T2   B8,*+SP(60)       ; |114| 

           MVKL    .S2     0xc0c90fda,B4
||         STDW    .D1T2   B5:B4,*A5         ; |117| 
||         MVK     .S1     0x80,A3

           MVKH    .S2     0xc0c90fda,B4
||         STW     .D2T1   A3,*+SP(68)       ; |117| 
||         MV      .L1X    B9,A10
||         MVKL    .S1     0x41490fda,A4

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L17:    
;          EXCLUSIVE CPU CYCLES: 1

           ADDKPC  .S2     $C$RL29,B3,0      ; |230| 
||         MVKH    .S1     0x41490fda,A4

$C$RL29:   ; CALL OCCURS {gimme_random} {0}  ; |230| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 16
           MVKL    .S1     input,A11
           MVKH    .S1     input,A11
           LDW     .D1T2   *A11,B4           ; |230| 
           NOP             4
           ADD     .L2X    A10,B4,B4         ; |230| 

           STW     .D2T1   A4,*B4            ; |230| 
||         MVKL    .S2     0xc0c90fda,B4

           MVKL    .S1     0x41490fda,A4
||         MVKH    .S2     0xc0c90fda,B4

           CALLP   .S2     gimme_random,B3
||         MVKH    .S1     0x41490fda,A4

$C$RL30:   ; CALL OCCURS {gimme_random} {0}  ; |231| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 122
           LDW     .D1T1   *+A11(4),A3       ; |231| 
           NOP             4
           ADD     .L1     A10,A3,A3         ; |231| 

           STW     .D1T1   A4,*A3            ; |231| 
||         MVC     .S2     TSCL,B4           ; |122| 

           MVC     .S2     TSCH,B5           ; |122| 
           MV      .L1     A11,A3            ; |122| 
           LDW     .D1T1   *A3,A3            ; |235| 
           MV      .L1     A4,A5             ; |235| 
           ABSSP   .S1     A4,A6             ; |136| 
           ZERO    .L2     B25               ; |94| 
           CMPLTSP .S2X    A4,B10,B26        ; |133| 
           ADD     .L1     A10,A3,A3         ; |235| 
           LDW     .D1T1   *A3,A3            ; |235| 
           LDW     .D2T1   *+SP(24),A30
           CMPLTSP .S2X    A4,B10,B23        ; |150| 
           CMPLTSP .S1X    A4,B10,A25        ; |149| 
           LDW     .D2T2   *+SP(20),B31      ; |108| 
           ABSSP   .S2X    A3,B6             ; |136| 
           CMPGTSP .S2X    B6,A6,B0          ; |136| 
   [ B0]   MV      .L1     A3,A5             ; |138| 
           RCPSP   .S1     A5,A6             ; |53| 
           MPYSP   .M1     A5,A6,A7          ; |53| 
           LDW     .D2T2   *+SP(32),B30      ; |108| 
           MV      .L1     A3,A31            ; |130| 
   [ B0]   MV      .L1     A4,A3             ; |139| 
           SUBSP   .L1     A14,A7,A7         ; |53| 
           LDW     .D2T1   *+SP(28),A29      ; |108| 
           LDW     .D2T2   *+SP(40),B29      ; |108| 
           LDW     .D2T2   *+SP(36),B28      ; |108| 
           MPYSP   .M1     A6,A7,A6          ; |53| 
           LDW     .D2T2   *+SP(16),B27      ; |108| 
           LDW     .D2T2   *+SP(52),B21      ; |149| 
           LDW     .D2T1   *+SP(12),A26      ; |108| 
           MPYSP   .M1     A5,A6,A5          ; |53| 
   [!B0]   ZERO    .L1     A0                ; |128| 
   [ B0]   MVK     .L1     0x1,A0            ; |140| 
   [!A0]   LDW     .D2T2   *+SP(48),B11      ; |146| 
           SUBSP   .L1     A14,A5,A5         ; |53| 
   [ A0]   LDW     .D2T2   *+SP(44),B11      ; |108| 
           CMPEQSP .S2X    A31,B10,B22       ; |149| 
           OR      .L2X    B26,A0,B1         ; |90| 
           MPYSP   .M1     A6,A5,A5          ; |53| 
           MVKL    .S2     t_start,B20
   [!B1]   MV      .L2     B10,B11           ; |91| 
           AND     .L2     B22,B23,B1        ; |150| 
           MPYSP   .M1     A3,A5,A5          ; |53| 
           MVKH    .S2     t_start,B20
           STDW    .D2T2   B5:B4,*B20
           NOP             1
           MPYSP   .M1     A5,A5,A7          ; |108| 
           CMPLTSP .S1     A5,A15,A2         ; |155| 
           NOP             2
           MPYSP   .M1     A7,A7,A9          ; |108| 
           MPYSP   .M2X    B31,A7,B6         ; |108| 
           NOP             2
           MPYSP   .M1     A30,A9,A3         ; |108| 
           MPYSP   .M1     A9,A9,A8          ; |108| 
           MPYSP   .M2X    B30,A9,B9         ; |108| 
           MPYSP   .M1     A9,A7,A16         ; |108| 
           MPYSP   .M1     A29,A7,A7         ; |108| 

           ADDSP   .L2X    B6,A3,B8          ; |108| 
||         MPYSP   .M1     A9,A8,A28         ; |108| 

           MPYSP   .M2X    B29,A8,B7         ; |108| 
           MPYSP   .M1     A9,A16,A27        ; |108| 
           MPYSP   .M2X    B28,A16,B16       ; |108| 
           ADDSP   .L2     B27,B8,B6         ; |108| 
           ADDSP   .L1X    A7,B9,A7          ; |108| 
           MPYSP   .M1     A26,A27,A3        ; |108| 
           ADDSP   .L2     B16,B7,B7         ; |108| 
           MPYSP   .M2X    A28,B6,B6         ; |108| 
           NOP             2
           ADDSP   .L2X    A7,B7,B7          ; |108| 
           ADDSP   .L2X    A3,B6,B6          ; |108| 
           CMPLTSP .S1X    A31,B10,A3        ; |132| 
           NOP             2
           ADDSP   .L2     B6,B7,B7          ; |108| 
           MV      .L2X    A3,B0             ; |146| 
           XOR     .L1     1,A25,A3          ; |149| 
           SET     .S2     B25,31,31,B6      ; |94| 
           MPYSP   .M2X    A5,B7,B7          ; |108| 
           AND     .L2X    B22,A3,B2         ; |149| 
           MVKL    .S2     output+12,B25
   [ B0]   XOR     .L2     B11,B6,B11        ; |94| 
           ADDSP   .L2X    A5,B7,B8          ; |108| 
           MVKH    .S2     output+12,B25
           CMPGTSP .S2X    A5,B21,B0         ; |152| 
           LDW     .D2T2   *B25,B24          ; |235| 

   [ A0]   SUBSP   .L2     B11,B8,B12        ; |111| 
|| [!A0]   ADDSP   .S2     B8,B11,B12        ; |111| 

           NOP             3

   [ B2]   MV      .L2     B10,B12           ; |150| 
|| [ B1]   LDW     .D2T2   *+SP(48),B12      ; |150| 

   [ B0]   LDW     .D2T2   *+SP(44),B12      ; |150| 
   [ A2]   LDW     .D2T2   *+SP(56),B12      ; |153| 
           ADD     .L2X    A10,B24,B7        ; |235| 
           NOP             3

           STW     .D2T2   B12,*B7           ; |235| 
||         MVC     .S2     TSCL,B6           ; |128| 

           MVC     .S2     TSCH,B7           ; |128| 

           MVKL    .S1     t_offset,A3
||         LDW     .D2T1   *+SP(68),A23      ; |128| 
||         MVKL    .S2     t_stop,B19
||         ADD     .L1     4,A10,A10         ; |228| 

           MVKH    .S1     t_offset,A3
||         MVKH    .S2     t_stop,B19

           LDDW    .D1T1   *A3,A7:A6         ; |130| 
||         MVKL    .S1     cycle_counts+24,A3
||         STDW    .D2T2   B7:B6,*B19        ; |128| 

           MVKH    .S1     cycle_counts+24,A3
           LDDW    .D1T1   *A3,A9:A8         ; |130| 

           MV      .L2X    A3,B13            ; |130| 
||         SUB     .L1     A23,1,A0          ; |228| 

           STW     .D2T1   A0,*+SP(68)       ; |130| 
           ADDU    .L1X    A6,B4,A5:A4       ; |130| 

           ADD     .S1     A5,A7,A3          ; |130| 
||         SUBU    .L1X    B6,A4,A5:A4       ; |130| 

           EXT     .S1     A5,24,24,A24      ; |130| 
||         ADDU    .L1     A8,A4,A5:A4       ; |130| 

           ADD     .L2X    A3,B5,B4          ; |130| 
|| [ A0]   B       .S1     $C$L17            ; |228| 

   [ A0]   CALL    .S1     gimme_random      ; |230| 
||         SUB     .L2     B7,B4,B4          ; |130| 

           ADD     .L1     A5,A9,A3          ; |130| 

           ADD     .L1X    B4,A24,A5         ; |130| 
|| [ A0]   MVKL    .S2     0xc0c90fda,B4

           ADD     .L1     A3,A5,A5          ; |130| 
|| [ A0]   MVKH    .S2     0xc0c90fda,B4

   [!A0]   CALL    .S2     __c6xabi_fltllif  ; |135| 
||         STDW    .D2T1   A5:A4,*B13        ; |130| 
|| [ A0]   MVKL    .S1     0x41490fda,A4

           ; BRANCHCC OCCURS {$C$L17}        ; |228| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           LDDW    .D2T1   *B13,A5:A4        ; |135| 
           ADDKPC  .S2     $C$RL31,B3,3      ; |135| 
$C$RL31:   ; CALL OCCURS {__c6xabi_fltllif} {0}  ; |135| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 16
           ZERO    .L1     A3
           SET     .S1     A3,0x1a,0x1d,A3
           MPYSP   .M1     A3,A4,A3          ; |135| 
           ZERO    .L1     A11
           SET     .S1     A11,0x15,0x1d,A11
           ZERO    .L1     A10               ; |135| 
           SPDP    .S1     A3,A5:A4          ; |135| 
           NOP             2
           ADDDP   .L1     A11:A10,A5:A4,A5:A4 ; |135| 
           CALLP   .S2     __c6xabi_fixdlli,B3
$C$RL32:   ; CALL OCCURS {__c6xabi_fixdlli} {0}  ; |135| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 15

           MV      .L2X    A10,B5
||         STDW    .D2T1   A5:A4,*B13        ; |135| 

           SUBAW   .D2     B13,6,B10
||         MV      .L2X    A10,B4

           MVC     .S2     B4,TSCL           ; |115| 
||         STDW    .D2T2   B5:B4,*B10        ; |114| 

           MVC     .S2     TSCL,B8           ; |116| 
           MVC     .S2     TSCH,B4           ; |116| 
           MVKL    .S1     t_start,A15

           MVKH    .S1     t_start,A15
||         MV      .L2     B4,B9             ; |116| 

           MVC     .S2     TSCL,B4           ; |117| 
||         STDW    .D1T2   B9:B8,*A15        ; |116| 

           MVC     .S2     TSCH,B6           ; |117| 
           MVKL    .S2     input,B11
           MVKL    .S2     t_offset,B12

           SUBU    .L2     B4,B8,B5:B4       ; |117| 
||         MVKH    .S2     input,B11

           EXT     .S2     B5,24,24,B6       ; |117| 
||         SUB     .L2     B6,B9,B5          ; |117| 

           ADD     .L2     B5,B6,B5          ; |117| 
||         MVKH    .S2     t_offset,B12

           STDW    .D2T2   B5:B4,*B12        ; |117| 
||         ADD     .L1X    4,B11,A14
||         MVK     .S2     0x80,B13

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L18:    
;          EXCLUSIVE CPU CYCLES: 11

           LDW     .D2T2   *B11,B4           ; |243| 
||         LDW     .D1T1   *A14,A3           ; |243| 

           NOP             4

           ADD     .L2X    A10,B4,B4         ; |243| 
||         ADD     .L1     A10,A3,A3         ; |243| 
||         CALL    .S1     atan2f            ; |243| 

           LDW     .D2T1   *B4,A4            ; |243| 
||         LDW     .D1T2   *A3,B4            ; |243| 

           ADDKPC  .S2     $C$RL33,B3,3      ; |243| 
$C$RL33:   ; CALL OCCURS {atan2f} {0}        ; |243| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 9

           MVKL    .S1     output,A3
||         SUB     .L1X    B13,1,A0          ; |242| 
||         SUB     .L2     B13,1,B13         ; |242| 

           MVKH    .S1     output,A3
           LDW     .D1T1   *A3,A3            ; |243| 
   [ A0]   BNOP    .S1     $C$L18,3          ; |242| 

           ADD     .L1     A10,A3,A3         ; |243| 
||         ADD     .S1     4,A10,A10         ; |242| 

           STW     .D1T1   A4,*A3            ; |243| 
           ; BRANCHCC OCCURS {$C$L18}        ; |242| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 18
           MVC     .S2     TSCL,B8           ; |128| 
           MVC     .S2     TSCH,B4           ; |128| 

           LDDW    .D1T1   *A15,A7:A6        ; |130| 
||         LDDW    .D2T2   *B12,B7:B6        ; |130| 

           MVKL    .S2     t_stop,B13
           MV      .L2     B4,B9             ; |128| 
           MVKH    .S2     t_stop,B13
           NOP             1
           ADDU    .L1X    B6,A6,A5:A4       ; |130| 

           ADD     .L1X    A5,B7,A3          ; |130| 
||         LDDW    .D2T2   *B10,B7:B6        ; |130| 

           SUBU    .L2X    B8,A4,B5:B4       ; |130| 
           ADD     .L1     A3,A7,A3          ; |130| 
           EXT     .S2     B5,24,24,B16      ; |130| 
           CALL    .S1     __c6xabi_fltllif  ; |130| 

           ADDU    .L2     B6,B4,B5:B4       ; |130| 
||         SUB     .S2X    B9,A3,B6          ; |130| 

           ADD     .L2     B5,B7,B31         ; |130| 
||         ADD     .S2     B6,B16,B5         ; |130| 

           MV      .L1X    B4,A4             ; |130| 
||         ADD     .L2     B31,B5,B4         ; |130| 

           STDW    .D2T2   B9:B8,*B13        ; |128| 

           MV      .L1X    B4,A5             ; |130| 
||         ADDKPC  .S2     $C$RL34,B3,0      ; |130| 

$C$RL34:   ; CALL OCCURS {__c6xabi_fltllif} {0}  ; |130| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 15
           ZERO    .L1     A3
           SET     .S1     A3,0x1a,0x1d,A3
           MPYSP   .M1     A3,A4,A3          ; |130| 
           ZERO    .L1     A10               ; |130| 
           NOP             2
           SPDP    .S1     A3,A5:A4          ; |130| 
           NOP             1
           ADDDP   .L1     A11:A10,A5:A4,A5:A4 ; |130| 
           CALLP   .S2     __c6xabi_fixdlli,B3
$C$RL35:   ; CALL OCCURS {__c6xabi_fixdlli} {0}  ; |130| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 17
           MV      .L2X    A10,B4            ; |130| 

           MV      .L2X    A10,B5            ; |130| 
||         STDW    .D2T1   A5:A4,*B10        ; |130| 

           STDW    .D2T2   B5:B4,*+B10(8)    ; |114| 
||         MVC     .S2     B4,TSCL           ; |115| 

           MVC     .S2     TSCL,B6           ; |116| 
           MVC     .S2     TSCH,B7           ; |116| 
           MV      .L1     A15,A3            ; |116| 

           STDW    .D1T2   B7:B6,*A3         ; |116| 
||         MVC     .S2     TSCL,B4           ; |117| 

           MVC     .S2     TSCH,B8           ; |117| 
           SUBU    .L2     B4,B6,B5:B4       ; |117| 

           EXT     .S2     B5,24,24,B6       ; |117| 
||         SUB     .L2     B8,B7,B31         ; |117| 

           ADD     .L2     B31,B6,B5         ; |117| 
           STDW    .D2T2   B5:B4,*B12        ; |117| 

           LDW     .D2T2   *B11,B4           ; |251| 
||         LDW     .D1T1   *A14,A3           ; |251| 

           MVK     .S2     0x80,B30
           LDW     .D2T1   *+SP(72),A10      ; |117| 
           STW     .D2T2   B30,*+SP(12)      ; |117| 
           ZERO    .L1     A15
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L19:    
;          EXCLUSIVE CPU CYCLES: 10
           NOP             4

           CALL    .S1     atan2sp           ; |251| 
||         ADD     .L2X    A15,B4,B4         ; |251| 
||         ADD     .L1     A15,A3,A3         ; |251| 

           LDW     .D1T2   *A3,B4            ; |251| 
||         LDW     .D2T1   *B4,A4            ; |251| 

           NOP             3
           ADDKPC  .S2     $C$RL36,B3,0      ; |251| 
$C$RL36:   ; CALL OCCURS {atan2sp} {0}       ; |251| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 12

           LDW     .D2T2   *+SP(12),B4       ; |251| 
||         LDW     .D1T1   *A10,A3           ; |251| 

           NOP             4

           SUB     .L1X    B4,1,A0           ; |250| 
||         SUB     .L2     B4,1,B4           ; |250| 
||         ADD     .S1     A15,A3,A3         ; |251| 
||         ADD     .D1     4,A15,A15         ; |250| 

   [ A0]   BNOP    .S1     $C$L19,3          ; |250| 
||         STW     .D2T2   B4,*+SP(12)       ; |251| 
||         STW     .D1T1   A4,*A3            ; |251| 

   [ A0]   LDW     .D1T1   *A14,A3           ; |251| 
   [ A0]   LDW     .D2T2   *B11,B4           ; |251| 
           ; BRANCHCC OCCURS {$C$L19}        ; |250| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 20
           MVC     .S2     TSCL,B6           ; |128| 
           MVC     .S2     TSCH,B4           ; |128| 

           MVKL    .S1     t_start,A15
||         LDDW    .D2T2   *B12,B9:B8        ; |130| 

           MVKH    .S1     t_start,A15
           LDDW    .D1T1   *A15,A5:A4        ; |130| 
           MV      .L2     B4,B7             ; |128| 
           MV      .L2     B13,B30           ; |130| 
           NOP             2
           ADDU    .L1X    B8,A4,A7:A6       ; |130| 

           ADD     .L1X    A7,B9,A3          ; |130| 
||         LDDW    .D2T2   *+B10(8),B9:B8    ; |130| 

           ADD     .L1     A3,A5,A3          ; |130| 
||         SUBU    .L2X    B6,A6,B5:B4       ; |130| 

           EXT     .S2     B5,24,24,B16      ; |130| 
           SUB     .L2X    B7,A3,B31         ; |130| 
           CALL    .S1     __c6xabi_fltllif  ; |130| 

           ADDU    .L2     B8,B4,B5:B4       ; |130| 
||         ADD     .S2     B31,B16,B8        ; |130| 

           ADD     .L2     B5,B9,B5          ; |130| 

           MV      .L1X    B4,A4             ; |130| 
||         ADD     .L2     B5,B8,B4          ; |130| 

           STDW    .D2T2   B7:B6,*B30        ; |128| 

           ADDKPC  .S2     $C$RL37,B3,0      ; |130| 
||         MV      .L1X    B4,A5             ; |130| 

$C$RL37:   ; CALL OCCURS {__c6xabi_fltllif} {0}  ; |130| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 15
           ZERO    .L1     A3
           SET     .S1     A3,0x1a,0x1d,A3
           MPYSP   .M1     A3,A4,A3          ; |130| 
           ZERO    .L1     A10               ; |130| 
           NOP             2
           SPDP    .S1     A3,A5:A4          ; |130| 
           NOP             1
           ADDDP   .L1     A11:A10,A5:A4,A5:A4 ; |130| 
           CALLP   .S2     __c6xabi_fixdlli,B3
$C$RL38:   ; CALL OCCURS {__c6xabi_fixdlli} {0}  ; |130| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 17

           ADDAD   .D2     B10,1,B13
||         MV      .L2X    A10,B5

           MV      .L2X    A10,B4
||         STDW    .D2T1   A5:A4,*B13        ; |130| 

           STDW    .D2T2   B5:B4,*+B10(16)   ; |114| 
||         MVC     .S2     B4,TSCL           ; |115| 

           MVC     .S2     TSCL,B6           ; |116| 
           MVC     .S2     TSCH,B4           ; |116| 

           MV      .L1     A15,A3            ; |116| 
||         MV      .L2     B4,B7             ; |116| 

           STDW    .D1T2   B7:B6,*A3         ; |116| 
||         MVC     .S2     TSCL,B4           ; |117| 

           MVC     .S2     TSCH,B8           ; |117| 
           SUBU    .L2     B4,B6,B5:B4       ; |117| 

           EXT     .S2     B5,24,24,B6       ; |117| 
||         SUB     .L2     B8,B7,B31         ; |117| 

           ADD     .L2     B31,B6,B5         ; |117| 

           STDW    .D2T2   B5:B4,*B12        ; |117| 
||         MVKL    .S2     input,B4

           MVKH    .S2     input,B4
           LDW     .D2T2   *B4,B4            ; |259| 
           MVK     .S2     0x80,B11
           ZERO    .L1     A15
           LDW     .D2T1   *+SP(76),A10      ; |117| 
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L20:    
;          EXCLUSIVE CPU CYCLES: 11
           LDW     .D1T1   *A14,A3           ; |259| 
           ADD     .L2X    A15,B4,B4         ; |259| 
           LDW     .D2T1   *B4,A4            ; |259| 
           NOP             2

           ADD     .L1     A15,A3,A3         ; |259| 
||         CALL    .S1     atan2sp_c         ; |259| 

           LDW     .D1T2   *A3,B4            ; |259| 
           ADDKPC  .S2     $C$RL39,B3,3      ; |259| 
$C$RL39:   ; CALL OCCURS {atan2sp_c} {0}     ; |259| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 7

           LDW     .D1T1   *A10,A3           ; |259| 
||         SUB     .L1X    B11,1,A0          ; |258| 

   [ A0]   MVKL    .S2     input,B4
|| [ A0]   B       .S1     $C$L20            ; |258| 

   [ A0]   MVKH    .S2     input,B4
   [ A0]   LDW     .D2T2   *B4,B4            ; |259| 
           SUB     .L2     B11,1,B11         ; |258| 

           ADD     .L1     A15,A3,A3         ; |259| 
||         ADD     .S1     4,A15,A15         ; |258| 

           STW     .D1T1   A4,*A3            ; |259| 
           ; BRANCHCC OCCURS {$C$L20}        ; |258| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 17
           MVC     .S2     TSCL,B8           ; |128| 
           MVC     .S2     TSCH,B4           ; |128| 

           MVKL    .S1     t_start,A15
||         MV      .L2     B12,B5

           MVKH    .S1     t_start,A15
||         LDDW    .D2T2   *B5,B7:B6         ; |130| 

           LDDW    .D1T1   *A15,A5:A4        ; |130| 
           MV      .L2     B4,B9             ; |128| 
           LDDW    .D2T2   *+B10(16),B17:B16 ; |130| 
           MVKL    .S2     t_stop,B11
           MVKH    .S2     t_stop,B11
           ADDU    .L2X    B6,A4,B5:B4       ; |130| 

           ADD     .S2     B5,B7,B6          ; |130| 
||         SUBU    .L2     B8,B4,B5:B4       ; |130| 

           ADD     .D2X    B6,A5,B6          ; |130| 
||         CALL    .S1     __c6xabi_fltllif  ; |130| 
||         EXT     .S2     B5,24,24,B7       ; |130| 
||         ADDU    .L2     B16,B4,B5:B4      ; |130| 

           SUB     .L2     B9,B6,B6          ; |130| 
||         ADD     .S2     B5,B17,B31        ; |130| 

           ADD     .L2     B6,B7,B5          ; |130| 
||         MV      .L1X    B4,A4             ; |130| 

           ADD     .L2     B31,B5,B4         ; |130| 
           STDW    .D2T2   B9:B8,*B11        ; |128| 

           MV      .L1X    B4,A5             ; |130| 
||         ADDKPC  .S2     $C$RL40,B3,0      ; |130| 

$C$RL40:   ; CALL OCCURS {__c6xabi_fltllif} {0}  ; |130| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 113
           ZERO    .L1     A3
           SET     .S1     A3,0x1a,0x1d,A3
           MPYSP   .M1     A3,A4,A3          ; |130| 
           ZERO    .L1     A10               ; |130| 
           NOP             3
           SPDP    .S2X    A3,B5:B4          ; |130| 
           NOP             2
           ADDDP   .L1X    A11:A10,B5:B4,A5:A4 ; |130| 
           CALLP   .S2     __c6xabi_fixdlli,B3
$C$RL41:   ; CALL OCCURS {__c6xabi_fixdlli} {0}  ; |130| 

           ADDAD   .D2     B13,1,B12
||         MV      .L2X    A10,B5

           MV      .L2X    A10,B4
||         STDW    .D2T1   A5:A4,*B12        ; |130| 

           STDW    .D2T2   B5:B4,*+B10(32)   ; |114| 
||         MVC     .S2     B4,TSCL           ; |115| 

           MVC     .S2     TSCL,B4           ; |116| 
           MVC     .S2     TSCH,B5           ; |116| 

           STDW    .D1T2   B5:B4,*A15        ; |116| 
||         MVC     .S2     TSCL,B6           ; |117| 

           MVC     .S2     TSCH,B8           ; |117| 
           MVKL    .S1     input,A3
           MVKH    .S1     input,A3
           SUBU    .L2     B6,B4,B7:B6       ; |117| 

           MV      .L2X    A3,B16            ; |266| 
||         MVKL    .S1     t_offset,A3

           MVKH    .S1     t_offset,A3

           MVKL    .S1     output,A10
||         MV      .L2X    A14,B9            ; |117| 
||         EXT     .S2     B7,24,24,B7       ; |117| 
||         SUB     .D2     B8,B5,B5          ; |117| 

           MVKH    .S1     output,A10
||         LDW     .D2T2   *B9,B4            ; |266| 
||         MV      .L2X    A3,B10            ; |117| 
||         ADD     .S2     B5,B7,B7          ; |117| 

           LDW     .D1T1   *+A10(16),A6      ; |266| 
||         STDW    .D2T2   B7:B6,*B10        ; |117| 
||         MVK     .S2     0x80,B6           ; |266| 

           CALLP   .S2     atan2sp_v,B3
||         LDW     .D2T1   *B16,A4           ; |266| 

$C$RL42:   ; CALL OCCURS {atan2sp_v} {0}     ; |266| 
           MVC     .S2     TSCL,B8           ; |128| 
           MVC     .S2     TSCH,B4           ; |128| 

           LDDW    .D1T1   *A15,A7:A6        ; |130| 
||         LDDW    .D2T2   *B10,B7:B6        ; |130| 

           MVK     .S1     16,A14
           ADD     .L1X    B12,A14,A14
           LDDW    .D1T1   *A14,A9:A8        ; |130| 
           MV      .L2     B4,B9             ; |128| 
           ADDU    .L1X    B6,A6,A5:A4       ; |130| 
           SUBU    .L1X    B8,A4,A17:A16     ; |130| 
           ADD     .L1X    A5,B7,A4          ; |130| 

           MV      .L1     A16,A3            ; |130| 
||         ADD     .D1     A4,A7,A4          ; |130| 
||         EXT     .S1     A17,24,24,A6      ; |130| 

           SUB     .S1X    B9,A4,A3          ; |130| 
||         ADDU    .L1     A8,A3,A5:A4       ; |130| 

           ADD     .L1     A5,A9,A3          ; |130| 
||         ADD     .S1     A3,A6,A5          ; |130| 

           CALLP   .S2     __c6xabi_fltllif,B3
||         ADD     .L1     A3,A5,A5          ; |130| 
||         STDW    .D2T2   B9:B8,*B11        ; |128| 

$C$RL43:   ; CALL OCCURS {__c6xabi_fltllif} {0}  ; |130| 
           ZERO    .L1     A3
           SET     .S1     A3,0x1a,0x1d,A3
           MPYSP   .M1     A3,A4,A3          ; |130| 
           ZERO    .L1     A4                ; |130| 
           MV      .L1     A11,A5            ; |130| 
           NOP             2
           SPDP    .S1     A3,A7:A6          ; |130| 
           NOP             1
           ADDDP   .L1     A5:A4,A7:A6,A5:A4 ; |130| 
           CALLP   .S2     __c6xabi_fixdlli,B3
$C$RL44:   ; CALL OCCURS {__c6xabi_fixdlli} {0}  ; |130| 
           MVKL    .S2     0x3eb0c6f7,B7
           MVKL    .S2     0xa0b5ed8d,B6

           STDW    .D1T1   A5:A4,*A14        ; |130| 
||         MVKH    .S2     0x3eb0c6f7,B7

           LDW     .D1T2   *+A10(4),B4       ; |66| 
||         MVKH    .S2     0xa0b5ed8d,B6

           CALLP   .S2     isequal,B3
||         LDW     .D1T1   *A10,A4           ; |66| 
||         MVK     .S1     0x80,A6           ; |66| 
||         MVK     .L1     0x1,A8            ; |66| 

$C$RL45:   ; CALL OCCURS {isequal} {0}       ; |66| 

           MVKL    .S1     fcn_pass,A3
||         MVKL    .S2     0xa0b5ed8d,B6

           MVKH    .S1     fcn_pass,A3
||         MVKL    .S2     0x3eb0c6f7,B7

           MVKH    .S2     0xa0b5ed8d,B6

           MV      .L1     A4,A5             ; |66| 
||         LDW     .D1T1   *A10,A4           ; |67| 
||         MV      .L2X    A3,B10            ; |66| 
||         MVKH    .S2     0x3eb0c6f7,B7

           CALLP   .S2     isequal,B3
||         LDW     .D1T2   *+A10(8),B4       ; |67| 
||         STW     .D2T1   A5,*+B10(4)       ; |66| 
||         MVK     .S1     0x80,A6           ; |67| 
||         MVK     .L1     0x1,A8            ; |67| 

$C$RL46:   ; CALL OCCURS {isequal} {0}       ; |67| 
           MVKL    .S2     0x3eb0c6f7,B7
           MVKL    .S2     0xa0b5ed8d,B6
           MVKH    .S2     0x3eb0c6f7,B7

           STW     .D2T1   A4,*+B10(8)       ; |67| 
||         LDW     .D1T2   *+A10(12),B4      ; |68| 
||         MVKH    .S2     0xa0b5ed8d,B6

           CALLP   .S2     isequal,B3
||         LDW     .D1T1   *A10,A4           ; |68| 
||         MVK     .S1     0x80,A6           ; |68| 
||         MVK     .L1     0x1,A8            ; |68| 

$C$RL47:   ; CALL OCCURS {isequal} {0}       ; |68| 
           MVKL    .S2     0x3eb0c6f7,B7
           MVKL    .S2     0xa0b5ed8d,B6
           MVKH    .S2     0x3eb0c6f7,B7

           STW     .D2T1   A4,*+B10(12)      ; |68| 
||         LDW     .D1T2   *A13,B4           ; |69| 
||         MVKH    .S2     0xa0b5ed8d,B6

           CALLP   .S2     isequal,B3
||         LDW     .D1T1   *A10,A4           ; |69| 
||         MVK     .S1     0x80,A6           ; |69| 
||         MVK     .L1     0x1,A8            ; |69| 

$C$RL48:   ; CALL OCCURS {isequal} {0}       ; |69| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 11
           LDW     .D1T2   *A12,B0           ; |72| 
           LDW     .D2T2   *+SP(84),B5
           MV      .L2X    A4,B4             ; |69| 
           STW     .D2T2   B4,*+B10(16)      ; |69| 
           NOP             1

   [!B0]   BNOP    .S1     $C$L21,1          ; |72| 
||         MV      .L2     B0,B1             ; guard predicate rewrite

   [ B0]   LDW     .D2T2   *B5,B0            ; |72| 
   [ B1]   ADD     .L2     4,B5,B5
           NOP             2
           ; BRANCHCC OCCURS {$C$L21}        ; |72| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 15
           CMPEQ   .L2     B4,0,B31          ; |72| 
   [ B0]   LDW     .D2T2   *B5,B6            ; |72| 
           XOR     .L2     1,B31,B5          ; |72| 
           MVK     .L1     0x1,A3            ; |72| 
           NOP             2
   [ B0]   CMPEQ   .L2     B6,0,B4           ; |72| 
   [ B0]   XOR     .L2     1,B4,B4           ; |72| 

   [ B0]   AND     .L2     B5,B4,B0          ; |72| 
|| [!B0]   ZERO    .S2     B0                ; |72| 

   [ B0]   B       .S1     $C$L22            ; |72| 
   [ B0]   CALL    .S1     print_test_results ; |272| 
   [ B0]   MVKL    .S1     all_pass,A4
   [ B0]   MVKH    .S1     all_pass,A4
           NOP             2
           ; BRANCHCC OCCURS {$C$L22}        ; |72| 
;** --------------------------------------------------------------------------*
$C$L21:    
;          EXCLUSIVE CPU CYCLES: 5
           CALL    .S1     print_test_results ; |272| 
           MVKL    .S1     all_pass,A4
           MVKH    .S1     all_pass,A4
           ZERO    .L1     A3                ; |72| 
           NOP             1
;** --------------------------------------------------------------------------*
$C$L22:    
;          EXCLUSIVE CPU CYCLES: 1

           STW     .D1T1   A3,*A4            ; |72| 
||         MVK     .L1     0x2,A4            ; |272| 
||         ADDKPC  .S2     $C$RL49,B3,0      ; |272| 

$C$RL49:   ; CALL OCCURS {print_test_results} {0}  ; |272| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 30
           MVKL    .S2     $C$SL2+0,B4
           MVKH    .S2     $C$SL2+0,B4

           CALLP   .S2     printf,B3
||         STW     .D2T2   B4,*+SP(4)        ; |273| 

$C$RL50:   ; CALL OCCURS {printf} {0}        ; |273| 
           MVKL    .S2     $C$SL3+0,B4
           MVKH    .S2     $C$SL3+0,B4

           CALLP   .S2     printf,B3
||         STW     .D2T2   B4,*+SP(4)        ; |273| 

$C$RL51:   ; CALL OCCURS {printf} {0}        ; |273| 
           MVKL    .S1     $C$SL1+0,A10
           MVKH    .S1     $C$SL1+0,A10

           CALLP   .S2     print_profile_results,B3
||         MV      .L1     A10,A4            ; |280| 

$C$RL52:   ; CALL OCCURS {print_profile_results} {0}  ; |280| 

           CALLP   .S2     print_memory_results,B3
||         MV      .L1     A10,A4            ; |283| 

$C$RL53:   ; CALL OCCURS {print_memory_results} {0}  ; |283| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 11
           LDW     .D2T2   *++SP(104),B3     ; |284| 
           LDDW    .D2T1   *++SP,A13:A12     ; |284| 
           LDDW    .D2T1   *++SP,A15:A14     ; |284| 
           LDDW    .D2T2   *++SP,B11:B10     ; |284| 
           LDDW    .D2T2   *++SP,B13:B12     ; |284| 

           LDW     .D2T1   *++SP(8),A10      ; |284| 
||         RET     .S2     B3                ; |284| 

           LDW     .D2T1   *++SP(8),A11      ; |284| 
           NOP             4
           ; BRANCH OCCURS {B3}              ; |284| 
;******************************************************************************
;* STRINGS                                                                    *
;******************************************************************************
	.sect	".const:.string"
$C$SL1:	.string	"atan2SP",0
$C$SL2:	.string	"----------------------------------------",0
$C$SL3:	.string	"----------------------------------------",10,0
;*****************************************************************************
;* UNDEFINED EXTERNAL REFERENCES                                             *
;*****************************************************************************
	.global	printf
	.global	atan2
	.global	atan2f
	.global	driver_init
	.global	print_profile_results
	.global	print_memory_results
	.global	print_test_results
	.global	gimme_random
	.global	isequal
	.global	atan2sp
	.global	atan2sp_c
	.global	atan2sp_v
	.global	t_start
	.global	t_stop
	.global	t_offset
	.global	cycle_counts
	.global	fcn_pass
	.global	all_pass
	.global	a_ext
	.global	b_ext
	.global	a_sc
	.global	b_sc
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
