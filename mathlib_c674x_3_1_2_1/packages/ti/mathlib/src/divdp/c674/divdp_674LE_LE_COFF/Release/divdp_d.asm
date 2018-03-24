;******************************************************************************
;* TMS320C6x C/C++ Codegen                                          PC v7.4.2 *
;* Date/Time created: Mon May 16 23:42:33 2016                                *
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
	.word	0436c665bh,040028220h		; _a[0] @ 0
	.word	0dd18746bh,03ffe598bh		; _a[1] @ 64
	.word	00510e0f9h,0bfb35f8eh		; _a[2] @ 128
	.word	044000a11h,03fec60b0h		; _a[3] @ 192
	.word	0ac99509eh,0bfef5c9bh		; _a[4] @ 256
	.word	081bc2d42h,03fc761b8h		; _a[5] @ 320
	.word	0bf147d66h,0bff1d973h		; _a[6] @ 384
	.word	09c0229a6h,0bff0c5deh		; _a[7] @ 448
	.word	0577e6c17h,03ffa585fh		; _a[8] @ 512
	.word	08f359289h,0bfeba768h		; _a[9] @ 576
	.word	0bb40b34eh,0bfeb4a43h		; _a[10] @ 640
	.word	000713f07h,0bfff1efdh		; _a[11] @ 704
	.word	0595281adh,0c0051cb9h		; _a[12] @ 768
	.word	0841fb4d1h,03fe0b5dbh		; _a[13] @ 832
	.word	033ccb627h,040069340h		; _a[14] @ 896
	.word	09a9b2159h,0bfef61bah		; _a[15] @ 960
	.word	0eec1ea1bh,0c0091385h		; _a[16] @ 1024
	.word	0d01e90e5h,0bffe81e3h		; _a[17] @ 1088
	.word	021f1c250h,0c002914dh		; _a[18] @ 1152
	.word	0f904633ch,03ff06f7eh		; _a[19] @ 1216
	.word	040aaeafbh,04006962dh		; _a[20] @ 1280
	.word	0595281adh,040051cb9h		; _a[21] @ 1344
	.word	0fc0096ffh,03ff20a53h		; _a[22] @ 1408
	.word	0bb3f05cfh,03ff5978dh		; _a[23] @ 1472
	.word	07d8c1cd9h,0c0074d6eh		; _a[24] @ 1536
	.word	0f06a60c7h,0bfff7163h		; _a[25] @ 1600
	.word	061a2b247h,0c004838ch		; _a[26] @ 1664
	.word	0b0a62599h,03ffe47f7h		; _a[27] @ 1728
	.word	0b81585a3h,0c0027386h		; _a[28] @ 1792
	.word	0f19feaech,0c0010d8eh		; _a[29] @ 1856
	.word	036c8132ah,03fdf14bah		; _a[30] @ 1920
	.word	0486d571bh,04005ffedh		; _a[31] @ 1984
	.word	0638e44d2h,03ffeaddah		; _a[32] @ 2048
	.word	0dd93c46eh,03ff508cch		; _a[33] @ 2112
	.word	0e8e1d649h,0c0063d2ah		; _a[34] @ 2176
	.word	058c238f5h,040020395h		; _a[35] @ 2240
	.word	0a33cb08ah,0bff14408h		; _a[36] @ 2304
	.word	086e3b470h,0bfddcddfh		; _a[37] @ 2368
	.word	041d58d66h,0bffee8b9h		; _a[38] @ 2432
	.word	0606092e8h,0c0087b0ch		; _a[39] @ 2496
	.word	0b0a11d1ch,03ff6cfd5h		; _a[40] @ 2560
	.word	09c403d07h,03fe99a2ch		; _a[41] @ 2624
	.word	0b796daa2h,0bfef4ed9h		; _a[42] @ 2688
	.word	03afaa7d1h,03fdf9515h		; _a[43] @ 2752
	.word	02af4a050h,03ff5e0d7h		; _a[44] @ 2816
	.word	0433863f5h,0bff00e16h		; _a[45] @ 2880
	.word	0572c36c0h,03fe44389h		; _a[46] @ 2944
	.word	0ebb418a1h,0bfd64439h		; _a[47] @ 3008
	.word	0b8503e06h,03ff91268h		; _a[48] @ 3072
	.word	01f03d146h,0bff21583h		; _a[49] @ 3136
	.word	055fbb518h,03ffaaf80h		; _a[50] @ 3200
	.word	0daf5847ch,0bffce5c7h		; _a[51] @ 3264
	.word	0e873f240h,040084399h		; _a[52] @ 3328
	.word	02110f1c0h,0c007c609h		; _a[53] @ 3392
	.word	0500a038fh,0bfed84aeh		; _a[54] @ 3456
	.word	0e7ad22e3h,0bffc4a5ah		; _a[55] @ 3520
	.word	0ed51a793h,0bff3d878h		; _a[56] @ 3584
	.word	09fe5e3f5h,03fefb6cfh		; _a[57] @ 3648
	.word	0023711e5h,03fe7344ch		; _a[58] @ 3712
	.word	03c40222fh,03fb10301h		; _a[59] @ 3776
	.word	0e2386edch,0bff3217fh		; _a[60] @ 3840
	.word	0fbfc6541h,0c0037b8ch		; _a[61] @ 3904
	.word	0ebbba55dh,03fb5c86ch		; _a[62] @ 3968
	.word	0cd35a858h,04001ae3bh		; _a[63] @ 4032
	.word	0d5e727c2h,0bff1724ah		; _a[64] @ 4096
	.word	0ac215b9ah,0c00842c6h		; _a[65] @ 4160
	.word	082a48a8eh,03ff6512fh		; _a[66] @ 4224
	.word	0f965b20ch,03ff5ccbah		; _a[67] @ 4288
	.word	092b4a30ah,0bfe635b1h		; _a[68] @ 4352
	.word	0017a5383h,03ff5ab51h		; _a[69] @ 4416
	.word	0ca8e2e2ch,03fec144dh		; _a[70] @ 4480
	.word	038cbf968h,0bff1de57h		; _a[71] @ 4544
	.word	04d940789h,0bff8a2b9h		; _a[72] @ 4608
	.word	019b258adh,0bff75596h		; _a[73] @ 4672
	.word	0b6177ea2h,0bfe76b66h		; _a[74] @ 4736
	.word	078798e61h,03fdfbb2ah		; _a[75] @ 4800
	.word	0c94f69cbh,0bfe33139h		; _a[76] @ 4864
	.word	0b600d86dh,0bfd11ecdh		; _a[77] @ 4928
	.word	0e051e4cfh,03ffdcf53h		; _a[78] @ 4992
	.word	02334b86eh,0c0022328h		; _a[79] @ 5056
	.word	00f0a5effh,0c007dd9ah		; _a[80] @ 5120
	.word	093b04b8dh,03ffcac55h		; _a[81] @ 5184
	.word	0ffac1d2ah,0bfe01873h		; _a[82] @ 5248
	.word	0b85da9ffh,0bfeea818h		; _a[83] @ 5312
	.word	06697e48eh,0c0074e5fh		; _a[84] @ 5376
	.word	0d30e2f6eh,0bfca0063h		; _a[85] @ 5440
	.word	0fd9e25f0h,03fce9e92h		; _a[86] @ 5504
	.word	0bac2084eh,0bff45596h		; _a[87] @ 5568
	.word	05d0fa58fh,0c005cf50h		; _a[88] @ 5632
	.word	0338dcc06h,0bfd8e597h		; _a[89] @ 5696
	.word	0d52205e4h,0c0026bc1h		; _a[90] @ 5760
	.word	0a301f828h,03ffbd526h		; _a[91] @ 5824
	.word	0d8d36b4ch,0bfc60b5eh		; _a[92] @ 5888
	.word	07ba9c48ah,0bfebba09h		; _a[93] @ 5952
	.word	06e1c3d4dh,0400583d1h		; _a[94] @ 6016
	.word	0a464ceb7h,0bff4ba83h		; _a[95] @ 6080
	.word	05569bee0h,0bff1d3a6h		; _a[96] @ 6144
	.word	021583f5ch,03fe4e140h		; _a[97] @ 6208
	.word	07df4f865h,0bff00eddh		; _a[98] @ 6272
	.word	0fbc2839eh,0c0044605h		; _a[99] @ 6336
	.word	0fdb09a67h,0bfe34c64h		; _a[100] @ 6400
	.word	0c02e58d9h,0bff7c0e3h		; _a[101] @ 6464
	.word	07285589ah,03fc7a447h		; _a[102] @ 6528
	.word	085a84b0dh,0c0026037h		; _a[103] @ 6592
	.word	00445dfdeh,0bffba788h		; _a[104] @ 6656
	.word	0fa998eb2h,0c001562fh		; _a[105] @ 6720
	.word	05493d60bh,0bfed5201h		; _a[106] @ 6784
	.word	04fae93fdh,0c00588efh		; _a[107] @ 6848
	.word	0bafd9770h,0c008bdd3h		; _a[108] @ 6912
	.word	0bf45fb8dh,03ffe716ch		; _a[109] @ 6976
	.word	01e1594bdh,0bfe3b48fh		; _a[110] @ 7040
	.word	02e5654a0h,0bff377afh		; _a[111] @ 7104
	.word	0a0217317h,03ff4ff0ch		; _a[112] @ 7168
	.word	046d175a9h,0bfcf0e64h		; _a[113] @ 7232
	.word	0c640c191h,04007e892h		; _a[114] @ 7296
	.word	0389217c5h,0400658d0h		; _a[115] @ 7360
	.word	0f13e9c1dh,040081052h		; _a[116] @ 7424
	.word	0782e0f07h,0c004412ch		; _a[117] @ 7488
	.word	0af17b020h,0c003ec1eh		; _a[118] @ 7552
	.word	0fe9e0031h,03fffd3fdh		; _a[119] @ 7616
	.word	0cb8d31ach,0bffd305dh		; _a[120] @ 7680
	.word	0c1490b0ch,0bfe441aeh		; _a[121] @ 7744
	.word	0a212e4dfh,03fbffad7h		; _a[122] @ 7808
	.word	0bc24081dh,0bfcec198h		; _a[123] @ 7872
	.word	033ca31e8h,0bf8d872fh		; _a[124] @ 7936
	.word	0e757928eh,03ffb9018h		; _a[125] @ 8000
	.word	07491a254h,03ff3eb72h		; _a[126] @ 8064
	.word	0ca1dc5e4h,0c0015eabh		; _a[127] @ 8128
	.word	0d39a4668h,03ff04ac0h		; _a[128] @ 8192
	.word	082bb30c3h,0bfef7dc8h		; _a[129] @ 8256
	.word	0ce131deah,03ffe5413h		; _a[130] @ 8320
	.word	0c2e33effh,040031081h		; _a[131] @ 8384
	.word	059f4681ch,0bff95a54h		; _a[132] @ 8448
	.word	0c33b5393h,04006b6d4h		; _a[133] @ 8512
	.word	0e88eca33h,03ff82ef9h		; _a[134] @ 8576
	.word	0aae79fb7h,0bff1a7d4h		; _a[135] @ 8640
	.word	04cddff24h,03fa0a496h		; _a[136] @ 8704
	.word	074312a44h,0c0010791h		; _a[137] @ 8768
	.word	07ba30e8dh,0c002df31h		; _a[138] @ 8832
	.word	0f0d18ed3h,04005a01ch		; _a[139] @ 8896
	.word	042162505h,0bfe14918h		; _a[140] @ 8960
	.word	099440944h,0bff8bf57h		; _a[141] @ 9024
	.word	033d36c23h,0bff41e18h		; _a[142] @ 9088
	.word	02f166e01h,040006616h		; _a[143] @ 9152
	.word	0282ac175h,03ff19756h		; _a[144] @ 9216
	.word	0b1407f4ch,0bffb015fh		; _a[145] @ 9280
	.word	0f047fc18h,0bff361d0h		; _a[146] @ 9344
	.word	02e9da23dh,04002c2e6h		; _a[147] @ 9408
	.word	08169212ch,03ff31387h		; _a[148] @ 9472
	.word	0cef317bah,03fff65fch		; _a[149] @ 9536
	.word	08c840761h,040057d36h		; _a[150] @ 9600
	.word	030347b32h,03feeac4dh		; _a[151] @ 9664
	.word	054d97628h,03fe46a82h		; _a[152] @ 9728
	.word	0325d4a5eh,0bfde118eh		; _a[153] @ 9792
	.word	02f0e0a85h,03fee8888h		; _a[154] @ 9856
	.word	0b6d6c142h,0bfd1c072h		; _a[155] @ 9920
	.word	07f081ddch,0bff8cb75h		; _a[156] @ 9984
	.word	05baf533fh,0bffb2604h		; _a[157] @ 10048
	.word	07dabfd49h,03ff330f0h		; _a[158] @ 10112
	.word	031cc2ae6h,0bff44f0fh		; _a[159] @ 10176
	.word	0e6347cdfh,0bffbf1bfh		; _a[160] @ 10240
	.word	0f9ca5bd9h,0c0038f62h		; _a[161] @ 10304
	.word	0bf104ba8h,04007eaach		; _a[162] @ 10368
	.word	097d8cf3ah,040054c6ch		; _a[163] @ 10432
	.word	088eaf5adh,03ffdbce8h		; _a[164] @ 10496
	.word	0b124d09ah,03fef1ca4h		; _a[165] @ 10560
	.word	067798bddh,0c001c2feh		; _a[166] @ 10624
	.word	0bb6ed677h,03ffb5cd0h		; _a[167] @ 10688
	.word	08b9fdbd3h,040081c86h		; _a[168] @ 10752
	.word	01f2a67b3h,0c00093ddh		; _a[169] @ 10816
	.word	038433d6ch,03fe05966h		; _a[170] @ 10880
	.word	09a657174h,0c007fafah		; _a[171] @ 10944
	.word	09e4275c6h,0bfa73113h		; _a[172] @ 11008
	.word	0ffe6d58dh,03ff2e755h		; _a[173] @ 11072
	.word	0c41b4d63h,0bfeba8bdh		; _a[174] @ 11136
	.word	01a9e10f8h,03fd9ea79h		; _a[175] @ 11200
	.word	0255a2c9ch,03ffe02fdh		; _a[176] @ 11264
	.word	0f2b08c24h,040076e15h		; _a[177] @ 11328
	.word	075b8e9c1h,0bff54892h		; _a[178] @ 11392
	.word	06327ed85h,0c008d87ch		; _a[179] @ 11456
	.word	03a406daeh,0c006e82bh		; _a[180] @ 11520
	.word	000607810h,0bfc943e1h		; _a[181] @ 11584
	.word	09fe288f7h,040035163h		; _a[182] @ 11648
	.word	02d9b43beh,03ff1c16ah		; _a[183] @ 11712
	.word	0fe2cc129h,0c0032500h		; _a[184] @ 11776
	.word	0fdc08a9fh,0bfe80e25h		; _a[185] @ 11840
	.word	0ed4009dbh,0bfe3c401h		; _a[186] @ 11904
	.word	05d31337fh,03fe8d588h		; _a[187] @ 11968
	.word	0acc26b4ah,03fe89706h		; _a[188] @ 12032
	.word	0233fa029h,03fe64cc7h		; _a[189] @ 12096
	.word	011b386abh,03ffcca3eh		; _a[190] @ 12160
	.word	0489dfe83h,03fe5ce8bh		; _a[191] @ 12224
	.word	0950408a3h,04002e94ch		; _a[192] @ 12288
	.word	0b6cd8707h,03ffca989h		; _a[193] @ 12352
	.word	0b1be538dh,03ff79cb1h		; _a[194] @ 12416
	.word	069e72467h,0c0036765h		; _a[195] @ 12480
	.word	028035448h,040052fa1h		; _a[196] @ 12544
	.word	0515f6e25h,0bffa345bh		; _a[197] @ 12608
	.word	0964db4bfh,03fe9f5ffh		; _a[198] @ 12672
	.word	0d6890e31h,0bfeeafe5h		; _a[199] @ 12736
	.word	0d39614aah,03fb04bf9h		; _a[200] @ 12800
