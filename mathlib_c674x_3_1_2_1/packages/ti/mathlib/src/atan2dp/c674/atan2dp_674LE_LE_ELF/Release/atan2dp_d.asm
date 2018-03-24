;******************************************************************************
;* TMS320C6x C/C++ Codegen                                          PC v7.4.2 *
;* Date/Time created: Mon May 16 23:36:17 2016                                *
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
	.word	0436c665bh,040028220h		; a[0] @ 0
	.word	0dd18746bh,03ffe598bh		; a[1] @ 64
	.word	00510e0f9h,0bfb35f8eh		; a[2] @ 128
	.word	044000a11h,03fec60b0h		; a[3] @ 192
	.word	0ac99509eh,0bfef5c9bh		; a[4] @ 256
	.word	081bc2d42h,03fc761b8h		; a[5] @ 320
	.word	0bf147d66h,0bff1d973h		; a[6] @ 384
	.word	09c0229a6h,0bff0c5deh		; a[7] @ 448
	.word	0577e6c17h,03ffa585fh		; a[8] @ 512
	.word	08f359289h,0bfeba768h		; a[9] @ 576
	.word	0bb40b34eh,0bfeb4a43h		; a[10] @ 640
	.word	000713f07h,0bfff1efdh		; a[11] @ 704
	.word	0595281adh,0c0051cb9h		; a[12] @ 768
	.word	0841fb4d1h,03fe0b5dbh		; a[13] @ 832
	.word	033ccb627h,040069340h		; a[14] @ 896
	.word	09a9b2159h,0bfef61bah		; a[15] @ 960
	.word	0eec1ea1bh,0c0091385h		; a[16] @ 1024
	.word	0d01e90e5h,0bffe81e3h		; a[17] @ 1088
	.word	021f1c250h,0c002914dh		; a[18] @ 1152
	.word	0f904633ch,03ff06f7eh		; a[19] @ 1216
	.word	040aaeafbh,04006962dh		; a[20] @ 1280
	.word	0595281adh,040051cb9h		; a[21] @ 1344
	.word	0fc0096ffh,03ff20a53h		; a[22] @ 1408
	.word	0bb3f05cfh,03ff5978dh		; a[23] @ 1472
	.word	07d8c1cd9h,0c0074d6eh		; a[24] @ 1536
	.word	0f06a60c7h,0bfff7163h		; a[25] @ 1600
	.word	061a2b247h,0c004838ch		; a[26] @ 1664
	.word	0b0a62599h,03ffe47f7h		; a[27] @ 1728
	.word	0b81585a3h,0c0027386h		; a[28] @ 1792
	.word	0f19feaech,0c0010d8eh		; a[29] @ 1856
	.word	036c8132ah,03fdf14bah		; a[30] @ 1920
	.word	0486d571bh,04005ffedh		; a[31] @ 1984
	.word	0638e44d2h,03ffeaddah		; a[32] @ 2048
	.word	0dd93c46eh,03ff508cch		; a[33] @ 2112
	.word	0e8e1d649h,0c0063d2ah		; a[34] @ 2176
	.word	058c238f5h,040020395h		; a[35] @ 2240
	.word	0a33cb08ah,0bff14408h		; a[36] @ 2304
	.word	086e3b470h,0bfddcddfh		; a[37] @ 2368
	.word	041d58d66h,0bffee8b9h		; a[38] @ 2432
	.word	0606092e8h,0c0087b0ch		; a[39] @ 2496
	.word	0b0a11d1ch,03ff6cfd5h		; a[40] @ 2560
	.word	09c403d07h,03fe99a2ch		; a[41] @ 2624
	.word	0b796daa2h,0bfef4ed9h		; a[42] @ 2688
	.word	03afaa7d1h,03fdf9515h		; a[43] @ 2752
	.word	02af4a050h,03ff5e0d7h		; a[44] @ 2816
	.word	0433863f5h,0bff00e16h		; a[45] @ 2880
	.word	0572c36c0h,03fe44389h		; a[46] @ 2944
	.word	0ebb418a1h,0bfd64439h		; a[47] @ 3008
	.word	0b8503e06h,03ff91268h		; a[48] @ 3072
	.word	01f03d146h,0bff21583h		; a[49] @ 3136
	.word	055fbb518h,03ffaaf80h		; a[50] @ 3200
	.word	0daf5847ch,0bffce5c7h		; a[51] @ 3264
	.word	0e873f240h,040084399h		; a[52] @ 3328
	.word	02110f1c0h,0c007c609h		; a[53] @ 3392
	.word	0500a038fh,0bfed84aeh		; a[54] @ 3456
	.word	0e7ad22e3h,0bffc4a5ah		; a[55] @ 3520
	.word	0ed51a793h,0bff3d878h		; a[56] @ 3584
	.word	09fe5e3f5h,03fefb6cfh		; a[57] @ 3648
	.word	0023711e5h,03fe7344ch		; a[58] @ 3712
	.word	03c40222fh,03fb10301h		; a[59] @ 3776
	.word	0e2386edch,0bff3217fh		; a[60] @ 3840
	.word	0fbfc6541h,0c0037b8ch		; a[61] @ 3904
	.word	0ebbba55dh,03fb5c86ch		; a[62] @ 3968
	.word	0cd35a858h,04001ae3bh		; a[63] @ 4032
	.word	0d5e727c2h,0bff1724ah		; a[64] @ 4096
	.word	0ac215b9ah,0c00842c6h		; a[65] @ 4160
	.word	082a48a8eh,03ff6512fh		; a[66] @ 4224
	.word	0f965b20ch,03ff5ccbah		; a[67] @ 4288
	.word	092b4a30ah,0bfe635b1h		; a[68] @ 4352
	.word	0017a5383h,03ff5ab51h		; a[69] @ 4416
	.word	0ca8e2e2ch,03fec144dh		; a[70] @ 4480
	.word	038cbf968h,0bff1de57h		; a[71] @ 4544
	.word	04d940789h,0bff8a2b9h		; a[72] @ 4608
	.word	019b258adh,0bff75596h		; a[73] @ 4672
	.word	0b6177ea2h,0bfe76b66h		; a[74] @ 4736
	.word	078798e61h,03fdfbb2ah		; a[75] @ 4800
	.word	0c94f69cbh,0bfe33139h		; a[76] @ 4864
	.word	0b600d86dh,0bfd11ecdh		; a[77] @ 4928
	.word	0e051e4cfh,03ffdcf53h		; a[78] @ 4992
	.word	02334b86eh,0c0022328h		; a[79] @ 5056
	.word	00f0a5effh,0c007dd9ah		; a[80] @ 5120
	.word	093b04b8dh,03ffcac55h		; a[81] @ 5184
	.word	0ffac1d2ah,0bfe01873h		; a[82] @ 5248
	.word	0b85da9ffh,0bfeea818h		; a[83] @ 5312
	.word	06697e48eh,0c0074e5fh		; a[84] @ 5376
	.word	0d30e2f6eh,0bfca0063h		; a[85] @ 5440
	.word	0fd9e25f0h,03fce9e92h		; a[86] @ 5504
	.word	0bac2084eh,0bff45596h		; a[87] @ 5568
	.word	05d0fa58fh,0c005cf50h		; a[88] @ 5632
	.word	0338dcc06h,0bfd8e597h		; a[89] @ 5696
	.word	0d52205e4h,0c0026bc1h		; a[90] @ 5760
	.word	0a301f828h,03ffbd526h		; a[91] @ 5824
	.word	0d8d36b4ch,0bfc60b5eh		; a[92] @ 5888
	.word	07ba9c48ah,0bfebba09h		; a[93] @ 5952
	.word	06e1c3d4dh,0400583d1h		; a[94] @ 6016
	.word	0a464ceb7h,0bff4ba83h		; a[95] @ 6080
	.word	05569bee0h,0bff1d3a6h		; a[96] @ 6144
	.word	021583f5ch,03fe4e140h		; a[97] @ 6208
	.word	07df4f865h,0bff00eddh		; a[98] @ 6272
	.word	0fbc2839eh,0c0044605h		; a[99] @ 6336
	.word	0fdb09a67h,0bfe34c64h		; a[100] @ 6400
	.word	0c02e58d9h,0bff7c0e3h		; a[101] @ 6464
	.word	07285589ah,03fc7a447h		; a[102] @ 6528
	.word	085a84b0dh,0c0026037h		; a[103] @ 6592
	.word	00445dfdeh,0bffba788h		; a[104] @ 6656
	.word	0fa998eb2h,0c001562fh		; a[105] @ 6720
	.word	05493d60bh,0bfed5201h		; a[106] @ 6784
	.word	04fae93fdh,0c00588efh		; a[107] @ 6848
	.word	0bafd9770h,0c008bdd3h		; a[108] @ 6912
	.word	0bf45fb8dh,03ffe716ch		; a[109] @ 6976
	.word	01e1594bdh,0bfe3b48fh		; a[110] @ 7040
	.word	02e5654a0h,0bff377afh		; a[111] @ 7104
	.word	0a0217317h,03ff4ff0ch		; a[112] @ 7168
	.word	046d175a9h,0bfcf0e64h		; a[113] @ 7232
	.word	0c640c191h,04007e892h		; a[114] @ 7296
	.word	0389217c5h,0400658d0h		; a[115] @ 7360
	.word	0f13e9c1dh,040081052h		; a[116] @ 7424
	.word	0782e0f07h,0c004412ch		; a[117] @ 7488
	.word	0af17b020h,0c003ec1eh		; a[118] @ 7552
	.word	0fe9e0031h,03fffd3fdh		; a[119] @ 7616
	.word	0cb8d31ach,0bffd305dh		; a[120] @ 7680
	.word	0c1490b0ch,0bfe441aeh		; a[121] @ 7744
	.word	0a212e4dfh,03fbffad7h		; a[122] @ 7808
	.word	0bc24081dh,0bfcec198h		; a[123] @ 7872
	.word	033ca31e8h,0bf8d872fh		; a[124] @ 7936
	.word	0e757928eh,03ffb9018h		; a[125] @ 8000
	.word	07491a254h,03ff3eb72h		; a[126] @ 8064
	.word	0ca1dc5e4h,0c0015eabh		; a[127] @ 8128
	.word	0d39a4668h,03ff04ac0h		; a[128] @ 8192
	.word	082bb30c3h,0bfef7dc8h		; a[129] @ 8256
	.word	0ce131deah,03ffe5413h		; a[130] @ 8320
	.word	0c2e33effh,040031081h		; a[131] @ 8384
	.word	059f4681ch,0bff95a54h		; a[132] @ 8448
	.word	0c33b5393h,04006b6d4h		; a[133] @ 8512
	.word	0e88eca33h,03ff82ef9h		; a[134] @ 8576
	.word	0aae79fb7h,0bff1a7d4h		; a[135] @ 8640
	.word	04cddff24h,03fa0a496h		; a[136] @ 8704
	.word	074312a44h,0c0010791h		; a[137] @ 8768
	.word	07ba30e8dh,0c002df31h		; a[138] @ 8832
	.word	0f0d18ed3h,04005a01ch		; a[139] @ 8896
	.word	042162505h,0bfe14918h		; a[140] @ 8960
	.word	099440944h,0bff8bf57h		; a[141] @ 9024
	.word	033d36c23h,0bff41e18h		; a[142] @ 9088
	.word	02f166e01h,040006616h		; a[143] @ 9152
	.word	0282ac175h,03ff19756h		; a[144] @ 9216
	.word	0b1407f4ch,0bffb015fh		; a[145] @ 9280
	.word	0f047fc18h,0bff361d0h		; a[146] @ 9344
	.word	02e9da23dh,04002c2e6h		; a[147] @ 9408
	.word	08169212ch,03ff31387h		; a[148] @ 9472
	.word	0cef317bah,03fff65fch		; a[149] @ 9536
	.word	08c840761h,040057d36h		; a[150] @ 9600
	.word	030347b32h,03feeac4dh		; a[151] @ 9664
	.word	054d97628h,03fe46a82h		; a[152] @ 9728
	.word	0325d4a5eh,0bfde118eh		; a[153] @ 9792
	.word	02f0e0a85h,03fee8888h		; a[154] @ 9856
	.word	0b6d6c142h,0bfd1c072h		; a[155] @ 9920
	.word	07f081ddch,0bff8cb75h		; a[156] @ 9984
	.word	05baf533fh,0bffb2604h		; a[157] @ 10048
	.word	07dabfd49h,03ff330f0h		; a[158] @ 10112
	.word	031cc2ae6h,0bff44f0fh		; a[159] @ 10176
	.word	0e6347cdfh,0bffbf1bfh		; a[160] @ 10240
	.word	0f9ca5bd9h,0c0038f62h		; a[161] @ 10304
	.word	0bf104ba8h,04007eaach		; a[162] @ 10368
	.word	097d8cf3ah,040054c6ch		; a[163] @ 10432
	.word	088eaf5adh,03ffdbce8h		; a[164] @ 10496
	.word	0b124d09ah,03fef1ca4h		; a[165] @ 10560
	.word	067798bddh,0c001c2feh		; a[166] @ 10624
	.word	0bb6ed677h,03ffb5cd0h		; a[167] @ 10688
	.word	08b9fdbd3h,040081c86h		; a[168] @ 10752
	.word	01f2a67b3h,0c00093ddh		; a[169] @ 10816
	.word	038433d6ch,03fe05966h		; a[170] @ 10880
	.word	09a657174h,0c007fafah		; a[171] @ 10944
	.word	09e4275c6h,0bfa73113h		; a[172] @ 11008
	.word	0ffe6d58dh,03ff2e755h		; a[173] @ 11072
	.word	0c41b4d63h,0bfeba8bdh		; a[174] @ 11136
	.word	01a9e10f8h,03fd9ea79h		; a[175] @ 11200
	.word	0255a2c9ch,03ffe02fdh		; a[176] @ 11264
	.word	0f2b08c24h,040076e15h		; a[177] @ 11328
	.word	075b8e9c1h,0bff54892h		; a[178] @ 11392
	.word	06327ed85h,0c008d87ch		; a[179] @ 11456
	.word	03a406daeh,0c006e82bh		; a[180] @ 11520
	.word	000607810h,0bfc943e1h		; a[181] @ 11584
	.word	09fe288f7h,040035163h		; a[182] @ 11648
	.word	02d9b43beh,03ff1c16ah		; a[183] @ 11712
	.word	0fe2cc129h,0c0032500h		; a[184] @ 11776
	.word	0fdc08a9fh,0bfe80e25h		; a[185] @ 11840
	.word	0ed4009dbh,0bfe3c401h		; a[186] @ 11904
	.word	05d31337fh,03fe8d588h		; a[187] @ 11968
	.word	0acc26b4ah,03fe89706h		; a[188] @ 12032
	.word	0233fa029h,03fe64cc7h		; a[189] @ 12096
	.word	011b386abh,03ffcca3eh		; a[190] @ 12160
	.word	0489dfe83h,03fe5ce8bh		; a[191] @ 12224
	.word	0950408a3h,04002e94ch		; a[192] @ 12288
	.word	0b6cd8707h,03ffca989h		; a[193] @ 12352
	.word	0b1be538dh,03ff79cb1h		; a[194] @ 12416
	.word	069e72467h,0c0036765h		; a[195] @ 12480
	.word	028035448h,040052fa1h		; a[196] @ 12544
	.word	0515f6e25h,0bffa345bh		; a[197] @ 12608
	.word	0964db4bfh,03fe9f5ffh		; a[198] @ 12672
	.word	0d6890e31h,0bfeeafe5h		; a[199] @ 12736
	.word	0d39614aah,03fb04bf9h		; a[200] @ 12800

	.global	b
	.sect	".fardata:b", RW
	.clink
	.align	8
	.elfsym	b,SYM_SIZE(1608)
