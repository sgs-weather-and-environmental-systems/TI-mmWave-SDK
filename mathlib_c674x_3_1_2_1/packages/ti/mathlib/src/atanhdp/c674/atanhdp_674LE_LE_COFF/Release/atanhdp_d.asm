;******************************************************************************
;* TMS320C6x C/C++ Codegen                                          PC v7.4.2 *
;* Date/Time created: Mon May 16 23:37:59 2016                                *
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
	.word	099301ad8h,03f6ab441h		; _a[0] @ 0
	.word	0adfa0a03h,03f7460cbh		; _a[1] @ 64
	.word	0d05621d3h,0bf8460cbh		; _a[2] @ 128
	.word	0403edf64h,03f8e9131h		; _a[3] @ 192
	.word	0f2b239a4h,0bf9460cbh		; _a[4] @ 256
	.word	099788c84h,03f9978feh		; _a[5] @ 320
	.word	0ec0b5675h,0bf9e9131h		; _a[6] @ 384
	.word	04968d4abh,03fa1d4b2h		; _a[7] @ 448
	.word	09ccbfe1bh,0bfa460cbh		; _a[8] @ 512
	.word	046156314h,03fa6ece5h		; _a[9] @ 576
	.word	099788c84h,0bfa978feh		; _a[10] @ 640
	.word	042c1f17dh,03fac0518h		; _a[11] @ 704
	.word	096251aedh,0bfae9131h		; _a[12] @ 768
	.word	09fb73ff3h,03fb08ea5h		; _a[13] @ 832
	.word	04968d4abh,0bfb1d4b2h		; _a[14] @ 896
	.word	0f31a6963h,03fb31abeh		; _a[15] @ 960
	.word	0c7bf1bdfh,0bfb460cbh		; _a[16] @ 1024
	.word	07170b097h,03fb5a6d8h		; _a[17] @ 1088
	.word	046156314h,0bfb6ece5h		; _a[18] @ 1152
	.word	0efc6f7cch,03fb832f1h		; _a[19] @ 1216
	.word	0c46baa48h,0bfb978feh		; _a[20] @ 1280
	.word	0432a213ch,03fbabf0bh		; _a[21] @ 1344
	.word	096f57a6bh,0bfbc0517h		; _a[22] @ 1408
	.word	0983ffd46h,03fbd4b25h		; _a[23] @ 1472
	.word	0ec0b5675h,0bfbe9131h		; _a[24] @ 1536
	.word	03fd6afa5h,03fbfd73eh		; _a[25] @ 1600
	.word	049d1046ah,0bfc08ea5h		; _a[26] @ 1664
	.word	04a7645d7h,03fc131ach		; _a[27] @ 1728
	.word	0745bf26fh,0bfc1d4b2h		; _a[28] @ 1792
	.word	09e419f07h,03fc277b8h		; _a[29] @ 1856
	.word	0c8274b9eh,0bfc31abeh		; _a[30] @ 1920
	.word	0c8cc8d0ch,03fc3bdc5h		; _a[31] @ 1984
	.word	0f2b239a4h,0bfc460cbh		; _a[32] @ 2048
	.word	01c97e63bh,03fc503d2h		; _a[33] @ 2112
	.word	0467d92d3h,0bfc5a6d8h		; _a[34] @ 2176
	.word	04722d440h,03fc649dfh		; _a[35] @ 2240
	.word	0710880d8h,0bfc6ece5h		; _a[36] @ 2304
	.word	09aee2d70h,03fc78febh		; _a[37] @ 2368
	.word	0c4d3da07h,0bfc832f1h		; _a[38] @ 2432
	.word	0c5791b75h,03fc8d5f8h		; _a[39] @ 2496
	.word	0ef5ec80ch,0bfc978feh		; _a[40] @ 2560
	.word	0194474a4h,03fca1c05h		; _a[41] @ 2624
	.word	0432a213ch,0bfcabf0bh		; _a[42] @ 2688
	.word	043cf62a9h,03fcb6212h		; _a[43] @ 2752
	.word	06db50f41h,0bfcc0518h		; _a[44] @ 2816
	.word	0979abbd9h,03fcca81eh		; _a[45] @ 2880
	.word	0c1806870h,0bfcd4b24h		; _a[46] @ 2944
	.word	0eb661508h,03fcdee2ah		; _a[47] @ 3008
	.word	0ec0b5675h,0bfce9131h		; _a[48] @ 3072
	.word	015f1030dh,03fcf3438h		; _a[49] @ 3136
	.word	03fd6afa5h,0bfcfd73eh		; _a[50] @ 3200
	.word	034de2e1eh,03fd03d22h		; _a[51] @ 3264
	.word	0b530ced5h,0bfd08ea5h		; _a[52] @ 3328
	.word	0ca23a521h,03fd0e028h		; _a[53] @ 3392
	.word	0df167b6dh,0bfd131abh		; _a[54] @ 3456
	.word	0f40951b8h,03fd1832eh		; _a[55] @ 3520
	.word	0745bf26fh,0bfd1d4b2h		; _a[56] @ 3584
	.word	0894ec8bbh,03fd22635h		; _a[57] @ 3648
	.word	09e419f07h,0bfd277b8h		; _a[58] @ 3712
	.word	0b3347553h,03fd2c93bh		; _a[59] @ 3776
	.word	033871609h,0bfd31abfh		; _a[60] @ 3840
	.word	04879ec55h,03fd36c42h		; _a[61] @ 3904
	.word	05d6cc2a1h,0bfd3bdc5h		; _a[62] @ 3968
	.word	0725f98edh,03fd40f48h		; _a[63] @ 4032
	.word	0f2b239a4h,0bfd460cbh		; _a[64] @ 4096
	.word	007a50fefh,03fd4b24fh		; _a[65] @ 4160
	.word	01c97e63bh,0bfd503d2h		; _a[66] @ 4224
	.word	0318abc87h,03fd55555h		; _a[67] @ 4288
	.word	0b1dd5d3eh,0bfd5a6d8h		; _a[68] @ 4352
	.word	0c6d0338ah,03fd5f85bh		; _a[69] @ 4416
	.word	0dbc309d5h,0bfd649deh		; _a[70] @ 4480
	.word	0f0b5e021h,03fd69b61h		; _a[71] @ 4544
	.word	0710880d8h,0bfd6ece5h		; _a[72] @ 4608
	.word	085fb5724h,03fd73e68h		; _a[73] @ 4672
	.word	09aee2d70h,0bfd78febh		; _a[74] @ 4736
	.word	0afe103bbh,03fd7e16eh		; _a[75] @ 4800
	.word	03033a472h,0bfd832f2h		; _a[76] @ 4864
	.word	045267abeh,03fd88475h		; _a[77] @ 4928
	.word	05a19510ah,0bfd8d5f8h		; _a[78] @ 4992
	.word	06f0c2756h,03fd9277bh		; _a[79] @ 5056
	.word	0ef5ec80ch,0bfd978feh		; _a[80] @ 5120
	.word	004519e58h,03fd9ca82h		; _a[81] @ 5184
	.word	0194474a4h,0bfda1c05h		; _a[82] @ 5248
	.word	02e374af0h,03fda6d88h		; _a[83] @ 5312
	.word	0ae89eba7h,0bfdabf0bh		; _a[84] @ 5376
	.word	0c37cc1f2h,03fdb108eh		; _a[85] @ 5440
	.word	0d86f983eh,0bfdb6211h		; _a[86] @ 5504
	.word	0ed626e8ah,03fdbb394h		; _a[87] @ 5568
	.word	06db50f41h,0bfdc0518h		; _a[88] @ 5632
	.word	082a7e58dh,03fdc569bh		; _a[89] @ 5696
	.word	0979abbd9h,0bfdca81eh		; _a[90] @ 5760
	.word	0ac8d9224h,03fdcf9a1h		; _a[91] @ 5824
	.word	0c1806870h,0bfdd4b24h		; _a[92] @ 5888
	.word	041d30927h,03fdd9ca8h		; _a[93] @ 5952
	.word	056c5df73h,0bfddee2bh		; _a[94] @ 6016
	.word	06bb8b5bfh,03fde3faeh		; _a[95] @ 6080
	.word	080ab8c0ah,0bfde9131h		; _a[96] @ 6144
	.word	000fe2cc1h,03fdee2b5h		; _a[97] @ 6208
	.word	015f1030dh,0bfdf3438h		; _a[98] @ 6272
	.word	02ae3d959h,03fdf85bbh		; _a[99] @ 6336
	.word	03fd6afa5h,0bfdfd73eh		; _a[100] @ 6400
	.word	0aa64c2f8h,03fe01460h		; _a[101] @ 6464
	.word	06a8e1354h,0bfe03d22h		; _a[102] @ 6528
	.word	0f5077e7ah,03fe065e3h		; _a[103] @ 6592
	.word	0b530ced5h,0bfe08ea5h		; _a[104] @ 6656
	.word	009fa54c5h,03fe0b767h		; _a[105] @ 6720
	.word	0ca23a521h,0bfe0e028h		; _a[106] @ 6784
	.word	0549d1047h,03fe108eah		; _a[107] @ 6848
	.word	014c660a2h,0bfe131ach		; _a[108] @ 6912
	.word	0698fe692h,03fe15a6dh		; _a[109] @ 6976
	.word	029b936eeh,0bfe1832fh		; _a[110] @ 7040
	.word	0b432a214h,03fe1abf0h		; _a[111] @ 7104
	.word	03eac0d3ah,0bfe1d4b2h		; _a[112] @ 7168
	.word	0c9257860h,03fe1fd73h		; _a[113] @ 7232
	.word	0894ec8bbh,0bfe22635h		; _a[114] @ 7296
	.word	013c833e1h,03fe24ef7h		; _a[115] @ 7360
	.word	09e419f07h,0bfe277b8h		; _a[116] @ 7424
	.word	028bb0a2dh,03fe2a07ah		; _a[117] @ 7488
	.word	0e8e45a88h,0bfe2c93bh		; _a[118] @ 7552
	.word	0735dc5aeh,03fe2f1fdh		; _a[119] @ 7616
	.word	0fdd730d4h,0bfe31abeh		; _a[120] @ 7680
	.word	088509bfah,03fe34380h		; _a[121] @ 7744
	.word	04879ec55h,0bfe36c42h		; _a[122] @ 7808
	.word	0d2f3577bh,03fe39503h		; _a[123] @ 7872
	.word	05d6cc2a1h,0bfe3bdc5h		; _a[124] @ 7936
	.word	0e7e62dc7h,03fe3e686h		; _a[125] @ 8000
	.word	0a80f7e22h,0bfe40f48h		; _a[126] @ 8064
	.word	03288e948h,03fe4380ah		; _a[127] @ 8128
	.word	0bd02546eh,0bfe460cbh		; _a[128] @ 8192
	.word	0477bbf94h,03fe4898dh		; _a[129] @ 8256
	.word	007a50fefh,0bfe4b24fh		; _a[130] @ 8320
	.word	0921e7b15h,03fe4db10h		; _a[131] @ 8384
	.word	01c97e63bh,0bfe503d2h		; _a[132] @ 8448
	.word	0a7115161h,03fe52c93h		; _a[133] @ 8512
	.word	0673aa1bch,0bfe55555h		; _a[134] @ 8576
	.word	0f1b40ce2h,03fe57e16h		; _a[135] @ 8640
	.word	07c2d7808h,0bfe5a6d8h		; _a[136] @ 8704
	.word	006a6e32eh,03fe5cf9ah		; _a[137] @ 8768
	.word	0c6d0338ah,0bfe5f85bh		; _a[138] @ 8832
	.word	051499eb0h,03fe6211dh		; _a[139] @ 8896
	.word	0dbc309d5h,0bfe649deh		; _a[140] @ 8960
	.word	0663c74fbh,03fe672a0h		; _a[141] @ 9024
	.word	02665c557h,0bfe69b62h		; _a[142] @ 9088
	.word	0b0df307dh,03fe6c423h		; _a[143] @ 9152
	.word	03b589ba3h,0bfe6ece5h		; _a[144] @ 9216
	.word	0c5d206c8h,03fe715a6h		; _a[145] @ 9280
	.word	085fb5724h,0bfe73e68h		; _a[146] @ 9344
	.word	01074c24ah,03fe7672ah		; _a[147] @ 9408
	.word	09aee2d70h,0bfe78febh		; _a[148] @ 9472
	.word	025679896h,03fe7b8adh		; _a[149] @ 9536
	.word	0afe103bbh,0bfe7e16eh		; _a[150] @ 9600
	.word	0700a5417h,03fe80a30h		; _a[151] @ 9664
	.word	0fa83bf3dh,0bfe832f1h		; _a[152] @ 9728
	.word	0baad0f98h,03fe85bb3h		; _a[153] @ 9792
	.word	00f769589h,0bfe88475h		; _a[154] @ 9856
	.word	0cf9fe5e4h,03fe8ad36h		; _a[155] @ 9920
	.word	05a19510ah,0bfe8d5f8h		; _a[156] @ 9984
	.word	01a42a165h,03fe8febah		; _a[157] @ 10048
	.word	06f0c2756h,0bfe9277bh		; _a[158] @ 10112
	.word	02f3577b1h,03fe9503dh		; _a[159] @ 10176
	.word	0b9aee2d7h,0bfe978feh		; _a[160] @ 10240
	.word	079d83332h,03fe9a1c0h		; _a[161] @ 10304
	.word	0cea1b923h,0bfe9ca81h		; _a[162] @ 10368
	.word	08ecb097eh,03fe9f343h		; _a[163] @ 10432
	.word	0194474a4h,0bfea1c05h		; _a[164] @ 10496
	.word	0a3bddfcah,03fea44c6h		; _a[165] @ 10560
	.word	02e374af0h,0bfea6d88h		; _a[166] @ 10624
	.word	0ee609b4bh,03fea9649h		; _a[167] @ 10688
	.word	078da0671h,0bfeabf0bh		; _a[168] @ 10752
	.word	003537197h,03feae7cdh		; _a[169] @ 10816
	.word	08dccdcbdh,0bfeb108eh		; _a[170] @ 10880
	.word	04df62d18h,03feb3950h		; _a[171] @ 10944
	.word	0d86f983eh,0bfeb6211h		; _a[172] @ 11008
	.word	062e90364h,03feb8ad3h		; _a[173] @ 11072
	.word	0ed626e8ah,0bfebb394h		; _a[174] @ 11136
	.word	0ad8bbee6h,03febdc56h		; _a[175] @ 11200
	.word	038052a0bh,0bfec0518h		; _a[176] @ 11264
	.word	0c27e9531h,03fec2dd9h		; _a[177] @ 11328
	.word	04cf80057h,0bfec569bh		; _a[178] @ 11392
	.word	00d2150b3h,03fec7f5dh		; _a[179] @ 11456
	.word	0979abbd9h,0bfeca81eh		; _a[180] @ 11520
	.word	0221426feh,03fecd0e0h		; _a[181] @ 11584
	.word	0ac8d9224h,0bfecf9a1h		; _a[182] @ 11648
	.word	06cb6e280h,03fed2263h		; _a[183] @ 11712
	.word	0f7304da6h,0bfed4b24h		; _a[184] @ 11776
	.word	081a9b8cch,03fed73e6h		; _a[185] @ 11840
	.word	00c2323f1h,0bfed9ca8h		; _a[186] @ 11904
	.word	0cc4c744dh,03fedc569h		; _a[187] @ 11968
	.word	056c5df73h,0bfedee2bh		; _a[188] @ 12032
	.word	0e13f4a99h,03fee16ech		; _a[189] @ 12096
	.word	06bb8b5bfh,0bfee3faeh		; _a[190] @ 12160
	.word	02be2061ah,03fee6870h		; _a[191] @ 12224
	.word	0b65b7140h,0bfee9131h		; _a[192] @ 12288
	.word	040d4dc66h,03feeb9f3h		; _a[193] @ 12352
	.word	0cb4e478ch,0bfeee2b4h		; _a[194] @ 12416
	.word	08b7797e7h,03fef0b76h		; _a[195] @ 12480
	.word	015f1030dh,0bfef3438h		; _a[196] @ 12544
	.word	0a06a6e33h,03fef5cf9h		; _a[197] @ 12608
	.word	02ae3d959h,0bfef85bbh		; _a[198] @ 12672
	.word	0eb0d29b4h,03fefae7ch		; _a[199] @ 12736
	.word	0758694dah,0bfefd73eh		; _a[200] @ 12800