$C$IR_1:	.set	1608

	.sect	".cinit"
	.align	8
	.field  	$C$IR_2,32
	.field  	_b+0,32
	.word	088cd997bh,0c056d077h		; _b[0] @ 0
	.word	08c7ba3e5h,04032bda8h		; _b[1] @ 64
	.word	0c4b24c18h,0c04aeeb9h		; _b[2] @ 128
	.word	06cbf45fch,0c052f071h		; _b[3] @ 192
	.word	0bb63eebdh,0405813b1h		; _b[4] @ 256
	.word	0efc5f619h,0c01e6fb7h		; _b[5] @ 320
	.word	0dfb0d520h,0c0333513h		; _b[6] @ 384
	.word	0fb8978bah,040568659h		; _b[7] @ 448
	.word	02aa341b9h,04021a95ch		; _b[8] @ 512
	.word	0bbbb2c91h,0404d0929h		; _b[9] @ 576
	.word	08c30248bh,0c04b93aah		; _b[10] @ 640
	.word	044383e35h,040548c81h		; _b[11] @ 704
	.word	0ce63a5c2h,04056b2b3h		; _b[12] @ 768
	.word	0e76427c8h,04051996dh		; _b[13] @ 832
	.word	09c3702cch,0404b3243h		; _b[14] @ 896
	.word	073ad76c6h,0403beec2h		; _b[15] @ 960
	.word	05e7d63d9h,0c051b74ch		; _b[16] @ 1024
	.word	0157689cah,0403cc652h		; _b[17] @ 1088
	.word	0553840b9h,04050ffadh		; _b[18] @ 1152
	.word	025fc130bh,0c0119898h		; _b[19] @ 1216
	.word	0c4a332a0h,0404c3153h		; _b[20] @ 1280
	.word	01e166b7ch,040522eeah		; _b[21] @ 1344
	.word	0a1e3eaf7h,0405672efh		; _b[22] @ 1408
	.word	07164c72ah,03fe4d1ffh		; _b[23] @ 1472
	.word	0cb6192c2h,0c04aa0e1h		; _b[24] @ 1536
	.word	05113180bh,04056a002h		; _b[25] @ 1600
	.word	0de1c8069h,0c04131bdh		; _b[26] @ 1664
	.word	0ca940d69h,03fc7e5cah		; _b[27] @ 1728
	.word	0cc48428fh,040326aa2h		; _b[28] @ 1792
	.word	0fcff9a7fh,0c05664e3h		; _b[29] @ 1856
	.word	0ad6f3974h,0405583c0h		; _b[30] @ 1920
	.word	0022c2a2ah,04058082dh		; _b[31] @ 1984
	.word	075d2eaf4h,04040d297h		; _b[32] @ 2048
	.word	0d8ce62cfh,0c057653ch		; _b[33] @ 2112
	.word	037fd9d4fh,0c02ae4e5h		; _b[34] @ 2176
	.word	02ea6dc78h,0c05065cfh		; _b[35] @ 2240
	.word	07afcf660h,0c058f04fh		; _b[36] @ 2304
	.word	043201041h,0c01166c7h		; _b[37] @ 2368
	.word	08d045fe1h,0c04c4c99h		; _b[38] @ 2432
	.word	0f3b56ee2h,0c05857a2h		; _b[39] @ 2496
	.word	06d670ba8h,04050bb89h		; _b[40] @ 2560
	.word	07ef82da4h,04043a5b4h		; _b[41] @ 2624
	.word	0c8d5c747h,0c033f0aeh		; _b[42] @ 2688
	.word	0b4e11dbdh,0c0504ee0h		; _b[43] @ 2752
	.word	01e4c1b62h,0c052012ah		; _b[44] @ 2816
	.word	02a67b297h,040447f1fh		; _b[45] @ 2880
	.word	07f5118f7h,0404f3862h		; _b[46] @ 2944
	.word	0014b599bh,0c0576269h		; _b[47] @ 3008
	.word	048de9623h,0403428eah		; _b[48] @ 3072
	.word	090ad61cdh,0c048a1a8h		; _b[49] @ 3136
	.word	029040548h,0405855e7h		; _b[50] @ 3200
	.word	050184648h,0404314b9h		; _b[51] @ 3264
	.word	08f1c6816h,04038febeh		; _b[52] @ 3328
	.word	0c71a0565h,0404ceda3h		; _b[53] @ 3392
	.word	0c348bf8ch,0c04ddc84h		; _b[54] @ 3456
	.word	03dbc2331h,040579488h		; _b[55] @ 3520
	.word	03bd746a3h,0c040bf92h		; _b[56] @ 3584
	.word	0097e2e03h,03fff2ecbh		; _b[57] @ 3648
	.word	09f44d445h,0c02a468fh		; _b[58] @ 3712
	.word	0c59677a6h,0c0315969h		; _b[59] @ 3776
	.word	066e0dfa9h,0402fa44ch		; _b[60] @ 3840
	.word	0f56b5188h,0c0443330h		; _b[61] @ 3904
	.word	0569cc4c7h,0c035b1c0h		; _b[62] @ 3968
	.word	00c3d2524h,0c04759adh		; _b[63] @ 4032
	.word	0279f813ah,04054dbd4h		; _b[64] @ 4096
	.word	07551bbb4h,0404c0cd9h		; _b[65] @ 4160
	.word	07c4e2f38h,0bfeea3b5h		; _b[66] @ 4224
	.word	0b3ac6a57h,0400c9310h		; _b[67] @ 4288
	.word	06f0c2756h,0403a2d7bh		; _b[68] @ 4352
	.word	081bd0402h,0c0452f13h		; _b[69] @ 4416
	.word	09e774eech,04052fdf8h		; _b[70] @ 4480
	.word	07b1c0011h,04051e9f6h		; _b[71] @ 4544
	.word	02af8d20eh,04045ac9eh		; _b[72] @ 4608
	.word	0ff609dd0h,040529975h		; _b[73] @ 4672
	.word	07368ad69h,0c031a79ch		; _b[74] @ 4736
	.word	02f789390h,0404446adh		; _b[75] @ 4800
	.word	083997d14h,04053c27bh		; _b[76] @ 4864
	.word	08954a7f8h,0c04284b2h		; _b[77] @ 4928
	.word	0cac58b90h,0404028c3h		; _b[78] @ 4992
	.word	07224e08ah,0c05012e6h		; _b[79] @ 5056
	.word	08023a6ceh,040355d9bh		; _b[80] @ 5120
	.word	0848387dfh,0c053cda8h		; _b[81] @ 5184
	.word	000390ae4h,04055cc2ch		; _b[82] @ 5248
	.word	01862cd55h,0c05228e6h		; _b[83] @ 5312
	.word	06e7bde9eh,0c058c657h		; _b[84] @ 5376
	.word	0efde49cdh,0c0254f06h		; _b[85] @ 5440
	.word	026bc2c6ch,0c049d0ffh		; _b[86] @ 5504
	.word	0545acb28h,0c0512955h		; _b[87] @ 5568
	.word	0082c1e6ch,04057408ah		; _b[88] @ 5632
	.word	093972119h,0c0468aabh		; _b[89] @ 5696
	.word	0e8a13eaah,0c04295cbh		; _b[90] @ 5760
	.word	00148d55ch,04014c358h		; _b[91] @ 5824
	.word	0079d8333h,0c054ec9ch		; _b[92] @ 5888
	.word	05fc059f8h,0c04a1a27h		; _b[93] @ 5952
	.word	0200ce5c2h,0403597d7h		; _b[94] @ 6016
	.word	059070253h,0c04996bbh		; _b[95] @ 6080
	.word	0b0b615d1h,040404fb8h		; _b[96] @ 6144
	.word	0fcc5b8dch,040445ddch		; _b[97] @ 6208
	.word	054782759h,0c0448d46h		; _b[98] @ 6272
	.word	0ae7ba8eeh,0c0570c80h		; _b[99] @ 6336
	.word	02684cf07h,04047ea89h		; _b[100] @ 6400
	.word	0b08ea8a5h,04049a403h		; _b[101] @ 6464
	.word	050e0c324h,0c0477eaeh		; _b[102] @ 6528
	.word	092ca727fh,0c03b86efh		; _b[103] @ 6592
	.word	0134988e0h,0c055d9cah		; _b[104] @ 6656
	.word	0bb659c3ch,0c04de2e7h		; _b[105] @ 6720
	.word	0e47e9a3ah,0c052a4b1h		; _b[106] @ 6784
	.word	00af1cb8ah,0c039f144h		; _b[107] @ 6848
	.word	078b87882h,0c05399d3h		; _b[108] @ 6912
	.word	042975445h,04028c1d6h		; _b[109] @ 6976
	.word	0a2cd1f02h,0c04d2ac1h		; _b[110] @ 7040
	.word	0810a569bh,04056585ch		; _b[111] @ 7104
	.word	0a1cac083h,0c0566645h		; _b[112] @ 7168
	.word	0bfd99f43h,0c05571fch		; _b[113] @ 7232
	.word	0d66fe3beh,040281b3bh		; _b[114] @ 7296
	.word	0824264ffh,040440798h		; _b[115] @ 7360
	.word	0c2f405f7h,0404ede9dh		; _b[116] @ 7424
	.word	0f640639dh,04044777ah		; _b[117] @ 7488
	.word	0ad299956h,04055f2bfh		; _b[118] @ 7552
	.word	07f0b78dah,040562661h		; _b[119] @ 7616
	.word	0a0854625h,0c058ce59h		; _b[120] @ 7680
	.word	0f05f790ch,0c0526f44h		; _b[121] @ 7744
	.word	0b02c8316h,04050cf6ch		; _b[122] @ 7808
	.word	0b48d3ae7h,040458c54h		; _b[123] @ 7872
	.word	09513f8dbh,04057658dh		; _b[124] @ 7936
	.word	00918ad76h,040498ac8h		; _b[125] @ 8000
	.word	0a23cd64ah,0c021929dh		; _b[126] @ 8064
	.word	05f7403deh,0404bd3ceh		; _b[127] @ 8128
	.word	0ad7af7eeh,0404b783ah		; _b[128] @ 8192
	.word	089b0ee4ah,04042facch		; _b[129] @ 8256
	.word	0163baba8h,04044b4dbh		; _b[130] @ 8320
	.word	0af5847c0h,040359e7dh		; _b[131] @ 8384
	.word	0053d56a3h,0c04d5b65h		; _b[132] @ 8448
	.word	0b81a8e21h,0404abaa8h		; _b[133] @ 8512
	.word	059ba8679h,0c04917cdh		; _b[134] @ 8576
	.word	0cb2be2ddh,0c0353321h		; _b[135] @ 8640
	.word	089eacfedh,04049c453h		; _b[136] @ 8704
	.word	0bc027a2eh,040250b60h		; _b[137] @ 8768
	.word	024122e00h,0c02d3d00h		; _b[138] @ 8832
	.word	0b26b21b7h,0c0565aebh		; _b[139] @ 8896
	.word	03315d702h,0403c99c2h		; _b[140] @ 8960
	.word	01a3a3de9h,0c042e72ch		; _b[141] @ 9024
	.word	0252a5bf4h,0c041e4bah		; _b[142] @ 9088
	.word	0715908b0h,0c04bd305h		; _b[143] @ 9152
	.word	022050d86h,0404ee37ah		; _b[144] @ 9216
	.word	059b8d8fah,0c0573917h		; _b[145] @ 9280
	.word	0d8680b82h,040479bdeh		; _b[146] @ 9344
	.word	0f1bc705eh,0c04965a4h		; _b[147] @ 9408
	.word	002cab59bh,04054815ch		; _b[148] @ 9472
	.word	01d54a49dh,0c0282ccdh		; _b[149] @ 9536
	.word	068ac91c4h,0c0502598h		; _b[150] @ 9600
	.word	07ad736b3h,0c04e1ad0h		; _b[151] @ 9664
	.word	08b46f07fh,0c04303d8h		; _b[152] @ 9728
	.word	0ef9db22dh,040566da7h		; _b[153] @ 9792
	.word	09a2eeacfh,040530adfh		; _b[154] @ 9856
	.word	0f090f734h,040524e3dh		; _b[155] @ 9920
	.word	02d82194ah,0c0531040h		; _b[156] @ 9984
	.word	0ea8da7f4h,040453574h		; _b[157] @ 10048
	.word	02b5a20deh,0404e72dah		; _b[158] @ 10112
	.word	05de085e7h,04049b5d3h		; _b[159] @ 10176
	.word	0a501aca8h,0c051fe7ch		; _b[160] @ 10240
	.word	0bc54af85h,04033f236h		; _b[161] @ 10304
	.word	01ebe3129h,04036a902h		; _b[162] @ 10368
	.word	0eede6f8ch,0c0541e1bh		; _b[163] @ 10432
	.word	008d66857h,040541133h		; _b[164] @ 10496
	.word	0fe5fecd0h,0c04e45afh		; _b[165] @ 10560
	.word	090a6abd1h,0404472d0h		; _b[166] @ 10624
	.word	0d5629d84h,04050ae20h		; _b[167] @ 10688
	.word	0c75ecec2h,0403f8ac9h		; _b[168] @ 10752
	.word	062ce2b72h,0404e4873h		; _b[169] @ 10816
	.word	0b960df3eh,0c04fa3efh		; _b[170] @ 10880
	.word	072332343h,0403a2f71h		; _b[171] @ 10944
	.word	02bc804e7h,0c038a66bh		; _b[172] @ 11008
	.word	01ef15ccfh,0c0257bb1h		; _b[173] @ 11072
	.word	0f5756283h,0405301f4h		; _b[174] @ 11136
	.word	0b2d4d402h,040526435h		; _b[175] @ 11200
	.word	0ce4ead0ch,040489c50h		; _b[176] @ 11264
	.word	015b9a5a9h,040524bc2h		; _b[177] @ 11328
	.word	016659d13h,0c04066a1h		; _b[178] @ 11392
	.word	06aa9c206h,0403e17ddh		; _b[179] @ 11456
	.word	005ab3aach,0c0505376h		; _b[180] @ 11520
	.word	0ddb6291ch,04013305fh		; _b[181] @ 11584
	.word	098d1f37dh,040500affh		; _b[182] @ 11648
	.word	05a1016ceh,0404cf00fh		; _b[183] @ 11712
	.word	07490cb95h,0404be517h		; _b[184] @ 11776
	.word	014f483cbh,040349239h		; _b[185] @ 11840
	.word	061a45fc6h,0c041ef42h		; _b[186] @ 11904
	.word	046eaa01ch,04050ef8eh		; _b[187] @ 11968
	.word	062a1b5c8h,0c032b39ch		; _b[188] @ 12032
	.word	0746d9026h,04058a9a9h		; _b[189] @ 12096
	.word	0a5467606h,0401adf22h		; _b[190] @ 12160
	.word	0290eed03h,0c056bb06h		; _b[191] @ 12224
	.word	012315aech,04038d190h		; _b[192] @ 12288
	.word	07cc6243ch,0c0423a8ah		; _b[193] @ 12352
	.word	0cfdb7506h,0405349f3h		; _b[194] @ 12416
	.word	0794ea077h,0c0372d74h		; _b[195] @ 12480
	.word	012dace17h,040446d5eh		; _b[196] @ 12544
	.word	09f5c513ah,040548e03h		; _b[197] @ 12608
	.word	0f06e9285h,04002b02ah		; _b[198] @ 12672
	.word	0a70d1fa3h,040270dcch		; _b[199] @ 12736
	.word	04ff5e199h,0403f0a26h		; _b[200] @ 12800