b:
	.word	088cd997bh,0c056d077h		; b[0] @ 0
	.word	08c7ba3e5h,04032bda8h		; b[1] @ 64
	.word	0c4b24c18h,0c04aeeb9h		; b[2] @ 128
	.word	06cbf45fch,0c052f071h		; b[3] @ 192
	.word	0bb63eebdh,0405813b1h		; b[4] @ 256
	.word	0efc5f619h,0c01e6fb7h		; b[5] @ 320
	.word	0dfb0d520h,0c0333513h		; b[6] @ 384
	.word	0fb8978bah,040568659h		; b[7] @ 448
	.word	02aa341b9h,04021a95ch		; b[8] @ 512
	.word	0bbbb2c91h,0404d0929h		; b[9] @ 576
	.word	08c30248bh,0c04b93aah		; b[10] @ 640
	.word	044383e35h,040548c81h		; b[11] @ 704
	.word	0ce63a5c2h,04056b2b3h		; b[12] @ 768
	.word	0e76427c8h,04051996dh		; b[13] @ 832
	.word	09c3702cch,0404b3243h		; b[14] @ 896
	.word	073ad76c6h,0403beec2h		; b[15] @ 960
	.word	05e7d63d9h,0c051b74ch		; b[16] @ 1024
	.word	0157689cah,0403cc652h		; b[17] @ 1088
	.word	0553840b9h,04050ffadh		; b[18] @ 1152
	.word	025fc130bh,0c0119898h		; b[19] @ 1216
	.word	0c4a332a0h,0404c3153h		; b[20] @ 1280
	.word	01e166b7ch,040522eeah		; b[21] @ 1344
	.word	0a1e3eaf7h,0405672efh		; b[22] @ 1408
	.word	07164c72ah,03fe4d1ffh		; b[23] @ 1472
	.word	0cb6192c2h,0c04aa0e1h		; b[24] @ 1536
	.word	05113180bh,04056a002h		; b[25] @ 1600
	.word	0de1c8069h,0c04131bdh		; b[26] @ 1664
	.word	0ca940d69h,03fc7e5cah		; b[27] @ 1728
	.word	0cc48428fh,040326aa2h		; b[28] @ 1792
	.word	0fcff9a7fh,0c05664e3h		; b[29] @ 1856
	.word	0ad6f3974h,0405583c0h		; b[30] @ 1920
	.word	0022c2a2ah,04058082dh		; b[31] @ 1984
	.word	075d2eaf4h,04040d297h		; b[32] @ 2048
	.word	0d8ce62cfh,0c057653ch		; b[33] @ 2112
	.word	037fd9d4fh,0c02ae4e5h		; b[34] @ 2176
	.word	02ea6dc78h,0c05065cfh		; b[35] @ 2240
	.word	07afcf660h,0c058f04fh		; b[36] @ 2304
	.word	043201041h,0c01166c7h		; b[37] @ 2368
	.word	08d045fe1h,0c04c4c99h		; b[38] @ 2432
	.word	0f3b56ee2h,0c05857a2h		; b[39] @ 2496
	.word	06d670ba8h,04050bb89h		; b[40] @ 2560
	.word	07ef82da4h,04043a5b4h		; b[41] @ 2624
	.word	0c8d5c747h,0c033f0aeh		; b[42] @ 2688
	.word	0b4e11dbdh,0c0504ee0h		; b[43] @ 2752
	.word	01e4c1b62h,0c052012ah		; b[44] @ 2816
	.word	02a67b297h,040447f1fh		; b[45] @ 2880
	.word	07f5118f7h,0404f3862h		; b[46] @ 2944
	.word	0014b599bh,0c0576269h		; b[47] @ 3008
	.word	048de9623h,0403428eah		; b[48] @ 3072
	.word	090ad61cdh,0c048a1a8h		; b[49] @ 3136
	.word	029040548h,0405855e7h		; b[50] @ 3200
	.word	050184648h,0404314b9h		; b[51] @ 3264
	.word	08f1c6816h,04038febeh		; b[52] @ 3328
	.word	0c71a0565h,0404ceda3h		; b[53] @ 3392
	.word	0c348bf8ch,0c04ddc84h		; b[54] @ 3456
	.word	03dbc2331h,040579488h		; b[55] @ 3520
	.word	03bd746a3h,0c040bf92h		; b[56] @ 3584
	.word	0097e2e03h,03fff2ecbh		; b[57] @ 3648
	.word	09f44d445h,0c02a468fh		; b[58] @ 3712
	.word	0c59677a6h,0c0315969h		; b[59] @ 3776
	.word	066e0dfa9h,0402fa44ch		; b[60] @ 3840
	.word	0f56b5188h,0c0443330h		; b[61] @ 3904
	.word	0569cc4c7h,0c035b1c0h		; b[62] @ 3968
	.word	00c3d2524h,0c04759adh		; b[63] @ 4032
	.word	0279f813ah,04054dbd4h		; b[64] @ 4096
	.word	07551bbb4h,0404c0cd9h		; b[65] @ 4160
	.word	07c4e2f38h,0bfeea3b5h		; b[66] @ 4224
	.word	0b3ac6a57h,0400c9310h		; b[67] @ 4288
	.word	06f0c2756h,0403a2d7bh		; b[68] @ 4352
	.word	081bd0402h,0c0452f13h		; b[69] @ 4416
	.word	09e774eech,04052fdf8h		; b[70] @ 4480
	.word	07b1c0011h,04051e9f6h		; b[71] @ 4544
	.word	02af8d20eh,04045ac9eh		; b[72] @ 4608
	.word	0ff609dd0h,040529975h		; b[73] @ 4672
	.word	07368ad69h,0c031a79ch		; b[74] @ 4736
	.word	02f789390h,0404446adh		; b[75] @ 4800
	.word	083997d14h,04053c27bh		; b[76] @ 4864
	.word	08954a7f8h,0c04284b2h		; b[77] @ 4928
	.word	0cac58b90h,0404028c3h		; b[78] @ 4992
	.word	07224e08ah,0c05012e6h		; b[79] @ 5056
	.word	08023a6ceh,040355d9bh		; b[80] @ 5120
	.word	0848387dfh,0c053cda8h		; b[81] @ 5184
	.word	000390ae4h,04055cc2ch		; b[82] @ 5248
	.word	01862cd55h,0c05228e6h		; b[83] @ 5312
	.word	06e7bde9eh,0c058c657h		; b[84] @ 5376
	.word	0efde49cdh,0c0254f06h		; b[85] @ 5440
	.word	026bc2c6ch,0c049d0ffh		; b[86] @ 5504
	.word	0545acb28h,0c0512955h		; b[87] @ 5568
	.word	0082c1e6ch,04057408ah		; b[88] @ 5632
	.word	093972119h,0c0468aabh		; b[89] @ 5696
	.word	0e8a13eaah,0c04295cbh		; b[90] @ 5760
	.word	00148d55ch,04014c358h		; b[91] @ 5824
	.word	0079d8333h,0c054ec9ch		; b[92] @ 5888
	.word	05fc059f8h,0c04a1a27h		; b[93] @ 5952
	.word	0200ce5c2h,0403597d7h		; b[94] @ 6016
	.word	059070253h,0c04996bbh		; b[95] @ 6080
	.word	0b0b615d1h,040404fb8h		; b[96] @ 6144
	.word	0fcc5b8dch,040445ddch		; b[97] @ 6208
	.word	054782759h,0c0448d46h		; b[98] @ 6272
	.word	0ae7ba8eeh,0c0570c80h		; b[99] @ 6336
	.word	02684cf07h,04047ea89h		; b[100] @ 6400
	.word	0b08ea8a5h,04049a403h		; b[101] @ 6464
	.word	050e0c324h,0c0477eaeh		; b[102] @ 6528
	.word	092ca727fh,0c03b86efh		; b[103] @ 6592
	.word	0134988e0h,0c055d9cah		; b[104] @ 6656
	.word	0bb659c3ch,0c04de2e7h		; b[105] @ 6720
	.word	0e47e9a3ah,0c052a4b1h		; b[106] @ 6784
	.word	00af1cb8ah,0c039f144h		; b[107] @ 6848
	.word	078b87882h,0c05399d3h		; b[108] @ 6912
	.word	042975445h,04028c1d6h		; b[109] @ 6976
	.word	0a2cd1f02h,0c04d2ac1h		; b[110] @ 7040
	.word	0810a569bh,04056585ch		; b[111] @ 7104
	.word	0a1cac083h,0c0566645h		; b[112] @ 7168
	.word	0bfd99f43h,0c05571fch		; b[113] @ 7232
	.word	0d66fe3beh,040281b3bh		; b[114] @ 7296
	.word	0824264ffh,040440798h		; b[115] @ 7360
	.word	0c2f405f7h,0404ede9dh		; b[116] @ 7424
	.word	0f640639dh,04044777ah		; b[117] @ 7488
	.word	0ad299956h,04055f2bfh		; b[118] @ 7552
	.word	07f0b78dah,040562661h		; b[119] @ 7616
	.word	0a0854625h,0c058ce59h		; b[120] @ 7680
	.word	0f05f790ch,0c0526f44h		; b[121] @ 7744
	.word	0b02c8316h,04050cf6ch		; b[122] @ 7808
	.word	0b48d3ae7h,040458c54h		; b[123] @ 7872
	.word	09513f8dbh,04057658dh		; b[124] @ 7936
	.word	00918ad76h,040498ac8h		; b[125] @ 8000
	.word	0a23cd64ah,0c021929dh		; b[126] @ 8064
	.word	05f7403deh,0404bd3ceh		; b[127] @ 8128
	.word	0ad7af7eeh,0404b783ah		; b[128] @ 8192
	.word	089b0ee4ah,04042facch		; b[129] @ 8256
	.word	0163baba8h,04044b4dbh		; b[130] @ 8320
	.word	0af5847c0h,040359e7dh		; b[131] @ 8384
	.word	0053d56a3h,0c04d5b65h		; b[132] @ 8448
	.word	0b81a8e21h,0404abaa8h		; b[133] @ 8512
	.word	059ba8679h,0c04917cdh		; b[134] @ 8576
	.word	0cb2be2ddh,0c0353321h		; b[135] @ 8640
	.word	089eacfedh,04049c453h		; b[136] @ 8704
	.word	0bc027a2eh,040250b60h		; b[137] @ 8768
	.word	024122e00h,0c02d3d00h		; b[138] @ 8832
	.word	0b26b21b7h,0c0565aebh		; b[139] @ 8896
	.word	03315d702h,0403c99c2h		; b[140] @ 8960
	.word	01a3a3de9h,0c042e72ch		; b[141] @ 9024
	.word	0252a5bf4h,0c041e4bah		; b[142] @ 9088
	.word	0715908b0h,0c04bd305h		; b[143] @ 9152
	.word	022050d86h,0404ee37ah		; b[144] @ 9216
	.word	059b8d8fah,0c0573917h		; b[145] @ 9280
	.word	0d8680b82h,040479bdeh		; b[146] @ 9344
	.word	0f1bc705eh,0c04965a4h		; b[147] @ 9408
	.word	002cab59bh,04054815ch		; b[148] @ 9472
	.word	01d54a49dh,0c0282ccdh		; b[149] @ 9536
	.word	068ac91c4h,0c0502598h		; b[150] @ 9600
	.word	07ad736b3h,0c04e1ad0h		; b[151] @ 9664
	.word	08b46f07fh,0c04303d8h		; b[152] @ 9728
	.word	0ef9db22dh,040566da7h		; b[153] @ 9792
	.word	09a2eeacfh,040530adfh		; b[154] @ 9856
	.word	0f090f734h,040524e3dh		; b[155] @ 9920
	.word	02d82194ah,0c0531040h		; b[156] @ 9984
	.word	0ea8da7f4h,040453574h		; b[157] @ 10048
	.word	02b5a20deh,0404e72dah		; b[158] @ 10112
	.word	05de085e7h,04049b5d3h		; b[159] @ 10176
	.word	0a501aca8h,0c051fe7ch		; b[160] @ 10240
	.word	0bc54af85h,04033f236h		; b[161] @ 10304
	.word	01ebe3129h,04036a902h		; b[162] @ 10368
	.word	0eede6f8ch,0c0541e1bh		; b[163] @ 10432
	.word	008d66857h,040541133h		; b[164] @ 10496
	.word	0fe5fecd0h,0c04e45afh		; b[165] @ 10560
	.word	090a6abd1h,0404472d0h		; b[166] @ 10624
	.word	0d5629d84h,04050ae20h		; b[167] @ 10688
	.word	0c75ecec2h,0403f8ac9h		; b[168] @ 10752
	.word	062ce2b72h,0404e4873h		; b[169] @ 10816
	.word	0b960df3eh,0c04fa3efh		; b[170] @ 10880
	.word	072332343h,0403a2f71h		; b[171] @ 10944
	.word	02bc804e7h,0c038a66bh		; b[172] @ 11008
	.word	01ef15ccfh,0c0257bb1h		; b[173] @ 11072
	.word	0f5756283h,0405301f4h		; b[174] @ 11136
	.word	0b2d4d402h,040526435h		; b[175] @ 11200
	.word	0ce4ead0ch,040489c50h		; b[176] @ 11264
	.word	015b9a5a9h,040524bc2h		; b[177] @ 11328
	.word	016659d13h,0c04066a1h		; b[178] @ 11392
	.word	06aa9c206h,0403e17ddh		; b[179] @ 11456
	.word	005ab3aach,0c0505376h		; b[180] @ 11520
	.word	0ddb6291ch,04013305fh		; b[181] @ 11584
	.word	098d1f37dh,040500affh		; b[182] @ 11648
	.word	05a1016ceh,0404cf00fh		; b[183] @ 11712
	.word	07490cb95h,0404be517h		; b[184] @ 11776
	.word	014f483cbh,040349239h		; b[185] @ 11840
	.word	061a45fc6h,0c041ef42h		; b[186] @ 11904
	.word	046eaa01ch,04050ef8eh		; b[187] @ 11968
	.word	062a1b5c8h,0c032b39ch		; b[188] @ 12032
	.word	0746d9026h,04058a9a9h		; b[189] @ 12096
	.word	0a5467606h,0401adf22h		; b[190] @ 12160
	.word	0290eed03h,0c056bb06h		; b[191] @ 12224
	.word	012315aech,04038d190h		; b[192] @ 12288
	.word	07cc6243ch,0c0423a8ah		; b[193] @ 12352
	.word	0cfdb7506h,0405349f3h		; b[194] @ 12416
	.word	0794ea077h,0c0372d74h		; b[195] @ 12480
	.word	012dace17h,040446d5eh		; b[196] @ 12544
	.word	09f5c513ah,040548e03h		; b[197] @ 12608
	.word	0f06e9285h,04002b02ah		; b[198] @ 12672
	.word	0a70d1fa3h,040270dcch		; b[199] @ 12736
	.word	04ff5e199h,0403f0a26h		; b[200] @ 12800

;	C:\MATHLIB_Tools\CCSV5_5_0\ccsv5\tools\compiler\c6000_7.4.2\bin\opt6x.exe C:\\Users\\gtbldadm\\AppData\\Local\\Temp\\030482 C:\\Users\\gtbldadm\\AppData\\Local\\Temp\\030484 
	.sect	".text:optci"
	.clink

;******************************************************************************
;* FUNCTION NAME: atandpMod_atan2dpi                                          *
;*                                                                            *
;*   Regs Modified     : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,B0,B1,B4,B5,B6,B7,B8,  *
;*                           B9,A16,A17,A18,A19,A20,A21,B16,B17,B18,B19       *
;*   Regs Used         : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,B0,B1,B3,B4,B5,B6,B7,  *
;*                           B8,B9,A16,A17,A18,A19,A20,A21,B16,B17,B18,B19    *
;*   Local Frame Size  : 0 Args + 0 Auto + 0 Save = 0 byte                    *
;******************************************************************************
atandpMod_atan2dpi:
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 391

           MV      .L1     A4,A6             ; |64| 
||         MV      .S1     A5,A7             ; |64| 

           ZERO    .L2     B5:B4             ; |83| 

           CMPLTDP .S2X    A7:A6,B5:B4,B0    ; |83| 
||         ZERO    .L1     A3                ; |84| 

           SET     .S1     A3,31,31,A3       ; |84| 
   [ B0]   XOR     .L1     A5,A3,A7          ; |84| 
           RCPDP   .S1     A7:A6,A5:A4       ; |55| 
           ZERO    .L2     B7
           MPYDP   .M1     A7:A6,A5:A4,A9:A8 ; |55| 
           SET     .S2     B7,0x1e,0x1e,B7
           ZERO    .L2     B6                ; |55| 
           MVKL    .S2     0x3ffbb67a,B19
           MVKL    .S2     0xe8584caa,B18
           MVKH    .S2     0x3ffbb67a,B19
           MVKH    .S2     0xe8584caa,B18
           ZERO    .L1     A17:A16           ; |100| 
           MVKL    .S1     0xb9e2bccb,A20
           MVKL    .S1     0xc034817f,A21
           MVKH    .S1     0xb9e2bccb,A20
           SUBDP   .L2X    B7:B6,A9:A8,B5:B4 ; |55| 
           MVKH    .S1     0xc034817f,A21
           MVKL    .S1     ti_math_vTable,A3
           MVKH    .S1     ti_math_vTable,A3
           NOP             3
           MPYDP   .M2X    A5:A4,B5:B4,B5:B4 ; |55| 
           NOP             9
           NOP             1
           MPYDP   .M1X    A7:A6,B5:B4,A5:A4 ; |55| 
           NOP             9
           NOP             1
           SUBDP   .L2X    B7:B6,A5:A4,B9:B8 ; |55| 
           NOP             6
           MPYDP   .M2     B5:B4,B9:B8,B5:B4 ; |55| 
           NOP             9
           NOP             1
           MPYDP   .M1X    A7:A6,B5:B4,A5:A4 ; |55| 
           NOP             9
           SUBDP   .L1X    B7:B6,A5:A4,A9:A8 ; |55| 
           ZERO    .S1     A5
           SET     .S1     A5,0x14,0x1d,A5
           MV      .L1X    B6,A4             ; |88| 
           CMPGTDP .S1     A7:A6,A5:A4,A1    ; |88| 
           NOP             2
   [ A1]   MPYDP   .M1X    B5:B4,A9:A8,A7:A6 ; |55| 
           NOP             9
           NOP             1
           ADDDP   .L2X    B19:B18,A7:A6,B5:B4 ; |55| 
           MV      .L1X    B7,A9             ; |55| 
           MV      .L1     A4,A8             ; |55| 
           NOP             4
           RCPDP   .S2     B5:B4,B17:B16     ; |55| 
           NOP             1
           MPYDP   .M2     B17:B16,B5:B4,B9:B8 ; |55| 
           NOP             9
           SUBDP   .L2X    A9:A8,B9:B8,B9:B8 ; |55| 
           MPYDP   .M1X    B19:B18,A7:A6,A9:A8 ; |55| 
           NOP             5
           MPYDP   .M2     B17:B16,B9:B8,B17:B16 ; |55| 
           NOP             9
           MPYDP   .M2     B17:B16,B5:B4,B9:B8 ; |55| 
           SUBDP   .L1     A9:A8,A5:A4,A5:A4 ; |55| 
           NOP             8
           SUBDP   .L2     B7:B6,B9:B8,B9:B8 ; |55| 
           NOP             6
           MPYDP   .M2     B17:B16,B9:B8,B9:B8 ; |55| 
           NOP             9
           MPYDP   .M2     B9:B8,B5:B4,B5:B4 ; |55| 
           NOP             9
           SUBDP   .L2     B7:B6,B5:B4,B5:B4 ; |55| 
           NOP             6
           MPYDP   .M2     B9:B8,B5:B4,B5:B4 ; |55| 
           NOP             9
           NOP             1
           MPYDP   .M1X    A5:A4,B5:B4,A9:A8 ; |55| 
           NOP             3
           MVKL    .S1     0x3fd12614,A5
           MVKL    .S1     0x5e9ecd56,A4
           MVKH    .S1     0x3fd12614,A5
           MVKH    .S1     0x5e9ecd56,A4
           CMPGTDP .S1     A7:A6,A5:A4,A0    ; |93| 
           MV      .L2     B6,B4             ; |100| 

   [ A0]   MV      .L1     A8,A6             ; |55| 