$C$IR_1:	.set	1608

	.global	_a
_a:	.usect	".far",1608,8
;	C:\MATHLIB_Tools\CCSV5_5_0\ccsv5\tools\compiler\c6000_7.4.2\bin\opt6x.exe C:\\Users\\gtbldadm\\AppData\\Local\\Temp\\024004 C:\\Users\\gtbldadm\\AppData\\Local\\Temp\\024006 
	.sect	".text:optci"
	.clink

;******************************************************************************
;* FUNCTION NAME: logdp_atanhdp_i                                             *
;*                                                                            *
;*   Regs Modified     : A0,A1,A3,A4,A5,A6,A7,A8,A9,B0,B1,B4,B5,B6,B7,B8,B9,  *
;*                           A16,A17,A18,A19,B16,B17,B18,B19                  *
;*   Regs Used         : A0,A1,A3,A4,A5,A6,A7,A8,A9,B0,B1,B3,B4,B5,B6,B7,B8,  *
;*                           B9,A16,A17,A18,A19,B16,B17,B18,B19               *
;*   Local Frame Size  : 0 Args + 0 Auto + 0 Save = 0 byte                    *
;******************************************************************************
_logdp_atanhdp_i:
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 318
           CLR     .S1     A5,20,31,A3       ; |109| 
           EXTU    .S1     A5,1,21,A0        ; |104| 
           SET     .S1     A3,21,29,A5       ; |109| 

   [!A0]   ZERO    .L1     A5:A4             ; |112| 
||         ZERO    .L2     B5

           ZERO    .L2     B4                ; |120| 
           SET     .S2     B5,0x15,0x1d,B5
           SUBDP   .L2X    A5:A4,B5:B4,B17:B16 ; |120| 
           MV      .S2     B5,B7             ; |121| 
           ZERO    .L2     B6                ; |120| 
           NOP             4
           MPYDP   .M2     B5:B4,B17:B16,B9:B8 ; |121| 
           MPYDP   .M1X    B7:B6,A5:A4,A7:A6 ; |117| 
           NOP             3
           MVKL    .S2     0x667f3bcd,B6
           MVKL    .S2     0x3fe6a09e,B7
           MVKH    .S2     0x667f3bcd,B6
           MVKH    .S2     0x3fe6a09e,B7
           CMPGTDP .S2X    A5:A4,B7:B6,B0    ; |115| 
           ADDDP   .L2     B5:B4,B9:B8,B9:B8 ; |121| 

           MV      .S2     B5,B7             ; |121| 
||         MV      .D2     B4,B6             ; |121| 

   [ B0]   ADDDP   .L2X    B7:B6,A7:A6,B9:B8 ; |117| 
           ZERO    .L1     A7
           SET     .S1     A7,0x1e,0x1e,A7
           MV      .L1X    B4,A6             ; |66| 
           NOP             3
           RCPDP   .S2     B9:B8,B7:B6       ; |66| 
           NOP             1
           MPYDP   .M2     B9:B8,B7:B6,B19:B18 ; |66| 
           NOP             9
           NOP             1
           SUBDP   .L1X    A7:A6,B19:B18,A9:A8 ; |66| 
           NOP             6
           MPYDP   .M1X    B7:B6,A9:A8,A9:A8 ; |66| 
           NOP             9
           MPYDP   .M1X    B9:B8,A9:A8,A17:A16 ; |66| 
           NOP             9
           SUBDP   .L1     A7:A6,A17:A16,A17:A16 ; |66| 
           NOP             6
           MPYDP   .M1     A9:A8,A17:A16,A17:A16 ; |66| 
           NOP             9
           NOP             1
           MPYDP   .M2X    B9:B8,A17:A16,B7:B6 ; |66| 
           MV      .L1X    B5,A9             ; |121| 
           MV      .L1     A6,A8             ; |66| 
           SUBDP   .L1     A5:A4,A9:A8,A5:A4 ; |116| 
           MVKL    .S2     0x4030624a,B9
           MVKL    .S2     0x2016afed,B8
           MVKH    .S2     0x4030624a,B9
           MVKH    .S2     0x2016afed,B8
           NOP             2
           SUBDP   .L2X    A7:A6,B7:B6,B7:B6 ; |66| 
           ZERO    .L1     A6                ; |64| 
   [ B0]   SUBDP   .L2X    A5:A4,B5:B4,B17:B16 ; |116| 
           ZERO    .L1     A5:A4             ; |68| 
           NOP             3
           MPYDP   .M2X    A17:A16,B7:B6,B7:B6 ; |66| 
           NOP             9
           NOP             1
           MPYDP   .M2     B17:B16,B7:B6,B5:B4 ; |66| 
           CMPEQDP .S1X    B17:B16,A5:A4,A1  ; |68| 
           NOP             8
   [ A1]   ZERO    .L2     B5:B4             ; |69| 
           MPYDP   .M2     B5:B4,B5:B4,B17:B16 ; |126| 
           MVKL    .S2     0xc041d580,B7
           MVKL    .S2     0x4b67ce0f,B6
           MVKH    .S2     0xc041d580,B7
           MVKH    .S2     0x4b67ce0f,B6
           MVKL    .S1     0x40738083,A5
           MVKL    .S1     0xfa15267e,A4
           MVKH    .S1     0x40738083,A5
           MVKH    .S1     0xfa15267e,A4
           NOP             1
           ADDDP   .L2     B7:B6,B17:B16,B7:B6 ; |64| 
           NOP             6
           MPYDP   .M2     B17:B16,B7:B6,B7:B6 ; |64| 
           NOP             9
           NOP             1
           ADDDP   .L1X    A5:A4,B7:B6,A5:A4 ; |64| 
           MVKL    .S2     0xc0880bfe,B7
           MVKL    .S2     0x9c0d9077,B6
           MVKH    .S2     0xc0880bfe,B7
           MVKH    .S2     0x9c0d9077,B6
           NOP             2
           MPYDP   .M1X    B17:B16,A5:A4,A5:A4 ; |64| 
           NOP             9
           ADDDP   .L1X    B7:B6,A5:A4,A5:A4 ; |64| 
           MV      .L2X    A7,B7             ; |66| 
           ZERO    .L2     B6                ; |64| 
           NOP             4
           RCPDP   .S1     A5:A4,A9:A8       ; |64| 
           NOP             1
           MPYDP   .M1     A9:A8,A5:A4,A17:A16 ; |64| 
           NOP             9
           SUBDP   .L1X    B7:B6,A17:A16,A17:A16 ; |64| 
           NOP             6
           MPYDP   .M1     A9:A8,A17:A16,A19:A18 ; |64| 
           NOP             9
           MPYDP   .M1     A19:A18,A5:A4,A9:A8 ; |64| 
           MVKL    .S1     0xbfe94415,A17
           MVKL    .S1     0xb356bd29,A16
           MVKH    .S1     0xbfe94415,A17
           MVKH    .S1     0xb356bd29,A16
           NOP             5
           SUBDP   .L1     A7:A6,A9:A8,A9:A8 ; |64| 
           MPYDP   .M2X    A17:A16,B17:B16,B7:B6 ; |66| 
           ZERO    .L1     A6                ; |66| 
           NOP             4
           MPYDP   .M1     A19:A18,A9:A8,A9:A8 ; |64| 
           NOP             9
           MPYDP   .M1     A9:A8,A5:A4,A5:A4 ; |66| 
           ADDDP   .L2     B9:B8,B7:B6,B7:B6 ; |66| 
           NOP             8
           SUBDP   .L1     A7:A6,A5:A4,A5:A4 ; |66| 
           MPYDP   .M2     B17:B16,B7:B6,B7:B6 ; |66| 
           MVKL    .S1     0x12b3b59a,A6
           MVKH    .S1     0x12b3b59a,A6
           MVKL    .S1     0xc05007ff,A7
           MVKH    .S1     0xc05007ff,A7
           NOP             1
           MPYDP   .M1     A9:A8,A5:A4,A5:A4 ; |66| 
           NOP             3
           ADDDP   .S2X    A7:A6,B7:B6,B19:B18 ; |66| 
           ZERO    .L2     B7:B6             ; |68| 
           MVKL    .S1     0x3fe63000,A9
           MVKH    .S1     0x3fe63000,A9
           ZERO    .L1     A8                ; |134| 
           NOP             2
           MPYDP   .M2X    B19:B18,A5:A4,B9:B8 ; |66| 
           CMPEQDP .S2     B19:B18,B7:B6,B1  ; |68| 
           NOP             8
   [ B1]   ZERO    .L2     B9:B8             ; |69| 
           MPYDP   .M2     B17:B16,B9:B8,B9:B8 ; |134| 
           MVK     .S2     1022,B6           ; |104| 
           MVKL    .S2     0xbf2bd010,B7
           SUB     .L1X    A0,B6,A3          ; |104| 
   [!B0]   SUB     .L1     A3,1,A3           ; |122| 
           INTDP   .L1     A3,A7:A6          ; |134| 
           MVKH    .S2     0xbf2bd010,B7
           MVKL    .S2     0x5c610ca8,B6
           MVKH    .S2     0x5c610ca8,B6
           NOP             1
           MPYDP   .M2     B5:B4,B9:B8,B9:B8 ; |134| 
           MPYDP   .M1X    B7:B6,A7:A6,A5:A4 ; |134| 
           NOP             8
           ADDDP   .L2     B9:B8,B5:B4,B5:B4 ; |134| 
           MPYDP   .M1     A9:A8,A7:A6,A7:A6 ; |134| 
           NOP             6
           ADDDP   .L1X    B5:B4,A5:A4,A5:A4 ; |134| 
           NOP             6
           ADDDP   .L1     A7:A6,A5:A4,A5:A4 ; |134| 
           RETNOP  .S2     B3,5              ; |135| 
           ; BRANCH OCCURS {B3}              ; |135| 
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
;*   Local Frame Size  : 8 Args + 12 Auto + 56 Save = 76 byte                 *
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

           STW     .D2T2   B3,*SP--(32)      ; |124| 
||         CALLP   .S2     _driver_init,B3
||         MVKH    .S1     $C$SL1+0,A4

$C$RL0:    ; CALL OCCURS {_driver_init} {0}  ; |132| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 3

           MVK     .S2     0xc9,B4
||         MVKL    .S1     _a,A14

           MVKH    .S1     _a,A14
||         MVKL    .S2     _output,B10

           CALL    .S1     _atanh            ; |141| 
||         MV      .L1     A14,A10
||         MV      .D1X    B4,A11
||         MVKH    .S2     _output,B10
||         ZERO    .L2     B11

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L1:    
;          EXCLUSIVE CPU CYCLES: 5
           LDDW    .D1T1   *A10++,A5:A4      ; |141| 
           ADDKPC  .S2     $C$RL1,B3,3       ; |141| 