$C$IR_2:	.set	1608

	.global	_a
_a:	.usect	".far",1608,8
	.global	_b
_b:	.usect	".far",1608,8
;	C:\MATHLIB_Tools\CCSV5_5_0\ccsv5\tools\compiler\c6000_7.4.2\bin\opt6x.exe C:\\Users\\gtbldadm\\AppData\\Local\\Temp\\022644 C:\\Users\\gtbldadm\\AppData\\Local\\Temp\\022646 
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
;*   Local Frame Size  : 8 Args + 36 Auto + 56 Save = 100 byte                *
;******************************************************************************
_main:
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 12
           STW     .D2T1   A11,*SP--(8)      ; |135| 
           STW     .D2T1   A10,*SP--(8)      ; |135| 
           STDW    .D2T2   B13:B12,*SP--     ; |135| 
           STDW    .D2T2   B11:B10,*SP--     ; |135| 
           STDW    .D2T1   A15:A14,*SP--     ; |135| 

           STDW    .D2T1   A13:A12,*SP--     ; |135| 
||         MVKL    .S1     $C$SL1+0,A4

           STW     .D2T2   B3,*SP--(56)      ; |135| 
||         CALLP   .S2     _driver_init,B3
||         MVKH    .S1     $C$SL1+0,A4

$C$RL0:    ; CALL OCCURS {_driver_init} {0}  ; |143| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 9
           MVKL    .S1     _a,A12

           MVKL    .S2     _b,B10
||         MVKL    .S1     _output,A14

           MVKH    .S1     _a,A12
||         MVK     .S2     0xc9,B4

           MVKH    .S2     _b,B10
||         MVKH    .S1     _output,A14

           MV      .L2     B10,B11
||         MV      .L1     A12,A11
||         CALL    .S1     __divd            ; |151| 
||         LDW     .D1T1   *A14,A10

           LDDW    .D1T1   *A11++,A5:A4      ; |151| 
||         MV      .L1X    B4,A13
||         LDDW    .D2T2   *B11++,B5:B4      ; |151| 

           NOP             3
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L1:    
;          EXCLUSIVE CPU CYCLES: 1
           ADDKPC  .S2     $C$RL1,B3,0       ; |151| 
$C$RL1:    ; CALL OCCURS {__divd} {0}        ; |151| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 7

           SUB     .L1     A13,1,A0          ; |150| 
||         STDW    .D1T1   A5:A4,*A10++      ; |151| 
||         SUB     .S1     A13,1,A13         ; |150| 

   [ A0]   LDDW    .D2T2   *B11++,B5:B4      ; |151| 
|| [!A0]   ADD     .L2X    4,A14,B4
|| [!A0]   MV      .L1     A12,A10
|| [!A0]   MVK     .S1     0xc9,A13
|| [ A0]   B       .S2     $C$L1             ; |150| 

   [ A0]   CALL    .S1     __divd            ; |151| 
   [ A0]   LDDW    .D1T1   *A11++,A5:A4      ; |151| 
   [!A0]   MV      .L1X    B10,A11
   [!A0]   ZERO    .L2     B11
   [!A0]   STW     .D2T2   B4,*+SP(28)
           ; BRANCHCC OCCURS {$C$L1}         ; |150| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 1
           CALL    .S1     _divdp            ; |154| 
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L2:    
;          EXCLUSIVE CPU CYCLES: 5

           LDDW    .D1T1   *A12++,A5:A4      ; |154| 
||         LDDW    .D2T2   *B10++,B5:B4      ; |154| 

           ADDKPC  .S2     $C$RL2,B3,3       ; |154| 
$C$RL2:    ; CALL OCCURS {_divdp} {0}        ; |154| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 12
           LDW     .D2T2   *+SP(28),B4       ; |154| 
           SUB     .L1     A13,1,A0          ; |153| 
           SUB     .L1     A13,1,A13         ; |153| 
           NOP             2
           LDW     .D2T2   *B4,B4            ; |154| 
   [ A0]   BNOP    .S1     $C$L2,3           ; |153| 

           ADD     .L2     B11,B4,B4         ; |154| 
||         ADD     .S2     8,B11,B11         ; |153| 

   [ A0]   CALL    .S1     _divdp            ; |154| 
||         STDW    .D2T1   A5:A4,*B4         ; |154| 

           ; BRANCHCC OCCURS {$C$L2}         ; |153| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 7
           LDW     .D2T2   *+SP(28),B4
           MV      .L2X    A11,B11
           MV      .L1     A10,A12
           MVK     .S1     0xc9,A13
           ZERO    .L2     B10
           ADD     .L2     4,B4,B4

           STW     .D2T2   B4,*+SP(32)
||         CALL    .S1     _divdp_c          ; |157| 

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L3:    
;          EXCLUSIVE CPU CYCLES: 5

           LDDW    .D1T1   *A12++,A5:A4      ; |157| 
||         LDDW    .D2T2   *B11++,B5:B4      ; |157| 

           ADDKPC  .S2     $C$RL3,B3,3       ; |157| 
$C$RL3:    ; CALL OCCURS {_divdp_c} {0}      ; |157| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 12
           LDW     .D2T2   *+SP(32),B4       ; |157| 
           SUB     .L1     A13,1,A0          ; |156| 
           SUB     .L1     A13,1,A13         ; |156| 
           NOP             2
           LDW     .D2T2   *B4,B4            ; |157| 
   [ A0]   BNOP    .S1     $C$L3,3           ; |156| 

           ADD     .L2     B10,B4,B4         ; |157| 
||         ADD     .S2     8,B10,B10         ; |156| 

   [ A0]   CALL    .S1     _divdp_c          ; |157| 
||         STDW    .D2T1   A5:A4,*B4         ; |157| 
|| [!A0]   ZERO    .L2     B4

           ; BRANCHCC OCCURS {$C$L3}         ; |156| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 3

           MVK     .S1     0xc9,A3
||         SET     .S2     B4,0x1e,0x1e,B4
||         ZERO    .L2     B6                ; |59| 
||         ZERO    .D2     B20               ; |59| 
||         LDW     .D1T2   *+A14(12),B23

           SUB     .L1     A3,1,A1
||         MV      .S1     A10,A3
||         DINT                              ; interrupts off
||         STW     .D2T2   B4,*+SP(16)       ; |59| 
||         MV      .L2     B4,B7

           ZERO    .L2     B18               ; |59| 
||         MV      .S2X    A11,B22
||         MV      .D2     B4,B21

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*
;*      Loop found in file               : C:/nightlybuilds/mathlib/ti/mathlib/src/divdp/divdp_d.c
;*      Loop source line                 : 159
;*      Loop opening brace source line   : 159
;*      Loop closing brace source line   : 161
;*      Known Minimum Trip Count         : 201                    
;*      Known Maximum Trip Count         : 201                    
;*      Known Max Trip Count Factor      : 201
;*      Loop Carried Dependency Bound(^) : 99
;*      Unpartitioned Resource Bound     : 14
;*      Partitioned Resource Bound(*)    : 28
;*      Resource Partition:
;*                                A-side   B-side
;*      .L units                     1        1     
;*      .S units                     3        2     
;*      .D units                     1        2     
;*      .M units                     0       28*    
;*      .X cross paths               0        4     
;*      .T address paths             1        2     
;*      Long read paths              0        0     
;*      Long write paths             0        0     
;*      Logical  ops (.LS)           0        6     (.L or .S unit)
;*      Addition ops (.LSD)          0        1     (.L or .S or .D unit)
;*      Bound(.L .S .LS)             2        5     
;*      Bound(.L .S .D .LS .LSD)     2        4     
;*
;*      Searching for software pipeline schedule at ...
;*         ii = 99 Schedule found with 1 iterations in parallel
;*
;*      Register Usage Table:
;*          +-----------------------------------------------------------------+
;*          |AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA|BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB|
;*          |00000000001111111111222222222233|00000000001111111111222222222233|
;*          |01234567890123456789012345678901|01234567890123456789012345678901|
;*          |--------------------------------+--------------------------------|
;*       0: | * *                            |      **          * ****        |
;*       1: | * *                            |      **          * ****        |
;*       2: | * *                            |      **          * ****        |
;*       3: | * *                            |      **          * ****        |
;*       4: | * *                            |      **          * ****        |
;*       5: | * *                            |      ****        * ****        |
;*       6: | * *                            |      ****        * ****        |
;*       7: | * *                            |      ****      *** ****        |
;*       8: | * *                            |      ****      *** ****        |
;*       9: | * *                            |      ****      *** ****        |
;*      10: | * *                            |      ****      *** ****        |
;*      11: | * *                            |      ****      *** ****        |
;*      12: | * *                            |      ****      *** ****        |
;*      13: | * *                            |      ****      *** ****        |
;*      14: | * *                            |      ****      *** ****        |
;*      15: | * *                            |      ****      *** ****        |
;*      16: | * *                            |      ****      *** ****        |
;*      17: | * *                            |    ******      *** ****        |
;*      18: | * *                            |    ******      *** ****        |
;*      19: | * *                            |      ****      *** ****        |
;*      20: | * *                            |      ****      *** ****        |
;*      21: | * *                            |      ****      *** ****        |
;*      22: | * *                            |      ****      *** ****        |
;*      23: | * *                            |      ****      *** ****        |
;*      24: | * *                            |    ******      *** ****        |
;*      25: | * *                            |    ******      *** ****        |
;*      26: | * *                            |    ******      *** ****        |
;*      27: | * *                            |    ******      *** ****        |
;*      28: | * *                            |      ****        * ****        |
;*      29: | * *                            |      ****        * ****        |
;*      30: | * *                            |      ****        * ****        |
;*      31: | * *                            |      ****        * ****        |
;*      32: | * *                            |      ****        * ****        |
;*      33: | * *                            |      ****        * ****        |
;*      34: | * *                            |      ****      *** ****        |
;*      35: | * *                            |      ****      *** ****        |
;*      36: | * *                            |      ****      *** ****        |
;*      37: | * *                            |      ****      *** ****        |
;*      38: | * *                            |      ****      *** ****        |
;*      39: | * *                            |      ****      *** ****        |
;*      40: | * *                            |      ****      *** ****        |
;*      41: | * *                            |      ****      *** ****        |
;*      42: | * *                            |      ****      *** ****        |
;*      43: | * *                            |      ****      *** ****        |
;*      44: | * *                            |    ******      *** ****        |
;*      45: | * *                            |    ******      *** ****        |
;*      46: | * *                            |      ****      *** ****        |
;*      47: | * *                            |      ****      *** ****        |
;*      48: | * *                            |      ****      *** ****        |
;*      49: | * *                            |      ****      *** ****        |
;*      50: | * *                            |      ****      *** ****        |
;*      51: | * *                            |    ******      *** ****        |
;*      52: | * *                            |    ******      *** ****        |
;*      53: | * *                            |    ******      *** ****        |
;*      54: | * *                            |    ******      *** ****        |
;*      55: | * *                            |      ****        * ****        |
;*      56: | * *                            |      ****        * ****        |
;*      57: | * *                            |      ****        * ****        |
;*      58: | * *                            |      ****        * ****        |
;*      59: | * *                            |      ****        * ****        |
;*      60: | * *                            |      ****        * ****        |
;*      61: | * *                            |    ******        * ****        |
;*      62: | * *                            |    ******        * ****        |
;*      63: | * *                            |    ******        * ****        |
;*      64: | * *                            |    ******        * ****        |
;*      65: | * *                            |    ****          * ****        |
;*      66: | * *                            |    ****          * ****        |
;*      67: | * *                            |    ****          * ****        |
;*      68: | * *                            |    ****          * ****        |
;*      69: | * *                            |    ****          * ****        |
;*      70: | * *                            |    ****          * ****        |
;*      71: | * *                            |    ******        ******        |
;*      72: | * *                            |    ******        ******        |
;*      73: | * *                            |    ****          * ****        |
;*      74: | * *                            |    ****          * ****        |
;*      75: | * *                            |    ****          * ****        |
;*      76: | * *                            |    ****          * ****        |
;*      77: | * *                            |    ****          * ****        |
;*      78: | * *                            |    ******        * ****        |
;*      79: | * *                            |    ******        * ****        |
;*      80: | * *                            |    ******        * ****        |
;*      81: | * *                            |    ******        * ****        |
;*      82: | * *                            |      **          * ****        |
;*      83: | * *                            |      **          * ****        |
;*      84: | * *                            |      **          * ****        |
;*      85: | * *                            |      **          * ****        |
;*      86: | * *****                        |      **          * ****        |
;*      87: | * *****                        |      **          * ****        |
;*      88: |** *  **                        |    ****          * ****        |
;*      89: |** *  **                        |    ****          * ****        |
;*      90: |** *  **                        |    ****          * ****        |
;*      91: |** *  **                        |    ****          * ****        |
;*      92: |** *                            |      **          * ****        |
;*      93: |** *                            |      **          * ****        |
;*      94: |** *                            |      **          * ****        |
;*      95: |** *                            |      **          * ****        |
;*      96: |** *                            |      **          * ****        |
;*      97: |** *                            |      **          * ****        |
;*      98: | * *                            |    ****          * ****        |
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
;*      Total cycles (est.)         : 0 + min_trip_cnt * 99 = 19899        
;*----------------------------------------------------------------------------*
;*       SETUP CODE
;*
;*                  SUB             A1,1,A1
;*
;*        SINGLE SCHEDULED ITERATION
;*
;*        $C$C130:
;*   0              LDDW    .D2T2   *B22++,B9:B8      ; |59|  ^ 
;*   1              NOP             4
;*   5              RCPDP   .S2     B9:B8,B17:B16     ; |59|  ^ 
;*   6              NOP             1
;*   7              MPYDP   .M2     B17:B16,B9:B8,B5:B4 ; |59|  ^ 
;*   8              NOP             9
;*  17              SUBDP   .L2     B21:B20,B5:B4,B5:B4 ; |59|  ^ 
;*  18              NOP             6
;*  24              MPYDP   .M2     B17:B16,B5:B4,B17:B16 ; |59|  ^ 
;*  25              NOP             9
;*  34              MPYDP   .M2     B17:B16,B9:B8,B5:B4 ; |59|  ^ 
;*  35              NOP             9
;*  44              SUBDP   .L2     B7:B6,B5:B4,B5:B4 ; |59|  ^ 
;*  45              NOP             6
;*  51              MPYDP   .M2     B17:B16,B5:B4,B5:B4 ; |59|  ^ 
;*  52              NOP             9
;*  61              MPYDP   .M2     B5:B4,B9:B8,B9:B8 ; |59|  ^ 
;*  62              NOP             8
;*  70              MV      .L2     B7,B19            ; |59| 
;*  71              SUBDP   .L2     B19:B18,B9:B8,B9:B8 ; |59|  ^ 
;*  72              NOP             6
;*  78              MPYDP   .M2     B5:B4,B9:B8,B5:B4 ; |59|  ^ 
;*  79              NOP             2
;*  81              LDDW    .D1T1   *A3++,A7:A6       ; |59| 
;*  82              NOP             3
;*  85              ZERO    .L1     A5:A4             ; |59| 
;*  86              CMPEQDP .S1     A7:A6,A5:A4,A0    ; |59| 
;*  87              NOP             1
;*  88      [!A0]   MPYDP   .M2X    A7:A6,B5:B4,B5:B4 ; |59|  ^ 
;*  89              NOP             4
;*  93      [ A1]   BDEC    .S1     $C$C130,A1        ; |159| 
;*  94              NOP             3
;*  97      [ A0]   ZERO    .L2     B5:B4             ; |59| 
;*  98              STDW    .D2T2   B5:B4,*B23++      ; |59|  ^ 
;*  99              ; BRANCHCC OCCURS {$C$C130}       ; |159| 
;*----------------------------------------------------------------------------*
$C$L4:    ; PIPED LOOP PROLOG
;** --------------------------------------------------------------------------*
$C$L5:    ; PIPED LOOP KERNEL
;          EXCLUSIVE CPU CYCLES: 99
           LDDW    .D2T2   *B22++,B9:B8      ; |59| <0,0>  ^ 
           NOP             4
           RCPDP   .S2     B9:B8,B17:B16     ; |59| <0,5>  ^ 
           NOP             1
           MPYDP   .M2     B17:B16,B9:B8,B5:B4 ; |59| <0,7>  ^ 
           NOP             9
           SUBDP   .L2     B21:B20,B5:B4,B5:B4 ; |59| <0,17>  ^ 
           NOP             6
           MPYDP   .M2     B17:B16,B5:B4,B17:B16 ; |59| <0,24>  ^ 
           NOP             9
           MPYDP   .M2     B17:B16,B9:B8,B5:B4 ; |59| <0,34>  ^ 
           NOP             9
           SUBDP   .L2     B7:B6,B5:B4,B5:B4 ; |59| <0,44>  ^ 
           NOP             6
           MPYDP   .M2     B17:B16,B5:B4,B5:B4 ; |59| <0,51>  ^ 
           NOP             9
           MPYDP   .M2     B5:B4,B9:B8,B9:B8 ; |59| <0,61>  ^ 
           NOP             8
           MV      .L2     B7,B19            ; |59| <0,70> 
           SUBDP   .L2     B19:B18,B9:B8,B9:B8 ; |59| <0,71>  ^ 
           NOP             6
           MPYDP   .M2     B5:B4,B9:B8,B5:B4 ; |59| <0,78>  ^ 
           NOP             2
           LDDW    .D1T1   *A3++,A7:A6       ; |59| <0,81> 
           NOP             3
           ZERO    .L1     A5:A4             ; |59| <0,85> 
           CMPEQDP .S1     A7:A6,A5:A4,A0    ; |59| <0,86> 
           NOP             1
   [!A0]   MPYDP   .M2X    A7:A6,B5:B4,B5:B4 ; |59| <0,88>  ^ 
           NOP             4
   [ A1]   BDEC    .S1     $C$L5,A1          ; |159| <0,93> 
           NOP             3
   [ A0]   ZERO    .L2     B5:B4             ; |59| <0,97> 
           STDW    .D2T2   B5:B4,*B23++      ; |59| <0,98>  ^ 