|| [ A0]   MV      .S1     A9,A7             ; |55| 

           MV      .L1     A6,A4             ; |98| 
||         MV      .S1     A7,A5             ; |98| 

           SET     .S2     B4,31,31,B4       ; |101| 
||         CMPLTDP .S1     A5:A4,A17:A16,A2  ; |100| 

           MVKL    .S2     0x404dca0a,B5
   [ A2]   XOR     .L1X    A5,B4,A5          ; |101| 
           MPYDP   .M1     A5:A4,A5:A4,A17:A16 ; |55| 
           MVKL    .S1     0xe14ac710,A8
           MVKL    .S1     0x402e0c49,A9
           MVKH    .S1     0xe14ac710,A8
           MVKH    .S1     0x402e0c49,A9
           MVKH    .S2     0x404dca0a,B5
           MVKL    .S2     0x320da3d7,B4
           MVKH    .S2     0x320da3d7,B4
           NOP             2
           ADDDP   .L1     A9:A8,A17:A16,A9:A8 ; |55| 
           NOP             6
           MPYDP   .M1     A17:A16,A9:A8,A9:A8 ; |55| 
           NOP             9
           ADDDP   .L1X    B5:B4,A9:A8,A9:A8 ; |55| 
           MVKL    .S2     0x4044887c,B5
           MVKL    .S2     0xbcc495a9,B4
           MVKH    .S2     0x4044887c,B5
           MVKH    .S2     0xbcc495a9,B4
           NOP             2
           MPYDP   .M1     A17:A16,A9:A8,A19:A18 ; |55| 
           NOP             5
           MVKL    .S1     0x40558a12,A9
           MVKL    .S1     0x40b6da5,A8
           MVKH    .S1     0x40558a12,A9
           MVKH    .S1     0x40b6da5,A8
           ADDDP   .L1     A9:A8,A19:A18,A9:A8 ; |55| 
           MV      .S1X    B7,A19            ; |55| 
           MV      .L1X    B6,A18            ; |55| 
           NOP             4
           MPYDP   .M1     A17:A16,A9:A8,A9:A8 ; |55| 
           NOP             9
           NOP             1
           ADDDP   .L2X    B5:B4,A9:A8,B5:B4 ; |55| 
           MV      .L1X    B7,A9             ; |55| 
           MV      .L1X    B6,A8             ; |55| 
           NOP             4
           RCPDP   .S2     B5:B4,B9:B8       ; |55| 
           NOP             1
           MPYDP   .M2     B9:B8,B5:B4,B17:B16 ; |55| 
           NOP             9
           SUBDP   .L2X    A9:A8,B17:B16,B17:B16 ; |55| 
           MVKL    .S1     0xbfeacd7a,A9
           MVKL    .S1     0xd9b187bd,A8
           MVKH    .S1     0xbfeacd7a,A9
           MVKH    .S1     0xd9b187bd,A8
           MPYDP   .M1     A9:A8,A17:A16,A9:A8 ; |55| 
           NOP             1
           MPYDP   .M2     B9:B8,B17:B16,B9:B8 ; |55| 
           NOP             6
           MVKL    .S2     0x5c8d6a63,B16
           MVKL    .S2     0xc020fd3f,B17
           MVKH    .S2     0x5c8d6a63,B16

           MPYDP   .M2     B9:B8,B5:B4,B19:B18 ; |55| 
||         MVKH    .S2     0xc020fd3f,B17

           NOP             1
           ADDDP   .L1X    B17:B16,A9:A8,A9:A8 ; |55| 
           NOP             6
           MPYDP   .M1     A17:A16,A9:A8,A9:A8 ; |55| 
           NOP             1
           SUBDP   .L1X    A19:A18,B19:B18,A19:A18 ; |55| 
           NOP             6
           MPYDP   .M1X    A19:A18,B9:B8,A19:A18 ; |55| 
           ADDDP   .L1     A21:A20,A9:A8,A9:A8 ; |55| 
           NOP             6
           MPYDP   .M1     A17:A16,A9:A8,A9:A8 ; |55| 
           MVKL    .S2     0xc02b60a6,B9
           MVKL    .S2     0x51061ce2,B8
           MPYDP   .M2X    A19:A18,B5:B4,B5:B4 ; |55| 
           MVKH    .S2     0xc02b60a6,B9
           MVKH    .S2     0x51061ce2,B8
           NOP             4
           ADDDP   .L1X    B9:B8,A9:A8,A9:A8 ; |55| 
           NOP             2
           SUBDP   .L2     B7:B6,B5:B4,B5:B4 ; |55| 
           NOP             3
           MPYDP   .M1     A17:A16,A9:A8,A17:A16 ; |55| 
           NOP             3
           MPYDP   .M1X    A19:A18,B5:B4,A9:A8 ; |55| 
           NOP             9
           MPYDP   .M1     A17:A16,A9:A8,A9:A8 ; |55| 
           MVKL    .S2     0x3e4fffff,B5
           MVK     .S2     0xffffedec,B4     ; |104| 
           MVKH    .S2     0x3e4fffff,B5
           CMPGTDP .S2X    A5:A4,B5:B4,B1    ; |104| 
           MV      .L2     B6,B4             ; |79| 
           SET     .S2     B4,31,31,B4       ; |119| 
           NOP             3
           MPYDP   .M1     A9:A8,A7:A6,A9:A8 ; |109| 
           NOP             9
   [ B1]   ADDDP   .L1     A9:A8,A7:A6,A7:A6 ; |109| 
           MV      .S1X    B6,A8             ; |109| 
   [ A1]   MVK     .L1     0x2,A8            ; |90| 
   [ A0]   ADD     .L1     1,A8,A8           ; |94| 
           LDDW    .D1T1   *+A3[A8],A5:A4    ; |116| 
           MV      .S1X    B6,A3             ; |116| 
           SET     .S1     A3,31,31,A3       ; |113| 
           CMPLT   .L1     A8,2,A0           ; |112| 
   [!A0]   XOR     .L1     A7,A3,A7          ; |113| 
           ADDDP   .L1     A5:A4,A7:A6,A5:A4 ; |116| 
           MVK     .L2     0xffffffff,B1     ; |79| 
           RETNOP  .S2     B3,3              ; |123| 
   [ B0]   MV      .L2     B6,B1             ; |79| 
   [!B1]   XOR     .L1X    A5,B4,A5          ; |119| 
           ; BRANCH OCCURS {B3}              ; |123| 
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
;*   Local Frame Size  : 8 Args + 72 Auto + 56 Save = 136 byte                *
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

           STW     .D2T2   B3,*SP--(88)      ; |135| 
||         CALLP   .S2     driver_init,B3
||         MVKH    .S1     $C$SL1+0,A4

$C$RL0:    ; CALL OCCURS {driver_init} {0}   ; |144| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 9
           MVKL    .S1     a,A10

           MVKL    .S2     b,B10
||         MVKL    .S1     output,A15

           MVKH    .S1     a,A10
||         MVK     .S2     0xc9,B4

           MVKH    .S2     b,B10
||         MVKH    .S1     output,A15

           MV      .L2     B10,B11
||         MV      .L1     A10,A12
||         CALL    .S1     atan2             ; |153| 
||         LDW     .D1T1   *A15,A11

           LDDW    .D1T1   *A12++,A5:A4      ; |153| 
||         MV      .L1X    B4,A13
||         LDDW    .D2T2   *B11++,B5:B4      ; |153| 

           NOP             3
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L1:    
;          EXCLUSIVE CPU CYCLES: 1
           ADDKPC  .S2     $C$RL1,B3,0       ; |153| 
$C$RL1:    ; CALL OCCURS {atan2} {0}         ; |153| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 7

           SUB     .L1     A13,1,A0          ; |152| 
||         STDW    .D1T1   A5:A4,*A11++      ; |153| 
||         SUB     .S1     A13,1,A13         ; |152| 

   [ A0]   B       .S1     $C$L1             ; |152| 
|| [ A0]   LDDW    .D1T1   *A12++,A5:A4      ; |153| 
|| [ A0]   LDDW    .D2T2   *B11++,B5:B4      ; |153| 

   [ A0]   CALL    .S1     atan2             ; |153| 
   [!A0]   MV      .L1X    B10,A14
   [!A0]   MVK     .S1     0xc9,A11
   [!A0]   ADD     .L2X    4,A15,B12
   [!A0]   ZERO    .L2     B11
           ; BRANCHCC OCCURS {$C$L1}         ; |152| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 1
           CALL    .S1     atan2dp           ; |156| 
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L2:    
;          EXCLUSIVE CPU CYCLES: 5

           LDDW    .D1T1   *A10++,A5:A4      ; |156| 
||         LDDW    .D2T2   *B10++,B5:B4      ; |156| 

           ADDKPC  .S2     $C$RL2,B3,3       ; |156| 
$C$RL2:    ; CALL OCCURS {atan2dp} {0}       ; |156| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 7

           LDW     .D2T2   *B12,B4           ; |156| 
||         SUB     .L1     A11,1,A0          ; |155| 
||         SUB     .S1     A11,1,A11         ; |155| 

   [ A0]   BNOP    .S2     $C$L2,1           ; |155| 
|| [!A0]   MVKL    .S1     a,A10
|| [!A0]   ADD     .L2     4,B12,B10
|| [!A0]   MV      .D2X    A14,B12

   [!A0]   MVKH    .S1     a,A10
   [!A0]   MVK     .S1     0xc9,A11

           ADD     .L2     B11,B4,B4         ; |156| 
||         ADD     .S2     8,B11,B11         ; |155| 

   [ A0]   CALL    .S1     atan2dp           ; |156| 
|| [!A0]   ZERO    .L2     B11
||         STDW    .D2T1   A5:A4,*B4         ; |156| 

           ; BRANCHCC OCCURS {$C$L2}         ; |155| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 1
           CALL    .S1     atan2dp_c         ; |159| 
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L3:    
;          EXCLUSIVE CPU CYCLES: 5

           LDDW    .D1T1   *A10++,A5:A4      ; |159| 
||         LDDW    .D2T2   *B12++,B5:B4      ; |159| 

           ADDKPC  .S2     $C$RL3,B3,3       ; |159| 
$C$RL3:    ; CALL OCCURS {atan2dp_c} {0}     ; |159| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 7

           LDW     .D2T2   *B10,B4           ; |159| 
||         SUB     .L1     A11,1,A0          ; |158| 
||         SUB     .S1     A11,1,A11         ; |158| 

   [!A0]   MVKL    .S1     a,A30
|| [!A0]   ADD     .L2     4,B10,B31
|| [!A0]   MVK     .D2     0xffffffff,B10    ; |158| 
|| [!A0]   ZERO    .L1     A11
|| [ A0]   B       .S2     $C$L3             ; |158| 

   [!A0]   MVKH    .S1     a,A30
   [!A0]   MVKL    .S1     0x54442d18,A31
   [!A0]   MVKL    .S1     0x400921fb,A3

           ADD     .L2     B11,B4,B4         ; |159| 
||         ADD     .S2     8,B11,B11         ; |158| 

           STDW    .D2T1   A5:A4,*B4         ; |159| 
|| [!A0]   MVKL    .S2     0x7fefffff,B4
|| [ A0]   CALL    .S1     atan2dp_c         ; |159| 

           ; BRANCHCC OCCURS {$C$L3}         ; |158| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5

           SET     .S1     A11,0x1e,0x1e,A11
||         MVKL    .S2     0xffefffff,B11
||         ZERO    .L1     A12               ; |55| 
||         ZERO    .D1     A10               ; |55| 
||         STW     .D2T2   B31,*+SP(36)
||         ZERO    .L2     B24               ; |55| 

           MVKH    .S1     0x400921fb,A3
||         MVKH    .S2     0x7fefffff,B4
||         MV      .L1     A11,A25           ; |55| 
||         MV      .D1     A11,A13           ; |55| 
||         SUB     .L2X    A30,8,B25

           MVKH    .S1     0x54442d18,A31
||         STW     .D2T1   A3,*+SP(28)       ; |145| 
||         MVKH    .S2     0xffefffff,B11
||         SUB     .L1     A14,8,A26
||         ZERO    .D1     A24               ; |55| 

           STW     .D2T1   A31,*+SP(24)      ; |145| 
||         MVK     .S2     0xc9,B2
||         MV      .L1X    B10,A27           ; |158| 

           STW     .D2T2   B4,*+SP(32)       ; |155| 
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L4:    
;          EXCLUSIVE CPU CYCLES: 102
           LDDW    .D1T1   *++A26,A23:A22    ; |137| 
           LDDW    .D2T2   *++B25,B21:B20    ; |136| 
           NOP             3
           RCPDP   .S1     A23:A22,A5:A4     ; |55| 
           NOP             1
           MPYDP   .M1     A5:A4,A23:A22,A7:A6 ; |55| 
           NOP             9
           SUBDP   .L1     A11:A10,A7:A6,A7:A6 ; |55| 
           NOP             6
           MPYDP   .M1     A5:A4,A7:A6,A5:A4 ; |55| 
           NOP             9
           MPYDP   .M1     A5:A4,A23:A22,A7:A6 ; |55| 
           NOP             9
           SUBDP   .L1     A25:A24,A7:A6,A7:A6 ; |55| 
           NOP             6
           MPYDP   .M1     A5:A4,A7:A6,A5:A4 ; |55| 
           NOP             9
           MPYDP   .M1     A5:A4,A23:A22,A7:A6 ; |55| 
           NOP             9
           SUBDP   .L1     A13:A12,A7:A6,A7:A6 ; |55| 
           NOP             6
           MPYDP   .M1     A5:A4,A7:A6,A5:A4 ; |55| 
           NOP             9
           NOP             1
           MPYDP   .M2X    B21:B20,A5:A4,B23:B22 ; |55| 
           NOP             6
           CALL    .S1     atandpMod_atan2dpi ; |139| 
           ADDKPC  .S2     $C$RL4,B3,2       ; |139| 
           MV      .L1X    B23,A5            ; |139| 
           MV      .L1X    B22,A4            ; |139| 
$C$RL4:    ; CALL OCCURS {atandpMod_atan2dpi} {0}  ; |139| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 43

           ZERO    .L2     B5:B4             ; |142| 
||         MV      .L1     A5,A7             ; |139| 
||         MV      .S1     A4,A6             ; |139| 
||         LDW     .D2T2   *+SP(36),B28      ; |156| 
||         SUB     .S2     B2,1,B2           ; |161| 

           CMPLTDP .S2X    A23:A22,B5:B4,B0  ; |142| 
           ZERO    .L2     B5:B4             ; |144| 

   [ B0]   CMPGTDP .S2X    A7:A6,B5:B4,B1    ; |144| 
|| [ B0]   MVKL    .S1     0x54442d18,A8
|| [!B0]   ZERO    .L2     B1                ; |144| 

   [ B0]   MVKL    .S1     0x400921fb,A9
||         ZERO    .L2     B5:B4             ; |149| 

   [ B0]   MVKH    .S1     0x54442d18,A8
||         CMPGTDP .S2     B21:B20,B5:B4,B7  ; |149| 

   [ B0]   MVKH    .S1     0x400921fb,A9
||         ZERO    .L2     B5:B4             ; |149| 

   [ B0]   ADDDP   .L1     A9:A8,A5:A4,A5:A4 ; |143| 