$C$RL1:    ; CALL OCCURS {_atanh} {0}        ; |141| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 7

           LDW     .D2T2   *B10,B4           ; |141| 
||         SUB     .L1     A11,1,A0          ; |140| 
||         SUB     .S1     A11,1,A11         ; |140| 

   [ A0]   BNOP    .S1     $C$L1,3           ; |140| 

           ADD     .L2     B11,B4,B5         ; |141| 
||         ADD     .D2     8,B11,B11         ; |140| 
|| [!A0]   MVK     .S2     0xc9,B4

   [ A0]   CALL    .S1     _atanh            ; |141| 
||         STDW    .D2T1   A5:A4,*B5         ; |141| 

           ; BRANCHCC OCCURS {$C$L1}         ; |140| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 1

           CALL    .S1     _atanhdp          ; |144| 
||         MV      .L1X    B4,A11
||         ZERO    .L2     B11
||         MV      .D1     A14,A10
||         ADD     .S2     4,B10,B12

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L2:    
;          EXCLUSIVE CPU CYCLES: 5
           LDDW    .D1T1   *A10++,A5:A4      ; |144| 
           ADDKPC  .S2     $C$RL2,B3,3       ; |144| 
$C$RL2:    ; CALL OCCURS {_atanhdp} {0}      ; |144| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 7

           LDW     .D2T2   *B12,B4           ; |144| 
||         SUB     .L1     A11,1,A0          ; |143| 
||         SUB     .S1     A11,1,A11         ; |143| 

   [ A0]   BNOP    .S1     $C$L2,3           ; |143| 

           ADD     .L2     B11,B4,B5         ; |144| 
||         ADD     .D2     8,B11,B11         ; |143| 
|| [!A0]   MVK     .S2     0xc9,B4

   [ A0]   CALL    .S1     _atanhdp          ; |144| 
||         STDW    .D2T1   A5:A4,*B5         ; |144| 

           ; BRANCHCC OCCURS {$C$L2}         ; |143| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 1

           CALL    .S1     _atanhdp_c        ; |147| 
||         MV      .L1X    B4,A11
||         ZERO    .L2     B11
||         MV      .D1     A14,A10
||         ADD     .S2     4,B12,B12

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L3:    
;          EXCLUSIVE CPU CYCLES: 5
           LDDW    .D1T1   *A10++,A5:A4      ; |147| 
           ADDKPC  .S2     $C$RL3,B3,3       ; |147| 
$C$RL3:    ; CALL OCCURS {_atanhdp_c} {0}    ; |147| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 7

           LDW     .D2T2   *B12,B4           ; |147| 
||         SUB     .L1     A11,1,A0          ; |146| 
||         SUB     .S1     A11,1,A11         ; |146| 

   [ A0]   B       .S2     $C$L3             ; |146| 
|| [!A0]   ZERO    .L1     A3
|| [!A0]   ZERO    .S1     A31
|| [!A0]   ZERO    .D1     A13
|| [!A0]   SUB     .L2X    A14,8,B23
|| [!A0]   ZERO    .D2     B22

   [!A0]   SET     .S1     A3,0x14,0x1e,A3
|| [!A0]   STW     .D2T1   A31,*+SP(12)
|| [!A0]   ZERO    .L1     A31
|| [!A0]   MVK     .S2     0xc9,B2
|| [!A0]   ZERO    .D1     A10               ; |199| 

   [!A0]   SET     .S1     A13,0x0,0x1e,A13
|| [!A0]   MVK     .L1     0xffffffff,A12

   [!A0]   STW     .D2T1   A3,*+SP(16)

           ADD     .L2     B11,B4,B5         ; |147| 
||         ADD     .S2     8,B11,B11         ; |146| 

   [ A0]   CALL    .S1     _atanhdp_c        ; |147| 
||         STDW    .D2T1   A5:A4,*B5         ; |147| 

           ; BRANCHCC OCCURS {$C$L3}         ; |146| 
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains control code
;*----------------------------------------------------------------------------*
$C$L4:    
;          EXCLUSIVE CPU CYCLES: 15

           ZERO    .L1     A5:A4             ; |174| 
||         LDDW    .D2T2   *++B23,B5:B4      ; |150| 

           MVKL    .S2     0x3fb99999,B7
           MVKL    .S2     0x9999999a,B6
           MVKH    .S2     0x3fb99999,B7
           MVKH    .S2     0x9999999a,B6

           CMPLTDP .S1X    B5:B4,A5:A4,A0    ; |174| 
||         ABSDP   .S2     B5:B4,B21:B20     ; |171| 

           NOP             1

   [!A0]   ZERO    .L1     A21
|| [ A0]   ZERO    .S1     A20               ; |174| 
||         CMPGTDP .S2     B21:B20,B7:B6,B0  ; |178| 

   [ A0]   ZERO    .L1     A21

   [ B0]   ZERO    .L2     B5
|| [!B0]   MPYDP   .M2     B5:B4,B5:B4,B7:B6 ; |187| 
|| [!B0]   B       .S1     $C$L5             ; |178| 
|| [ B0]   ZERO    .S2     B4                ; |66| 

   [ B0]   SET     .S2     B5,0x14,0x1d,B5
   [ B0]   SUBDP   .L2     B5:B4,B21:B20,B5:B4 ; |66| 
   [!A0]   ZERO    .L1     A20               ; |174| 
   [!A0]   SET     .S1     A21,0x14,0x1d,A21
   [ A0]   MVKH    .S1     0xbff00000,A21
           ; BRANCHCC OCCURS {$C$L5}         ; |178| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 101
           ZERO    .L1     A4                ; |66| 
           ZERO    .L1     A5
           SET     .S1     A5,0x1e,0x1e,A5
           RCPDP   .S2     B5:B4,B7:B6       ; |66| 
           ZERO    .L2     B31
           MPYDP   .M2     B7:B6,B5:B4,B9:B8 ; |66| 
           ZERO    .L1     A8                ; |66| 
           NOP             9
           SUBDP   .L1X    A5:A4,B9:B8,A5:A4 ; |66| 
           SET     .S2     B31,0x1e,0x1e,B9
           ZERO    .L2     B8                ; |66| 
           MV      .L1X    B9,A9             ; |66| 
           NOP             3
           MPYDP   .M1X    B7:B6,A5:A4,A5:A4 ; |66| 
           NOP             9
           NOP             1
           MPYDP   .M2X    A5:A4,B5:B4,B7:B6 ; |66| 
           NOP             9
           SUBDP   .L2     B9:B8,B7:B6,B7:B6 ; |66| 
           NOP             7
           MPYDP   .M1X    A5:A4,B7:B6,A5:A4 ; |66| 
           NOP             9
           MPYDP   .M1X    A5:A4,B5:B4,A7:A6 ; |66| 
           NOP             9
           SUBDP   .L1     A9:A8,A7:A6,A7:A6 ; |66| 
           ZERO    .L2     B5:B4             ; |68| 
           NOP             5
           MPYDP   .M1     A5:A4,A7:A6,A5:A4 ; |66| 
           NOP             2

           SET     .S1     A31,0x14,0x1d,A7
||         ZERO    .L1     A6                ; |66| 

           ADDDP   .L1X    A7:A6,B21:B20,A7:A6 ; |66| 
           NOP             6
           MPYDP   .M1     A7:A6,A5:A4,A5:A4 ; |66| 
           CMPEQDP .S2X    A7:A6,B5:B4,B0    ; |68| 
           NOP             3
           CALL    .S1     _logdp_atanhdp_i  ; |195| 
           ADDKPC  .S2     $C$RL4,B3,3       ; |195| 
   [ B0]   ZERO    .L1     A5:A4             ; |69| 
$C$RL4:    ; CALL OCCURS {_logdp_atanhdp_i} {0}  ; |195| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 8

           MVK     .S1     12,A3
||         ZERO    .L2     B5
||         ZERO    .S2     B4                ; |196| 
||         ZERO    .L1     A11

           ADD     .L1X    B10,A3,A3
||         SET     .S2     B5,0x15,0x1d,B5

           LDW     .D1T1   *A3,A3
||         B       .S1     $C$L6             ; |196| 

           MPYDP   .M1X    B5:B4,A5:A4,A5:A4 ; |196| 
           SET     .S1     A11,0x14,0x1d,A11
           SUB     .L2     B2,1,B2           ; |149| 

           MV      .L2X    A11,B5            ; |199| 
||         ZERO    .S2     B4                ; |199| 

           ADD     .L1X    B22,A3,A6
||         CMPEQDP .S2     B21:B20,B5:B4,B0  ; |203| 
||         ADD     .L2     8,B22,B22         ; |149| 

           ; BRANCH OCCURS {$C$L6}           ; |196| 
;** --------------------------------------------------------------------------*
$C$L5:    
;          EXCLUSIVE CPU CYCLES: 54
           MVKL    .S1     0x3fd55555,A5
           MVKL    .S1     0x6f13a03b,A4
           MVKH    .S1     0x3fd55555,A5
           MVKH    .S1     0x6f13a03b,A4
           MPYDP   .M2     B7:B6,B7:B6,B5:B4 ; |187| 
           MVKL    .S1     0x7f12091,A6
           MPYDP   .M1X    A5:A4,B7:B6,A5:A4 ; |187| 
           MVKL    .S1     0x3fc9992a,A7
           MVKH    .S1     0x7f12091,A6
           MVKH    .S1     0x3fc9992a,A7
           ADDAW   .D2     B10,3,B31
           LDW     .D2T1   *B31,A3
           SUB     .L2     B2,1,B2           ; |149| 
           ZERO    .L1     A11
           MPYDP   .M2     B7:B6,B5:B4,B7:B6 ; |187| 
           MPYDP   .M1X    A7:A6,B5:B4,A7:A6 ; |187| 
           SET     .S1     A11,0x14,0x1d,A11
           NOP             3
           MVKL    .S2     0xb81d48c0,B4
           MVKL    .S2     0x3fc2914f,B5
           MVKH    .S2     0xb81d48c0,B4
           MVKH    .S2     0x3fc2914f,B5
           MPYDP   .M2     B5:B4,B7:B6,B5:B4 ; |187| 
           ADDDP   .L1     A7:A6,A5:A4,A5:A4 ; |187| 
           ADD     .S1X    B22,A3,A6
           ADD     .L2     8,B22,B22         ; |149| 
           NOP             7
           ADDDP   .L1X    B5:B4,A5:A4,A5:A4 ; |187| 
           ZERO    .L2     B4                ; |199| 
           MV      .L2X    A11,B5            ; |199| 
           CMPEQDP .S2     B21:B20,B5:B4,B0  ; |203| 
           NOP             3
           MPYDP   .M1X    B21:B20,A5:A4,A5:A4 ; |187| 
           NOP             9
           ADDDP   .L1X    B21:B20,A5:A4,A5:A4 ; |187| 
           NOP             1
;** --------------------------------------------------------------------------*
$C$L6:    
;          EXCLUSIVE CPU CYCLES: 21
           CMPGTDP .S1X    B21:B20,A11:A10,A0 ; |199| 
           NOP             4

   [ A0]   MV      .L1     A13,A5            ; |200| 
|| [ B0]   LDW     .D2T1   *+SP(16),A5       ; |200| 

   [ A0]   MV      .L1     A12,A4            ; |200| 
   [ B0]   MV      .L1     A10,A4            ; |200| 
           NOP             2
           MPYDP   .M1     A21:A20,A5:A4,A5:A4 ; |150| 
           NOP             4
   [ B2]   BNOP    .S1     $C$L4,4           ; |149| 

   [!B2]   CALL    .S1     _atanhdp_v        ; |152| 
||         STDW    .D1T1   A5:A4,*A6         ; |150| 

           ; BRANCHCC OCCURS {$C$L4}         ; |149| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           LDW     .D2T2   *+B10(16),B4      ; |152| 
           MV      .L1     A14,A4            ; |152| 
           MVK     .S1     0xc9,A6           ; |152| 
           ADDKPC  .S2     $C$RL5,B3,1       ; |152| 
$C$RL5:    ; CALL OCCURS {_atanhdp_v} {0}    ; |152| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 40
           MVKL    .S2     0x3ddb7cdf,B7
           MVKL    .S2     0xd9d7bdbb,B6
           MVKH    .S2     0x3ddb7cdf,B7

           LDW     .D2T1   *B10,A4           ; |66| 
||         MVKH    .S2     0xd9d7bdbb,B6

           CALLP   .S2     _isequal,B3
||         LDW     .D2T2   *+B10(4),B4       ; |66| 
||         MVK     .S1     0xc9,A6           ; |66| 
||         MVK     .L1     0x9,A8            ; |66| 

$C$RL6:    ; CALL OCCURS {_isequal} {0}      ; |66| 
           MVKL    .S2     0x3ddb7cdf,B7

           MVKL    .S1     _fcn_pass,A14
||         MVKL    .S2     0xd9d7bdbb,B6

           MVKH    .S1     _fcn_pass,A14
||         MVKH    .S2     0x3ddb7cdf,B7

           STW     .D1T1   A4,*+A14(4)       ; |66| 
||         LDW     .D2T2   *+B10(8),B4       ; |67| 
||         MVKH    .S2     0xd9d7bdbb,B6

           CALLP   .S2     _isequal,B3
||         LDW     .D2T1   *B10,A4           ; |67| 
||         MVK     .S1     0xc9,A6           ; |67| 
||         MVK     .L1     0x9,A8            ; |67| 

$C$RL7:    ; CALL OCCURS {_isequal} {0}      ; |67| 
           MVKL    .S2     0x3ddb7cdf,B7
           MVKL    .S2     0xd9d7bdbb,B6
           MVKH    .S2     0x3ddb7cdf,B7

           MV      .L2     B10,B11