;** --------------------------------------------------------------------------*
$C$L6:    ; PIPED LOOP EPILOG
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 8

           MV      .L2X    A14,B11
||         MVK     .S2     0xc9,B6           ; |162| 

           MV      .L2X    A11,B4            ; |162| 
||         RINT                              ; interrupts on
||         STW     .D2T2   B7,*+SP(16)

           CALLP   .S2     _divdp_v,B3
||         LDW     .D2T1   *+B11(16),A6      ; |162| 
||         MV      .L1     A10,A4            ; |162| 
||         MV      .L2     B21,B10

$C$RL4:    ; CALL OCCURS {_divdp_v} {0}      ; |162| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 49
           MVKL    .S2     0x3ddb7cdf,B7
           MVKL    .S2     0xd9d7bdbb,B6
           MVKH    .S2     0x3ddb7cdf,B7

           LDW     .D2T2   *+B11(4),B4       ; |66| 
||         MVKH    .S2     0xd9d7bdbb,B6

           CALLP   .S2     _isequal,B3
||         LDW     .D2T1   *B11,A4           ; |66| 
||         MVK     .S1     0xc9,A6           ; |66| 
||         MVK     .L1     0x1,A8            ; |66| 

$C$RL5:    ; CALL OCCURS {_isequal} {0}      ; |66| 
           MVKL    .S2     _fcn_pass,B5
           MVKL    .S2     0x3ddb7cdf,B7
           MVKH    .S2     _fcn_pass,B5
           MVKL    .S2     0xd9d7bdbb,B6

           LDW     .D2T2   *+B11(8),B4       ; |67| 
||         MVKH    .S2     0x3ddb7cdf,B7

           STW     .D2T1   A4,*+B5(4)        ; |66| 
||         MVKH    .S2     0xd9d7bdbb,B6

           CALLP   .S2     _isequal,B3
||         LDW     .D2T1   *B11,A4           ; |67| 
||         MVK     .S1     0xc9,A6           ; |67| 
||         MVK     .L1     0x1,A8            ; |67| 

$C$RL6:    ; CALL OCCURS {_isequal} {0}      ; |67| 
           MVKL    .S2     _fcn_pass,B5
           MVKL    .S2     0x3ddb7cdf,B7
           MVKL    .S2     0xd9d7bdbb,B6
           MVKH    .S2     _fcn_pass,B5
           MVKH    .S2     0x3ddb7cdf,B7

           MV      .L1     A14,A3
||         STW     .D2T1   A4,*+B5(8)        ; |67| 
||         MVKH    .S2     0xd9d7bdbb,B6

           CALLP   .S2     _isequal,B3
||         LDW     .D1T1   *A3,A4            ; |68| 
||         LDW     .D2T2   *+B11(12),B4      ; |68| 
||         MVK     .S1     0xc9,A6           ; |68| 
||         MVK     .L1     0x1,A8            ; |68| 

$C$RL7:    ; CALL OCCURS {_isequal} {0}      ; |68| 
           LDW     .D2T2   *+SP(32),B4
           MVKL    .S2     0xd9d7bdbb,B6
           MVKL    .S2     0x3ddb7cdf,B7
           MVKH    .S2     0xd9d7bdbb,B6
           MVKL    .S1     _output,A3
           ADDAD   .D2     B4,1,B5

           LDW     .D2T2   *B5,B4            ; |69| 
||         MVKL    .S2     _fcn_pass,B5

           MVKH    .S2     _fcn_pass,B5

           MVKH    .S1     _output,A3
||         STW     .D2T1   A4,*+B5(12)       ; |68| 
||         MVKH    .S2     0x3ddb7cdf,B7

           CALLP   .S2     _isequal,B3
||         LDW     .D1T1   *A3,A4            ; |69| 
||         MVK     .S1     0xc9,A6           ; |69| 
||         MVK     .L1     0x1,A8            ; |69| 

$C$RL8:    ; CALL OCCURS {_isequal} {0}      ; |69| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 14
           MVKL    .S2     _fcn_pass,B4
           MVKH    .S2     _fcn_pass,B4

           ADD     .L2     4,B4,B4
||         MVKL    .S2     _fcn_pass,B5

           LDW     .D2T2   *B4,B0            ; |72| 
           MVKH    .S2     _fcn_pass,B5
           STW     .D2T2   B4,*+SP(20)
           ADD     .L2     8,B5,B4
           STW     .D2T1   A4,*+B5(16)       ; |69| 

   [!B0]   MVKL    .S1     _all_pass,A3
|| [!B0]   B       .S2     $C$L7             ; |72| 
|| [!B0]   ZERO    .L1     A4                ; |72| 
||         MV      .L2     B0,B1             ; guard predicate rewrite

   [!B0]   CALL    .S2     _print_test_results ; |166| 
|| [!B0]   MVKH    .S1     _all_pass,A3
|| [ B0]   LDW     .D2T2   *B4,B0            ; |72| 

           STW     .D2T2   B4,*+SP(24)       ; |69| 
   [ B1]   ADD     .L2     4,B4,B4
           NOP             2
           ; BRANCHCC OCCURS {$C$L7}         ; |72| 
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
           CALL    .S1     _print_test_results ; |166| 
           MVKL    .S1     _all_pass,A3
           MVKH    .S1     _all_pass,A3
           NOP             2
;** --------------------------------------------------------------------------*
$C$L7:    
;          EXCLUSIVE CPU CYCLES: 1

           STW     .D1T1   A4,*A3            ; |72| 
||         MVK     .L1     0x1,A4            ; |166| 
||         ADDKPC  .S2     $C$RL9,B3,0       ; |166| 

$C$RL9:    ; CALL OCCURS {_print_test_results} {0}  ; |166| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 19
           MVKL    .S1     _a_sc,A4

           MVKH    .S1     _a_sc,A4
||         MVKL    .S2     _b_sc,B5

           MVKH    .S2     _b_sc,B5

           ADDAD   .D2     B5,7,B6
||         MV      .L2X    A4,B4             ; |173| 
||         MVK     .S2     0xffffffff,B19    ; |179| 

           ADDAD   .D2     B4,7,B7
||         MV      .L2     B19,B18           ; |179| 
||         ZERO    .L1     A7

           STDW    .D2T2   B19:B18,*+B5(48)  ; |179| 
||         SET     .S1     A7,0x14,0x1d,A7
||         ZERO    .L1     A6                ; |177| 

           STDW    .D2T1   A7:A6,*+B5(32)    ; |177| 
||         ZERO    .L2     B16               ; |178| 
||         ZERO    .S2     B17
||         ZERO    .L1     A9:A8             ; |173| 

           STDW    .D2T1   A9:A8,*B5         ; |173| 
||         MVKH    .S2     0xbff00000,B17
||         ZERO    .L2     B9

           STDW    .D2T2   B17:B16,*+B5(40)  ; |178| 
||         MVKH    .S2     0xfff00000,B9
||         ZERO    .L2     B8                ; |176| 

           STDW    .D2T2   B9:B8,*+B5(24)    ; |176| 
           STDW    .D2T1   A7:A6,*+B4(32)    ; |177| 

           STDW    .D2T2   B9:B8,*+B4(24)    ; |176| 
||         ZERO    .L1     A3

           STDW    .D2T2   B17:B16,*+B4(40)  ; |178| 
||         SET     .S1     A3,0x14,0x1e,A3

           STDW    .D2T2   B19:B18,*+B4(48)  ; |179| 

           STDW    .D2T1   A9:A8,*B4         ; |173| 
||         MV      .L2X    A3,B21            ; |175| 
||         ZERO    .S2     B20               ; |175| 

           STDW    .D2T2   B21:B20,*+B4(16)  ; |175| 
||         MVK     .L2     0x6,B31           ; |181| 
||         ZERO    .L1     A5

           STDW    .D2T2   B21:B20,*+B5(16)  ; |175| 
||         ZERO    .L1     A4                ; |174| 
||         MVKH    .S1     0x80000000,A5

           MVK     .L2     0x7,B4            ; |182| 
||         STDW    .D2T1   A5:A4,*+B4(8)     ; |174| 
||         MV      .S2     B5,B13            ; |173| 
||         MV      .L1X    B31,A1            ; |181| 

           MVC     .S2     B4,RILC
||         MVK     .L2     6,B5              ; |182| 
||         STDW    .D2T1   A5:A4,*+B5(8)     ; |174| 
||         SUB     .L1     A1,1,A1           ; |181| 

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*
;*      Loop found in file               : C:/nightlybuilds/mathlib/ti/mathlib/src/divdp/divdp_d.c
;*      Loop source line                 : 182
;*      Loop opening brace source line   : 182
;*      Loop closing brace source line   : 186
;*      Known Minimum Trip Count         : 7                    
;*      Known Maximum Trip Count         : 7                    
;*      Known Max Trip Count Factor      : 7
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
;*      Total cycles (est.)         : 6 + min_trip_cnt * 6 = 48        
;*----------------------------------------------------------------------------*
;*        SINGLE SCHEDULED ITERATION
;*
;*        $C$C77:
;*   0              ADD     .L1     A4,A3,A7          ; |184| 
;*   1              CMPGT   .L1     A7,6,A0           ; |184| 
;*   2      [ A0]   MVK     .S1     0xffffffc8,A7     ; |184| 
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
;*     ||           SPBR            $C$C77
;*  11              NOP             1
;*  12              ; BRANCHCC OCCURS {$C$C77}        ; |182| 
;*----------------------------------------------------------------------------*
$C$L8:    ; PIPED LOOP PROLOG
;          EXCLUSIVE CPU CYCLES: 7

   [ A1]   SPLOOPD 6       ;12               ; SPRELOAD