|| [ B1]   LDW     .D2T1   *+SP(28),A9       ; |144| 

   [ B1]   LDW     .D2T1   *+SP(24),A8       ; |144| 
           XOR     .L2     1,B7,B29          ; |149| 
           CMPEQDP .S2X    A23:A22,B5:B4,B6  ; |149| 
           ZERO    .L2     B5:B4             ; |152| 
           CMPLTDP .S2X    A23:A22,B5:B4,B4  ; |152| 
   [ B1]   SUBDP   .S1     A7:A6,A9:A8,A5:A4 ; |145| 
           ZERO    .L1     A7:A6             ; |150| 
           XOR     .L2     1,B4,B5           ; |152| 
           CMPGTDP .S2X    B21:B20,A7:A6,B7  ; |150| 
           ZERO    .L1     A7:A6             ; |152| 
           AND     .L2     B6,B29,B1         ; |149| 
           CMPEQDP .S2X    B21:B20,A7:A6,B4  ; |152| 
   [ B1]   MVKL    .S1     0x54442d18,A4

   [ B1]   MVKL    .S1     0xbff921fb,A5
||         AND     .L2     B0,B4,B0          ; |153| 

   [ B1]   MVKH    .S1     0x54442d18,A4

   [ B1]   MVKH    .S1     0xbff921fb,A5
||         AND     .L2     B6,B7,B1          ; |150| 

   [ B1]   MVKL    .S1     0x54442d18,A4
   [ B1]   MVKL    .S1     0x3ff921fb,A5
   [ B1]   MVKH    .S1     0x54442d18,A4

   [ B1]   MVKH    .S1     0x3ff921fb,A5
||         AND     .L2     B4,B5,B1          ; |152| 
||         LDW     .D2T2   *+SP(32),B5       ; |153| 
||         MV      .S2X    A27,B4            ; |153| 

   [ B1]   ZERO    .L1     A5:A4             ; |153| 
   [ B0]   MVKL    .S1     0x54442d18,A4
   [ B0]   MVKL    .S1     0x400921fb,A5
   [ B0]   MVKH    .S1     0x54442d18,A4

           CMPGTDP .S2     B23:B22,B5:B4,B1  ; |155| 
||         LDW     .D2T2   *B28,B4           ; |162| 

   [ B0]   MVKH    .S1     0x400921fb,A5
   [ B1]   MVKL    .S1     0x54442d18,A4

   [ B1]   MVKL    .S1     0x3ff921fb,A5
||         CMPLTDP .S2     B23:B22,B11:B10,B0 ; |158| 

   [ B1]   MVKH    .S1     0x54442d18,A4
|| [!B2]   MV      .L2X    A15,B10

   [ B2]   B       .S2     $C$L4             ; |161| 
|| [ B1]   MVKH    .S1     0x3ff921fb,A5
||         ADD     .L2     B24,B4,B4         ; |162| 
||         ADD     .D2     8,B24,B24         ; |161| 

   [ B0]   MVKL    .S1     0x54442d18,A4
   [ B0]   MVKL    .S1     0xbff921fb,A5
   [ B0]   MVKH    .S1     0x54442d18,A4
   [ B0]   MVKH    .S1     0xbff921fb,A5

   [!B2]   CALL    .S1     atan2dp_v         ; |164| 
||         STDW    .D2T1   A5:A4,*B4         ; |162| 

           ; BRANCHCC OCCURS {$C$L4}         ; |161| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           LDW     .D2T1   *+B10(16),A6      ; |164| 
           MVKL    .S1     a,A4
           MVKH    .S1     a,A4
           MVK     .S2     0xc9,B6           ; |164| 

           MV      .L2X    A14,B4            ; |164| 
||         ADDKPC  .S2     $C$RL5,B3,0       ; |164| 

$C$RL5:    ; CALL OCCURS {atan2dp_v} {0}     ; |164| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 46
           MVKL    .S2     0x3e112e0b,B7
           MVKL    .S2     0xe826d695,B6
           MVKH    .S2     0x3e112e0b,B7

           LDW     .D2T1   *B10,A4           ; |66| 
||         MVKH    .S2     0xe826d695,B6

           CALLP   .S2     isequal,B3
||         LDW     .D2T2   *+B10(4),B4       ; |66| 
||         MVK     .S1     0xc9,A6           ; |66| 
||         MVK     .L1     0x1,A8            ; |66| 

$C$RL6:    ; CALL OCCURS {isequal} {0}       ; |66| 
           MVKL    .S2     fcn_pass,B6
           MVKL    .S2     0x3e112e0b,B7
           MVKH    .S2     fcn_pass,B6
           MVKH    .S2     0x3e112e0b,B7

           STW     .D2T1   A4,*+B6(4)        ; |66| 
||         MVKL    .S2     0xe826d695,B6

           LDW     .D2T2   *+B10(8),B4       ; |67| 
||         MVKH    .S2     0xe826d695,B6

           CALLP   .S2     isequal,B3
||         LDW     .D2T1   *B10,A4           ; |67| 
||         MVK     .S1     0xc9,A6           ; |67| 
||         MVK     .L1     0x1,A8            ; |67| 

$C$RL7:    ; CALL OCCURS {isequal} {0}       ; |67| 
           MVKL    .S2     fcn_pass,B5
           MVKL    .S2     0x3e112e0b,B7
           MVKL    .S2     0xe826d695,B6
           MVKH    .S2     fcn_pass,B5
           MVKH    .S2     0x3e112e0b,B7

           STW     .D2T1   A4,*+B5(8)        ; |67| 
||         MVKH    .S2     0xe826d695,B6

           CALLP   .S2     isequal,B3
||         LDW     .D1T1   *A15,A4           ; |68| 
||         LDW     .D2T2   *+B10(12),B4      ; |68| 
||         MVK     .S1     0xc9,A6           ; |68| 
||         MVK     .L1     0x1,A8            ; |68| 

$C$RL8:    ; CALL OCCURS {isequal} {0}       ; |68| 

           LDW     .D2T1   *+SP(36),A3       ; |68| 
||         MVKL    .S2     fcn_pass,B4

           MVKL    .S2     0xe826d695,B6
           MVKL    .S2     0x3e112e0b,B7
           MVKH    .S2     fcn_pass,B4

           MV      .L1     A15,A31           ; |69| 
||         STW     .D2T1   A4,*+B4(12)       ; |68| 
||         MVKH    .S2     0xe826d695,B6

           ADD     .L1     4,A3,A3
||         LDW     .D1T1   *A31,A4           ; |69| 
||         MVKH    .S2     0x3e112e0b,B7

           CALLP   .S2     isequal,B3
||         LDW     .D1T2   *A3,B4            ; |69| 
||         STW     .D2T1   A3,*+SP(40)
||         MVK     .S1     0xc9,A6           ; |69| 
||         MVK     .L1     0x1,A8            ; |69| 

$C$RL9:    ; CALL OCCURS {isequal} {0}       ; |69| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 14
           MVKL    .S1     fcn_pass,A3
           MVKH    .S1     fcn_pass,A3
           ADD     .L1     4,A3,A14
           LDW     .D1T1   *A14,A0           ; |72| 
           MV      .L2X    A3,B4             ; |72| 
           STW     .D2T1   A4,*+B4(16)       ; |69| 
           ADD     .L2X    8,A3,B4
           STW     .D2T2   B4,*+SP(44)       ; |69| 

   [!A0]   B       .S1     $C$L5             ; |72| 
|| [ A0]   LDW     .D2T2   *B4,B0            ; |72| 

   [!A0]   CALL    .S1     print_test_results ; |168| 
   [ A0]   ADD     .L2     4,B4,B4
   [!A0]   MVKL    .S2     all_pass,B5
   [!A0]   MV      .L2X    A12,B4
   [!A0]   MVKH    .S2     all_pass,B5
           ; BRANCHCC OCCURS {$C$L5}         ; |72| 
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
           CALL    .S1     print_test_results ; |168| 
           MVKL    .S2     all_pass,B5
           MVKH    .S2     all_pass,B5
           NOP             2
;** --------------------------------------------------------------------------*
$C$L5:    
;          EXCLUSIVE CPU CYCLES: 1

           MVK     .L1     0x1,A4            ; |168| 
||         STW     .D2T2   B4,*B5            ; |72| 
||         ADDKPC  .S2     $C$RL10,B3,0      ; |168| 

$C$RL10:   ; CALL OCCURS {print_test_results} {0}  ; |168| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 14

           MVKL    .S1     a_sc,A4
||         MVKL    .S2     b_sc,B5

           LDW     .D2T1   *+SP(32),A31      ; |178| 
||         MVKH    .S1     a_sc,A4
||         MVKH    .S2     b_sc,B5

           ADDAD   .D2     B5,5,B6
||         MV      .L2X    A10,B16
||         ADD     .S2     1,B11,B17

           STDW    .D2T2   B17:B16,*+B5(24)  ; |178| 
||         MV      .L2X    A4,B4             ; |175| 
||         ZERO    .S2     B9

           ADDAD   .D2     B4,5,B7
||         SET     .S2     B9,0x14,0x1d,B9
||         ZERO    .L2     B8                ; |179| 

           STDW    .D2T2   B9:B8,*+B5(32)    ; |179| 
           STDW    .D2T2   B17:B16,*+B4(24)  ; |178| 

           STDW    .D2T2   B9:B8,*+B4(32)    ; |179| 
||         ADD     .L1     1,A31,A7
||         MV      .S1     A10,A6

           STDW    .D2T1   A7:A6,*+B4(16)    ; |177| 
||         ZERO    .L1     A5

           STDW    .D2T1   A7:A6,*+B5(16)    ; |177| 
||         ZERO    .L1     A4                ; |176| 
||         MVKH    .S1     0x80000000,A5
||         MVK     .L2     0x4,B31           ; |181| 

           STDW    .D2T1   A5:A4,*+B4(8)     ; |176| 

           ZERO    .L2     B17:B16           ; |175| 
||         STDW    .D2T1   A5:A4,*+B5(8)     ; |176| 
||         MV      .L1X    B31,A1            ; |181| 

           MVK     .L2     0x5,B4            ; |182| 
||         STDW    .D2T2   B17:B16,*B4       ; |175| 
||         MV      .L1X    B5,A12            ; |175| 

           MVC     .S2     B4,RILC
||         MVK     .L2     4,B5              ; |182| 
||         STDW    .D2T2   B17:B16,*B5       ; |175| 
||         MV      .L1X    B9,A3             ; |179| 
||         SUB     .S1     A1,1,A1           ; |181| 

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*
;*      Loop found in file               : C:/nightlybuilds/mathlib/ti/mathlib/src/atan2dp/atan2dp_d.c
;*      Loop source line                 : 182
;*      Loop opening brace source line   : 182
;*      Loop closing brace source line   : 186
;*      Known Minimum Trip Count         : 5                    
;*      Known Maximum Trip Count         : 5                    
;*      Known Max Trip Count Factor      : 5
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
;*      Total cycles (est.)         : 6 + min_trip_cnt * 6 = 36        
;*----------------------------------------------------------------------------*
;*        SINGLE SCHEDULED ITERATION
;*
;*        $C$C115:
;*   0              ADD     .L1     A4,A3,A7          ; |184| 
;*   1              CMPGT   .L1     A7,4,A0           ; |184| 
;*   2      [ A0]   MVK     .S1     0xffffffd8,A7     ; |184| 
;*     ||   [!A0]   ZERO    .D1     A7                ; |184| 
;*   3              LDDW    .D2T2   *B8++,B5:B4       ; |183|  ^ 
;*     ||           ADD     .L1     A5,A7,A7          ; |184| 
;*   4              ADD     .L1     A6,A7,A7          ; |184| 
;*   5              LDDW    .D1T2   *A7,B5:B4         ; |184|  ^ 
;*     ||           ADD     .L1     1,A4,A4           ; |182| 
;*   6              NOP             2
;*   8              STDW    .D2T2   B5:B4,*B7++       ; |183|  ^ 
;*     ||           ADD     .L1     8,A5,A5           ; |182| 
;*   9              NOP             1
;*  10              STDW    .D2T2   B5:B4,*B6++       ; |184|  ^ 
;*     ||           SPBR            $C$C115
;*  11              NOP             1
;*  12              ; BRANCHCC OCCURS {$C$C115}       ; |182| 
;*----------------------------------------------------------------------------*
$C$L6:    ; PIPED LOOP PROLOG
;          EXCLUSIVE CPU CYCLES: 7

   [ A1]   SPLOOPD 6       ;12               ; SPRELOAD
||         STW     .D2T1   A3,*+SP(16)       ; |179| 
||         MVK     .L1     0x1,A3            ; |181| 
||         ZERO    .S1     A4                ; |182| 
||         MVC     .S2     B5,ILC

;** --------------------------------------------------------------------------*
$C$L7:    ; PIPED LOOP KERNEL
;          EXCLUSIVE CPU CYCLES: 6

           SPMASK          L2
||         MVK     .L2     0x8,B9
||         ADD     .L1     A4,A3,A7          ; |184| (P) <0,0> 

           SPMASK          L2,S2
||         ZERO    .L2     B30               ; |179| 
||         MVKL    .S2     a_sc,B8
||         CMPGT   .L1     A7,4,A0           ; |184| (P) <0,1> 

           SPMASK          L1,S2,D2
||         STW     .D2T2   B30,*+SP(12)      ; |176| 
||         MVKH    .S2     a_sc,B8
||         MV      .L1X    B9,A5
|| [!A0]   ZERO    .D1     A7                ; |184| (P) <0,2> 
|| [ A0]   MVK     .S1     0xffffffd8,A7     ; |184| (P) <0,2> 

           SPMASK          S1
||         MV      .S1     A12,A6
||         LDDW    .D2T2   *B8++,B5:B4       ; |183| (P) <0,3>  ^ 
||         ADD     .L1     A5,A7,A7          ; |184| (P) <0,3> 

           ADD     .L1     A6,A7,A7          ; |184| (P) <0,4> 

           ADD     .L1     1,A4,A4           ; |182| (P) <0,5> 
||         LDDW    .D1T2   *A7,B5:B4         ; |184| (P) <0,5>  ^ 

           NOP             2

           STDW    .D2T2   B5:B4,*B7++       ; |183| <0,8>  ^ 
||         ADD     .L1     8,A5,A5           ; |182| <0,8> 

           NOP             1

           SPKERNEL 0,0
||         STDW    .D2T2   B5:B4,*B6++       ; |184| <0,10>  ^ 

;** --------------------------------------------------------------------------*
$C$L8:    ; PIPED LOOP EPILOG AND PROLOG
;          EXCLUSIVE CPU CYCLES: 9
           NOP             2

           SPMASKR         ;$C$L8
||         ZERO    .S1     A4                ; |182| 
||         ADD     .D1     1,A3,A3           ; |181| 

           ADD     .L2     8,B9,B9           ; |181| 
|| [ A1]   B       .S2     $C$L8             ; |181| 

           MV      .S1     A6,A12
||         MVKL    .S2     a_sc,B8
||         SUB     .D1     A1,1,A1           ; |181| 

           MVKH    .S2     a_sc,B8
||         MV      .L1X    B9,A5

           MV      .S1     A12,A6
||         MVK     .L2     0x5,B4            ; |182| 
||         MVK     .S2     4,B5              ; |182| 

           NOP             2
           ; BRANCHCC OCCURS {$C$L8}         ; |181| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 17
           LDW     .D2T1   *+SP(24),A29      ; |55| 
           LDW     .D2T1   *+SP(28),A30      ; |155| 
           LDW     .D2T1   *+SP(32),A31      ; |158| 
           LDW     .D2T1   *+SP(36),A3
           STW     .D2T1   A11,*+SP(52)      ; |55| 

           STW     .D2T1   A11,*+SP(60)      ; |55| 
||         ZERO    .L1     A28

           STW     .D2T1   A28,*+SP(48)
||         MVK     .L2     0xffffffff,B30    ; |155| 

           STW     .D2T2   B30,*+SP(72)
||         ZERO    .L1     A4

           STW     .D2T1   A4,*+SP(56)
||         MVK     .S2     0x19,B4           ; |189| 

           STW     .D2T2   B4,*+SP(20)
           STW     .D2T1   A29,*+SP(64)      ; |55| 

           STW     .D2T1   A30,*+SP(68)      ; |55| 
||         MVKL    .S2     a_sc,B31

           STW     .D2T1   A31,*+SP(76)      ; |155| 
||         MVKH    .S2     a_sc,B31

           STW     .D2T1   A3,*+SP(80)       ; |158| 
||         SUB     .L2     B31,8,B13
||         SUB     .L1     A12,8,A15

           LDDW    .D1T1   *++A15,A5:A4      ; |191| 
||         LDDW    .D2T2   *++B13,B7:B6      ; |191| 

           CALL    .S1     atan2             ; |191| 

           MV      .L2     B30,B10           ; |155| 
||         ZERO    .S2     B12
||         ZERO    .L1     A10

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
$C$L9:    
;          EXCLUSIVE CPU CYCLES: 4
           ADDKPC  .S2     $C$RL11,B3,1      ; |191| 

           MV      .L2X    A4,B4             ; |191| 
||         MV      .L1X    B6,A4             ; |191| 

           MV      .L2X    A5,B5             ; |191| 
||         MV      .L1X    B7,A5             ; |191| 