||         STW     .D1T1   A4,*+A14(8)       ; |67| 
||         LDW     .D2T2   *+B10(12),B4      ; |68| 
||         MVKH    .S2     0xd9d7bdbb,B6

           CALLP   .S2     _isequal,B3
||         LDW     .D2T1   *B11,A4           ; |68| 
||         MVK     .S1     0xc9,A6           ; |68| 
||         MVK     .L1     0x9,A8            ; |68| 

$C$RL8:    ; CALL OCCURS {_isequal} {0}      ; |68| 
           MVKL    .S2     0xd9d7bdbb,B6
           MVKL    .S2     0x3ddb7cdf,B7

           MVK     .S1     16,A15
||         MV      .L1X    B10,A3            ; |69| 
||         STW     .D1T1   A4,*+A14(12)      ; |68| 
||         MVKH    .S2     0xd9d7bdbb,B6

           ADD     .L1X    B11,A15,A15
||         LDW     .D1T1   *A3,A4            ; |69| 
||         MVKH    .S2     0x3ddb7cdf,B7

           CALLP   .S2     _isequal,B3
||         LDW     .D1T2   *A15,B4           ; |69| 
||         MVK     .S1     0xc9,A6           ; |69| 
||         MVK     .L1     0x9,A8            ; |69| 

$C$RL9:    ; CALL OCCURS {_isequal} {0}      ; |69| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 12
           ADD     .L2X    4,A14,B12
           LDW     .D2T2   *B12,B0           ; |72| 
           ADD     .L2X    8,A14,B11
           STW     .D1T1   A4,*+A14(16)      ; |69| 
           NOP             2

   [!B0]   MVKL    .S1     _all_pass,A3
|| [!B0]   B       .S2     $C$L7             ; |72| 
||         MV      .L2     B0,B1             ; guard predicate rewrite
|| [!B0]   MV      .D2X    A10,B4

   [!B0]   CALL    .S2     _print_test_results ; |158| 
|| [!B0]   MVKH    .S1     _all_pass,A3
|| [ B0]   LDW     .D2T2   *B11,B0           ; |72| 

   [ B1]   ADD     .L2     4,B11,B4
           NOP             3
           ; BRANCHCC OCCURS {$C$L7}         ; |72| 
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
           CALL    .S1     _print_test_results ; |158| 
           MVKL    .S1     _all_pass,A3
           MVKH    .S1     _all_pass,A3
           NOP             2
;** --------------------------------------------------------------------------*
$C$L7:    
;          EXCLUSIVE CPU CYCLES: 1

           MVK     .L1     0x1,A4            ; |158| 
||         STW     .D1T2   B4,*A3            ; |72| 
||         ADDKPC  .S2     $C$RL10,B3,0      ; |158| 

$C$RL10:   ; CALL OCCURS {_print_test_results} {0}  ; |158| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 12
           MVKL    .S1     _a_sc,A3
           MVKH    .S1     _a_sc,A3
           LDW     .D2T1   *+SP(16),A5       ; |171| 
           MV      .L2X    A3,B5             ; |165| 

           MV      .L2X    A12,B9            ; |167| 
||         STDW    .D2T1   A11:A10,*+B5(32)  ; |169| 

           MV      .L2X    A12,B8            ; |167| 
||         ZERO    .S2     B7
||         STDW    .D2T1   A13:A12,*+B5(48)  ; |171| 

           ZERO    .L1     A7
||         STDW    .D2T2   B9:B8,*+B5(56)    ; |172| 
||         MVKH    .S2     0xfff00000,B7
||         ZERO    .L2     B6                ; |168| 

           MVKH    .S1     0xbff00000,A7
||         ZERO    .L1     A6                ; |170| 
||         STDW    .D2T2   B7:B6,*+B5(24)    ; |168| 

           MV      .L1     A10,A4            ; |171| 
||         STDW    .D2T1   A7:A6,*+B5(40)    ; |170| 

           MVK     .S2     0x8,B4
||         STDW    .D2T1   A5:A4,*+B5(16)    ; |167| 
||         ZERO    .L2     B9:B8             ; |165| 

           ADD     .L1     1,A13,A5
||         STDW    .D2T2   B9:B8,*B5         ; |165| 

           STDW    .D2T1   A5:A4,*+B5(8)     ; |166| 
||         MV      .L1X    B4,A10            ; |170| 
||         SUB     .L2X    A3,8,B13
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
$C$L8:    
;          EXCLUSIVE CPU CYCLES: 7
           LDDW    .D2T2   *++B13,B5:B4      ; |175| 
           CALL    .S1     _atanh            ; |175| 
           ADDKPC  .S2     $C$RL11,B3,2      ; |175| 
           MV      .L1X    B4,A4             ; |175| 
           MV      .L1X    B5,A5             ; |175| 
$C$RL11:   ; CALL OCCURS {_atanh} {0}        ; |175| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 34
           MVKL    .S1     _output,A11
           MVKH    .S1     _output,A11
           LDW     .D1T2   *A11,B4           ; |175| 
           NOP             4
           ADD     .L2     B10,B4,B4         ; |175| 
           STDW    .D2T1   A5:A4,*B4         ; |175| 

           CALLP   .S2     _atanhdp,B3
||         LDDW    .D2T1   *B13,A5:A4        ; |176| 

$C$RL12:   ; CALL OCCURS {_atanhdp} {0}      ; |176| 
           LDW     .D1T1   *+A11(4),A3       ; |176| 
           NOP             4
           ADD     .L2X    B10,A3,B4         ; |176| 
           STDW    .D2T1   A5:A4,*B4         ; |176| 
           LDDW    .D2T2   *B13,B5:B4        ; |177| 
           NOP             4
           MV      .L1X    B4,A4             ; |177| 

           CALLP   .S2     _atanhdp_c,B3
||         MV      .L1X    B5,A5             ; |177| 

$C$RL13:   ; CALL OCCURS {_atanhdp_c} {0}    ; |177| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 26
           LDW     .D1T1   *+A11(8),A3       ; |177| 
           NOP             4
           ADD     .L2X    B10,A3,B4         ; |177| 
           STDW    .D2T1   A5:A4,*B4         ; |177| 
           LDDW    .D2T1   *B13,A5:A4        ; |178| 
           ZERO    .L2     B5:B4             ; |174| 
           NOP             3
           CMPLTDP .S2X    A5:A4,B5:B4,B0    ; |174| 
           ABSDP   .S1     A5:A4,A23:A22     ; |171| 

           MVKL    .S2     0x3fb99999,B5
|| [!B0]   ZERO    .L1     A21
|| [ B0]   ZERO    .D1     A20               ; |174| 

           MVKL    .S2     0x9999999a,B4
           MVKH    .S2     0x3fb99999,B5
           MVKH    .S2     0x9999999a,B4
           CMPGTDP .S2X    A23:A22,B5:B4,B1  ; |178| 
   [ B0]   ZERO    .L1     A21

   [!B1]   B       .S1     $C$L9             ; |178| 
|| [ B1]   ZERO    .L1     A5
|| [!B1]   MPYDP   .M1     A5:A4,A5:A4,A5:A4 ; |187| 
|| [ B1]   ZERO    .D1     A4                ; |66| 

   [ B1]   SET     .S1     A5,0x14,0x1d,A5
   [ B1]   SUBDP   .L1     A5:A4,A23:A22,A5:A4 ; |66| 
   [!B0]   ZERO    .S1     A20               ; |174| 
   [!B0]   SET     .S1     A21,0x14,0x1d,A21
   [ B0]   MVKH    .S1     0xbff00000,A21
           ; BRANCHCC OCCURS {$C$L9}         ; |178| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 104
           ZERO    .L2     B4                ; |66| 
           ZERO    .L2     B5
           SET     .S2     B5,0x1e,0x1e,B5
           RCPDP   .S1     A5:A4,A7:A6       ; |66| 
           ZERO    .L1     A31
           MPYDP   .M1     A7:A6,A5:A4,A9:A8 ; |66| 
           ZERO    .L2     B8                ; |66| 
           ZERO    .L2     B31
           NOP             8
           SUBDP   .L2X    B5:B4,A9:A8,B5:B4 ; |66| 
           SET     .S1     A31,0x1e,0x1e,A9
           ZERO    .L1     A8                ; |66| 
           MV      .L2X    A9,B9             ; |66| 
           NOP             3
           MPYDP   .M2X    A7:A6,B5:B4,B5:B4 ; |66| 
           NOP             9
           NOP             1
           MPYDP   .M1X    B5:B4,A5:A4,A7:A6 ; |66| 
           NOP             9
           SUBDP   .L1     A9:A8,A7:A6,A7:A6 ; |66| 
           NOP             7
           MPYDP   .M2X    B5:B4,A7:A6,B5:B4 ; |66| 
           NOP             9
           MPYDP   .M2X    B5:B4,A5:A4,B7:B6 ; |66| 
           NOP             9
           SUBDP   .L2     B9:B8,B7:B6,B7:B6 ; |66| 
           ZERO    .L1     A5:A4             ; |68| 
           NOP             5
           MPYDP   .M2     B5:B4,B7:B6,B5:B4 ; |66| 
           NOP             2

           MV      .L2     B8,B6             ; |66| 
||         SET     .S2     B31,0x14,0x1d,B7

           ADDDP   .L2X    B7:B6,A23:A22,B7:B6 ; |66| 
           NOP             6
           MPYDP   .M2     B7:B6,B5:B4,B5:B4 ; |66| 
           CMPEQDP .S1X    B7:B6,A5:A4,A0    ; |68| 
           NOP             6
           CALL    .S1     _logdp_atanhdp_i  ; |195| 
           ADDKPC  .S2     $C$RL14,B3,0      ; |195| 
   [ A0]   ZERO    .L2     B5:B4             ; |69| 
           NOP             1
           MV      .L1X    B4,A4             ; |195| 
           MV      .L1X    B5,A5             ; |195| 
$C$RL14:   ; CALL OCCURS {_logdp_atanhdp_i} {0}  ; |195| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 6

           B       .S1     $C$L10            ; |196| 
||         ZERO    .L1     A7
||         ZERO    .D1     A6                ; |196| 

           SET     .S1     A7,0x15,0x1d,A7
           MPYDP   .M1     A7:A6,A5:A4,A5:A4 ; |196| 
           NOP             3
           ; BRANCH OCCURS {$C$L10}          ; |196| 
;** --------------------------------------------------------------------------*
$C$L9:    
;          EXCLUSIVE CPU CYCLES: 52
           MVKL    .S2     0x6f13a03b,B4
           MVKL    .S2     0x3fd55555,B5
           MVKH    .S2     0x6f13a03b,B4
           MVKH    .S2     0x3fd55555,B5
           MPYDP   .M1     A5:A4,A5:A4,A7:A6 ; |187| 
           MVKL    .S2     0x3fc9992a,B7
           MPYDP   .M2X    B5:B4,A5:A4,B5:B4 ; |187| 
           MVKL    .S2     0x7f12091,B6
           MVKH    .S2     0x3fc9992a,B7
           MVKH    .S2     0x7f12091,B6
           NOP             4
           MPYDP   .M1     A5:A4,A7:A6,A5:A4 ; |187| 
           MPYDP   .M2X    B7:B6,A7:A6,B7:B6 ; |187| 
           NOP             4
           MVKL    .S1     0x3fc2914f,A7
           MVKL    .S1     0xb81d48c0,A6
           MVKH    .S1     0x3fc2914f,A7
           MVKH    .S1     0xb81d48c0,A6
           MPYDP   .M1     A7:A6,A5:A4,A5:A4 ; |187| 
           ADDDP   .L2     B7:B6,B5:B4,B5:B4 ; |187| 
           NOP             8
           ADDDP   .L1X    A5:A4,B5:B4,A5:A4 ; |187| 
           NOP             6
           MPYDP   .M1     A23:A22,A5:A4,A5:A4 ; |187| 
           NOP             9
           ADDDP   .L1     A23:A22,A5:A4,A5:A4 ; |187| 
;** --------------------------------------------------------------------------*
$C$L10:    
;          EXCLUSIVE CPU CYCLES: 22

           SUB     .S1     A10,1,A2          ; |174| 
||         ZERO    .L2     B5
||         ZERO    .D1     A6                ; |199| 
||         ZERO    .S2     B4                ; |199| 

           SET     .S2     B5,0x14,0x1d,B5
           CMPGTDP .S2X    A23:A22,B5:B4,B0  ; |199| 
           MV      .L1X    B5,A7             ; |199| 
           CMPEQDP .S1     A23:A22,A7:A6,A0  ; |203| 
           MVK     .S2     12,B31

   [ B0]   MV      .L1     A13,A5            ; |200| 
|| [ A0]   LDW     .D2T1   *+SP(16),A5       ; |200| 

           ADD     .L2X    A11,B31,B4
           LDW     .D2T2   *B4,B4            ; |178| 
   [ B0]   MV      .L1     A12,A4            ; |200| 
   [ A0]   MV      .L1     A6,A4             ; |200| 
           MPYDP   .M1     A21:A20,A5:A4,A5:A4 ; |178| 
           SUB     .L1     A10,1,A10         ; |174| 
           ADD     .L2     B10,B4,B5         ; |178| 
           ADD     .L2     8,B10,B10         ; |174| 
   [!A2]   MV      .L2X    A11,B10
   [ A2]   BNOP    .S1     $C$L8,4           ; |174| 

   [!A2]   CALL    .S1     _atanhdp_v        ; |180| 