||         MVK     .L1     0x1,A3            ; |181| 
||         ZERO    .S1     A4                ; |182| 
||         MVC     .S2     B5,ILC

;** --------------------------------------------------------------------------*
$C$L9:    ; PIPED LOOP KERNEL
;          EXCLUSIVE CPU CYCLES: 6

           SPMASK          L2
||         MVK     .L2     0x8,B9
||         ADD     .L1     A4,A3,A7          ; |184| (P) <0,0> 

           SPMASK          S2
||         MVKL    .S2     _a_sc,B8
||         CMPGT   .L1     A7,6,A0           ; |184| (P) <0,1> 

           SPMASK          L1,S2
||         MVKH    .S2     _a_sc,B8
||         MV      .L1X    B9,A5
|| [!A0]   ZERO    .D1     A7                ; |184| (P) <0,2> 
|| [ A0]   MVK     .S1     0xffffffc8,A7     ; |184| (P) <0,2> 

           SPMASK          S1
||         MV      .S1X    B13,A6
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
$C$L10:    ; PIPED LOOP EPILOG AND PROLOG
;          EXCLUSIVE CPU CYCLES: 9
           NOP             2

           SPMASKR         ;$C$L10
||         ZERO    .S1     A4                ; |182| 
||         ADD     .D1     1,A3,A3           ; |181| 

           ADD     .L2     8,B9,B9           ; |181| 
|| [ A1]   B       .S2     $C$L10            ; |181| 

           MVKL    .S2     _a_sc,B8
||         MV      .L2X    A6,B13
||         SUB     .S1     A1,1,A1           ; |181| 

           MVKH    .S2     _a_sc,B8
||         MV      .L1X    B9,A5

           MV      .S1X    B13,A6
||         MVK     .L2     0x7,B4            ; |182| 
||         MVK     .S2     6,B5              ; |182| 

           NOP             2
           ; BRANCHCC OCCURS {$C$L10}        ; |181| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 6
           LDW     .D2T2   *+SP(32),B4       ; |189| 
           MV      .L1X    B10,A11           ; |59| 
           STW     .D2T2   B10,*+SP(40)      ; |59| 

           ZERO    .L1     A3
||         MVK     .S2     0x31,B31          ; |189| 

           MV      .L1X    B10,A13           ; |59| 
||         MVKL    .S2     _a_sc,B10
||         STW     .D2T1   A3,*+SP(36)
||         ZERO    .L2     B12

           ADD     .L2     4,B4,B11
||         MVKH    .S2     _a_sc,B10
||         STW     .D2T2   B31,*+SP(12)
||         MV      .L1X    B13,A15
||         ZERO    .S1     A10
||         ZERO    .D1     A12

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L11:    
;          EXCLUSIVE CPU CYCLES: 7

           LDDW    .D1T1   *A15,A5:A4        ; |191| 
||         LDDW    .D2T2   *B10,B7:B6        ; |191| 

           CALL    .S1     __divd            ; |191| 
           ADDKPC  .S2     $C$RL10,B3,2      ; |191| 

           MV      .L2X    A4,B4             ; |191| 
||         MV      .L1X    B6,A4             ; |191| 

           MV      .L2X    A5,B5             ; |191| 
||         MV      .L1X    B7,A5             ; |191| 

$C$RL10:   ; CALL OCCURS {__divd} {0}        ; |191| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 38
           LDW     .D1T1   *A14,A3           ; |191| 
           NOP             4
           ADD     .L2X    B12,A3,B4         ; |191| 
           STDW    .D2T1   A5:A4,*B4         ; |191| 

           LDDW    .D1T1   *A15,A7:A6        ; |192| 
||         LDDW    .D2T2   *B10,B5:B4        ; |192| 

           NOP             4

           MV      .L1X    B4,A4             ; |192| 
||         MV      .L2X    A6,B4             ; |192| 

           CALLP   .S2     _divdp,B3
||         MV      .L1X    B5,A5             ; |192| 
||         MV      .L2X    A7,B5             ; |192| 

$C$RL11:   ; CALL OCCURS {_divdp} {0}        ; |192| 
           LDW     .D1T1   *+A14(4),A3       ; |192| 
           NOP             4
           ADD     .L1X    B12,A3,A3         ; |192| 
           STDW    .D1T1   A5:A4,*A3         ; |192| 

           LDDW    .D1T1   *A15,A7:A6        ; |193| 
||         LDDW    .D2T2   *B10,B5:B4        ; |193| 

           NOP             4

           MV      .L1X    B4,A4             ; |193| 
||         MV      .L2X    A6,B4             ; |193| 

           CALLP   .S2     _divdp_c,B3
||         MV      .L1X    B5,A5             ; |193| 
||         MV      .L2X    A7,B5             ; |193| 

$C$RL12:   ; CALL OCCURS {_divdp_c} {0}      ; |193| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 108
           LDW     .D1T1   *+A14(8),A3       ; |193| 
           LDW     .D2T2   *B11,B16          ; |194| 
           ZERO    .L2     B9:B8             ; |62| 
           NOP             2
           ADD     .L2X    B12,A3,B4         ; |193| 
           STDW    .D2T1   A5:A4,*B4         ; |193| 
           LDDW    .D1T1   *A15++,A5:A4      ; |59| 
           LDDW    .D2T2   *B10++,B5:B4      ; |59| 
           ADD     .L2     B12,B16,B31       ; |194| 
           MV      .L1X    B11,A3            ; |194| 
           ADD     .L2     8,B12,B12         ; |195| 
           RCPDP   .S1     A5:A4,A7:A6       ; |59| 
           CMPEQDP .S2     B5:B4,B9:B8,B0    ; |62| 
           MPYDP   .M1     A7:A6,A5:A4,A9:A8 ; |59| 
           NOP             9
           SUBDP   .L1     A13:A12,A9:A8,A9:A8 ; |59| 
           NOP             6
           MPYDP   .M1     A7:A6,A9:A8,A7:A6 ; |59| 
           NOP             9
           MPYDP   .M1     A7:A6,A5:A4,A9:A8 ; |59| 
           NOP             9
           SUBDP   .L1     A11:A10,A9:A8,A9:A8 ; |59| 
           NOP             6
           MPYDP   .M1     A7:A6,A9:A8,A7:A6 ; |59| 
           NOP             9
           MPYDP   .M1     A7:A6,A5:A4,A9:A8 ; |59| 
           NOP             7
           MV      .L1     A12,A4            ; |59| 
           MV      .L1     A13,A5            ; |59| 
           SUBDP   .L1     A5:A4,A9:A8,A5:A4 ; |59| 
           NOP             6
           MPYDP   .M1     A7:A6,A5:A4,A5:A4 ; |59| 
           NOP             9
           NOP             1

           MPYDP   .M2X    B5:B4,A5:A4,B7:B6 ; |59| 
||         LDW     .D2T2   *+SP(12),B4       ; |194| 

           NOP             4

           SUB     .L1X    B4,1,A0           ; |189| 
||         SUB     .L2     B4,1,B4           ; |189| 

   [ A0]   BNOP    .S1     $C$L11,3          ; |189| 
||         STW     .D2T2   B4,*+SP(12)       ; |194| 

   [ B0]   ZERO    .L2     B7:B6             ; |63| 

   [!A0]   CALL    .S1     _divdp_v          ; |198| 
||         STDW    .D2T2   B7:B6,*B31        ; |194| 

           ; BRANCHCC OCCURS {$C$L11}        ; |189| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           LDW     .D1T1   *+A3(4),A6        ; |198| 
           MVKL    .S1     _a_sc,A4
           MVKH    .S1     _a_sc,A4
           ADDKPC  .S2     $C$RL13,B3,0      ; |198| 

           MVK     .S2     0x31,B6           ; |198| 
||         MV      .L2     B13,B4            ; |198| 

$C$RL13:   ; CALL OCCURS {_divdp_v} {0}      ; |198| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 46
           MVKL    .S2     0x3ddb7cdf,B7
           MVKL    .S2     0xd9d7bdbb,B6
           MVKH    .S2     0x3ddb7cdf,B7

           LDW     .D1T1   *A14,A4           ; |66| 
||         MVKH    .S2     0xd9d7bdbb,B6

           CALLP   .S2     _isequal,B3
||         LDW     .D1T2   *+A14(4),B4       ; |66| 
||         MVK     .S1     0x31,A6           ; |66| 
||         MVK     .L1     0x1,A8            ; |66| 

$C$RL14:   ; CALL OCCURS {_isequal} {0}      ; |66| 
           MVKL    .S2     _fcn_pass,B4
           MVKL    .S2     0xd9d7bdbb,B6
           MVKL    .S2     0x3ddb7cdf,B7
           MVKH    .S2     _fcn_pass,B4
           MVKH    .S2     0xd9d7bdbb,B6

           MV      .L1     A4,A5             ; |66| 
||         LDW     .D1T1   *A14,A4           ; |67| 
||         MVKH    .S2     0x3ddb7cdf,B7

           CALLP   .S2     _isequal,B3
||         STW     .D2T1   A5,*+B4(4)        ; |66| 
||         LDW     .D1T2   *+A14(8),B4       ; |67| 
||         MVK     .S1     0x31,A6           ; |67| 
||         MVK     .L1     0x1,A8            ; |67| 

$C$RL15:   ; CALL OCCURS {_isequal} {0}      ; |67| 
           MVKL    .S2     _fcn_pass,B4
           MVKL    .S2     0xd9d7bdbb,B6
           MVKL    .S2     0x3ddb7cdf,B7
           MVKH    .S2     _fcn_pass,B4
           MVKH    .S2     0xd9d7bdbb,B6

           MV      .L1     A4,A3             ; |67| 
||         LDW     .D1T1   *A14,A4           ; |68| 
||         MVKH    .S2     0x3ddb7cdf,B7

           CALLP   .S2     _isequal,B3
||         STW     .D2T1   A3,*+B4(8)        ; |67| 
||         LDW     .D1T2   *+A14(12),B4      ; |68| 
||         MVK     .S1     0x31,A6           ; |68| 
||         MVK     .L1     0x1,A8            ; |68| 

$C$RL16:   ; CALL OCCURS {_isequal} {0}      ; |68| 
           MVKL    .S2     _fcn_pass,B4
           MVKL    .S2     0xd9d7bdbb,B6
           MVKL    .S2     0x3ddb7cdf,B7
           MVKH    .S2     _fcn_pass,B4

           MVKL    .S1     _output,A3
||         MVKH    .S2     0xd9d7bdbb,B6

           MVKH    .S1     _output,A3
||         STW     .D2T1   A4,*+B4(12)       ; |68| 
||         LDW     .D1T2   *+A14(16),B4      ; |69| 
||         MVKH    .S2     0x3ddb7cdf,B7

           CALLP   .S2     _isequal,B3
||         LDW     .D1T1   *A3,A4            ; |69| 
||         MVK     .S1     0x31,A6           ; |69| 
||         MVK     .L1     0x1,A8            ; |69| 

$C$RL17:   ; CALL OCCURS {_isequal} {0}      ; |69| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 17
           LDW     .D2T1   *+SP(20),A3       ; |69| 
           MVKL    .S2     _fcn_pass,B31
           MVKH    .S2     _fcn_pass,B31
           STW     .D2T1   A4,*+B31(16)      ; |69| 
           NOP             1

           MV      .L2X    A3,B4             ; |69| 
||         STW     .D2T1   A3,*+SP(36)       ; |69| 

           LDW     .D2T2   *B4,B0            ; |72| 
           LDW     .D2T1   *+SP(24),A3
           NOP             3

   [!B0]   B       .S1     $C$L12            ; |72| 
|| [!B0]   MV      .L1     A10,A4

   [!B0]   CALL    .S1     _print_test_results ; |202| 
||         STW     .D2T1   A3,*+SP(40)       ; |72| 

   [ B0]   LDW     .D1T1   *A3,A0            ; |72| 
   [!B0]   MVKL    .S1     _all_pass,A3
   [ B0]   ADD     .L1     4,A3,A3
   [!B0]   MVKH    .S1     _all_pass,A3
           ; BRANCHCC OCCURS {$C$L12}        ; |72| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 10
           CMPEQ   .L1     A4,0,A4           ; |72| 
   [ A0]   LDW     .D1T1   *A3,A3            ; |72| 
           XOR     .L1     1,A4,A4           ; |72| 
           NOP             3
   [ A0]   CMPEQ   .L1     A3,0,A3           ; |72| 
   [ A0]   XOR     .L1     1,A3,A3           ; |72| 

   [ A0]   AND     .L1     A4,A3,A0          ; |72| 
|| [!A0]   ZERO    .S1     A0                ; |72| 
||         MVK     .D1     0x1,A4            ; |72| 

   [!A0]   MV      .L1     A10,A4
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           CALL    .S1     _print_test_results ; |202| 
           MVKL    .S1     _all_pass,A3
           MVKH    .S1     _all_pass,A3
           NOP             2
;** --------------------------------------------------------------------------*
$C$L12:    
;          EXCLUSIVE CPU CYCLES: 1

           STW     .D1T1   A4,*A3            ; |72| 
||         MVK     .L1     0x3,A4            ; |202| 
||         ADDKPC  .S2     $C$RL18,B3,0      ; |202| 

$C$RL18:   ; CALL OCCURS {_print_test_results} {0}  ; |202| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 13

           LDW     .D2T1   *+SP(16),A11      ; |59| 
||         MVKL    .S2     _b_ext,B8

           MVKH    .S2     _b_ext,B8
||         ZERO    .L2     B4
||         MVK     .S1     0x777,A3

           STW     .D2T1   A3,*+SP(12)       ; |206| 
||         SET     .S2     B4,0x14,0x1e,B4
||         MVK     .L2     0xffffffff,B6     ; |206| 
||         MVKL    .S1     _a_ext,A4
||         MV      .L1     A10,A31           ; |205| 

           MV      .L2     B8,B4             ; |205| 
||         ADD     .S2     -1,B4,B7
||         STW     .D2T1   A31,*+SP(16)      ; |205| 
||         MVKH    .S1     _a_ext,A4

           MV      .L2X    A12,B4            ; |206| 
||         STDW    .D2T2   B7:B6,*B4         ; |206| 
||         ZERO    .S2     B5

           MV      .L2X    A4,B6             ; |205| 
||         STW     .D2T1   A11,*+SP(44)      ; |59| 
||         SET     .S2     B5,0x14,0x14,B5

           STDW    .D2T2   B5:B4,*B6         ; |205| 
||         MV      .L2X    A4,B10            ; |205| 
||         MV      .L1X    B8,A14            ; |206| 

           LDDW    .D2T2   *B10,B7:B6        ; |208| 
||         LDDW    .D1T1   *A14,A5:A4        ; |208| 

           CALL    .S1     __divd            ; |208| 
           MVKL    .S2     0x4000cccc,B13
           MVKL    .S2     0xcccccccd,B12

           MVKH    .S2     0x4000cccc,B13