$C$RL11:   ; CALL OCCURS {atan2} {0}         ; |191| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 152
           MVKL    .S1     output,A3
           MVKH    .S1     output,A3
           LDW     .D1T2   *A3,B4            ; |191| 
           NOP             4
           ADD     .L2     B12,B4,B4         ; |191| 
           STDW    .D2T1   A5:A4,*B4         ; |191| 
           LDDW    .D2T2   *B13,B7:B6        ; |192| 
           LDDW    .D1T2   *A15,B5:B4        ; |192| 
           NOP             3
           MV      .L1X    B6,A4             ; |192| 

           MV      .L1X    B7,A5             ; |192| 
||         CALLP   .S2     atan2dp,B3

$C$RL12:   ; CALL OCCURS {atan2dp} {0}       ; |192| 
           MVKL    .S1     output,A3
           MVKH    .S1     output,A3
           LDW     .D1T1   *+A3(4),A3        ; |192| 
           NOP             4
           ADD     .L2X    B12,A3,B4         ; |192| 
           STDW    .D2T1   A5:A4,*B4         ; |192| 

           CALLP   .S2     atan2dp_c,B3
||         LDDW    .D2T1   *B13,A5:A4        ; |193| 
||         LDDW    .D1T2   *A15,B5:B4        ; |193| 

$C$RL13:   ; CALL OCCURS {atan2dp_c} {0}     ; |193| 
           MVKL    .S1     output,A3
           MVKH    .S1     output,A3
           LDW     .D1T1   *+A3(8),A3        ; |193| 
           NOP             4
           ADD     .L1X    B12,A3,A3         ; |193| 
           STDW    .D1T1   A5:A4,*A3         ; |193| 
           LDDW    .D1T1   *A15,A23:A22      ; |137| 
           LDDW    .D2T2   *B13,B23:B22      ; |136| 
           NOP             3
           RCPDP   .S1     A23:A22,A5:A4     ; |55| 
           NOP             1
           MPYDP   .M1     A5:A4,A23:A22,A7:A6 ; |55| 
           NOP             9
           SUBDP   .L1     A11:A10,A7:A6,A7:A6 ; |55| 
           NOP             6
           MPYDP   .M1     A5:A4,A7:A6,A7:A6 ; |55| 
           NOP             9
           MPYDP   .M1     A7:A6,A23:A22,A9:A8 ; |55| 
           MV      .L1     A11,A5            ; |55| 
           MV      .L1     A10,A4            ; |55| 
           NOP             7
           SUBDP   .L1     A5:A4,A9:A8,A5:A4 ; |55| 
           NOP             6
           MPYDP   .M1     A7:A6,A5:A4,A7:A6 ; |55| 
           NOP             9
           MPYDP   .M1     A7:A6,A23:A22,A9:A8 ; |55| 
           MV      .L1     A11,A5            ; |55| 
           MV      .L1     A10,A4            ; |55| 
           NOP             7
           SUBDP   .L1     A5:A4,A9:A8,A5:A4 ; |55| 
           NOP             6
           MPYDP   .M1     A7:A6,A5:A4,A5:A4 ; |55| 
           NOP             9
           NOP             1
           MPYDP   .M2X    B23:B22,A5:A4,B21:B20 ; |55| 
           NOP             9
           NOP             1
           MV      .L1X    B20,A4            ; |139| 

           CALLP   .S2     atandpMod_atan2dpi,B3
||         MV      .L1X    B21,A5            ; |139| 

$C$RL14:   ; CALL OCCURS {atandpMod_atan2dpi} {0}  ; |139| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 45

           ZERO    .L2     B5:B4             ; |142| 
||         MV      .L1     A5,A7             ; |139| 
||         MV      .S1     A4,A6             ; |139| 
||         LDW     .D2T2   *+SP(80),B28      ; |156| 

           CMPLTDP .S2X    A23:A22,B5:B4,B0  ; |142| 
           ZERO    .L2     B5:B4             ; |144| 

   [ B0]   CMPGTDP .S2X    A7:A6,B5:B4,B1    ; |144| 
|| [ B0]   MVKL    .S1     0x54442d18,A8
|| [!B0]   ZERO    .L2     B1                ; |144| 

   [ B0]   MVKL    .S1     0x400921fb,A9
||         ZERO    .L2     B5:B4             ; |149| 

   [ B0]   MVKH    .S1     0x54442d18,A8
||         CMPGTDP .S2     B23:B22,B5:B4,B7  ; |149| 

   [ B0]   MVKH    .S1     0x400921fb,A9
||         ZERO    .L2     B5:B4             ; |149| 

           CMPEQDP .S2X    A23:A22,B5:B4,B6  ; |149| 
|| [ B0]   ADDDP   .L1     A9:A8,A5:A4,A5:A4 ; |143| 
|| [ B1]   LDW     .D2T1   *+SP(64),A8       ; |144| 

   [ B1]   LDW     .D2T1   *+SP(68),A9       ; |144| 
           XOR     .L2     1,B7,B29          ; |149| 
           ZERO    .L2     B5:B4             ; |152| 
           AND     .L2     B6,B29,B2         ; |149| 
           CMPLTDP .S2X    A23:A22,B5:B4,B4  ; |152| 
   [ B1]   SUBDP   .S1     A7:A6,A9:A8,A5:A4 ; |145| 
           ZERO    .L1     A7:A6             ; |150| 
           XOR     .L2     1,B4,B4           ; |152| 
           CMPGTDP .S2X    B23:B22,A7:A6,B7  ; |150| 
           ZERO    .L1     A7:A6             ; |152| 
           AND     .L2     B6,B7,B1          ; |150| 
           CMPEQDP .S2X    B23:B22,A7:A6,B5  ; |152| 
   [ B2]   MVKL    .S1     0x54442d18,A4

   [ B2]   MVKL    .S1     0xbff921fb,A5
||         AND     .L2     B0,B5,B0          ; |153| 

   [ B2]   MVKH    .S1     0x54442d18,A4

   [ B2]   MVKH    .S1     0xbff921fb,A5
||         AND     .L2     B5,B4,B2          ; |152| 
||         LDW     .D2T2   *+SP(76),B5       ; |153| 
||         MV      .S2     B10,B4            ; |153| 

   [ B1]   MVKL    .S1     0x54442d18,A4
   [ B1]   MVKL    .S1     0x3ff921fb,A5
   [ B1]   MVKH    .S1     0x54442d18,A4
   [ B1]   MVKH    .S1     0x3ff921fb,A5

           CMPGTDP .S2     B21:B20,B5:B4,B1  ; |155| 
||         LDW     .D2T2   *B28,B4           ; |194| 
|| [ B2]   ZERO    .L1     A5:A4             ; |153| 

   [ B0]   MVKL    .S1     0x54442d18,A4

   [ B0]   MVKL    .S1     0x400921fb,A5
||         CMPLTDP .S2     B21:B20,B11:B10,B2 ; |158| 

   [ B0]   MVKH    .S1     0x54442d18,A4
   [ B0]   MVKH    .S1     0x400921fb,A5

           ADD     .L2     B12,B4,B5         ; |194| 
||         LDW     .D2T2   *+SP(20),B4       ; |194| 
|| [ B1]   MVKL    .S1     0x54442d18,A4
||         ADD     .S2     8,B12,B12         ; |195| 

   [ B1]   MVKL    .S1     0x3ff921fb,A5
   [ B1]   MVKH    .S1     0x54442d18,A4
   [ B1]   MVKH    .S1     0x3ff921fb,A5
   [ B2]   MVKL    .S1     0x54442d18,A4

           SUB     .L1X    B4,1,A0           ; |189| 
|| [ B2]   MVKL    .S1     0xbff921fb,A5
||         SUB     .L2     B4,1,B4           ; |189| 

   [ A0]   B       .S2     $C$L9             ; |189| 
|| [ B2]   MVKH    .S1     0x54442d18,A4
||         STW     .D2T2   B4,*+SP(20)       ; |194| 

   [ B2]   MVKH    .S1     0xbff921fb,A5

   [!A0]   MVKL    .S1     output,A10
||         STDW    .D2T1   A5:A4,*B5         ; |194| 

   [!A0]   CALL    .S2     atan2dp_v         ; |198| 
|| [!A0]   MVKH    .S1     output,A10
|| [ A0]   LDDW    .D2T2   *++B13,B7:B6      ; |191| 
|| [ A0]   LDDW    .D1T1   *++A15,A5:A4      ; |191| 

   [ A0]   CALL    .S1     atan2             ; |191| 
|| [!A0]   LDW     .D1T1   *+A10(16),A6      ; |198| 

   [!A0]   MVKL    .S1     a_sc,A4
           ; BRANCHCC OCCURS {$C$L9}         ; |189| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 3
           MVK     .S2     0x19,B6           ; |198| 
           MV      .L2X    A12,B4            ; |198| 

           ADDKPC  .S2     $C$RL15,B3,0      ; |198| 
||         MVKH    .S1     a_sc,A4

$C$RL15:   ; CALL OCCURS {atan2dp_v} {0}     ; |198| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 43
           MVKL    .S2     0x3e112e0b,B7
           MVKL    .S2     0xe826d695,B6
           MVKH    .S2     0x3e112e0b,B7

           LDW     .D1T1   *A10,A4           ; |66| 
||         MVKH    .S2     0xe826d695,B6

           CALLP   .S2     isequal,B3
||         LDW     .D1T2   *+A10(4),B4       ; |66| 
||         MVK     .S1     0x19,A6           ; |66| 
||         MVK     .L1     0x1,A8            ; |66| 

$C$RL16:   ; CALL OCCURS {isequal} {0}       ; |66| 
           MVKL    .S2     0xe826d695,B6
           MVKL    .S2     0x3e112e0b,B7

           LDW     .D1T2   *+A10(8),B4       ; |67| 
||         MVKL    .S1     fcn_pass,A3
||         MVKH    .S2     0xe826d695,B6

           MV      .L1     A4,A5             ; |66| 
||         LDW     .D1T1   *A10,A4           ; |67| 
||         MVKH    .S1     fcn_pass,A3
||         MVKH    .S2     0x3e112e0b,B7

           CALLP   .S2     isequal,B3
||         STW     .D1T1   A5,*+A3(4)        ; |66| 
||         MVK     .S1     0x19,A6           ; |67| 
||         MVK     .L1     0x1,A8            ; |67| 

$C$RL17:   ; CALL OCCURS {isequal} {0}       ; |67| 
           MVKL    .S2     0x3e112e0b,B7

           MVKL    .S1     fcn_pass,A3
||         MVKL    .S2     0xe826d695,B6

           MVKH    .S1     fcn_pass,A3
||         MVKH    .S2     0x3e112e0b,B7

           MV      .L2X    A10,B4            ; |67| 
||         STW     .D1T1   A4,*+A3(8)        ; |67| 
||         MVKH    .S2     0xe826d695,B6

           CALLP   .S2     isequal,B3
||         LDW     .D2T1   *B4,A4            ; |68| 
||         LDW     .D1T2   *+A10(12),B4      ; |68| 
||         MVK     .S1     0x19,A6           ; |68| 
||         MVK     .L1     0x1,A8            ; |68| 

$C$RL18:   ; CALL OCCURS {isequal} {0}       ; |68| 
           LDW     .D2T1   *+SP(40),A3       ; |68| 
           MVKL    .S2     0xe826d695,B6
           MVKL    .S1     fcn_pass,A5
           MVKL    .S2     0x3e112e0b,B7
           MVKH    .S1     fcn_pass,A5

           MVKH    .S2     0xe826d695,B6
||         STW     .D2T1   A3,*+SP(20)       ; |68| 

           MV      .L2X    A3,B4             ; |66| 
||         MV      .L1     A10,A3            ; |69| 
||         STW     .D1T1   A4,*+A5(12)       ; |68| 
||         MVKH    .S2     0x3e112e0b,B7

           CALLP   .S2     isequal,B3
||         LDW     .D2T2   *B4,B4            ; |69| 
||         LDW     .D1T1   *A3,A4            ; |69| 
||         MVK     .S1     0x19,A6           ; |69| 
||         MVK     .L1     0x1,A8            ; |69| 

$C$RL19:   ; CALL OCCURS {isequal} {0}       ; |69| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 12

           LDW     .D2T1   *+SP(44),A3
||         MV      .L2X    A14,B4            ; |69| 
||         MVKL    .S1     fcn_pass,A31

           LDW     .D2T2   *B4,B0            ; |72| 
           MVKH    .S1     fcn_pass,A31
           STW     .D1T1   A4,*+A31(16)      ; |69| 
           STW     .D2T1   A14,*+SP(48)      ; |69| 
           STW     .D2T1   A3,*+SP(52)       ; |72| 

   [!B0]   ZERO    .L1     A3                ; |72| 
|| [!B0]   B       .S1     $C$L10            ; |72| 
|| [ B0]   LDW     .D2T2   *+SP(52),B4

   [!B0]   CALL    .S1     print_test_results ; |202| 
           MV      .L2     B0,B1             ; guard predicate rewrite
   [!B0]   MVKL    .S1     all_pass,A4
   [!B0]   MVKH    .S1     all_pass,A4

   [ B0]   LDW     .D2T2   *B4,B0            ; |72| 
|| [ B1]   ADD     .L2     4,B4,B4

           ; BRANCHCC OCCURS {$C$L10}        ; |72| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 14
           CMPEQ   .L1     A4,0,A3           ; |72| 
           XOR     .L1     1,A3,A3           ; |72| 
           NOP             2
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
           CALL    .S1     print_test_results ; |202| 
           MVKL    .S1     all_pass,A4
           MVKH    .S1     all_pass,A4
           NOP             2
;** --------------------------------------------------------------------------*
$C$L10:    
;          EXCLUSIVE CPU CYCLES: 1

           STW     .D1T1   A3,*A4            ; |72| 
||         MVK     .L1     0x3,A4            ; |202| 
||         ADDKPC  .S2     $C$RL20,B3,0      ; |202| 

$C$RL20:   ; CALL OCCURS {print_test_results} {0}  ; |202| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 24
           LDW     .D2T1   *+SP(24),A29      ; |55| 
           LDW     .D2T1   *+SP(36),A3       ; |212| 
           LDW     .D2T2   *+SP(16),B7       ; |205| 
           LDW     .D2T1   *+SP(32),A31      ; |158| 
           LDW     .D2T1   *+SP(28),A30      ; |155| 
           STW     .D2T2   B11,*+SP(64)      ; |158| 

           STW     .D2T1   A13,*+SP(24)      ; |55| 
||         MVK     .L2     0xffffffff,B31    ; |155| 

           STW     .D2T2   B31,*+SP(36)      ; |206| 
||         MVKL    .S2     b_ext,B6
||         ZERO    .L1     A28

           STW     .D2T1   A28,*+SP(16)      ; |205| 
||         MVKH    .S2     b_ext,B6
||         MV      .L2     B31,B28           ; |205| 

           STW     .D2T2   B28,*+SP(60)      ; |205| 

           LDW     .D2T2   *+SP(12),B6       ; |205| 
||         MV      .L1X    B6,A15            ; |206| 
||         MV      .L2     B6,B8             ; |206| 

           STW     .D2T1   A3,*+SP(68)       ; |158| 

           STW     .D2T1   A31,*+SP(56)      ; |155| 
||         MVKL    .S1     a_ext,A4

           STW     .D2T1   A30,*+SP(32)      ; |55| 
||         MVKH    .S1     a_ext,A4
||         MVK     .S2     0x777,B30

           STW     .D2T1   A29,*+SP(28)      ; |55| 
||         ZERO    .L2     B4
||         ZERO    .S2     B5

           STW     .D2T2   B30,*+SP(12)      ; |206| 
||         MV      .L2X    A4,B29            ; |205| 
||         SET     .S2     B5,0x14,0x14,B5

           STDW    .D2T2   B5:B4,*B29        ; |205| 

           STDW    .D2T2   B7:B6,*B8         ; |206| 
||         MV      .L2X    A4,B10            ; |205| 

           LDDW    .D2T2   *B10,B7:B6        ; |208| 
           CALL    .S1     atan2             ; |208| 

           LDDW    .D1T2   *A15,B5:B4        ; |208| 
||         MVKL    .S2     0x4000cccc,B13

           MVKL    .S2     0xcccccccd,B12

           MVKH    .S2     0x4000cccc,B13
||         ZERO    .L1     A12

           MV      .L1X    B7,A5             ; |208| 
||         MVKH    .S2     0xcccccccd,B12
||         ZERO    .L2     B11
||         MV      .S1     A13,A11           ; |55| 
||         ZERO    .D1     A10

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
$C$L11:    
;          EXCLUSIVE CPU CYCLES: 1

           MV      .L1X    B6,A4             ; |208| 
||         ADDKPC  .S2     $C$RL21,B3,0      ; |208| 

$C$RL21:   ; CALL OCCURS {atan2} {0}         ; |208| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 146
           MVKL    .S1     output,A3
           MVKH    .S1     output,A3
           LDW     .D1T1   *A3,A3            ; |208| 
           MV      .L2X    A5,B5             ; |208| 
           MV      .L2X    A4,B4             ; |208| 
           NOP             2
           ADD     .L2X    B11,A3,B6         ; |208| 
           STDW    .D2T2   B5:B4,*B6         ; |208| 

           CALLP   .S2     atan2dp,B3