||         STDW    .D2T1   A5:A4,*B5         ; |178| 

           ; BRANCHCC OCCURS {$C$L8}         ; |174| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           LDW     .D2T2   *+B10(16),B4      ; |180| 
           MVKL    .S1     _a_sc,A4
           MVKH    .S1     _a_sc,A4
           MVK     .L1     0x8,A6            ; |180| 
           ADDKPC  .S2     $C$RL15,B3,0      ; |180| 
$C$RL15:   ; CALL OCCURS {_atanhdp_v} {0}    ; |180| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 40
           MVKL    .S2     0x3ddb7cdf,B7
           MVKL    .S2     0xd9d7bdbb,B6
           MVKH    .S2     0x3ddb7cdf,B7

           LDW     .D2T1   *B10,A4           ; |66| 
||         MVKH    .S2     0xd9d7bdbb,B6

           CALLP   .S2     _isequal,B3
||         LDW     .D2T2   *+B10(4),B4       ; |66| 
||         MVK     .L1     0x8,A6            ; |66| 
||         MVK     .S1     0x9,A8            ; |66| 

$C$RL16:   ; CALL OCCURS {_isequal} {0}      ; |66| 
           MVKL    .S2     0x3ddb7cdf,B7
           MVKL    .S2     0xd9d7bdbb,B6

           MV      .L1     A14,A11           ; |66| 
||         MVKH    .S2     0x3ddb7cdf,B7

           STW     .D1T1   A4,*+A11(4)       ; |66| 
||         LDW     .D2T2   *+B10(8),B4       ; |67| 
||         MVKH    .S2     0xd9d7bdbb,B6

           CALLP   .S2     _isequal,B3
||         LDW     .D2T1   *B10,A4           ; |67| 
||         MVK     .L1     0x8,A6            ; |67| 
||         MVK     .S1     0x9,A8            ; |67| 

$C$RL17:   ; CALL OCCURS {_isequal} {0}      ; |67| 
           MVKL    .S2     0x3ddb7cdf,B7
           MVKL    .S2     0xd9d7bdbb,B6
           MVKH    .S2     0x3ddb7cdf,B7

           MV      .L2     B10,B5            ; |67| 
||         STW     .D1T1   A4,*+A11(8)       ; |67| 
||         LDW     .D2T2   *+B10(12),B4      ; |68| 
||         MVKH    .S2     0xd9d7bdbb,B6

           CALLP   .S2     _isequal,B3
||         LDW     .D2T1   *B5,A4            ; |68| 
||         MVK     .L1     0x8,A6            ; |68| 
||         MVK     .S1     0x9,A8            ; |68| 

$C$RL18:   ; CALL OCCURS {_isequal} {0}      ; |68| 
           MVKL    .S2     0x3ddb7cdf,B7
           MVKL    .S2     0xd9d7bdbb,B6

           STW     .D1T1   A4,*+A11(12)      ; |68| 
||         MVKH    .S2     0x3ddb7cdf,B7

           MV      .L1X    B10,A3            ; |69| 
||         LDW     .D1T2   *A15,B4           ; |69| 
||         MVKH    .S2     0xd9d7bdbb,B6

           CALLP   .S2     _isequal,B3
||         LDW     .D1T1   *A3,A4            ; |69| 
||         MVK     .L1     0x8,A6            ; |69| 
||         MVK     .S1     0x9,A8            ; |69| 

$C$RL19:   ; CALL OCCURS {_isequal} {0}      ; |69| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 11
           LDW     .D2T2   *B12,B0           ; |72| 
           STW     .D1T1   A4,*+A11(16)      ; |69| 
           NOP             3

   [!B0]   MVKL    .S1     _all_pass,A3
|| [!B0]   B       .S2     $C$L11            ; |72| 
|| [!B0]   ZERO    .L1     A4                ; |72| 
||         MV      .L2     B0,B1             ; guard predicate rewrite

   [!B0]   CALL    .S2     _print_test_results ; |184| 
|| [!B0]   MVKH    .S1     _all_pass,A3
|| [ B0]   LDW     .D2T2   *B11,B0           ; |72| 

   [ B1]   ADD     .L2     4,B11,B4
           NOP             3
           ; BRANCHCC OCCURS {$C$L11}        ; |72| 
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
           CALL    .S1     _print_test_results ; |184| 
           MVKL    .S1     _all_pass,A3
           MVKH    .S1     _all_pass,A3
           NOP             2
;** --------------------------------------------------------------------------*
$C$L11:    
;          EXCLUSIVE CPU CYCLES: 1

           STW     .D1T1   A4,*A3            ; |72| 
||         MVK     .L1     0x3,A4            ; |184| 
||         ADDKPC  .S2     $C$RL20,B3,0      ; |184| 

$C$RL20:   ; CALL OCCURS {_print_test_results} {0}  ; |184| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 6
           MVKL    .S2     _a_ext,B13

           MVKH    .S2     _a_ext,B13
||         ZERO    .L1     A5
||         MVK     .S1     0x6d6,A3

           STW     .D2T1   A3,*+SP(20)       ; |187| 
||         SET     .S1     A5,0x14,0x14,A5
||         ZERO    .L1     A4                ; |187| 

           CALL    .S1     _atanh            ; |189| 
||         STDW    .D2T1   A5:A4,*B13        ; |187| 
||         MV      .L1X    B13,A10           ; |187| 

           LDDW    .D1T1   *A10,A5:A4        ; |189| 
           ZERO    .L2     B10               ; |187| 
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
;          EXCLUSIVE CPU CYCLES: 3
           ADDKPC  .S2     $C$RL21,B3,2      ; |189| 
$C$RL21:   ; CALL OCCURS {_atanh} {0}        ; |189| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 28
           MVKL    .S1     _output,A14
           MVKH    .S1     _output,A14
           LDW     .D1T1   *A14,A3           ; |189| 
           NOP             4
           ADD     .L1X    B10,A3,A3         ; |189| 
           STDW    .D1T1   A5:A4,*A3         ; |189| 

           CALLP   .S2     _atanhdp,B3
||         LDDW    .D1T1   *A10,A5:A4        ; |190| 

$C$RL22:   ; CALL OCCURS {_atanhdp} {0}      ; |190| 
           LDW     .D1T1   *+A14(4),A3       ; |190| 
           NOP             4
           ADD     .L1X    B10,A3,A3         ; |190| 
           STDW    .D1T1   A5:A4,*A3         ; |190| 

           CALLP   .S2     _atanhdp_c,B3
||         LDDW    .D1T1   *A10,A5:A4        ; |191| 

$C$RL23:   ; CALL OCCURS {_atanhdp_c} {0}    ; |191| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 23
           LDW     .D1T1   *+A14(8),A3       ; |191| 
           ZERO    .L2     B7:B6             ; |174| 
           MVKL    .S2     0x3fb99999,B5
           MVKH    .S2     0x3fb99999,B5
           NOP             1
           ADD     .L2X    B10,A3,B4         ; |191| 
           STDW    .D2T1   A5:A4,*B4         ; |191| 
           LDDW    .D1T1   *A10,A5:A4        ; |192| 
           MVKL    .S2     0x9999999a,B4
           MVKH    .S2     0x9999999a,B4
           NOP             2

           ABSDP   .S1     A5:A4,A21:A20     ; |171| 
||         CMPLTDP .S2X    A5:A4,B7:B6,B0    ; |174| 

           NOP             1

   [!B0]   ZERO    .L2     B21
|| [ B0]   ZERO    .S2     B20               ; |174| 

           CMPGTDP .S2X    A21:A20,B5:B4,B1  ; |178| 
   [ B0]   ZERO    .L2     B21

   [!B1]   B       .S1     $C$L13            ; |178| 
|| [ B1]   ZERO    .L1     A5
|| [ B1]   ZERO    .D1     A4                ; |66| 

   [ B1]   SET     .S1     A5,0x14,0x1d,A5

           SUBDP   .L1     A5:A4,A21:A20,A7:A6 ; |66| 
|| [!B1]   MPYDP   .M1     A5:A4,A5:A4,A5:A4 ; |187| 

   [!B0]   ZERO    .L2     B20               ; |174| 
   [!B0]   SET     .S2     B21,0x14,0x1d,B21
   [ B0]   MVKH    .S2     0xbff00000,B21
           ; BRANCHCC OCCURS {$C$L13}        ; |178| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 103
           ZERO    .L2     B4                ; |66| 
           ZERO    .L2     B5
           SET     .S2     B5,0x1e,0x1e,B5
           RCPDP   .S1     A7:A6,A5:A4       ; |66| 
           ZERO    .L1     A31
           MPYDP   .M1     A5:A4,A7:A6,A9:A8 ; |66| 
           ZERO    .L2     B6                ; |66| 
           ZERO    .L2     B31
           NOP             8
           SUBDP   .L2X    B5:B4,A9:A8,B5:B4 ; |66| 
           SET     .S1     A31,0x1e,0x1e,A9
           ZERO    .L1     A8                ; |66| 
           MV      .L2X    A9,B7             ; |66| 
           NOP             3
           MPYDP   .M2X    A5:A4,B5:B4,B5:B4 ; |66| 
           NOP             9
           NOP             1
           MPYDP   .M1X    B5:B4,A7:A6,A5:A4 ; |66| 
           NOP             9
           SUBDP   .L1     A9:A8,A5:A4,A5:A4 ; |66| 
           NOP             7
           MPYDP   .M2X    B5:B4,A5:A4,B9:B8 ; |66| 
           NOP             9
           MPYDP   .M2X    B9:B8,A7:A6,B5:B4 ; |66| 
           ZERO    .L1     A5:A4             ; |68| 
           NOP             8
           SUBDP   .L2     B7:B6,B5:B4,B5:B4 ; |66| 
           ZERO    .S2     B6                ; |66| 
           SET     .S2     B31,0x14,0x1d,B7
           ADDDP   .L2X    B7:B6,A21:A20,B7:B6 ; |66| 
           NOP             3
           MPYDP   .M2     B9:B8,B5:B4,B5:B4 ; |66| 
           NOP             9
           MPYDP   .M2     B7:B6,B5:B4,B5:B4 ; |66| 
           CMPEQDP .S1X    B7:B6,A5:A4,A0    ; |68| 
           NOP             6
           CALL    .S1     _logdp_atanhdp_i  ; |195| 
           ADDKPC  .S2     $C$RL24,B3,0      ; |195| 
   [ A0]   ZERO    .L2     B5:B4             ; |69| 
           NOP             1
           MV      .L1X    B4,A4             ; |195| 
           MV      .L1X    B5,A5             ; |195| 
$C$RL24:   ; CALL OCCURS {_logdp_atanhdp_i} {0}  ; |195| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 6

           B       .S1     $C$L14            ; |196| 
||         ZERO    .L2     B5
||         ZERO    .S2     B4                ; |196| 

           SET     .S2     B5,0x15,0x1d,B5
           MPYDP   .M2X    B5:B4,A5:A4,B5:B4 ; |196| 
           NOP             3
           ; BRANCH OCCURS {$C$L14}          ; |196| 
;** --------------------------------------------------------------------------*
$C$L13:    
;          EXCLUSIVE CPU CYCLES: 55
           MVKL    .S2     0x3fd55555,B5
           MVKL    .S2     0x6f13a03b,B4
           MVKH    .S2     0x3fd55555,B5
           MVKH    .S2     0x6f13a03b,B4
           MVKL    .S2     0x3fc9992a,B7
           MVKL    .S2     0x7f12091,B6
           MPYDP   .M1     A5:A4,A5:A4,A7:A6 ; |187| 
           MPYDP   .M2X    B5:B4,A5:A4,B9:B8 ; |187| 
           MVKH    .S2     0x3fc9992a,B7
           MVKH    .S2     0x7f12091,B6
           NOP             6
           MPYDP   .M1     A5:A4,A7:A6,A5:A4 ; |187| 
           MPYDP   .M2X    B7:B6,A7:A6,B5:B4 ; |187| 
           NOP             4
           MVKL    .S1     0x3fc2914f,A7
           MVKL    .S1     0xb81d48c0,A6
           MVKH    .S1     0x3fc2914f,A7
           MVKH    .S1     0xb81d48c0,A6
           MPYDP   .M1     A7:A6,A5:A4,A5:A4 ; |187| 
           ADDDP   .L2     B5:B4,B9:B8,B5:B4 ; |187| 
           NOP             9
           ADDDP   .L2X    A5:A4,B5:B4,B5:B4 ; |187| 
           NOP             6
           MPYDP   .M2X    A21:A20,B5:B4,B5:B4 ; |187| 
           NOP             9
           ADDDP   .L2X    A21:A20,B5:B4,B5:B4 ; |187| 
;** --------------------------------------------------------------------------*
$C$L14:    
;          EXCLUSIVE CPU CYCLES: 40

           ZERO    .S2     B7
||         ZERO    .L1     A4                ; |199| 
||         ZERO    .D2     B6                ; |199| 

           SET     .S2     B7,0x14,0x1d,B7
           CMPGTDP .S2X    A21:A20,B7:B6,B0  ; |199| 
           MV      .L1X    B7,A5             ; |199| 
           CMPEQDP .S1     A21:A20,A5:A4,A0  ; |203| 
           MVK     .S2     12,B31

   [ B0]   MV      .L2X    A13,B5            ; |200| 