||         MV      .L2X    A12,B11           ; |206| 
||         MV      .L1X    B11,A15           ; |59| 

           MV      .L1X    B7,A5             ; |208| 
||         MV      .L2X    A5,B5             ; |208| 
||         MV      .S1     A11,A13           ; |59| 
||         MVKH    .S2     0xcccccccd,B12

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
;          EXCLUSIVE CPU CYCLES: 1

           MV      .L2X    A4,B4             ; |208| 
||         MV      .L1X    B6,A4             ; |208| 
||         ADDKPC  .S2     $C$RL19,B3,0      ; |208| 

$C$RL19:   ; CALL OCCURS {__divd} {0}        ; |208| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 175
           MVKL    .S1     _output,A3
           MVKH    .S1     _output,A3
           LDW     .D1T1   *A3,A3            ; |208| 
           NOP             4
           ADD     .L1X    B11,A3,A3         ; |208| 
           STDW    .D1T1   A5:A4,*A3         ; |208| 

           LDDW    .D2T2   *B10,B5:B4        ; |209| 
||         LDDW    .D1T1   *A14,A7:A6        ; |209| 

           NOP             4

           MV      .L1X    B4,A4             ; |209| 
||         MV      .L2X    A6,B4             ; |209| 

           CALLP   .S2     _divdp,B3
||         MV      .L1X    B5,A5             ; |209| 
||         MV      .L2X    A7,B5             ; |209| 

$C$RL20:   ; CALL OCCURS {_divdp} {0}        ; |209| 
           MVKL    .S1     _output,A3
           MVKH    .S1     _output,A3
           LDW     .D1T1   *+A3(4),A3        ; |209| 
           NOP             4
           ADD     .L1X    B11,A3,A3         ; |209| 
           STDW    .D1T1   A5:A4,*A3         ; |209| 

           LDDW    .D1T1   *A14,A7:A6        ; |210| 
||         LDDW    .D2T2   *B10,B5:B4        ; |210| 

           NOP             4

           MV      .L1X    B4,A4             ; |210| 
||         MV      .L2X    A6,B4             ; |210| 

           CALLP   .S2     _divdp_c,B3
||         MV      .L1X    B5,A5             ; |210| 
||         MV      .L2X    A7,B5             ; |210| 

$C$RL21:   ; CALL OCCURS {_divdp_c} {0}      ; |210| 
           MVKL    .S1     _output,A3
           MVKH    .S1     _output,A3
           LDW     .D1T1   *+A3(8),A3        ; |210| 
           MV      .L2X    A15,B8            ; |211| 
           LDW     .D2T2   *B8,B8            ; |211| 
           NOP             2
           ADD     .L2X    B11,A3,B4         ; |210| 
           STDW    .D2T1   A5:A4,*B4         ; |210| 
           LDDW    .D1T1   *A14,A5:A4        ; |59| 
           LDDW    .D2T2   *B10,B5:B4        ; |59| 
           ADD     .L2     B11,B8,B31        ; |211| 
           NOP             2
           RCPDP   .S1     A5:A4,A7:A6       ; |59| 
           NOP             1
           MPYDP   .M1     A7:A6,A5:A4,A9:A8 ; |59| 
           NOP             9
           SUBDP   .L1     A13:A12,A9:A8,A9:A8 ; |59| 
           NOP             6
           MPYDP   .M1     A7:A6,A9:A8,A7:A6 ; |59| 
           NOP             9
           MPYDP   .M1     A7:A6,A5:A4,A9:A8 ; |59| 
           NOP             9
           SUBDP   .L1     A11:A10,A9:A8,A9:A8 ; |59| 
           NOP             6
           MPYDP   .M1     A7:A6,A9:A8,A7:A6 ; |59| 
           NOP             9
           MPYDP   .M1     A7:A6,A5:A4,A9:A8 ; |59| 
           NOP             8

           MV      .L1     A13,A5            ; |59| 
||         MV      .S1     A12,A4            ; |59| 

           SUBDP   .L1     A5:A4,A9:A8,A5:A4 ; |59| 
           NOP             6
           MPYDP   .M1     A7:A6,A5:A4,A5:A4 ; |59| 
           NOP             9
           NOP             1
           MPYDP   .M2X    B5:B4,A5:A4,B7:B6 ; |59| 
           NOP             5
           ZERO    .L1     A5:A4             ; |62| 
           NOP             1
           CMPEQDP .S2X    B5:B4,A5:A4,B0    ; |62| 
           NOP             1
   [ B0]   ZERO    .L2     B7:B6             ; |63| 
           STDW    .D2T2   B7:B6,*B31        ; |211| 
           LDDW    .D2T2   *B10,B5:B4        ; |212| 
           LDDW    .D1T1   *A14,A5:A4        ; |213| 
           NOP             3
           MPYDP   .M2     B13:B12,B5:B4,B5:B4 ; |212| 
           NOP             9

           STDW    .D2T2   B5:B4,*++B10      ; |212| 
||         ZERO    .L2     B5

           MVKH    .S2     0xbff80000,B5

           ZERO    .L2     B4                ; |213| 
||         CALLP   .S2     __divd,B3

$C$RL22:   ; CALL OCCURS {__divd} {0}        ; |213| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 12
           LDW     .D2T1   *+SP(12),A3       ; |211| 
           ADD     .L2     8,B11,B11         ; |207| 
           STDW    .D1T1   A5:A4,*++A14      ; |213| 
           NOP             2
           SUB     .L1     A3,1,A0           ; |207| 

   [ A0]   B       .S2     $C$L13            ; |207| 
|| [ A0]   LDDW    .D1T1   *A14,A5:A4        ; |208| 
|| [ A0]   LDDW    .D2T2   *B10,B7:B6        ; |208| 
|| [!A0]   MVKL    .S1     _a_ext,A4

   [!A0]   MVKL    .S2     _b_ext,B4
|| [ A0]   CALL    .S1     __divd            ; |208| 

           STW     .D2T1   A0,*+SP(12)       ; |213| 
   [!A0]   CALL    .S1     _divdp_v          ; |215| 
   [!A0]   LDW     .D1T1   *+A15(4),A6       ; |215| 

   [ A0]   MV      .L2X    A5,B5             ; |208| 
|| [ A0]   MV      .L1X    B7,A5             ; |208| 

           ; BRANCHCC OCCURS {$C$L13}        ; |207| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 3
           MVKH    .S2     _b_ext,B4
           ADDKPC  .S2     $C$RL23,B3,0      ; |215| 

           MVK     .S2     0x777,B6          ; |215| 
||         MVKH    .S1     _a_ext,A4

$C$RL23:   ; CALL OCCURS {_divdp_v} {0}      ; |215| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 42
           MVKL    .S2     0xd9d7bdbb,B6

           MVKL    .S1     _output,A10
||         MVKL    .S2     0x3ddb7cdf,B7

           MVKH    .S1     _output,A10
||         MVKH    .S2     0xd9d7bdbb,B6

           LDW     .D1T1   *A10,A4           ; |66| 
||         MVKH    .S2     0x3ddb7cdf,B7

           CALLP   .S2     _isequal,B3
||         LDW     .D1T2   *+A10(4),B4       ; |66| 
||         MVK     .S1     0x777,A6          ; |66| 
||         MVK     .L1     0x1,A8            ; |66| 

$C$RL24:   ; CALL OCCURS {_isequal} {0}      ; |66| 
           MVKL    .S2     _fcn_pass,B10
           MVKL    .S2     0xd9d7bdbb,B6
           MVKL    .S2     0x3ddb7cdf,B7
           MVKH    .S2     _fcn_pass,B10

           MV      .L1     A4,A3             ; |66| 
||         MVKH    .S2     0xd9d7bdbb,B6

           LDW     .D1T2   *+A10(8),B4       ; |67| 
||         STW     .D2T1   A3,*+B10(4)       ; |66| 
||         MVKH    .S2     0x3ddb7cdf,B7

           CALLP   .S2     _isequal,B3
||         LDW     .D1T1   *A10,A4           ; |67| 
||         MVK     .S1     0x777,A6          ; |67| 
||         MVK     .L1     0x1,A8            ; |67| 

$C$RL25:   ; CALL OCCURS {_isequal} {0}      ; |67| 
           MVKL    .S2     0xd9d7bdbb,B6
           MVKL    .S2     0x3ddb7cdf,B7

           MV      .L1     A4,A3             ; |67| 
||         MVKH    .S2     0xd9d7bdbb,B6

           LDW     .D1T2   *+A10(12),B4      ; |68| 
||         STW     .D2T1   A3,*+B10(8)       ; |67| 
||         MVKH    .S2     0x3ddb7cdf,B7

           CALLP   .S2     _isequal,B3
||         LDW     .D1T1   *A10,A4           ; |68| 
||         MVK     .S1     0x777,A6          ; |68| 
||         MVK     .L1     0x1,A8            ; |68| 

$C$RL26:   ; CALL OCCURS {_isequal} {0}      ; |68| 
           MVKL    .S2     0xd9d7bdbb,B6
           MVKL    .S2     0x3ddb7cdf,B7
           MVKH    .S2     0xd9d7bdbb,B6

           MV      .L1     A10,A3            ; |68| 
||         LDW     .D1T2   *+A10(16),B4      ; |69| 
||         STW     .D2T1   A4,*+B10(12)      ; |68| 
||         MVKH    .S2     0x3ddb7cdf,B7

           CALLP   .S2     _isequal,B3
||         LDW     .D1T1   *A3,A4            ; |69| 
||         MVK     .S1     0x777,A6          ; |69| 
||         MVK     .L1     0x1,A8            ; |69| 

$C$RL27:   ; CALL OCCURS {_isequal} {0}      ; |69| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 16
           LDW     .D2T2   *+SP(20),B4       ; |69| 
           STW     .D2T1   A4,*+B10(16)      ; |69| 
           NOP             3
           LDW     .D2T1   *B4,A0            ; |72| 
           LDW     .D2T2   *+SP(24),B4
           NOP             3
   [!A0]   B       .S1     $C$L14            ; |72| 

   [!A0]   CALL    .S1     _print_test_results ; |219| 
|| [ A0]   LDW     .D2T2   *B4,B0            ; |72| 

   [!A0]   MV      .L1     A12,A3
   [!A0]   MVKL    .S1     _all_pass,A4
   [ A0]   ADD     .L2     4,B4,B4
   [!A0]   MVKH    .S1     _all_pass,A4
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
           CALL    .S1     _print_test_results ; |219| 
           MVKL    .S1     _all_pass,A4
           MVKH    .S1     _all_pass,A4
           NOP             2
;** --------------------------------------------------------------------------*
$C$L14:    
;          EXCLUSIVE CPU CYCLES: 1

           STW     .D1T1   A3,*A4            ; |72| 
||         MVK     .L1     0x4,A4            ; |219| 
||         ADDKPC  .S2     $C$RL28,B3,0      ; |219| 

$C$RL28:   ; CALL OCCURS {_print_test_results} {0}  ; |219| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 16
           MVKL    .S1     _cycle_counts+24,A4

           MVKH    .S1     _cycle_counts+24,A4
||         MV      .L2X    A12,B4            ; |114| 
||         MV      .L1     A12,A2            ; |114| 
||         MV      .D1     A12,A3            ; |114| 

           MVC     .S2     B4,TSCL           ; |115| 
||         STDW    .D1T1   A3:A2,*A4         ; |114| 

           MVC     .S2     TSCL,B6           ; |116| 
           MVC     .S2     TSCH,B4           ; |116| 
           MVKL    .S1     _t_start,A4

           MVKH    .S1     _t_start,A4
||         MV      .L2     B4,B7             ; |116| 

           MVC     .S2     TSCL,B4           ; |117| 
||         STDW    .D1T2   B7:B6,*A4         ; |116| 

           MVC     .S2     TSCH,B8           ; |117| 
           SUBU    .L2     B4,B6,B5:B4       ; |117| 

           SUB     .L2     B8,B7,B6          ; |117| 
||         EXT     .S2     B5,24,24,B5       ; |117| 
||         MVKL    .S1     _t_offset,A4

           ADD     .L2     B6,B5,B5          ; |117| 
||         MVKH    .S1     _t_offset,A4

           MVK     .S2     0x80,B4
||         STDW    .D1T2   B5:B4,*A4         ; |117| 

           CALL    .S1     _gimme_random     ; |229| 

           MVKL    .S2     0x3fa6defc,B4
||         MV      .L1X    B4,A11            ; |117| 
||         MVKL    .S1     0x402921fb,A5

           MVKH    .S2     0x3fa6defc,B4
||         MVKH    .S1     0x402921fb,A5
||         STW     .D2T1   A3,*+SP(12)       ; |114| 
||         MV      .L1     A2,A10

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
$C$L15:    
;          EXCLUSIVE CPU CYCLES: 3
           MVKL    .S2     0xc01921fb,B5
           MVKH    .S2     0xc01921fb,B5

           MV      .L1X    B4,A4             ; |229| 
||         ADDKPC  .S2     $C$RL29,B3,0      ; |229| 

$C$RL29:   ; CALL OCCURS {_gimme_random} {0}  ; |229| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 17
           MVKL    .S1     _input,A3
           MVKH    .S1     _input,A3
           LDW     .D1T2   *A3,B4            ; |229| 
           MVKL    .S2     0xc01921fb,B5
           MVKH    .S2     0xc01921fb,B5
           LDW     .D1T1   *+A3(4),A12       ; |230| 
           NOP             1
           ADD     .L2X    A10,B4,B4         ; |229| 

           STDW    .D2T1   A5:A4,*B4         ; |229| 
||         MVKL    .S2     0x3fa6defc,B4

           MVKH    .S2     0x3fa6defc,B4
           MVKL    .S1     0x402921fb,A5

           MV      .L1X    B4,A4             ; |230| 
||         MVKH    .S1     0x402921fb,A5
||         CALLP   .S2     _gimme_random,B3

$C$RL30:   ; CALL OCCURS {_gimme_random} {0}  ; |230| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 121
           ADD     .L1     A12,A10,A3        ; |230| 

           STDW    .D1T1   A5:A4,*A3         ; |230| 