||         LDDW    .D2T1   *B10,A5:A4        ; |209| 
||         LDDW    .D1T2   *A15,B5:B4        ; |209| 

$C$RL22:   ; CALL OCCURS {atan2dp} {0}       ; |209| 
           MVKL    .S1     output,A3
           MVKH    .S1     output,A3
           LDW     .D1T1   *+A3(4),A3        ; |209| 
           NOP             4
           ADD     .L2X    B11,A3,B4         ; |209| 
           STDW    .D2T1   A5:A4,*B4         ; |209| 

           CALLP   .S2     atan2dp_c,B3
||         LDDW    .D2T1   *B10,A5:A4        ; |210| 
||         LDDW    .D1T2   *A15,B5:B4        ; |210| 

$C$RL23:   ; CALL OCCURS {atan2dp_c} {0}     ; |210| 
           MVKL    .S1     output,A3
           MVKH    .S1     output,A3
           LDW     .D1T1   *+A3(8),A3        ; |210| 
           NOP             4
           ADD     .L1X    B11,A3,A3         ; |210| 
           STDW    .D1T1   A5:A4,*A3         ; |210| 
           LDDW    .D1T1   *A15,A23:A22      ; |137| 
           LDDW    .D2T2   *B10,B23:B22      ; |136| 
           NOP             3
           RCPDP   .S1     A23:A22,A5:A4     ; |55| 
           NOP             1
           MPYDP   .M1     A5:A4,A23:A22,A7:A6 ; |55| 
           NOP             9
           SUBDP   .L1     A11:A10,A7:A6,A7:A6 ; |55| 
           NOP             6
           MPYDP   .M1     A5:A4,A7:A6,A7:A6 ; |55| 
           NOP             9
           MPYDP   .M1     A7:A6,A23:A22,A5:A4 ; |55| 
           NOP             9
           SUBDP   .L1     A13:A12,A5:A4,A5:A4 ; |55| 
           NOP             6
           MPYDP   .M1     A7:A6,A5:A4,A7:A6 ; |55| 
           NOP             9
           MPYDP   .M1     A7:A6,A23:A22,A9:A8 ; |55| 
           MV      .L1     A11,A5            ; |55| 
           MV      .L1     A10,A4            ; |55| 
           NOP             7
           SUBDP   .L1     A5:A4,A9:A8,A5:A4 ; |55| 
           NOP             6
           MPYDP   .M1     A7:A6,A5:A4,A5:A4 ; |55| 
           NOP             9
           NOP             1
           MPYDP   .M2X    B23:B22,A5:A4,B21:B20 ; |55| 
           NOP             9
           NOP             1
           MV      .L1X    B20,A4            ; |139| 

           CALLP   .S2     atandpMod_atan2dpi,B3
||         MV      .L1X    B21,A5            ; |139| 

$C$RL24:   ; CALL OCCURS {atandpMod_atan2dpi} {0}  ; |139| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 68

           ZERO    .L2     B5:B4             ; |142| 
||         MV      .L1     A5,A7             ; |139| 
||         MV      .S1     A4,A6             ; |139| 
||         LDW     .D2T2   *+SP(68),B28      ; |156| 

           CMPLTDP .S2X    A23:A22,B5:B4,B0  ; |142| 
           ZERO    .L2     B5:B4             ; |144| 

   [ B0]   CMPGTDP .S2X    A7:A6,B5:B4,B1    ; |144| 
|| [ B0]   MVKL    .S1     0x54442d18,A8
|| [!B0]   ZERO    .L2     B1                ; |144| 

   [ B0]   MVKL    .S1     0x400921fb,A9
||         ZERO    .L2     B5:B4             ; |149| 

   [ B0]   MVKH    .S1     0x54442d18,A8
||         CMPGTDP .S2     B23:B22,B5:B4,B6  ; |149| 
||         LDW     .D2T2   *B28,B27          ; |211| 

   [ B0]   MVKH    .S1     0x400921fb,A9
||         ZERO    .L2     B5:B4             ; |149| 

           XOR     .L2     1,B6,B29          ; |149| 
|| [ B0]   ADDDP   .L1     A9:A8,A5:A4,A5:A4 ; |143| 
|| [ B1]   LDW     .D2T1   *+SP(28),A8       ; |144| 

   [ B1]   LDW     .D2T1   *+SP(32),A9       ; |144| 
           CMPEQDP .S2X    A23:A22,B5:B4,B8  ; |149| 
           ZERO    .L2     B5:B4             ; |152| 
           ZERO    .L2     B7:B6             ; |150| 
           CMPGTDP .S2     B23:B22,B7:B6,B6  ; |150| 
   [ B1]   SUBDP   .L1     A7:A6,A9:A8,A5:A4 ; |145| 
           AND     .L2     B8,B29,B2         ; |149| 
           CMPLTDP .S2X    A23:A22,B5:B4,B4  ; |152| 
           AND     .L2     B8,B6,B1          ; |150| 
           ZERO    .L1     A7:A6             ; |152| 
           XOR     .L2     1,B4,B5           ; |152| 
           CMPEQDP .S2X    B23:B22,A7:A6,B4  ; |152| 
   [ B2]   MVKL    .S1     0x54442d18,A4
   [ B2]   MVKL    .S1     0xbff921fb,A5
   [ B2]   MVKH    .S1     0x54442d18,A4

   [ B2]   MVKH    .S1     0xbff921fb,A5
||         AND     .L2     B4,B5,B2          ; |152| 
||         LDW     .D2T2   *+SP(56),B5       ; |153| 

   [ B1]   MVKL    .S1     0x54442d18,A4
   [ B1]   MVKL    .S1     0x3ff921fb,A5
   [ B1]   MVKH    .S1     0x54442d18,A4

   [ B1]   MVKH    .S1     0x3ff921fb,A5
||         AND     .L2     B0,B4,B1          ; |153| 
||         LDW     .D2T2   *+SP(36),B4       ; |153| 

   [ B2]   ZERO    .L1     A5:A4             ; |153| 
   [ B1]   MVKL    .S1     0x54442d18,A4
   [ B1]   MVKL    .S1     0x400921fb,A5
   [ B1]   MVKH    .S1     0x54442d18,A4

           CMPGTDP .S2     B21:B20,B5:B4,B0  ; |155| 
||         LDW     .D2T2   *+SP(64),B5       ; |156| 

   [ B1]   MVKH    .S1     0x400921fb,A5
   [ B0]   MVKL    .S1     0x54442d18,A4
   [ B0]   MVKL    .S1     0x3ff921fb,A5
   [ B0]   MVKH    .S1     0x54442d18,A4

           CMPLTDP .S2     B21:B20,B5:B4,B1  ; |158| 
|| [ B0]   MVKH    .S1     0x3ff921fb,A5

           ADD     .L2     B11,B27,B4        ; |211| 
   [ B1]   MVKL    .S1     0x54442d18,A4
   [ B1]   MVKL    .S1     0xbff921fb,A5
   [ B1]   MVKH    .S1     0x54442d18,A4
   [ B1]   MVKH    .S1     0xbff921fb,A5
           STDW    .D2T1   A5:A4,*B4         ; |211| 
           LDDW    .D2T2   *B10,B5:B4        ; |212| 
           ZERO    .L2     B26               ; |213| 
           SET     .S2     B26,31,31,B8      ; |213| 
           ADD     .L2     8,B11,B11         ; |207| 
           NOP             1

           MPYDP   .M2     B13:B12,B5:B4,B7:B6 ; |212| 
||         LDDW    .D1T2   *A15,B5:B4        ; |213| 

           NOP             4
           XOR     .L2     B5,B8,B5          ; |213| 
           STDW    .D1T2   B5:B4,*++A15      ; |213| 
           LDW     .D2T2   *+SP(12),B4       ; |213| 
           NOP             3
           STDW    .D2T2   B7:B6,*++B10      ; |212| 

           SUB     .L1X    B4,1,A0           ; |207| 
||         SUB     .L2     B4,1,B4           ; |207| 

   [ A0]   B       .S1     $C$L11            ; |207| 
|| [ A0]   LDDW    .D2T2   *B10,B7:B6        ; |208| 
|| [!A0]   MVKL    .S2     output,B10

   [ A0]   CALL    .S1     atan2             ; |208| 
||         STW     .D2T2   B4,*+SP(12)       ; |212| 
|| [!A0]   MVKH    .S2     output,B10

   [ A0]   LDDW    .D1T2   *A15,B5:B4        ; |208| 
|| [!A0]   LDW     .D2T1   *+B10(16),A6      ; |215| 
|| [!A0]   MVKL    .S1     a_ext,A4

   [!A0]   CALL    .S1     atan2dp_v         ; |215| 
   [!A0]   MVKL    .S2     b_ext,B4
   [ A0]   MV      .L1X    B7,A5             ; |208| 
           ; BRANCHCC OCCURS {$C$L11}        ; |207| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 3
           MVKH    .S2     b_ext,B4
           ADDKPC  .S2     $C$RL25,B3,0      ; |215| 

           MVK     .S2     0x777,B6          ; |215| 
||         MVKH    .S1     a_ext,A4

$C$RL25:   ; CALL OCCURS {atan2dp_v} {0}     ; |215| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 43
           MVKL    .S2     0x3e112e0b,B7
           MVKL    .S2     0xe826d695,B6
           MVKH    .S2     0x3e112e0b,B7

           LDW     .D2T1   *B10,A4           ; |66| 
||         MVKH    .S2     0xe826d695,B6

           CALLP   .S2     isequal,B3
||         LDW     .D2T2   *+B10(4),B4       ; |66| 
||         MVK     .S1     0x777,A6          ; |66| 
||         MVK     .L1     0x1,A8            ; |66| 

$C$RL26:   ; CALL OCCURS {isequal} {0}       ; |66| 
           MVKL    .S2     fcn_pass,B11
           MVKL    .S2     0x3e112e0b,B7
           MVKH    .S2     fcn_pass,B11
           MVKL    .S2     0xe826d695,B6

           LDW     .D2T2   *+B10(8),B4       ; |67| 
||         MVKH    .S2     0x3e112e0b,B7

           STW     .D2T1   A4,*+B11(4)       ; |66| 
||         MVKH    .S2     0xe826d695,B6

           CALLP   .S2     isequal,B3
||         LDW     .D2T1   *B10,A4           ; |67| 
||         MVK     .S1     0x777,A6          ; |67| 
||         MVK     .L1     0x1,A8            ; |67| 

$C$RL27:   ; CALL OCCURS {isequal} {0}       ; |67| 
           MVKL    .S2     0x3e112e0b,B7
           MVKL    .S2     0xe826d695,B6
           MVKH    .S2     0x3e112e0b,B7

           MV      .L1X    B10,A3            ; |67| 
||         STW     .D2T1   A4,*+B11(8)       ; |67| 
||         MVKH    .S2     0xe826d695,B6

           CALLP   .S2     isequal,B3
||         LDW     .D1T1   *A3,A4            ; |68| 
||         LDW     .D2T2   *+B10(12),B4      ; |68| 
||         MVK     .S1     0x777,A6          ; |68| 
||         MVK     .L1     0x1,A8            ; |68| 

$C$RL28:   ; CALL OCCURS {isequal} {0}       ; |68| 
           LDW     .D2T1   *+SP(40),A5       ; |68| 
           MVKL    .S2     0xe826d695,B6
           MVKL    .S2     0x3e112e0b,B7

           MV      .L1X    B10,A3            ; |68| 
||         STW     .D2T1   A4,*+B11(12)      ; |68| 
||         MVKH    .S2     0xe826d695,B6

           LDW     .D1T1   *A3,A4            ; |69| 
||         MVKH    .S2     0x3e112e0b,B7

           CALLP   .S2     isequal,B3
||         LDW     .D1T2   *A5,B4            ; |69| 
||         MVK     .S1     0x777,A6          ; |69| 
||         MVK     .L1     0x1,A8            ; |69| 

$C$RL29:   ; CALL OCCURS {isequal} {0}       ; |69| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 11

           LDW     .D1T1   *A14,A0           ; |72| 
||         LDW     .D2T2   *+SP(44),B4

           STW     .D2T1   A4,*+B11(16)      ; |69| 
           NOP             3

   [!A0]   B       .S1     $C$L12            ; |72| 
|| [ A0]   LDW     .D2T2   *B4,B0            ; |72| 

   [!A0]   CALL    .S1     print_test_results ; |219| 
   [ A0]   ADD     .L2     4,B4,B4
   [!A0]   MVKL    .S2     all_pass,B5
   [!A0]   MV      .L2X    A10,B4
   [!A0]   MVKH    .S2     all_pass,B5
           ; BRANCHCC OCCURS {$C$L12}        ; |72| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 10
   [ B0]   LDW     .D2T2   *B4,B4            ; |72| 
           CMPEQ   .L1     A4,0,A3           ; |72| 
           XOR     .L1     1,A3,A3           ; |72| 
   [!B0]   MV      .L1     A10,A0            ; |72| 
           NOP             1
   [ B0]   CMPEQ   .L2     B4,0,B4           ; |72| 
   [ B0]   XOR     .L2     1,B4,B4           ; |72| 
           NOP             1

   [ B0]   AND     .L1X    A3,B4,A0          ; |72| 
||         MVK     .L2     0x1,B4            ; |72| 

   [!A0]   MV      .L2X    A10,B4
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           CALL    .S1     print_test_results ; |219| 
           MVKL    .S2     all_pass,B5
           MVKH    .S2     all_pass,B5
           NOP             2
;** --------------------------------------------------------------------------*
$C$L12:    
;          EXCLUSIVE CPU CYCLES: 1

           MVK     .L1     0x4,A4            ; |219| 
||         STW     .D2T2   B4,*B5            ; |72| 
||         ADDKPC  .S2     $C$RL30,B3,0      ; |219| 

$C$RL30:   ; CALL OCCURS {print_test_results} {0}  ; |219| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 15
           MVKL    .S1     cycle_counts+24,A3

           MVKH    .S1     cycle_counts+24,A3
||         MV      .L2X    A10,B4            ; |114| 
||         MV      .L1     A12,A11           ; |114| 

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

           CALL    .S1     gimme_random      ; |229| 
||         EXT     .S2     B7,24,24,B5       ; |117| 
||         SUB     .L2     B8,B5,B4          ; |117| 

           MVKL    .S2     0x3fa6defc,B4
||         ADD     .L2     B4,B5,B7          ; |117| 
||         MVKL    .S1     0x402921fb,A5

           MVKH    .S2     0x3fa6defc,B4
||         MVKL    .S1     t_offset,A3

           MVKL    .S2     0xc01921fb,B5
||         MVKH    .S1     t_offset,A3

           MV      .L1X    B4,A4             ; |229| 
||         MVKH    .S2     0xc01921fb,B5
||         STDW    .D1T2   B7:B6,*A3         ; |117| 
||         MVK     .S1     0x80,A12
||         MV      .L2X    A10,B10

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
$C$L13:    
;          EXCLUSIVE CPU CYCLES: 1

           ADDKPC  .S2     $C$RL31,B3,0      ; |229| 
||         MVKH    .S1     0x402921fb,A5

$C$RL31:   ; CALL OCCURS {gimme_random} {0}  ; |229| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 128
           MVKL    .S2     input,B11
           MVKH    .S2     input,B11
           LDW     .D2T2   *B11,B4           ; |229| 
           MVKL    .S2     0xc01921fb,B5
           MVKH    .S2     0xc01921fb,B5
           NOP             2
           ADD     .L2     B10,B4,B4         ; |229| 

           STDW    .D2T1   A5:A4,*B4         ; |229| 
||         MVKL    .S2     0x3fa6defc,B4

           MVKH    .S2     0x3fa6defc,B4
           MVKL    .S1     0x402921fb,A5

           CALLP   .S2     gimme_random,B3
||         MV      .L1X    B4,A4             ; |230| 
||         MVKH    .S1     0x402921fb,A5

$C$RL32:   ; CALL OCCURS {gimme_random} {0}  ; |230| 
           LDW     .D2T2   *+B11(4),B4       ; |230| 
           NOP             4
           ADD     .L2     B10,B4,B4         ; |230| 

           STDW    .D2T1   A5:A4,*B4         ; |230| 
||         MVC     .S2     TSCL,B16          ; |122| 

           MVC     .S2     TSCH,B17          ; |122| 

           MV      .L1     A5,A23            ; |137| 