|| [ A0]   LDW     .D2T2   *+SP(16),B5       ; |200| 

   [ B0]   MV      .L2X    A12,B4            ; |200| 
   [ A0]   MV      .L2     B6,B4             ; |200| 
           ADD     .L2X    A14,B31,B6
           LDW     .D2T2   *B6,B6            ; |192| 
           MPYDP   .M2     B21:B20,B5:B4,B5:B4 ; |192| 
           ZERO    .L1     A6                ; |193| 
           ZERO    .L1     A7
           LDW     .D2T1   *+SP(20),A3
           ADD     .L2     B10,B6,B6         ; |192| 
           MVKH    .S1     0xbff80000,A7
           ADD     .L2     8,B10,B10         ; |188| 
           NOP             3
           STDW    .D2T2   B5:B4,*B6         ; |192| 
           LDDW    .D1T1   *A10,A5:A4        ; |193| 
           SUB     .L1     A3,1,A2           ; |188| 
   [!A2]   MV      .L2X    A14,B10
           NOP             2
           MPYDP   .M1     A7:A6,A5:A4,A5:A4 ; |193| 
           NOP             6
   [ A2]   BNOP    .S1     $C$L12,2          ; |188| 

   [ A2]   CALL    .S1     _atanh            ; |189| 
||         STDW    .D1T1   A5:A4,*++A10      ; |193| 

   [ A2]   LDDW    .D1T1   *A10,A5:A4        ; |189| 

   [!A2]   CALL    .S1     _atanhdp_v        ; |195| 
||         STW     .D2T1   A2,*+SP(20)       ; |193| 

           ; BRANCHCC OCCURS {$C$L12}        ; |188| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           LDW     .D2T2   *+B10(16),B4      ; |195| 
           MV      .L1X    B13,A4
           MVK     .S1     0x6d6,A6          ; |195| 
           ADDKPC  .S2     $C$RL25,B3,1      ; |195| 
$C$RL25:   ; CALL OCCURS {_atanhdp_v} {0}    ; |195| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 40
           MVKL    .S2     0x3ddb7cdf,B7
           MVKL    .S2     0xd9d7bdbb,B6
           MVKH    .S2     0x3ddb7cdf,B7

           LDW     .D2T1   *B10,A4           ; |66| 
||         MVKH    .S2     0xd9d7bdbb,B6

           CALLP   .S2     _isequal,B3
||         LDW     .D2T2   *+B10(4),B4       ; |66| 
||         MVK     .S1     0x6d6,A6          ; |66| 
||         MVK     .L1     0x9,A8            ; |66| 

$C$RL26:   ; CALL OCCURS {_isequal} {0}      ; |66| 
           MVKL    .S2     0x3ddb7cdf,B7
           MVKL    .S2     0xd9d7bdbb,B6

           MV      .L1     A11,A3            ; |66| 
||         MVKH    .S2     0x3ddb7cdf,B7

           STW     .D1T1   A4,*+A3(4)        ; |66| 
||         LDW     .D2T2   *+B10(8),B4       ; |67| 
||         MVKH    .S2     0xd9d7bdbb,B6

           CALLP   .S2     _isequal,B3
||         LDW     .D2T1   *B10,A4           ; |67| 
||         MVK     .S1     0x6d6,A6          ; |67| 
||         MVK     .L1     0x9,A8            ; |67| 

$C$RL27:   ; CALL OCCURS {_isequal} {0}      ; |67| 
           MVKL    .S2     0x3ddb7cdf,B7
           MVKL    .S2     0xd9d7bdbb,B6

           MV      .L1     A11,A3            ; |195| 
||         MVKH    .S2     0x3ddb7cdf,B7

           MV      .L2X    A14,B5            ; |67| 
||         STW     .D1T1   A4,*+A3(8)        ; |67| 
||         LDW     .D2T2   *+B10(12),B4      ; |68| 
||         MVKH    .S2     0xd9d7bdbb,B6

           CALLP   .S2     _isequal,B3
||         LDW     .D2T1   *B5,A4            ; |68| 
||         MVK     .S1     0x6d6,A6          ; |68| 
||         MVK     .L1     0x9,A8            ; |68| 

$C$RL28:   ; CALL OCCURS {_isequal} {0}      ; |68| 
           MVKL    .S2     0x3ddb7cdf,B7
           MVKL    .S2     0xd9d7bdbb,B6

           MV      .L1     A11,A5            ; |69| 
||         LDW     .D1T2   *A15,B4           ; |69| 
||         MVKH    .S2     0x3ddb7cdf,B7

           MV      .L1     A14,A3            ; |68| 
||         STW     .D1T1   A4,*+A5(12)       ; |68| 
||         MVKH    .S2     0xd9d7bdbb,B6

           CALLP   .S2     _isequal,B3
||         LDW     .D1T1   *A3,A4            ; |69| 
||         MVK     .S1     0x6d6,A6          ; |69| 
||         MVK     .L1     0x9,A8            ; |69| 

$C$RL29:   ; CALL OCCURS {_isequal} {0}      ; |69| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 11
           LDW     .D2T2   *B12,B0           ; |72| 
           MV      .L1     A11,A3            ; |72| 
           STW     .D1T1   A4,*+A3(16)       ; |69| 
           NOP             2

   [!B0]   B       .S2     $C$L15            ; |72| 
|| [!B0]   MVKL    .S1     _all_pass,A3
|| [!B0]   ZERO    .L1     A4                ; |72| 
||         MV      .L2     B0,B1             ; guard predicate rewrite

   [!B0]   CALL    .S2     _print_test_results ; |199| 
|| [!B0]   MVKH    .S1     _all_pass,A3
|| [ B0]   LDW     .D2T2   *B11,B0           ; |72| 

   [ B1]   ADD     .L2     4,B11,B4
           NOP             3
           ; BRANCHCC OCCURS {$C$L15}        ; |72| 
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
           CALL    .S1     _print_test_results ; |199| 
           MVKL    .S1     _all_pass,A3
           MVKH    .S1     _all_pass,A3
           NOP             2
;** --------------------------------------------------------------------------*
$C$L15:    
;          EXCLUSIVE CPU CYCLES: 1

           STW     .D1T1   A4,*A3            ; |72| 
||         MVK     .L1     0x4,A4            ; |199| 
||         ADDKPC  .S2     $C$RL30,B3,0      ; |199| 

$C$RL30:   ; CALL OCCURS {_print_test_results} {0}  ; |199| 
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

           MVKL    .S1     _t_offset,A3
||         SUBU    .L2     B6,B4,B9:B8       ; |117| 

           CALL    .S1     _gimme_random     ; |209| 
||         EXT     .S2     B9,24,24,B6       ; |117| 
||         SUB     .L2     B7,B5,B5          ; |117| 

           ADD     .L2     B5,B6,B5          ; |117| 
||         MV      .S2     B8,B4             ; |117| 
||         MVKH    .S1     _t_offset,A3

           MVK     .S2     0x80,B4
||         STDW    .D1T2   B5:B4,*A3         ; |117| 

           ZERO    .L2     B5
||         MV      .S2X    A11,B10
||         ZERO    .L1     A5

           MV      .L2X    A11,B4            ; |209| 
||         MV      .L1X    B4,A14            ; |117| 
||         MVKH    .S2     0xbfe00000,B5
||         SET     .S1     A5,0x14,0x1d,A5
||         MV      .D1     A10,A4            ; |209| 

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains control code
;*----------------------------------------------------------------------------*
$C$L16:    
;          EXCLUSIVE CPU CYCLES: 1
           ADDKPC  .S2     $C$RL31,B3,0      ; |209| 
$C$RL31:   ; CALL OCCURS {_gimme_random} {0}  ; |209| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 25
           MVKL    .S1     _input,A3
           MVKH    .S1     _input,A3
           LDW     .D1T1   *A3,A3            ; |209| 
           NOP             4
           ADD     .L2X    B10,A3,B4         ; |209| 

           STDW    .D2T1   A5:A4,*B4         ; |209| 
||         MVC     .S2     TSCL,B4           ; |122| 

           NOP             1

           MV      .L1X    B4,A20            ; |122| Define a twin register
||         MVC     .S2     TSCH,B6           ; |122| 

           MV      .L2X    A4,B4             ; |213| 
||         MVKL    .S2     0x3fb99999,B9
||         ZERO    .L1     A7:A6             ; |174| 

           MV      .L2X    A5,B5             ; |213| 
||         MVKL    .S2     0x9999999a,B8
||         MV      .L1X    B6,A21            ; |122| 

           ABSDP   .S2     B5:B4,B21:B20     ; |171| 
           CMPLTDP .S1X    B5:B4,A7:A6,A0    ; |174| 
           MVKH    .S2     0x3fb99999,B9

   [!A0]   ZERO    .L1     A23
|| [ A0]   ZERO    .S1     A22               ; |174| 
||         MVKH    .S2     0x9999999a,B8

           CMPGTDP .S2     B21:B20,B9:B8,B0  ; |178| 
   [ A0]   ZERO    .L1     A23

   [!B0]   B       .S1     $C$L17            ; |178| 
|| [!B0]   MPYDP   .M2     B5:B4,B5:B4,B5:B4 ; |187| 
|| [ B0]   ZERO    .L2     B5
|| [ B0]   ZERO    .S2     B4                ; |66| 

   [ B0]   SET     .S2     B5,0x14,0x1d,B5
   [ B0]   SUBDP   .L2     B5:B4,B21:B20,B5:B4 ; |66| 
   [!A0]   ZERO    .L1     A22               ; |174| 
   [!A0]   SET     .S1     A23,0x14,0x1d,A23
   [ A0]   MVKH    .S1     0xbff00000,A23
           ; BRANCHCC OCCURS {$C$L17}        ; |178| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 101
           ZERO    .L1     A4                ; |66| 
           ZERO    .L1     A5
           SET     .S1     A5,0x1e,0x1e,A5
           RCPDP   .S2     B5:B4,B7:B6       ; |66| 
           ZERO    .L2     B31
           MPYDP   .M2     B7:B6,B5:B4,B9:B8 ; |66| 
           ZERO    .L1     A8                ; |66| 
           ZERO    .L1     A31
           NOP             8
           SUBDP   .L1X    A5:A4,B9:B8,A5:A4 ; |66| 
           SET     .S2     B31,0x1e,0x1e,B9
           ZERO    .L2     B8                ; |66| 
           MV      .L1X    B9,A9             ; |66| 
           NOP             3
           MPYDP   .M1X    B7:B6,A5:A4,A5:A4 ; |66| 
           NOP             9
           NOP             1
           MPYDP   .M2X    A5:A4,B5:B4,B7:B6 ; |66| 
           NOP             9
           SUBDP   .L2     B9:B8,B7:B6,B7:B6 ; |66| 
           NOP             7
           MPYDP   .M1X    A5:A4,B7:B6,A5:A4 ; |66| 
           NOP             9
           MPYDP   .M1X    A5:A4,B5:B4,A7:A6 ; |66| 
           NOP             9
           SUBDP   .L1     A9:A8,A7:A6,A7:A6 ; |66| 
           ZERO    .L2     B5:B4             ; |68| 
           NOP             5
           MPYDP   .M1     A5:A4,A7:A6,A5:A4 ; |66| 
           NOP             2

           SET     .S1     A31,0x14,0x1d,A7
||         ZERO    .L1     A6                ; |66| 

           ADDDP   .L1X    A7:A6,B21:B20,A7:A6 ; |66| 
           NOP             6
           MPYDP   .M1     A7:A6,A5:A4,A5:A4 ; |66| 
           CMPEQDP .S2X    A7:A6,B5:B4,B0    ; |68| 
           NOP             3
           CALL    .S1     _logdp_atanhdp_i  ; |195| 
           ADDKPC  .S2     $C$RL32,B3,3      ; |195| 
   [ B0]   ZERO    .L1     A5:A4             ; |69| 
$C$RL32:   ; CALL OCCURS {_logdp_atanhdp_i} {0}  ; |195| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 6

           B       .S1     $C$L18            ; |196| 
||         ZERO    .L2     B5
||         ZERO    .D2     B4                ; |196| 
||         MVKL    .S2     _output+12,B31
||         ZERO    .L1     A7
||         MV      .D1     A11,A6

           SET     .S2     B5,0x15,0x1d,B5
||         SET     .S1     A7,0x14,0x1d,A7

           MVKL    .S1     _t_start,A3
||         MVKH    .S2     _output+12,B31

           MPYDP   .M1X    B5:B4,A5:A4,A5:A4 ; |196| 
           MVKH    .S1     _t_start,A3
           STDW    .D1T1   A21:A20,*A3
           ; BRANCH OCCURS {$C$L18}          ; |196| 
;** --------------------------------------------------------------------------*
$C$L17:    
;          EXCLUSIVE CPU CYCLES: 53
           MVKL    .S1     0x3fd55555,A5
           MVKL    .S1     0x6f13a03b,A4
           MVKH    .S1     0x3fd55555,A5
           MVKH    .S1     0x6f13a03b,A4
           MPYDP   .M2     B5:B4,B5:B4,B7:B6 ; |187| 
           MVKL    .S1     0x7f12091,A6
           MPYDP   .M1X    A5:A4,B5:B4,A5:A4 ; |187| 
           MVKL    .S1     0x3fc9992a,A7
           MVKH    .S1     0x7f12091,A6
           MVKH    .S1     0x3fc9992a,A7
           MVKL    .S2     _output+12,B31
           MVKH    .S2     _output+12,B31
           MVKL    .S1     _t_start,A3
           MVKH    .S1     _t_start,A3
           MPYDP   .M2     B5:B4,B7:B6,B5:B4 ; |187| 
           MPYDP   .M1X    A7:A6,B7:B6,A7:A6 ; |187| 
           STDW    .D1T1   A21:A20,*A3
           NOP             3
           MVKL    .S2     0xb81d48c0,B6
           MVKL    .S2     0x3fc2914f,B7
           MVKH    .S2     0xb81d48c0,B6
           MVKH    .S2     0x3fc2914f,B7
           MPYDP   .M2     B7:B6,B5:B4,B5:B4 ; |187| 
           ADDDP   .L1     A7:A6,A5:A4,A5:A4 ; |187| 
           MV      .S1     A11,A6
           ZERO    .L1     A7
           SET     .S1     A7,0x14,0x1d,A7
           NOP             6
           ADDDP   .L1X    B5:B4,A5:A4,A5:A4 ; |187| 
           NOP             6
           MPYDP   .M1X    B21:B20,A5:A4,A5:A4 ; |187| 
           NOP             9
           ADDDP   .L1X    B21:B20,A5:A4,A5:A4 ; |187| 