||         MVC     .S2     TSCL,B6           ; |122| 

           MVC     .S2     TSCH,B7           ; |122| 
           ADD     .L1     A12,A10,A3        ; |59| 
           LDDW    .D1T1   *A3,A7:A6         ; |59| 
           ZERO    .L2     B4                ; |59| 
           ZERO    .L2     B5
           SET     .S2     B5,0x1e,0x1e,B5
           ZERO    .L2     B17
           RCPDP   .S1     A7:A6,A5:A4       ; |59| 
           ZERO    .L2     B16               ; |59| 
           MPYDP   .M1     A5:A4,A7:A6,A9:A8 ; |59| 
           SET     .S2     B17,0x1e,0x1e,B17
           MVKL    .S2     _input,B12
           MVKH    .S2     _input,B12
           LDW     .D2T2   *B12,B31          ; |59| 
           MVKL    .S1     _output+12,A31
           MV      .L2X    A12,B11           ; |59| 
           MVKH    .S1     _output+12,A31
           MVKL    .S1     _t_start,A30
           ADD     .L1X    B31,A10,A3        ; |59| 
           MVKH    .S1     _t_start,A30
           SUBDP   .L2X    B5:B4,A9:A8,B5:B4 ; |59| 
           STDW    .D1T2   B7:B6,*A30
           MV      .L1X    B31,A12           ; |62| 
           NOP             4
           MPYDP   .M2X    A5:A4,B5:B4,B5:B4 ; |59| 
           NOP             9
           MPYDP   .M2X    B5:B4,A7:A6,B9:B8 ; |59| 
           NOP             9
           SUBDP   .L2     B17:B16,B9:B8,B9:B8 ; |59| 
           NOP             6
           MPYDP   .M2     B5:B4,B9:B8,B9:B8 ; |59| 
           NOP             9
           NOP             1
           MPYDP   .M1X    B9:B8,A7:A6,A5:A4 ; |59| 
           ADD     .L2X    B31,A10,B5        ; |62| 
           NOP             6
           MV      .L1X    B17,A7            ; |59| 
           MV      .L1X    B16,A6            ; |59| 
           SUBDP   .L1     A7:A6,A5:A4,A5:A4 ; |59| 
           ZERO    .L2     B17:B16           ; |62| 
           NOP             5
           MPYDP   .M1X    B9:B8,A5:A4,A7:A6 ; |59| 
           LDDW    .D1T1   *A3,A5:A4         ; |59| 
           LDDW    .D2T2   *B5,B9:B8         ; |62| 
           NOP             7
           MPYDP   .M1     A5:A4,A7:A6,A5:A4 ; |59| 
           LDW     .D1T1   *A31,A6           ; |234| 
           CMPEQDP .S2     B9:B8,B17:B16,B0  ; |62| 
           NOP             6
           ADD     .L1     A10,A6,A3         ; |234| 
   [ B0]   ZERO    .L1     A5:A4             ; |63| 

           STDW    .D1T1   A5:A4,*A3         ; |234| 
||         MVC     .S2     TSCL,B8           ; |128| 

           MVC     .S2     TSCH,B9           ; |128| 

           MVKL    .S2     _t_offset,B13
||         MVKL    .S1     _cycle_counts+24,A3
||         SUB     .L1     A11,1,A0          ; |227| 
||         ADD     .D1     8,A10,A10         ; |227| 

           MVKH    .S2     _t_offset,B13
||         MVKH    .S1     _cycle_counts+24,A3
||         SUB     .L1     A11,1,A11         ; |227| 

           MV      .L1     A3,A13            ; |130| 
||         LDDW    .D2T2   *B13,B17:B16      ; |130| 

           MVKL    .S1     _t_stop,A29
           LDDW    .D1T1   *A3,A5:A4         ; |130| 
           MVKH    .S1     _t_stop,A29
           STDW    .D1T2   B9:B8,*A29        ; |128| 
           ADDU    .L2     B16,B6,B5:B4      ; |130| 

           ADD     .S2     B5,B17,B6         ; |130| 
|| [ A0]   B       .S1     $C$L15            ; |227| 
||         SUBU    .L2     B8,B4,B5:B4       ; |130| 

           ADD     .L2     B6,B7,B6          ; |130| 

           ADDU    .L2X    A4,B4,B7:B6       ; |130| 
||         SUB     .D2     B9,B6,B5          ; |130| 
||         EXT     .S2     B5,24,24,B4       ; |130| 

   [ A0]   CALL    .S2     _gimme_random     ; |229| 
||         ADD     .L2     B5,B4,B5          ; |130| 
||         ADD     .D2X    B7,A5,B4          ; |130| 
|| [ A0]   MVKL    .S1     0x402921fb,A5

           ADD     .L2     B4,B5,B7          ; |130| 
|| [ A0]   MVKL    .S2     0x3fa6defc,B4
|| [ A0]   MVKH    .S1     0x402921fb,A5

   [!A0]   CALL    .S1     __fltllif         ; |135| 
|| [ A0]   MVKH    .S2     0x3fa6defc,B4
||         STDW    .D1T2   B7:B6,*A13        ; |130| 

           ; BRANCHCC OCCURS {$C$L15}        ; |227| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           LDDW    .D1T1   *A13,A5:A4        ; |135| 
           ADDKPC  .S2     $C$RL31,B3,3      ; |135| 
$C$RL31:   ; CALL OCCURS {__fltllif} {0}     ; |135| 
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
           CALLP   .S2     __fixdlli,B3
$C$RL32:   ; CALL OCCURS {__fixdlli} {0}     ; |135| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 20
           MV      .L2X    A13,B4
           MV      .L2X    A10,B5
           MV      .L2X    A10,B6

           MVK     .S2     24,B10
||         MV      .L2X    A10,B7

           SUB     .L2X    A13,B10,B10
||         STDW    .D2T1   A5:A4,*B4         ; |135| 

           STDW    .D2T2   B7:B6,*B10        ; |114| 
||         MVC     .S2     B5,TSCL           ; |115| 

           MVC     .S2     TSCL,B4           ; |116| 
           MVC     .S2     TSCH,B5           ; |116| 
           MV      .L1X    B4,A14            ; |116| 

           MV      .L1X    B5,A13            ; |116| 
||         MVC     .S2     TSCL,B5           ; |117| 

           MVC     .S2     TSCH,B4           ; |117| 
           SUBU    .L2X    B5,A14,B7:B6      ; |117| 

           SUB     .L1X    B4,A13,A4         ; |117| 
||         EXT     .S2     B7,24,24,B4       ; |117| 
||         MVKL    .S1     _output,A3

           MVKH    .S1     _output,A3
||         MVK     .S2     0x80,B31

           MV      .L1     A12,A10
||         LDW     .D1T1   *A3,A12
||         ADD     .S1X    A4,B4,A3          ; |117| 
||         STW     .D2T2   B31,*+SP(20)      ; |117| 

           STW     .D2T1   A3,*+SP(24)       ; |117| 
||         CALL    .S1     __divd            ; |242| 

           LDDW    .D2T2   *B11++,B5:B4      ; |242| 
||         LDDW    .D1T1   *A10++,A5:A4      ; |242| 

           MV      .L1X    B6,A15            ; |117| 
           NOP             2
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L16:    
;          EXCLUSIVE CPU CYCLES: 1
           ADDKPC  .S2     $C$RL33,B3,0      ; |242| 
$C$RL33:   ; CALL OCCURS {__divd} {0}        ; |242| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 12
           LDW     .D2T2   *+SP(20),B4       ; |242| 
           STDW    .D1T1   A5:A4,*A12++      ; |242| 
           NOP             3

           SUB     .L1X    B4,1,A0           ; |241| 
||         SUB     .L2     B4,1,B4           ; |241| 

   [ A0]   B       .S1     $C$L16            ; |241| 
||         STW     .D2T2   B4,*+SP(20)       ; |242| 

   [ A0]   LDDW    .D2T2   *B11++,B5:B4      ; |242| 
|| [ A0]   CALL    .S1     __divd            ; |242| 

   [ A0]   LDDW    .D1T1   *A10++,A5:A4      ; |242| 
           NOP             3
           ; BRANCHCC OCCURS {$C$L16}        ; |241| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 13
           MVC     .S2     TSCL,B6           ; |128| 
           MVC     .S2     TSCH,B7           ; |128| 
           LDW     .D2T1   *+SP(24),A3       ; |128| 
           LDDW    .D2T2   *B10,B5:B4        ; |130| 
           ADDU    .L1     A15,A14,A5:A4     ; |130| 
           NOP             2

           ADD     .S1     A5,A3,A3          ; |130| 
||         SUBU    .L1X    B6,A4,A5:A4       ; |130| 
||         CALL    .S2     __fltllif         ; |130| 

           ADD     .L1     A3,A13,A3         ; |130| 
||         EXT     .S1     A5,24,24,A31      ; |130| 

           ADDU    .L2X    B4,A4,B9:B8       ; |130| 
||         SUB     .L1X    B7,A3,A3          ; |130| 
||         MVKL    .S2     _t_stop,B4

           ADD     .L2     B9,B5,B5          ; |130| 
||         ADD     .L1     A3,A31,A3         ; |130| 
||         MVKH    .S2     _t_stop,B4

           STDW    .D2T2   B7:B6,*B4         ; |128| 
||         MV      .L1X    B8,A4             ; |130| 

           ADD     .L1X    B5,A3,A5          ; |130| 
||         ADDKPC  .S2     $C$RL34,B3,0      ; |130| 

$C$RL34:   ; CALL OCCURS {__fltllif} {0}     ; |130| 
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
           CALLP   .S2     __fixdlli,B3
$C$RL35:   ; CALL OCCURS {__fixdlli} {0}     ; |130| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 18
           MV      .L2X    A10,B4            ; |135| 

           ZERO    .L1     A12
||         MV      .L2X    A10,B5            ; |135| 
||         STDW    .D2T1   A5:A4,*B10        ; |130| 

           SET     .S1     A12,0x1a,0x1d,A12
||         STDW    .D2T2   B5:B4,*+B10(8)    ; |114| 
||         MVC     .S2     B4,TSCL           ; |115| 

           MVC     .S2     TSCL,B6           ; |116| 
           MVC     .S2     TSCH,B7           ; |116| 
           MVKL    .S1     _t_start,A15
           MVKH    .S1     _t_start,A15

           STDW    .D1T2   B7:B6,*A15        ; |116| 
||         MVC     .S2     TSCL,B4           ; |117| 

           MVC     .S2     TSCH,B8           ; |117| 
           SUBU    .L2     B4,B6,B5:B4       ; |117| 

           EXT     .S2     B5,24,24,B5       ; |117| 
||         SUB     .L2     B8,B7,B6          ; |117| 

           ADD     .L2     B6,B5,B5          ; |117| 

           STDW    .D2T2   B5:B4,*B13        ; |117| 
||         MV      .L2     B12,B4            ; |250| 

           LDW     .D2T2   *B4,B4            ; |250| 
           LDW     .D2T1   *+SP(28),A14      ; |117| 
           MVK     .S2     0x80,B11
           ADD     .L1X    4,B12,A13
           NOP             1
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L17:    
;          EXCLUSIVE CPU CYCLES: 13
           LDW     .D1T1   *A13,A3           ; |250| 
           ADD     .L2X    A10,B4,B4         ; |250| 
           LDDW    .D2T2   *B4,B7:B6         ; |250| 
           NOP             2
           ADD     .L1     A10,A3,A3         ; |250| 
           LDDW    .D1T1   *A3,A5:A4         ; |250| 
           CALL    .S1     _divdp            ; |250| 
           ADDKPC  .S2     $C$RL36,B3,2      ; |250| 

           MV      .L2X    A4,B4             ; |250| 
||         MV      .L1X    B6,A4             ; |250| 

           MV      .L2X    A5,B5             ; |250| 
||         MV      .L1X    B7,A5             ; |250| 

$C$RL36:   ; CALL OCCURS {_divdp} {0}        ; |250| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 7

           LDW     .D1T1   *A14,A3           ; |250| 
||         SUB     .L1X    B11,1,A0          ; |249| 

   [ A0]   BNOP    .S1     $C$L17,1          ; |249| 
|| [ A0]   MV      .L2     B12,B4            ; |250| 

   [ A0]   LDW     .D2T2   *B4,B4            ; |250| 
           SUB     .L2     B11,1,B11         ; |249| 

           ADD     .L1     A10,A3,A3         ; |250| 
||         ADD     .S1     8,A10,A10         ; |249| 

           STDW    .D1T1   A5:A4,*A3         ; |250| 
           ; BRANCHCC OCCURS {$C$L17}        ; |249| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 17
           MVC     .S2     TSCL,B8           ; |128| 
           MVC     .S2     TSCH,B4           ; |128| 

           MV      .L1     A15,A14           ; |128| 
||         LDDW    .D2T2   *B13,B7:B6        ; |130| 

           LDDW    .D1T1   *A14,A7:A6        ; |130| 
           LDDW    .D2T2   *+B10(8),B17:B16  ; |130| 
           MV      .L2     B4,B9             ; |128| 
           NOP             2
           ADDU    .L1X    B6,A6,A5:A4       ; |130| 
           ADD     .L1X    A5,B7,A3          ; |130| 

           ADD     .L1     A3,A7,A3          ; |130| 
||         SUBU    .L2X    B8,A4,B5:B4       ; |130| 

           CALL    .S1     __fltllif         ; |130| 
||         EXT     .S2     B5,24,24,B6       ; |130| 
||         ADDU    .L2     B16,B4,B5:B4      ; |130| 

           SUB     .L2X    B9,A3,B7          ; |130| 
||         ADD     .S2     B5,B17,B31        ; |130| 

           ADD     .L2     B7,B6,B5          ; |130| 
||         MV      .L1X    B4,A4             ; |130| 
||         MVKL    .S2     _t_stop,B6

           ADD     .L2     B31,B5,B4         ; |130| 
||         MVKH    .S2     _t_stop,B6

           STDW    .D2T2   B9:B8,*B6         ; |128| 

           MV      .L1X    B4,A5             ; |130| 
||         ADDKPC  .S2     $C$RL37,B3,0      ; |130| 

$C$RL37:   ; CALL OCCURS {__fltllif} {0}     ; |130| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 13
           MPYSP   .M1     A12,A4,A3         ; |130| 
           ZERO    .L1     A10               ; |130| 
           NOP             2
           SPDP    .S1     A3,A5:A4          ; |130| 
           NOP             1
           ADDDP   .L1     A11:A10,A5:A4,A5:A4 ; |130| 
           CALLP   .S2     __fixdlli,B3
$C$RL38:   ; CALL OCCURS {__fixdlli} {0}     ; |130| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 19

           ADDAD   .D2     B10,1,B11
||         MV      .L2X    A10,B5

           MV      .L2X    A10,B4
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

           EXT     .S2     B5,24,24,B5       ; |117| 
||         SUB     .L2     B8,B7,B6          ; |117| 

           ADD     .L2     B6,B5,B5          ; |117| 
||         MV      .S2     B13,B12           ; |117| 
||         LDW     .D2T1   *+SP(32),A15      ; |117| 

           STDW    .D2T2   B5:B4,*B12        ; |117| 
||         MVKL    .S2     _input,B4
||         MVK     .S1     0x80,A3

           MVKH    .S2     _input,B4
||         STW     .D2T1   A3,*+SP(20)       ; |117| 

           LDW     .D2T2   *B4,B4            ; |258| 
||         LDW     .D1T1   *A13,A3           ; |258| 

           NOP             3
           MV      .L2X    A15,B13           ; |258| 

           ADD     .L2X    A10,B4,B4         ; |258| 