||         MV      .S1     A4,A22            ; |137| 

           RCPDP   .S1     A23:A22,A5:A4     ; |55| 
           ZERO    .L1     A9
           MPYDP   .M1     A5:A4,A23:A22,A7:A6 ; |55| 
           SET     .S1     A9,0x1e,0x1e,A9
           MV      .L1     A10,A8            ; |55| 
           MV      .L2X    A11,B4            ; |55| 
           MV      .L2X    A9,B5             ; |55| 
           MV      .L2X    A11,B8            ; |55| 
           MV      .L2X    A9,B9             ; |55| 
           MV      .L2     B11,B12           ; |55| 
           MVKL    .S1     t_start,A3
           MVKH    .S1     t_start,A3
           SUBDP   .L1     A9:A8,A7:A6,A7:A6 ; |55| 
           STDW    .D1T2   B17:B16,*A3       ; |122| 
           NOP             5
           MPYDP   .M1     A5:A4,A7:A6,A5:A4 ; |55| 
           NOP             9
           MPYDP   .M1     A5:A4,A23:A22,A7:A6 ; |55| 
           NOP             9
           NOP             1
           SUBDP   .L2X    B5:B4,A7:A6,B5:B4 ; |55| 
           NOP             6
           MPYDP   .M2X    A5:A4,B5:B4,B5:B4 ; |55| 
           NOP             9
           MPYDP   .M2X    B5:B4,A23:A22,B7:B6 ; |55| 
           NOP             9
           SUBDP   .L2     B9:B8,B7:B6,B7:B6 ; |55| 
           LDW     .D2T2   *B12,B8           ; |136| 
           NOP             5
           MPYDP   .M2     B5:B4,B7:B6,B5:B4 ; |55| 
           NOP             3
           ADD     .L2     B10,B8,B6         ; |136| 
           LDDW    .D2T2   *B6,B23:B22       ; |136| 
           NOP             4
           MPYDP   .M2     B23:B22,B5:B4,B21:B20 ; |55| 
           NOP             9
           NOP             1
           MV      .L1X    B20,A4            ; |139| 

           CALLP   .S2     atandpMod_atan2dpi,B3
||         MV      .L1X    B21,A5            ; |139| 

$C$RL33:   ; CALL OCCURS {atandpMod_atan2dpi} {0}  ; |139| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 56

           ZERO    .L2     B5:B4             ; |142| 
||         MVKL    .S2     0x400921fb,B7
||         MV      .L1     A4,A6             ; |139| 
||         MV      .D1     A5,A7             ; |139| 
||         MVKL    .S1     output+12,A3

           CMPLTDP .S2X    A23:A22,B5:B4,B0  ; |142| 
||         MVKH    .S1     output+12,A3

           ZERO    .L2     B5:B4             ; |144| 
||         LDW     .D1T1   *A3,A3            ; |234| 

           MVKH    .S2     0x400921fb,B7
|| [ B0]   MVKL    .S1     0x54442d18,A8
|| [!B0]   ZERO    .L2     B1                ; |144| 

   [ B0]   MVKH    .S1     0x54442d18,A8
||         MVKL    .S2     0x54442d18,B6

   [ B0]   MV      .L1X    B7,A9             ; |145| 
|| [ B0]   CMPGTDP .S2X    A5:A4,B5:B4,B1    ; |144| 

   [ B0]   ADDDP   .S1     A9:A8,A7:A6,A7:A6 ; |143| 
||         ZERO    .L2     B5:B4             ; |149| 

           MVKH    .S2     0x54442d18,B6
||         ZERO    .L1     A9:A8             ; |149| 

           ADD     .L1X    B10,A3,A3         ; |234| 

   [ B1]   SUBDP   .S1X    A5:A4,B7:B6,A7:A6 ; |145| 
||         CMPGTDP .S2X    B23:B22,A9:A8,B6  ; |149| 

           ZERO    .L1     A5:A4             ; |150| 
           MVKL    .S2     0x7fefffff,B7
           CMPGTDP .S2X    B23:B22,A5:A4,B29 ; |150| 
           ZERO    .L1     A5:A4             ; |152| 
           CMPEQDP .S2X    A23:A22,B5:B4,B4  ; |149| 

           XOR     .L2     1,B6,B5           ; |149| 
||         MVK     .D2     0xffffffff,B6     ; |155| 

           AND     .S2     B4,B29,B1         ; |150| 
||         AND     .D2     B4,B5,B2          ; |149| 
||         ZERO    .L2     B5:B4             ; |152| 

   [ B2]   MVKL    .S1     0xbff921fb,A7
||         CMPLTDP .S2X    A23:A22,B5:B4,B4  ; |152| 

   [ B2]   MVKL    .S1     0x54442d18,A6

   [ B2]   MVKH    .S1     0xbff921fb,A7
||         CMPEQDP .S2X    B23:B22,A5:A4,B28 ; |152| 
||         XOR     .L2     1,B4,B5           ; |152| 
||         MV      .D2     B6,B4             ; |155| 

   [ B2]   MVKH    .S1     0x54442d18,A6

   [ B1]   MVKL    .S1     0x3ff921fb,A7
||         AND     .L2     B0,B28,B2         ; |153| 
||         MVKH    .S2     0x7fefffff,B7

   [ B1]   MVKL    .S1     0x54442d18,A6
||         CMPGTDP .S2     B21:B20,B7:B6,B0  ; |155| 

   [ B1]   MVKH    .S1     0x3ff921fb,A7

   [ B1]   MVKH    .S1     0x54442d18,A6
||         AND     .L2     B28,B5,B1         ; |152| 
||         MVKL    .S2     0xffefffff,B5

   [ B1]   ZERO    .L1     A7:A6             ; |153| 
||         MVKH    .S2     0xffefffff,B5

   [ B2]   MVKL    .S1     0x400921fb,A7
   [ B2]   MVKL    .S1     0x54442d18,A6
   [ B2]   MVKH    .S1     0x400921fb,A7

   [ B2]   MVKH    .S1     0x54442d18,A6
||         CMPLTDP .S2     B21:B20,B5:B4,B2  ; |158| 

   [ B0]   MVKL    .S1     0x3ff921fb,A7
   [ B0]   MVKL    .S1     0x54442d18,A6
   [ B0]   MVKH    .S1     0x3ff921fb,A7
   [ B0]   MVKH    .S1     0x54442d18,A6
   [ B2]   MVKL    .S1     0xbff921fb,A7
   [ B2]   MVKL    .S1     0x54442d18,A6
   [ B2]   MVKH    .S1     0xbff921fb,A7
   [ B2]   MVKH    .S1     0x54442d18,A6

           STDW    .D1T1   A7:A6,*A3         ; |234| 
||         MVC     .S2     TSCL,B6           ; |128| 

           MVC     .S2     TSCH,B4           ; |128| 

           MVKL    .S1     t_start,A3
||         SUB     .L1     A12,1,A0          ; |227| 
||         MV      .L2     B4,B7             ; |128| 
||         MVKL    .S2     t_stop,B4
||         ADD     .D2     8,B10,B10         ; |227| 
||         SUB     .D1     A12,1,A12         ; |227| 

           MVKL    .S1     t_offset,A15
||         MVKH    .S2     t_stop,B4

           MVKH    .S1     t_offset,A15
||         STDW    .D2T2   B7:B6,*B4         ; |128| 
|| [ A0]   MVKL    .S2     0x3fa6defc,B4

           MVKH    .S1     t_start,A3
||         LDDW    .D1T1   *A15,A9:A8        ; |130| 
|| [ A0]   MVKH    .S2     0x3fa6defc,B4

           LDDW    .D1T1   *A3,A7:A6         ; |130| 
||         MVKL    .S1     cycle_counts+24,A3
|| [ A0]   MVKL    .S2     0xc01921fb,B5

           MVKH    .S1     cycle_counts+24,A3
           LDDW    .D1T1   *A3,A17:A16       ; |130| 
   [ A0]   MVKH    .S2     0xc01921fb,B5
           MV      .L2X    A3,B11            ; |128| 
           ADDU    .L1     A8,A6,A5:A4       ; |130| 

           ADD     .S1     A5,A9,A3          ; |130| 
|| [ A0]   B       .S2     $C$L13            ; |227| 
||         SUBU    .L1X    B6,A4,A5:A4       ; |130| 

   [ A0]   CALL    .S2     gimme_random      ; |229| 
||         ADD     .D1     A3,A7,A3          ; |130| 
||         EXT     .S1     A5,24,24,A6       ; |130| 
||         ADDU    .L1     A16,A4,A5:A4      ; |130| 

           SUB     .L1X    B7,A3,A3          ; |130| 

           ADD     .L1     A5,A17,A3         ; |130| 
||         ADD     .S1     A3,A6,A5          ; |130| 

           ADD     .L1     A3,A5,A5          ; |130| 

   [!A0]   CALL    .S2     __c6xabi_fltllif  ; |135| 
||         STDW    .D2T1   A5:A4,*B11        ; |130| 
|| [ A0]   MVKL    .S1     0x402921fb,A5
|| [ A0]   MV      .L1X    B4,A4             ; |229| 

           ; BRANCHCC OCCURS {$C$L13}        ; |227| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           LDDW    .D2T1   *B11,A5:A4        ; |135| 
           ADDKPC  .S2     $C$RL34,B3,3      ; |135| 
$C$RL34:   ; CALL OCCURS {__c6xabi_fltllif} {0}  ; |135| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 16
           ZERO    .L1     A14
           SET     .S1     A14,0x1a,0x1d,A14
           MPYSP   .M1     A14,A4,A3         ; |135| 
           ZERO    .L1     A13
           SET     .S1     A13,0x15,0x1d,A13
           MV      .L1     A10,A12           ; |135| 
           SPDP    .S1     A3,A5:A4          ; |135| 
           NOP             2
           ADDDP   .L1     A13:A12,A5:A4,A5:A4 ; |135| 
           CALLP   .S2     __c6xabi_fixdlli,B3
$C$RL35:   ; CALL OCCURS {__c6xabi_fixdlli} {0}  ; |135| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 12
           MVK     .S1     24,A3

           SUB     .L1X    B11,A3,A3
||         MV      .L2X    A11,B4            ; |114| 
||         STDW    .D2T1   A5:A4,*B11        ; |135| 

           MVC     .S2     B4,TSCL           ; |115| 
||         STDW    .D1T1   A11:A10,*A3       ; |114| 

           MVC     .S2     TSCL,B5           ; |116| 
           MVC     .S2     TSCH,B4           ; |116| 
           MVC     .S2     TSCL,B6           ; |117| 
           MVC     .S2     TSCH,B8           ; |117| 

           MV      .L1X    B12,A3
||         MVKL    .S1     output,A5

           LDW     .D1T1   *A3,A15
||         MVKH    .S1     output,A5
||         SUBU    .L2     B6,B5,B7:B6       ; |117| 
||         MV      .L1     A15,A4            ; |117| 

           MVK     .S1     0x80,A3
||         EXT     .S2     B7,24,24,B5       ; |117| 
||         LDW     .D1T2   *+A3(4),B11
||         SUB     .L2     B8,B4,B4          ; |117| 

           ADD     .L2     B4,B5,B7          ; |117| 
||         LDW     .D1T1   *A5,A12

           STDW    .D1T2   B7:B6,*A4         ; |117| 
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
$C$L14:    
;          EXCLUSIVE CPU CYCLES: 8
           MVC     .S2     TSCL,B6           ; |122| 
           MVC     .S2     TSCH,B7           ; |122| 
           CALL    .S1     atan2             ; |243| 

           LDDW    .D1T1   *A15++,A5:A4      ; |243| 
||         LDDW    .D2T2   *B11++,B5:B4      ; |243| 

           MVKL    .S2     t_start,B8
           MVKH    .S2     t_start,B8
           STDW    .D2T2   B7:B6,*B8         ; |122| 
           ADDKPC  .S2     $C$RL36,B3,0      ; |243| 
$C$RL36:   ; CALL OCCURS {atan2} {0}         ; |243| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 20

           STDW    .D1T1   A5:A4,*A12++      ; |243| 
||         MVC     .S2     TSCL,B16          ; |128| 

           MVC     .S2     TSCH,B4           ; |128| 

           MVKL    .S1     t_start,A3
||         MVKL    .S2     t_offset,B12
||         SUB     .L1X    B10,1,A0          ; |241| 
||         MV      .L2     B4,B17            ; |128| 
||         SUB     .D2     B10,1,B10         ; |241| 

           MVKH    .S1     t_start,A3
||         MVKH    .S2     t_offset,B12

           LDDW    .D1T1   *A3,A7:A6         ; |130| 
||         LDDW    .D2T2   *B12,B7:B6        ; |130| 
||         MVKL    .S1     cycle_counts,A31

           MVKH    .S1     cycle_counts,A31
           MVKL    .S1     t_stop,A30
           MVKH    .S1     t_stop,A30
           STDW    .D1T2   B17:B16,*A30      ; |128| 

           ADDU    .L1X    B6,A6,A5:A4       ; |130| 
||         MVKL    .S2     cycle_counts,B6

           ADD     .L1X    A5,B7,A6          ; |130| 
||         MVKH    .S2     cycle_counts,B6

           SUBU    .L2X    B16,A4,B9:B8      ; |130| 
||         LDDW    .D1T1   *A31,A5:A4        ; |130| 
||         ADD     .L1     A6,A7,A6          ; |130| 

           EXT     .S2     B9,24,24,B31      ; |130| 
|| [!A0]   MV      .L1X    B6,A15

           SUB     .L2X    B4,A6,B7          ; |130| 

   [ A0]   BNOP    .S1     $C$L14,1          ; |241| 
||         ADD     .L2     B7,B31,B7         ; |130| 

           ADDU    .L2X    A4,B8,B5:B4       ; |130| 
           ADD     .L2X    B5,A5,B5          ; |130| 
           ADD     .L2     B5,B7,B5          ; |130| 

   [!A0]   CALL    .S1     __c6xabi_fltllif  ; |135| 
||         STDW    .D2T2   B5:B4,*B6         ; |130| 

           ; BRANCHCC OCCURS {$C$L14}        ; |241| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           LDDW    .D1T1   *A15,A5:A4        ; |135| 
           ADDKPC  .S2     $C$RL37,B3,3      ; |135| 
$C$RL37:   ; CALL OCCURS {__c6xabi_fltllif} {0}  ; |135| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 13
           MPYSP   .M1     A14,A4,A3         ; |135| 
           MV      .L1     A10,A12           ; |135| 
           NOP             2
           SPDP    .S1     A3,A5:A4          ; |135| 
           NOP             1
           ADDDP   .L1     A13:A12,A5:A4,A5:A4 ; |135| 
           CALLP   .S2     __c6xabi_fixdlli,B3
$C$RL38:   ; CALL OCCURS {__c6xabi_fixdlli} {0}  ; |135| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 10

           STDW    .D1T1   A11:A10,*+A15(8)  ; |114| 
||         MV      .L2X    A11,B4            ; |114| 

           MVC     .S2     B4,TSCL           ; |115| 
||         STDW    .D1T1   A5:A4,*A15        ; |135| 

           MVC     .S2     TSCL,B4           ; |116| 
           MVC     .S2     TSCH,B6           ; |116| 
           MVC     .S2     TSCL,B5           ; |117| 
           MVC     .S2     TSCH,B7           ; |117| 
           SUBU    .L2     B5,B4,B5:B4       ; |117| 

           EXT     .S2     B5,24,24,B6       ; |117| 
||         SUB     .L2     B7,B6,B5          ; |117| 
||         MVK     .S1     0x80,A3

           ADD     .L2     B5,B6,B5          ; |117| 

           STDW    .D2T2   B5:B4,*B12        ; |117| 
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
$C$L15:    
;          EXCLUSIVE CPU CYCLES: 19
           MVC     .S2     TSCL,B4           ; |122| 
           MVC     .S2     TSCH,B5           ; |122| 
           MVKL    .S1     input+4,A3
           MVKH    .S1     input+4,A3
           LDW     .D1T1   *A3,A4            ; |252| 
           ADD     .L2X    -4,A3,B6
           LDW     .D2T2   *B6,B6            ; |252| 
           MVKL    .S1     t_start,A3
           MVKH    .S1     t_start,A3
           ADD     .L1     A12,A4,A4         ; |252| 
           LDDW    .D1T1   *A4,A5:A4         ; |252| 
           ADD     .L2X    A12,B6,B6         ; |252| 
           LDDW    .D2T2   *B6,B7:B6         ; |252| 
           CALL    .S1     atan2dp           ; |252| 
           STDW    .D1T2   B5:B4,*A3         ; |122| 
           MV      .L2X    A4,B4             ; |252| 
           MV      .L2X    A5,B5             ; |252| 
           MV      .L1X    B6,A4             ; |252| 

           MV      .L1X    B7,A5             ; |252| 
||         ADDKPC  .S2     $C$RL39,B3,0      ; |252| 

$C$RL39:   ; CALL OCCURS {atan2dp} {0}       ; |252| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 25
           MVKL    .S2     output+4,B4
           MVKH    .S2     output+4,B4
           LDW     .D2T2   *B4,B4            ; |252| 
           NOP             4
           ADD     .L1X    A12,B4,A3         ; |252| 

           STDW    .D1T1   A5:A4,*A3         ; |252| 
||         MVC     .S2     TSCL,B16          ; |128| 

           MVC     .S2     TSCH,B8           ; |128| 

           MVKL    .S1     t_start,A3
||         MV      .L2     B12,B11           ; |130| 
||         ADDAD   .D1     A15,1,A31
||         SUB     .L1X    B10,1,A0          ; |250| 
||         MVKL    .S2     t_stop,B31
||         MV      .D2     B8,B17            ; |128| 

           MVKH    .S2     t_stop,B31