;** --------------------------------------------------------------------------*
$C$L18:    
;          EXCLUSIVE CPU CYCLES: 39
           MV      .L2X    A10,B4            ; |199| 
           CMPGTDP .S1X    B21:B20,A7:A6,A0  ; |199| 
           MV      .L2X    A7,B5             ; |199| 
           CMPEQDP .S2     B21:B20,B5:B4,B0  ; |203| 
           LDW     .D2T2   *B31,B4           ; |213| 
           NOP             2

   [ A0]   MV      .L1     A13,A5            ; |200| 
|| [ B0]   LDW     .D2T1   *+SP(16),A5       ; |200| 

   [ A0]   MV      .L1     A12,A4            ; |200| 
   [ B0]   MV      .L1     A6,A4             ; |200| 
           ADD     .L2     B10,B4,B4         ; |213| 
           NOP             1
           MPYDP   .M1     A23:A22,A5:A4,A5:A4 ; |213| 
           NOP             9

           STDW    .D2T1   A5:A4,*B4         ; |213| 
||         MVC     .S2     TSCL,B6           ; |128| 

           MVC     .S2     TSCH,B4           ; |128| 

           MVKL    .S1     _t_offset,A3
||         MVKL    .S2     _cycle_counts+24,B5
||         MV      .L2     B4,B7             ; |128| 
||         SUB     .L1     A14,1,A0          ; |207| 
||         SUB     .D1     A14,1,A14         ; |207| 
||         ADD     .D2     8,B10,B10         ; |207| 

           MVKH    .S1     _t_offset,A3
||         MVKH    .S2     _cycle_counts+24,B5

           LDDW    .D1T1   *A3,A7:A6         ; |130| 
           MVKL    .S1     _t_stop,A31
           LDDW    .D2T2   *B5,B5:B4         ; |130| 
           MVKH    .S1     _t_stop,A31
           STDW    .D1T2   B7:B6,*A31        ; |128| 
           ADDU    .L1     A6,A20,A5:A4      ; |130| 
           ADD     .L1     A5,A7,A5          ; |130| 

           ADD     .L1     A5,A21,A3         ; |130| 
|| [ A0]   B       .S2     $C$L16            ; |207| 
||         SUBU    .L2X    B6,A4,B9:B8       ; |130| 
|| [ A0]   ZERO    .S1     A5
|| [ A0]   MV      .D1     A10,A4            ; |209| 

   [ A0]   CALL    .S1     _gimme_random     ; |209| 
||         EXT     .S2     B9,24,24,B16      ; |130| 
||         ADDU    .L2     B4,B8,B9:B8       ; |130| 

           SUB     .L2X    B7,A3,B4          ; |130| 
||         MVKL    .S1     _cycle_counts+24,A3

           ADD     .L2     B9,B5,B4          ; |130| 
||         ADD     .S2     B4,B16,B5         ; |130| 
||         MVKH    .S1     _cycle_counts+24,A3

           ADD     .L2     B4,B5,B9          ; |130| 
|| [ A0]   ZERO    .S2     B5
|| [ A0]   MV      .D2X    A11,B4            ; |209| 
|| [!A0]   SUBAW   .D1     A3,6,A14
|| [ A0]   SET     .S1     A5,0x14,0x1d,A5

   [!A0]   CALL    .S1     __fltllif         ; |135| 
||         STDW    .D1T2   B9:B8,*A3         ; |130| 
|| [ A0]   MVKH    .S2     0xbfe00000,B5

           ; BRANCHCC OCCURS {$C$L16}        ; |207| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           LDDW    .D1T1   *+A14(24),A5:A4   ; |135| 
           ADDKPC  .S2     $C$RL33,B3,3      ; |135| 
$C$RL33:   ; CALL OCCURS {__fltllif} {0}     ; |135| 
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
           CALLP   .S2     __fixdlli,B3
$C$RL34:   ; CALL OCCURS {__fixdlli} {0}     ; |135| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 13
           MVKL    .S1     _cycle_counts+24,A3

           MVKH    .S1     _cycle_counts+24,A3
||         STDW    .D1T1   A11:A10,*+A14(8)  ; |114| 
||         MV      .L2X    A10,B4            ; |114| 

           MVC     .S2     B4,TSCL           ; |115| 
||         STDW    .D1T1   A5:A4,*A3         ; |135| 

           MVC     .S2     TSCL,B5           ; |116| 
           MVC     .S2     TSCH,B4           ; |116| 
           MVC     .S2     TSCL,B6           ; |117| 
           MVC     .S2     TSCH,B9           ; |117| 
           MVKL    .S1     _t_offset,A3
           MVKH    .S1     _t_offset,A3
           SUBU    .L2     B6,B5,B7:B6       ; |117| 

           MVK     .S1     0x80,A3
||         MV      .L2X    A3,B8             ; |117| 
||         EXT     .S2     B7,24,24,B5       ; |117| 
||         SUB     .D2     B9,B4,B4          ; |117| 

           ADD     .L2     B4,B5,B7          ; |117| 

           STDW    .D2T2   B7:B6,*B8         ; |117| 
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
$C$L19:    
;          EXCLUSIVE CPU CYCLES: 15
           MVC     .S2     TSCL,B4           ; |122| 
           MVC     .S2     TSCH,B5           ; |122| 
           MVKL    .S1     _input,A3
           MVKH    .S1     _input,A3
           LDW     .D1T1   *A3,A3            ; |222| 
           MVKL    .S2     _t_start,B6
           MVKH    .S2     _t_start,B6
           STDW    .D2T2   B5:B4,*B6         ; |122| 
           NOP             1

           ADD     .L1     A12,A3,A3         ; |222| 
||         CALL    .S1     _atanhdp          ; |222| 

           LDDW    .D1T1   *A3,A5:A4         ; |222| 
           ADDKPC  .S2     $C$RL35,B3,3      ; |222| 
$C$RL35:   ; CALL OCCURS {_atanhdp} {0}      ; |222| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 24
           MVKL    .S2     _output+4,B4
           MVKH    .S2     _output+4,B4
           LDW     .D2T2   *B4,B4            ; |222| 
           NOP             4
           ADD     .L1X    A12,B4,A3         ; |222| 

           STDW    .D1T1   A5:A4,*A3         ; |222| 
||         MVC     .S2     TSCL,B16          ; |128| 

           MVC     .S2     TSCH,B6           ; |128| 

           MVKL    .S2     _t_start,B4
||         MVKL    .S1     _t_offset,A3
||         SUB     .L1X    B13,1,A0          ; |220| 
||         MV      .L2     B6,B17            ; |128| 
||         ADD     .D1     8,A12,A12         ; |220| 
||         SUB     .D2     B13,1,B13         ; |220| 

           MVKH    .S1     _t_offset,A3
||         MVKH    .S2     _t_start,B4

           LDDW    .D1T1   *A3,A5:A4         ; |130| 
||         LDDW    .D2T2   *B4,B9:B8         ; |130| 
||         MVKL    .S1     _cycle_counts+8,A31
||         MVKL    .S2     _cycle_counts+8,B10

           MVKH    .S1     _cycle_counts+8,A31
||         MVKH    .S2     _cycle_counts+8,B10

           LDDW    .D1T1   *A31,A7:A6        ; |130| 
||         MVKL    .S1     _t_stop,A30

           MVKH    .S1     _t_stop,A30
           STDW    .D1T2   B17:B16,*A30      ; |128| 
           ADDU    .L2X    A4,B8,B5:B4       ; |130| 

   [ A0]   B       .S1     $C$L19            ; |220| 
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
||         STDW    .D2T2   B5:B4,*B10        ; |130| 

           ; BRANCHCC OCCURS {$C$L19}        ; |220| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           LDDW    .D1T1   *+A14(8),A5:A4    ; |135| 
           ADDKPC  .S2     $C$RL36,B3,3      ; |135| 
$C$RL36:   ; CALL OCCURS {__fltllif} {0}     ; |135| 
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
$C$RL37:   ; CALL OCCURS {__fixdlli} {0}     ; |135| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 12

           MV      .L2X    A10,B4            ; |114| 
||         STDW    .D1T1   A11:A10,*+A14(16) ; |114| 

           STDW    .D2T1   A5:A4,*B10        ; |135| 
||         MVC     .S2     B4,TSCL           ; |115| 

           MVC     .S2     TSCL,B5           ; |116| 
           MVC     .S2     TSCH,B4           ; |116| 
           MVC     .S2     TSCL,B6           ; |117| 
           MVC     .S2     TSCH,B8           ; |117| 
           SUBU    .L2     B6,B5,B7:B6       ; |117| 

           EXT     .S2     B7,24,24,B5       ; |117| 
||         MVKL    .S1     _t_offset,A3
||         SUB     .L2     B8,B4,B4          ; |117| 

           ADD     .L2     B4,B5,B7          ; |117| 
||         MVKH    .S1     _t_offset,A3

           STDW    .D1T2   B7:B6,*A3         ; |117| 
||         MVK     .S1     0x80,A3

           NOP             1
           MV      .L2X    A3,B10            ; |117| 
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
           MVKL    .S1     _input,A3
           MVKH    .S1     _input,A3
           LDW     .D1T1   *A3,A3            ; |231| 
           MVKL    .S2     _t_start,B6
           MVKH    .S2     _t_start,B6
           STDW    .D2T2   B5:B4,*B6         ; |122| 
           NOP             1

           ADD     .L1     A12,A3,A3         ; |231| 
||         CALL    .S1     _atanhdp_c        ; |231| 

           LDDW    .D1T1   *A3,A5:A4         ; |231| 
           ADDKPC  .S2     $C$RL38,B3,3      ; |231| 
$C$RL38:   ; CALL OCCURS {_atanhdp_c} {0}    ; |231| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 24
           MVKL    .S2     _output+8,B4
           MVKH    .S2     _output+8,B4
           LDW     .D2T2   *B4,B4            ; |231| 
           NOP             4
           ADD     .L1X    A12,B4,A3         ; |231| 

           STDW    .D1T1   A5:A4,*A3         ; |231| 
||         MVC     .S2     TSCL,B16          ; |128| 

           MVC     .S2     TSCH,B4           ; |128| 

           MVKL    .S2     _t_start,B5
||         MVKL    .S1     _t_offset,A3
||         SUB     .L1X    B10,1,A0          ; |229| 
||         MV      .L2     B4,B17            ; |128| 
||         ADD     .D1     8,A12,A12         ; |229| 
||         SUB     .D2     B10,1,B10         ; |229| 

           MVKH    .S1     _t_offset,A3
||         MVKH    .S2     _t_start,B5

           LDDW    .D1T1   *A3,A5:A4         ; |130| 
||         LDDW    .D2T2   *B5,B7:B6         ; |130| 
||         MVKL    .S1     _cycle_counts+16,A31
||         MVKL    .S2     _cycle_counts+16,B13

           MVKH    .S1     _cycle_counts+16,A31
||         MVKH    .S2     _cycle_counts+16,B13

           LDDW    .D1T1   *A31,A7:A6        ; |130| 
||         MVKL    .S1     _t_stop,A30

           MVKH    .S1     _t_stop,A30
           STDW    .D1T2   B17:B16,*A30      ; |128| 
           ADDU    .L2X    A4,B6,B9:B8       ; |130| 

           ADD     .S2X    B9,A5,B6          ; |130| 
|| [ A0]   B       .S1     $C$L20            ; |229| 
||         SUBU    .L2     B16,B8,B5:B4      ; |130| 

           ADD     .D2     B6,B7,B6          ; |130| 
||         EXT     .S2     B5,24,24,B7       ; |130| 
||         ADDU    .L2X    A6,B4,B5:B4       ; |130| 

           SUB     .L2     B17,B6,B6         ; |130| 
||         ADD     .S2X    B5,A7,B5          ; |130| 

           ADD     .L2     B6,B7,B6          ; |130| 
           ADD     .L2     B5,B6,B5          ; |130| 

   [!A0]   CALL    .S1     __fltllif         ; |135| 
||         STDW    .D2T2   B5:B4,*B13        ; |130| 

           ; BRANCHCC OCCURS {$C$L20}        ; |229| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           LDDW    .D2T1   *B13,A5:A4        ; |135| 
           ADDKPC  .S2     $C$RL39,B3,3      ; |135| 
$C$RL39:   ; CALL OCCURS {__fltllif} {0}     ; |135| 
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
$C$RL40:   ; CALL OCCURS {__fixdlli} {0}     ; |135| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 10

           MV      .L2     B13,B4            ; |114| 
||         MV      .S2X    A10,B5            ; |114| 
||         STDW    .D1T1   A11:A10,*A14      ; |114| 

           MVC     .S2     B5,TSCL           ; |115| 
||         STDW    .D2T1   A5:A4,*B4         ; |135| 

           MVC     .S2     TSCL,B4           ; |116| 
           MVC     .S2     TSCH,B6           ; |116| 
           MVC     .S2     TSCL,B5           ; |117| 
           MVC     .S2     TSCH,B7           ; |117| 
           SUBU    .L2     B5,B4,B5:B4       ; |117| 

           EXT     .S2     B5,24,24,B6       ; |117| 