||         ADD     .L1     A10,A3,A3         ; |258| 

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L18:    
;          EXCLUSIVE CPU CYCLES: 7

           LDDW    .D2T2   *B4,B7:B6         ; |258| 
||         LDDW    .D1T1   *A3,A5:A4         ; |258| 

           CALL    .S1     _divdp_c          ; |258| 
           ADDKPC  .S2     $C$RL39,B3,2      ; |258| 

           MV      .L2X    A4,B4             ; |258| 
||         MV      .L1X    B6,A4             ; |258| 

           MV      .L2X    A5,B5             ; |258| 
||         MV      .L1X    B7,A5             ; |258| 

$C$RL39:   ; CALL OCCURS {_divdp_c} {0}      ; |258| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 13
           LDW     .D2T2   *B13,B4           ; |258| 
           LDW     .D2T1   *+SP(20),A3       ; |258| 
           NOP             3

           ADD     .L1X    A10,B4,A6         ; |258| 
||         MVKL    .S2     _input,B4
||         ADD     .S1     8,A10,A10         ; |257| 

           MVKH    .S2     _input,B4
||         SUB     .L1     A3,1,A0           ; |257| 
||         STDW    .D1T1   A5:A4,*A6         ; |258| 

   [ A0]   BNOP    .S1     $C$L18,3          ; |257| 
|| [ A0]   LDW     .D2T2   *B4,B4            ; |258| 
|| [ A0]   LDW     .D1T1   *A13,A3           ; |258| 

           STW     .D2T1   A0,*+SP(20)       ; |258| 

           ADD     .L2X    A10,B4,B4         ; |258| 
|| [ A0]   ADD     .L1     A10,A3,A3         ; |258| 

           ; BRANCHCC OCCURS {$C$L18}        ; |257| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 16
           MVC     .S2     TSCL,B6           ; |128| 
           MVC     .S2     TSCH,B7           ; |128| 

           MV      .L2     B12,B4            ; |128| 
||         LDDW    .D1T1   *A14,A5:A4        ; |130| 

           LDDW    .D2T2   *B4,B9:B8         ; |130| 
           LDDW    .D2T2   *+B10(16),B17:B16 ; |130| 
           MVKL    .S2     _t_stop,B31
           MVKH    .S2     _t_stop,B31
           STDW    .D2T2   B7:B6,*B31        ; |128| 
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
           ADDKPC  .S2     $C$RL40,B3,0      ; |130| 
           MV      .L1X    B4,A5             ; |130| 
$C$RL40:   ; CALL OCCURS {__fltllif} {0}     ; |130| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 112
           MPYSP   .M1     A12,A4,A3         ; |130| 
           ZERO    .L1     A10               ; |130| 
           NOP             3
           SPDP    .S2X    A3,B5:B4          ; |130| 
           NOP             2
           ADDDP   .L1X    A11:A10,B5:B4,A5:A4 ; |130| 
           CALLP   .S2     __fixdlli,B3
$C$RL41:   ; CALL OCCURS {__fixdlli} {0}     ; |130| 

           ADDAD   .D2     B11,1,B12
||         MV      .L2X    A10,B5

           MV      .L2X    A10,B4
||         STDW    .D2T1   A5:A4,*B12        ; |130| 

           STDW    .D2T2   B5:B4,*+B10(32)   ; |114| 
||         MVC     .S2     B4,TSCL           ; |115| 

           MVC     .S2     TSCL,B18          ; |116| 
           MVC     .S2     TSCH,B4           ; |116| 
           MV      .L2     B4,B19            ; |116| 

           STDW    .D1T2   B19:B18,*A14      ; |116| 
||         MVC     .S2     TSCL,B5           ; |117| 

           MVC     .S2     TSCH,B4           ; |117| 
           MVKL    .S2     _input,B16
           MVKL    .S2     _t_offset,B10

           MVKH    .S2     _input,B16
||         MV      .D2X    A13,B9            ; |117| 
||         SUBU    .L2     B5,B18,B7:B6      ; |117| 

           LDW     .D2T1   *+B13(8),A6       ; |265| 
||         SUB     .L2     B4,B19,B31        ; |117| 
||         EXT     .S2     B7,24,24,B5       ; |117| 

           LDW     .D2T2   *B9,B4            ; |265| 
||         ADD     .L2     B31,B5,B7         ; |117| 
||         MVKH    .S2     _t_offset,B10

           STDW    .D2T2   B7:B6,*B10        ; |117| 
||         MVK     .S2     0x80,B6           ; |265| 

           CALLP   .S2     _divdp_v,B3
||         LDW     .D2T1   *B16,A4           ; |265| 

$C$RL42:   ; CALL OCCURS {_divdp_v} {0}      ; |265| 
           MVC     .S2     TSCL,B8           ; |128| 
           MVC     .S2     TSCH,B4           ; |128| 

           LDDW    .D1T1   *A14,A7:A6        ; |130| 
||         LDDW    .D2T2   *B10,B7:B6        ; |130| 

           MVK     .S1     16,A13
           ADD     .L1X    B12,A13,A13
           MVKL    .S1     _t_stop,A3

           LDDW    .D1T1   *A13,A17:A16      ; |130| 
||         MVKH    .S1     _t_stop,A3

           ADDU    .L1X    B6,A6,A9:A8       ; |130| 

           MV      .L2     B4,B9             ; |128| 
||         MV      .S2X    A3,B4             ; |128| 
||         ADD     .L1X    A9,B7,A3          ; |130| 

           SUBU    .L1X    B8,A8,A5:A4       ; |130| 

           ADD     .L1     A3,A7,A5          ; |130| 
||         EXT     .S1     A5,24,24,A3       ; |130| 

           SUB     .S1X    B9,A5,A6          ; |130| 
||         ADDU    .L1     A16,A4,A5:A4      ; |130| 

           ADD     .L1     A5,A17,A3         ; |130| 
||         ADD     .S1     A6,A3,A5          ; |130| 

           CALLP   .S2     __fltllif,B3
||         ADD     .L1     A3,A5,A5          ; |130| 
||         STDW    .D2T2   B9:B8,*B4         ; |128| 

$C$RL43:   ; CALL OCCURS {__fltllif} {0}     ; |130| 
           MPYSP   .M1     A12,A4,A3         ; |130| 
           NOP             3
           SPDP    .S1     A3,A5:A4          ; |130| 
           NOP             1
           ADDDP   .L1     A11:A10,A5:A4,A5:A4 ; |130| 
           CALLP   .S2     __fixdlli,B3
$C$RL44:   ; CALL OCCURS {__fixdlli} {0}     ; |130| 
           MVKL    .S1     _output,A10
           MVKH    .S1     _output,A10
           LDW     .D1T1   *A10,A3           ; |66| 
           MVKL    .S2     0x3ddb7cdf,B7
           MVKL    .S2     0xd9d7bdbb,B6
           MVKH    .S2     0x3ddb7cdf,B7

           MVKH    .S2     0xd9d7bdbb,B6
||         STDW    .D1T1   A5:A4,*A13        ; |130| 
||         MVK     .S1     0x80,A6           ; |66| 

           CALLP   .S2     _isequal,B3
||         LDW     .D1T2   *+A10(4),B4       ; |66| 
||         MV      .L1     A3,A4             ; |66| 
||         MVK     .S1     0x1,A8            ; |66| 

$C$RL45:   ; CALL OCCURS {_isequal} {0}      ; |66| 
           MVKL    .S2     0x3ddb7cdf,B7
           MVKL    .S2     0xd9d7bdbb,B6
           MVKL    .S2     _fcn_pass,B10
           MVKH    .S2     0x3ddb7cdf,B7
           MVKH    .S2     0xd9d7bdbb,B6

           MV      .L1     A4,A3             ; |66| 
||         LDW     .D1T1   *A10,A4           ; |67| 
||         MVKH    .S2     _fcn_pass,B10

           CALLP   .S2     _isequal,B3
||         LDW     .D1T2   *+A10(8),B4       ; |67| 
||         STW     .D2T1   A3,*+B10(4)       ; |66| 
||         MVK     .S1     0x80,A6           ; |67| 
||         MVK     .L1     0x1,A8            ; |67| 

$C$RL46:   ; CALL OCCURS {_isequal} {0}      ; |67| 
           MVKL    .S2     0xd9d7bdbb,B6
           MVKL    .S2     0x3ddb7cdf,B7

           MV      .L1     A4,A3             ; |67| 
||         MVKH    .S2     0xd9d7bdbb,B6

           LDW     .D1T2   *+A10(12),B4      ; |68| 
||         MVKH    .S2     0x3ddb7cdf,B7
||         STW     .D2T1   A3,*+B10(8)       ; |67| 

           CALLP   .S2     _isequal,B3
||         LDW     .D1T1   *A10,A4           ; |68| 
||         MVK     .S1     0x80,A6           ; |68| 
||         MVK     .L1     0x1,A8            ; |68| 

$C$RL47:   ; CALL OCCURS {_isequal} {0}      ; |68| 
           MVKL    .S2     0x3ddb7cdf,B7
           MVKL    .S2     0xd9d7bdbb,B6
           MVKH    .S2     0x3ddb7cdf,B7

           MV      .L1     A10,A3            ; |68| 
||         STW     .D2T1   A4,*+B10(12)      ; |68| 
||         LDW     .D1T2   *+A10(16),B4      ; |69| 
||         MVKH    .S2     0xd9d7bdbb,B6

           CALLP   .S2     _isequal,B3
||         LDW     .D1T1   *A3,A4            ; |69| 
||         MVK     .S1     0x80,A6           ; |69| 
||         MVK     .L1     0x1,A8            ; |69| 

$C$RL48:   ; CALL OCCURS {_isequal} {0}      ; |69| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 16
           LDW     .D2T2   *+SP(36),B5       ; |69| 
           LDW     .D2T1   *+SP(40),A3
           MV      .L2X    A4,B4             ; |69| 
           STW     .D2T2   B4,*+B10(16)      ; |69| 
           NOP             1
           LDW     .D2T2   *B5,B0            ; |72| 
           NOP             4

   [!B0]   BNOP    .S1     $C$L19,5          ; |72| 
|| [ B0]   LDW     .D1T1   *A3,A0            ; |72| 
|| [ B0]   ADD     .L1     4,A3,A3

           ; BRANCHCC OCCURS {$C$L19}        ; |72| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 15
   [ A0]   LDW     .D1T1   *A3,A3            ; |72| 
   [!A0]   ZERO    .L2     B0                ; |72| 
           CMPEQ   .L2     B4,0,B4           ; |72| 
           XOR     .L2     1,B4,B4           ; |72| 
           NOP             1
   [ A0]   CMPEQ   .L1     A3,0,A3           ; |72| 
   [ A0]   XOR     .L1     1,A3,A3           ; |72| 
           NOP             1
   [ A0]   AND     .L2X    B4,A3,B0          ; |72| 
   [ B0]   B       .S1     $C$L20            ; |72| 
   [ B0]   CALL    .S1     _print_test_results ; |271| 
           MVK     .L1     0x1,A3            ; |72| 
   [ B0]   MVKL    .S1     _all_pass,A4
   [ B0]   MVKH    .S1     _all_pass,A4
           NOP             1
           ; BRANCHCC OCCURS {$C$L20}        ; |72| 
;** --------------------------------------------------------------------------*
$C$L19:    
;          EXCLUSIVE CPU CYCLES: 5
           CALL    .S1     _print_test_results ; |271| 
           MVKL    .S1     _all_pass,A4
           MVKH    .S1     _all_pass,A4
           ZERO    .L1     A3                ; |72| 
           NOP             1
;** --------------------------------------------------------------------------*
$C$L20:    
;          EXCLUSIVE CPU CYCLES: 1

           STW     .D1T1   A3,*A4            ; |72| 
||         MVK     .L1     0x2,A4            ; |271| 
||         ADDKPC  .S2     $C$RL49,B3,0      ; |271| 

$C$RL49:   ; CALL OCCURS {_print_test_results} {0}  ; |271| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 30
           MVKL    .S2     $C$SL2+0,B4
           MVKH    .S2     $C$SL2+0,B4

           CALLP   .S2     _printf,B3
||         STW     .D2T2   B4,*+SP(4)        ; |272| 

$C$RL50:   ; CALL OCCURS {_printf} {0}       ; |272| 
           MVKL    .S2     $C$SL3+0,B4
           MVKH    .S2     $C$SL3+0,B4

           CALLP   .S2     _printf,B3
||         STW     .D2T2   B4,*+SP(4)        ; |272| 

$C$RL51:   ; CALL OCCURS {_printf} {0}       ; |272| 
           MVKL    .S1     $C$SL1+0,A10
           MVKH    .S1     $C$SL1+0,A10

           CALLP   .S2     _print_profile_results,B3
||         MV      .L1     A10,A4            ; |279| 

$C$RL52:   ; CALL OCCURS {_print_profile_results} {0}  ; |279| 

           CALLP   .S2     _print_memory_results,B3
||         MV      .L1     A10,A4            ; |282| 

$C$RL53:   ; CALL OCCURS {_print_memory_results} {0}  ; |282| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 11
           LDW     .D2T2   *++SP(56),B3      ; |283| 
           LDDW    .D2T1   *++SP,A13:A12     ; |283| 
           LDDW    .D2T1   *++SP,A15:A14     ; |283| 
           LDDW    .D2T2   *++SP,B11:B10     ; |283| 
           LDDW    .D2T2   *++SP,B13:B12     ; |283| 

           LDW     .D2T1   *++SP(8),A10      ; |283| 
||         RET     .S2     B3                ; |283| 

           LDW     .D2T1   *++SP(8),A11      ; |283| 
           NOP             4
           ; BRANCH OCCURS {B3}              ; |283| 
;******************************************************************************
;* STRINGS                                                                    *
;******************************************************************************
	.sect	".const:.string"
$C$SL1:	.string	"divDP",0
$C$SL2:	.string	"----------------------------------------",0
$C$SL3:	.string	"----------------------------------------",10,0
;*****************************************************************************
;* UNDEFINED EXTERNAL REFERENCES                                             *
;*****************************************************************************
	.global	_printf
	.global	_driver_init
	.global	_print_profile_results
	.global	_print_memory_results
	.global	_print_test_results
	.global	_gimme_random
	.global	_isequal
	.global	_divdp
	.global	_divdp_c
	.global	_divdp_v
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
	.global	__divd
	.global	__fltllif
	.global	__fixdlli

;******************************************************************************
;* BUILD ATTRIBUTES                                                           *
;******************************************************************************
	.battr "TI", Tag_File, 1, Tag_ABI_stack_align_needed(0)
	.battr "TI", Tag_File, 1, Tag_ABI_stack_align_preserved(0)
	.battr "TI", Tag_File, 1, Tag_Tramps_Use_SOC(1)