||         SUB     .L2     B10,1,B10         ; |250| 
||         MVKH    .S1     t_start,A3
||         LDDW    .D2T2   *B11,B7:B6        ; |130| 

           LDDW    .D1T1   *A3,A5:A4         ; |130| 
           MV      .L1     A31,A14           ; |128| 
           LDDW    .D1T1   *A31,A7:A6        ; |130| 
           ADD     .L1     8,A12,A12         ; |250| 
           STDW    .D2T2   B17:B16,*B31      ; |128| 
           ADDU    .L2X    B6,A4,B5:B4       ; |130| 

           ADD     .S2     B5,B7,B7          ; |130| 
||         SUBU    .L2     B16,B4,B5:B4      ; |130| 

           ADD     .L2X    B7,A5,B7          ; |130| 
|| [ A0]   B       .S1     $C$L15            ; |250| 
||         EXT     .S2     B5,24,24,B5       ; |130| 

           ADDU    .L1X    A6,B4,A5:A4       ; |130| 
||         SUB     .L2     B8,B7,B4          ; |130| 

           ADD     .L2     B4,B5,B4          ; |130| 
           ADD     .L1     A5,A7,A3          ; |130| 
           ADD     .L1X    A3,B4,A5          ; |130| 

   [!A0]   CALL    .S1     __c6xabi_fltllif  ; |135| 
||         STDW    .D1T1   A5:A4,*A14        ; |130| 

           ; BRANCHCC OCCURS {$C$L15}        ; |250| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           LDDW    .D1T1   *+A15(8),A5:A4    ; |135| 
           ADDKPC  .S2     $C$RL40,B3,3      ; |135| 
$C$RL40:   ; CALL OCCURS {__c6xabi_fltllif} {0}  ; |135| 
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
$C$RL41:   ; CALL OCCURS {__c6xabi_fixdlli} {0}  ; |135| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 11
           MV      .L2X    A11,B5            ; |114| 

           MV      .L2X    A14,B4            ; |135| 
||         STDW    .D1T1   A11:A10,*+A15(16) ; |114| 

           MVC     .S2     B5,TSCL           ; |115| 
||         STDW    .D2T1   A5:A4,*B4         ; |135| 

           MVC     .S2     TSCL,B4           ; |116| 
           MVC     .S2     TSCH,B6           ; |116| 
           MVC     .S2     TSCL,B5           ; |117| 
           MVC     .S2     TSCH,B7           ; |117| 
           SUBU    .L2     B5,B4,B5:B4       ; |117| 

           EXT     .S2     B5,24,24,B6       ; |117| 
||         SUB     .L2     B7,B6,B5          ; |117| 
||         MVK     .S1     0x80,A3

           ADD     .L2     B5,B6,B5          ; |117| 

           STDW    .D2T2   B5:B4,*B11        ; |117| 
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
$C$L16:    
;          EXCLUSIVE CPU CYCLES: 19
           MVC     .S2     TSCL,B4           ; |122| 
           MVC     .S2     TSCH,B5           ; |122| 
           MVKL    .S2     input,B13
           MVKH    .S2     input,B13
           LDW     .D2T2   *B13,B6           ; |261| 
           ADD     .L1X    4,B13,A3
           LDW     .D1T1   *A3,A4            ; |261| 
           MVKL    .S1     t_start,A3
           MVKH    .S1     t_start,A3
           ADD     .L2X    A12,B6,B6         ; |261| 
           LDDW    .D2T2   *B6,B7:B6         ; |261| 
           ADD     .L1     A12,A4,A4         ; |261| 
           LDDW    .D1T1   *A4,A5:A4         ; |261| 
           CALL    .S1     atan2dp_c         ; |261| 
           STDW    .D1T2   B5:B4,*A3         ; |122| 
           ADDKPC  .S2     $C$RL42,B3,1      ; |261| 

           MV      .L2X    A4,B4             ; |261| 
||         MV      .L1X    B6,A4             ; |261| 

           MV      .L2X    A5,B5             ; |261| 
||         MV      .L1X    B7,A5             ; |261| 

$C$RL42:   ; CALL OCCURS {atan2dp_c} {0}     ; |261| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 25
           MVKL    .S2     output+8,B4
           MVKH    .S2     output+8,B4
           LDW     .D2T2   *B4,B4            ; |261| 
           NOP             4
           ADD     .L1X    A12,B4,A3         ; |261| 

           STDW    .D1T1   A5:A4,*A3         ; |261| 
||         MVC     .S2     TSCL,B4           ; |128| 

           MVC     .S2     TSCH,B5           ; |128| 

           MVKL    .S1     t_start,A3
||         LDDW    .D2T2   *B11,B7:B6        ; |130| 
||         ADDAD   .D1     A15,2,A31
||         SUB     .L1X    B10,1,A0          ; |259| 
||         MVKL    .S2     t_stop,B12
||         SUB     .L2     B10,1,B10         ; |259| 

           MVKH    .S2     t_stop,B12
||         MVKH    .S1     t_start,A3

           LDDW    .D1T1   *A3,A5:A4         ; |130| 
           MV      .L1     A31,A14           ; |128| 
           LDDW    .D1T1   *A31,A7:A6        ; |130| 
           ADD     .L1     8,A12,A12         ; |259| 
           STDW    .D2T2   B5:B4,*B12        ; |128| 
           ADDU    .L2X    B6,A4,B9:B8       ; |130| 

           ADD     .S2     B9,B7,B8          ; |130| 
||         SUBU    .L2     B4,B8,B7:B6       ; |130| 

           ADD     .L2X    B8,A5,B8          ; |130| 
|| [ A0]   B       .S1     $C$L16            ; |259| 
||         EXT     .S2     B7,24,24,B7       ; |130| 

           ADDU    .L1X    A6,B6,A5:A4       ; |130| 
||         SUB     .L2     B5,B8,B6          ; |130| 

           ADD     .L2     B6,B7,B6          ; |130| 
           ADD     .L1     A5,A7,A3          ; |130| 
           ADD     .L1X    A3,B6,A5          ; |130| 

   [!A0]   CALL    .S1     __c6xabi_fltllif  ; |135| 
||         STDW    .D1T1   A5:A4,*A14        ; |130| 

           ; BRANCHCC OCCURS {$C$L16}        ; |259| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           LDDW    .D1T1   *+A15(16),A5:A4   ; |135| 
           ADDKPC  .S2     $C$RL43,B3,3      ; |135| 
$C$RL43:   ; CALL OCCURS {__c6xabi_fltllif} {0}  ; |135| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 109
           ZERO    .L1     A3
           SET     .S1     A3,0x1a,0x1d,A3
           MPYSP   .M1     A3,A4,A3          ; |135| 
           MV      .L1     A10,A12           ; |135| 
           NOP             2
           SPDP    .S1     A3,A5:A4          ; |135| 
           NOP             1
           ADDDP   .L1     A13:A12,A5:A4,A5:A4 ; |135| 
           CALLP   .S2     __c6xabi_fixdlli,B3
$C$RL44:   ; CALL OCCURS {__c6xabi_fixdlli} {0}  ; |135| 

           MV      .L2X    A11,B4            ; |114| 
||         STDW    .D1T1   A11:A10,*+A15(32) ; |114| 

           STDW    .D1T1   A5:A4,*A14        ; |135| 
||         MVC     .S2     B4,TSCL           ; |115| 

           MVC     .S2     TSCL,B8           ; |116| 
           MVC     .S2     TSCH,B4           ; |116| 
           MVKL    .S1     t_start,A10

           MVKH    .S1     t_start,A10
||         MV      .L2     B4,B9             ; |116| 

           STDW    .D1T2   B9:B8,*A10        ; |116| 
||         MVC     .S2     TSCL,B5           ; |117| 

           MVC     .S2     TSCH,B4           ; |117| 
           SUBU    .L2     B5,B8,B7:B6       ; |117| 

           SUB     .L2     B4,B9,B5          ; |117| 
||         EXT     .S2     B7,24,24,B7       ; |117| 

           MVKL    .S1     output,A11
||         LDW     .D2T1   *B13,A4           ; |268| 
||         ADD     .L2     B5,B7,B7          ; |117| 

           MVKH    .S1     output,A11
||         ADD     .L2     4,B13,B16
||         STDW    .D2T2   B7:B6,*B11        ; |117| 
||         MVK     .S2     0x80,B6           ; |268| 

           CALLP   .S2     atan2dp_v,B3
||         LDW     .D1T1   *+A11(16),A6      ; |268| 
||         LDW     .D2T2   *B16,B4           ; |268| 

$C$RL45:   ; CALL OCCURS {atan2dp_v} {0}     ; |268| 
           MVC     .S2     TSCL,B16          ; |128| 
           MVC     .S2     TSCH,B4           ; |128| 

           LDDW    .D1T1   *A10,A5:A4        ; |130| 
||         LDDW    .D2T2   *B11,B9:B8        ; |130| 

           MVK     .S2     16,B10
           ADD     .L2X    A14,B10,B10
           LDDW    .D2T2   *B10,B7:B6        ; |130| 
           MV      .L2     B4,B17            ; |128| 
           ADDU    .L1X    B8,A4,A7:A6       ; |130| 
           SUBU    .L1X    B16,A6,A9:A8      ; |130| 

           MV      .L1     A8,A3             ; |130| 
||         ADD     .S1X    A7,B9,A4          ; |130| 

           ADDU    .L1X    B6,A3,A5:A4       ; |130| 
||         ADD     .S1     A4,A5,A3          ; |130| 

           SUB     .L1X    B4,A3,A3          ; |130| 

           EXT     .S1     A9,24,24,A31      ; |130| 
||         ADD     .L2X    A5,B7,B4          ; |130| 

           ADD     .L1     A3,A31,A3         ; |130| 

           CALLP   .S2     __c6xabi_fltllif,B3
||         ADD     .L1X    B4,A3,A5          ; |130| 
||         STDW    .D2T2   B17:B16,*B12      ; |128| 

$C$RL46:   ; CALL OCCURS {__c6xabi_fltllif} {0}  ; |130| 
           ZERO    .L1     A3
           SET     .S1     A3,0x1a,0x1d,A3
           MPYSP   .M1     A3,A4,A3          ; |130| 
           NOP             3
           SPDP    .S1     A3,A5:A4          ; |130| 
           NOP             1
           ADDDP   .L1     A13:A12,A5:A4,A5:A4 ; |130| 
           CALLP   .S2     __c6xabi_fixdlli,B3
$C$RL47:   ; CALL OCCURS {__c6xabi_fixdlli} {0}  ; |130| 
           MVKL    .S2     0x3e112e0b,B7
           MVKL    .S2     0xe826d695,B6
           MVKH    .S2     0x3e112e0b,B7

           STDW    .D2T1   A5:A4,*B10        ; |130| 
||         LDW     .D1T2   *+A11(4),B4       ; |66| 
||         MVKH    .S2     0xe826d695,B6

           CALLP   .S2     isequal,B3
||         LDW     .D1T1   *A11,A4           ; |66| 
||         MVK     .S1     0x80,A6           ; |66| 
||         MVK     .L1     0x1,A8            ; |66| 

$C$RL48:   ; CALL OCCURS {isequal} {0}       ; |66| 
           MVKL    .S2     0xe826d695,B6

           MVKL    .S1     fcn_pass,A3
||         MVKL    .S2     0x3e112e0b,B7

           LDW     .D1T2   *+A11(8),B4       ; |67| 
||         MVKH    .S1     fcn_pass,A3
||         MVKH    .S2     0xe826d695,B6

           MV      .L1     A4,A5             ; |66| 
||         LDW     .D1T1   *A11,A4           ; |67| 
||         MV      .S1     A3,A10            ; |66| 
||         MVKH    .S2     0x3e112e0b,B7

           CALLP   .S2     isequal,B3
||         STW     .D1T1   A5,*+A10(4)       ; |66| 
||         MVK     .S1     0x80,A6           ; |67| 
||         MVK     .L1     0x1,A8            ; |67| 

$C$RL49:   ; CALL OCCURS {isequal} {0}       ; |67| 
           MVKL    .S2     0x3e112e0b,B7
           MVKL    .S2     0xe826d695,B6

           STW     .D1T1   A4,*+A10(8)       ; |67| 
||         MVKH    .S2     0x3e112e0b,B7

           LDW     .D1T2   *+A11(12),B4      ; |68| 
||         MVKH    .S2     0xe826d695,B6

           CALLP   .S2     isequal,B3
||         LDW     .D1T1   *A11,A4           ; |68| 
||         MVK     .S1     0x80,A6           ; |68| 
||         MVK     .L1     0x1,A8            ; |68| 

$C$RL50:   ; CALL OCCURS {isequal} {0}       ; |68| 
           LDW     .D2T2   *+SP(20),B4       ; |68| 
           MVKL    .S2     0x3e112e0b,B7
           MVKL    .S2     0xe826d695,B6
           MVKH    .S2     0x3e112e0b,B7

           STW     .D1T1   A4,*+A10(12)      ; |68| 
||         MVKH    .S2     0xe826d695,B6

           CALLP   .S2     isequal,B3
||         LDW     .D2T2   *B4,B4            ; |69| 
||         LDW     .D1T1   *A11,A4           ; |69| 
||         MVK     .S1     0x80,A6           ; |69| 
||         MVK     .L1     0x1,A8            ; |69| 

$C$RL51:   ; CALL OCCURS {isequal} {0}       ; |69| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 16
           LDW     .D2T2   *+SP(48),B5       ; |69| 
           MV      .L2X    A4,B4             ; |69| 
           STW     .D1T2   B4,*+A10(16)      ; |69| 
           NOP             2
           LDW     .D2T2   *B5,B0            ; |72| 
           LDW     .D2T2   *+SP(52),B5
           NOP             3

   [!B0]   B       .S1     $C$L17            ; |72| 
||         MV      .L2     B0,B1             ; guard predicate rewrite

   [ B0]   LDW     .D2T2   *B5,B0            ; |72| 
   [ B1]   ADD     .L2     4,B5,B5
           NOP             3
           ; BRANCHCC OCCURS {$C$L17}        ; |72| 
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

   [ B0]   B       .S1     $C$L18            ; |72| 
   [ B0]   CALL    .S1     print_test_results ; |274| 
   [ B0]   MVKL    .S1     all_pass,A4
   [ B0]   MVKH    .S1     all_pass,A4
           NOP             2
           ; BRANCHCC OCCURS {$C$L18}        ; |72| 
;** --------------------------------------------------------------------------*
$C$L17:    
;          EXCLUSIVE CPU CYCLES: 5
           CALL    .S1     print_test_results ; |274| 
           MVKL    .S1     all_pass,A4
           MVKH    .S1     all_pass,A4
           MV      .L1     A12,A3
           NOP             1
;** --------------------------------------------------------------------------*
$C$L18:    
;          EXCLUSIVE CPU CYCLES: 1

           STW     .D1T1   A3,*A4            ; |72| 
||         MVK     .L1     0x2,A4            ; |274| 
||         ADDKPC  .S2     $C$RL52,B3,0      ; |274| 

$C$RL52:   ; CALL OCCURS {print_test_results} {0}  ; |274| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 30
           MVKL    .S2     $C$SL2+0,B4
           MVKH    .S2     $C$SL2+0,B4

           CALLP   .S2     printf,B3
||         STW     .D2T2   B4,*+SP(4)        ; |275| 

$C$RL53:   ; CALL OCCURS {printf} {0}        ; |275| 
           MVKL    .S2     $C$SL3+0,B4
           MVKH    .S2     $C$SL3+0,B4

           CALLP   .S2     printf,B3
||         STW     .D2T2   B4,*+SP(4)        ; |275| 

$C$RL54:   ; CALL OCCURS {printf} {0}        ; |275| 
           MVKL    .S1     $C$SL1+0,A10
           MVKH    .S1     $C$SL1+0,A10

           CALLP   .S2     print_profile_results,B3
||         MV      .L1     A10,A4            ; |282| 

$C$RL55:   ; CALL OCCURS {print_profile_results} {0}  ; |282| 

           CALLP   .S2     print_memory_results,B3
||         MV      .L1     A10,A4            ; |285| 

$C$RL56:   ; CALL OCCURS {print_memory_results} {0}  ; |285| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 11
           LDW     .D2T2   *++SP(88),B3      ; |286| 
           LDDW    .D2T1   *++SP,A13:A12     ; |286| 
           LDDW    .D2T1   *++SP,A15:A14     ; |286| 
           LDDW    .D2T2   *++SP,B11:B10     ; |286| 
           LDDW    .D2T2   *++SP,B13:B12     ; |286| 

           LDW     .D2T1   *++SP(8),A10      ; |286| 
||         RET     .S2     B3                ; |286| 

           LDW     .D2T1   *++SP(8),A11      ; |286| 
           NOP             4
           ; BRANCH OCCURS {B3}              ; |286| 
;******************************************************************************
;* STRINGS                                                                    *
;******************************************************************************
	.sect	".const:.string"
$C$SL1:	.string	"atan2DP",0
$C$SL2:	.string	"----------------------------------------",0
$C$SL3:	.string	"----------------------------------------",10,0
;*****************************************************************************
;* UNDEFINED EXTERNAL REFERENCES                                             *
;*****************************************************************************
	.global	printf
	.global	atan2
	.global	driver_init
	.global	print_profile_results
	.global	print_memory_results
	.global	print_test_results
	.global	gimme_random
	.global	isequal
	.global	atan2dp
	.global	atan2dp_c
	.global	atan2dp_v
	.global	ti_math_vTable
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