||         SUB     .L2     B7,B6,B5          ; |117| 
||         MVKL    .S1     _t_offset,A3

           ADD     .L2     B5,B6,B5          ; |117| 
||         MVKH    .S1     _t_offset,A3

           STDW    .D1T2   B5:B4,*A3         ; |117| 
||         MVK     .S1     0x80,A12
||         MV      .L1     A12,A14           ; |117| 

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L21:    
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

           ADD     .L1     A14,A3,A3         ; |240| 
||         CALL    .S1     _atanh            ; |240| 

           LDDW    .D1T1   *A3,A5:A4         ; |240| 
           ADDKPC  .S2     $C$RL41,B3,3      ; |240| 
$C$RL41:   ; CALL OCCURS {_atanh} {0}        ; |240| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 25
           MVKL    .S2     _output,B13
           MVKH    .S2     _output,B13
           LDW     .D2T2   *B13,B4           ; |240| 
           NOP             4
           ADD     .L1X    A14,B4,A3         ; |240| 

           STDW    .D1T1   A5:A4,*A3         ; |240| 
||         MVC     .S2     TSCL,B8           ; |128| 

           MVC     .S2     TSCH,B4           ; |128| 

           MVKL    .S1     _t_offset,A3
||         MVKL    .S2     _t_start,B10
||         SUB     .L1     A12,1,A0          ; |238| 
||         MV      .L2     B4,B9             ; |128| 
||         ADD     .D1     8,A14,A14         ; |238| 

           MVKH    .S2     _t_start,B10
||         MVKH    .S1     _t_offset,A3
||         SUB     .L1     A12,1,A12         ; |238| 

           LDDW    .D1T1   *A3,A5:A4         ; |130| 
||         LDDW    .D2T2   *B10,B7:B6        ; |130| 
||         MVKL    .S1     _cycle_counts,A3

           MVKH    .S1     _cycle_counts,A3

           LDDW    .D1T1   *A3,A7:A6         ; |130| 
||         MVKL    .S1     _t_stop,A31

           MV      .L2X    A3,B4             ; |128| 
||         MVKH    .S1     _t_stop,A31

           STDW    .D1T2   B9:B8,*A31        ; |128| 
           ADDU    .L2X    A4,B6,B17:B16     ; |130| 
           MV      .L2     B16,B5            ; |130| 

           ADD     .S2X    B17,A5,B5         ; |130| 
||         SUBU    .L2     B8,B5,B17:B16     ; |130| 
|| [ A0]   B       .S1     $C$L21            ; |238| 

           ADD     .D2     B5,B7,B5          ; |130| 
||         ADDU    .L2X    A6,B16,B7:B6      ; |130| 
||         EXT     .S2     B17,24,24,B16     ; |130| 

           SUB     .L2     B9,B5,B5          ; |130| 

           ADD     .L2X    B7,A7,B5          ; |130| 
||         ADD     .S2     B5,B16,B7         ; |130| 

           ADD     .L2     B5,B7,B7          ; |130| 
           STDW    .D2T2   B7:B6,*B4         ; |130| 
           ; BRANCHCC OCCURS {$C$L21}        ; |238| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 7
           MV      .L1X    B4,A14

           CALLP   .S2     __fltllif,B3
||         LDDW    .D1T1   *A14,A5:A4        ; |135| 

$C$RL42:   ; CALL OCCURS {__fltllif} {0}     ; |135| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 106
           ZERO    .L1     A3
           SET     .S1     A3,0x1a,0x1d,A3
           MPYSP   .M1     A3,A4,A3          ; |135| 
           MV      .L1     A11,A12           ; |135| 
           NOP             2
           SPDP    .S1     A3,A5:A4          ; |135| 
           NOP             1
           ADDDP   .L1     A13:A12,A5:A4,A5:A4 ; |135| 
           CALLP   .S2     __fixdlli,B3
$C$RL43:   ; CALL OCCURS {__fixdlli} {0}     ; |135| 

           MV      .L2X    A10,B4            ; |114| 
||         STDW    .D1T1   A11:A10,*+A14(32) ; |114| 

           STDW    .D1T1   A5:A4,*A14        ; |135| 
||         MVC     .S2     B4,TSCL           ; |115| 

           MVC     .S2     TSCL,B4           ; |116| 
           MVC     .S2     TSCH,B5           ; |116| 

           STDW    .D2T2   B5:B4,*B10        ; |116| 
||         MVC     .S2     TSCL,B6           ; |117| 

           MVC     .S2     TSCH,B8           ; |117| 

           MVKL    .S1     _t_offset,A3
||         SUBU    .L2     B6,B4,B7:B6       ; |117| 

           MVKH    .S1     _t_offset,A3
||         EXT     .S2     B7,24,24,B7       ; |117| 
||         SUB     .L2     B8,B5,B5          ; |117| 

           MV      .L1     A3,A10            ; |117| 
||         MVKL    .S1     _input,A3
||         ADD     .L2     B5,B7,B7          ; |117| 

           MVKH    .S1     _input,A3
||         STDW    .D1T2   B7:B6,*A10        ; |117| 

           CALLP   .S2     _atanhdp_v,B3
||         LDW     .D1T1   *A3,A4            ; |247| 
||         LDW     .D2T2   *+B13(16),B4      ; |247| 
||         MVK     .S1     0x80,A6           ; |247| 

$C$RL44:   ; CALL OCCURS {_atanhdp_v} {0}    ; |247| 
           MVC     .S2     TSCL,B8           ; |128| 
           MVC     .S2     TSCH,B5           ; |128| 

           LDDW    .D1T1   *A10,A5:A4        ; |130| 
||         LDDW    .D2T2   *B10,B7:B6        ; |130| 

           MVK     .S2     16,B4
           ADD     .L2X    A14,B4,B4
           ADDAD   .D2     B4,2,B10

           MV      .L2     B5,B9             ; |128| 
||         LDDW    .D2T2   *B10,B5:B4        ; |130| 

           ADDU    .L1X    A4,B6,A7:A6       ; |130| 
           ADD     .L1     A7,A5,A4          ; |130| 
           SUBU    .L1X    B8,A6,A7:A6       ; |130| 

           ADD     .L2X    A4,B7,B6          ; |130| 
||         MV      .L1     A6,A5             ; |130| 
||         EXT     .S1     A7,24,24,A6       ; |130| 

           ADDU    .L1X    B4,A5,A5:A4       ; |130| 
||         SUB     .L2     B9,B6,B4          ; |130| 

           ADD     .L2X    B4,A6,B4          ; |130| 
||         MVKL    .S1     _t_stop,A3

           ADD     .L1X    A5,B5,A5          ; |130| 
||         MVKH    .S1     _t_stop,A3

           CALLP   .S2     __fltllif,B3
||         ADD     .L1X    A5,B4,A5          ; |130| 
||         STDW    .D1T2   B9:B8,*A3         ; |128| 

$C$RL45:   ; CALL OCCURS {__fltllif} {0}     ; |130| 
           ZERO    .L1     A3
           SET     .S1     A3,0x1a,0x1d,A3
           MPYSP   .M1     A3,A4,A3          ; |130| 
           NOP             3
           SPDP    .S1     A3,A5:A4          ; |130| 
           NOP             1
           ADDDP   .L1     A13:A12,A5:A4,A5:A4 ; |130| 
           CALLP   .S2     __fixdlli,B3
$C$RL46:   ; CALL OCCURS {__fixdlli} {0}     ; |130| 
           MVKL    .S2     0x3ddb7cdf,B7
           MVKL    .S2     0xd9d7bdbb,B6

           LDW     .D2T2   *+B13(4),B4       ; |66| 
||         MVKH    .S2     0x3ddb7cdf,B7

           STDW    .D2T1   A5:A4,*B10        ; |130| 
||         MVKH    .S2     0xd9d7bdbb,B6

           CALLP   .S2     _isequal,B3
||         LDW     .D2T1   *B13,A4           ; |66| 
||         MVK     .L1     0x9,A8            ; |66| 
||         MVK     .S1     0x80,A6           ; |66| 

$C$RL47:   ; CALL OCCURS {_isequal} {0}      ; |66| 
           MVKL    .S2     0xd9d7bdbb,B6

           MVKL    .S1     _fcn_pass,A10
||         MVKL    .S2     0x3ddb7cdf,B7

           MVKH    .S1     _fcn_pass,A10
||         MVKH    .S2     0xd9d7bdbb,B6

           STW     .D1T1   A4,*+A10(4)       ; |66| 
||         LDW     .D2T2   *+B13(8),B4       ; |67| 
||         MVKH    .S2     0x3ddb7cdf,B7

           CALLP   .S2     _isequal,B3
||         LDW     .D2T1   *B13,A4           ; |67| 
||         MVK     .S1     0x80,A6           ; |67| 
||         MVK     .L1     0x9,A8            ; |67| 

$C$RL48:   ; CALL OCCURS {_isequal} {0}      ; |67| 
           MVKL    .S2     0x3ddb7cdf,B7
           MVKL    .S2     0xd9d7bdbb,B6
           MVKH    .S2     0x3ddb7cdf,B7

           MV      .L1X    B13,A3            ; |68| 
||         STW     .D1T1   A4,*+A10(8)       ; |67| 
||         MVKH    .S2     0xd9d7bdbb,B6

           CALLP   .S2     _isequal,B3
||         LDW     .D1T1   *A3,A4            ; |68| 
||         LDW     .D2T2   *+B13(12),B4      ; |68| 
||         MVK     .S1     0x80,A6           ; |68| 
||         MVK     .L1     0x9,A8            ; |68| 

$C$RL49:   ; CALL OCCURS {_isequal} {0}      ; |68| 
           MVKL    .S2     0x3ddb7cdf,B7
           MVKL    .S2     0xd9d7bdbb,B6

           MV      .L2X    A4,B4             ; |68| 
||         MVKH    .S2     0x3ddb7cdf,B7

           STW     .D1T2   B4,*+A10(12)      ; |68| 
||         MVKH    .S2     0xd9d7bdbb,B6

           CALLP   .S2     _isequal,B3
||         LDW     .D1T2   *A15,B4           ; |69| 
||         LDW     .D2T1   *B13,A4           ; |69| 
||         MVK     .S1     0x80,A6           ; |69| 
||         MVK     .L1     0x9,A8            ; |69| 

$C$RL50:   ; CALL OCCURS {_isequal} {0}      ; |69| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 11
           LDW     .D2T1   *B12,A0           ; |72| 
           STW     .D1T1   A4,*+A10(16)      ; |69| 
           NOP             3

   [!A0]   BNOP    .S1     $C$L22,5          ; |72| 
|| [ A0]   LDW     .D2T2   *B11,B0           ; |72| 
|| [ A0]   ADD     .L2     4,B11,B4

           ; BRANCHCC OCCURS {$C$L22}        ; |72| 
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
   [ A0]   B       .S1     $C$L23            ; |72| 
   [ A0]   CALL    .S1     _print_test_results ; |253| 
   [ A0]   MVKL    .S1     _all_pass,A3
   [ A0]   MVKH    .S1     _all_pass,A3
           NOP             2
           ; BRANCHCC OCCURS {$C$L23}        ; |72| 
;** --------------------------------------------------------------------------*
$C$L22:    
;          EXCLUSIVE CPU CYCLES: 5
           CALL    .S1     _print_test_results ; |253| 
           MVKL    .S1     _all_pass,A3
           MVKH    .S1     _all_pass,A3
           MV      .L1     A11,A4
           NOP             1
;** --------------------------------------------------------------------------*
$C$L23:    
;          EXCLUSIVE CPU CYCLES: 1

           STW     .D1T1   A4,*A3            ; |72| 
||         MVK     .L1     0x2,A4            ; |253| 
||         ADDKPC  .S2     $C$RL51,B3,0      ; |253| 

$C$RL51:   ; CALL OCCURS {_print_test_results} {0}  ; |253| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 30
           MVKL    .S2     $C$SL2+0,B4
           MVKH    .S2     $C$SL2+0,B4

           CALLP   .S2     _printf,B3
||         STW     .D2T2   B4,*+SP(4)        ; |254| 

$C$RL52:   ; CALL OCCURS {_printf} {0}       ; |254| 
           MVKL    .S2     $C$SL3+0,B4
           MVKH    .S2     $C$SL3+0,B4

           CALLP   .S2     _printf,B3
||         STW     .D2T2   B4,*+SP(4)        ; |254| 

$C$RL53:   ; CALL OCCURS {_printf} {0}       ; |254| 
           MVKL    .S1     $C$SL1+0,A10
           MVKH    .S1     $C$SL1+0,A10

           CALLP   .S2     _print_profile_results,B3
||         MV      .L1     A10,A4            ; |261| 

$C$RL54:   ; CALL OCCURS {_print_profile_results} {0}  ; |261| 

           CALLP   .S2     _print_memory_results,B3
||         MV      .L1     A10,A4            ; |264| 

$C$RL55:   ; CALL OCCURS {_print_memory_results} {0}  ; |264| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 11
           LDW     .D2T2   *++SP(32),B3      ; |265| 
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
$C$SL1:	.string	"atanhDP",0
$C$SL2:	.string	"----------------------------------------",0
$C$SL3:	.string	"----------------------------------------",10,0
;*****************************************************************************
;* UNDEFINED EXTERNAL REFERENCES                                             *
;*****************************************************************************
	.global	_printf
	.global	_atanh
	.global	_driver_init
	.global	_print_profile_results
	.global	_print_memory_results
	.global	_print_test_results
	.global	_gimme_random
	.global	_isequal
	.global	_atanhdp_c
	.global	_atanhdp
	.global	_atanhdp_v
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
