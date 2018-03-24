;******************************************************************************
;* TMS320C6x C/C++ Codegen                                          PC v7.4.2 *
;* Date/Time created: Mon May 16 23:31:38 2016                                *
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
	.word	05be02646h,0412af0e3h		; a[0] @ 0
	.word	020423b0eh,04121197ah		; a[1] @ 64
	.word	066ce505bh,040fdd968h		; a[2] @ 128
	.word	0bb561764h,0411dd368h		; a[3] @ 192
	.word	09b258ad4h,040ed382dh		; a[4] @ 256
	.word	09d3b8af1h,04121d565h		; a[5] @ 320
	.word	0357bd563h,04116dda3h		; a[6] @ 384
	.word	0dfabcffdh,0412bd534h		; a[7] @ 448
	.word	09ea2edd6h,04129b83fh		; a[8] @ 512
	.word	0f33d2956h,0411316d3h		; a[9] @ 576
	.word	0dea31975h,0412616dbh		; a[10] @ 640
	.word	0442a927bh,04128999fh		; a[11] @ 704
	.word	0f4b223d4h,040ff1162h		; a[12] @ 768
	.word	048aef7d0h,0412c7afbh		; a[13] @ 832
	.word	02e682152h,041172716h		; a[14] @ 896
	.word	024213a0ch,041027270h		; a[15] @ 960
	.word	038de59bdh,041197540h		; a[16] @ 1024
	.word	07a42ff59h,041093db2h		; a[17] @ 1088
	.word	005c96031h,041008b60h		; a[18] @ 1152
	.word	05caf84bdh,0411ec7d7h		; a[19] @ 1216
	.word	09a7f221fh,041283555h		; a[20] @ 1280
	.word	0d3cf04b5h,0411eac9bh		; a[21] @ 1344
	.word	039f9c122h,04116eaf8h		; a[22] @ 1408
	.word	0a6c4fb47h,040e6e078h		; a[23] @ 1472
	.word	03822eae7h,0412d5011h		; a[24] @ 1536
	.word	0bfeef292h,04127c24ah		; a[25] @ 1600
	.word	09f912a5fh,040f71020h		; a[26] @ 1664
	.word	0ca0f4d7bh,0411f93ddh		; a[27] @ 1728
	.word	0dd928fbah,0410697d4h		; a[28] @ 1792
	.word	0409807c9h,04122381ah		; a[29] @ 1856
	.word	0117bc141h,0412a26cbh		; a[30] @ 1920
	.word	047531048h,04110c1a9h		; a[31] @ 1984
	.word	03d9fb898h,0411513c1h		; a[32] @ 2048
	.word	0c0d5984dh,040f7c32ah		; a[33] @ 2112
	.word	098b47263h,04129bddbh		; a[34] @ 2176
	.word	08969a0aeh,0410ff548h		; a[35] @ 2240
	.word	006488758h,0412b9a46h		; a[36] @ 2304
	.word	006eb412ch,040d6a8f9h		; a[37] @ 2368
	.word	0be2003ach,04128c59dh		; a[38] @ 2432
	.word	04b40db92h,040d69449h		; a[39] @ 2496
	.word	0e4d6eb34h,0412c62c5h		; a[40] @ 2560
	.word	02aca361ah,0412575b2h		; a[41] @ 2624
	.word	06a712282h,040fe2defh		; a[42] @ 2688
	.word	0b2c9696bh,04124bc73h		; a[43] @ 2752
	.word	03d4e0978h,040f240cfh		; a[44] @ 2816
	.word	0d6f2a5a4h,040f30c52h		; a[45] @ 2880
	.word	04f937238h,04126276dh		; a[46] @ 2944
	.word	0403d3ca1h,0412d4cc8h		; a[47] @ 3008
	.word	06b23eac1h,041220aeeh		; a[48] @ 3072
	.word	03dc66326h,041243069h		; a[49] @ 3136
	.word	0775cb5e3h,04104bdf4h		; a[50] @ 3200
	.word	093161a1eh,04106d07ch		; a[51] @ 3264
	.word	03d990951h,041131ff5h		; a[52] @ 3328
	.word	073e56473h,04121564bh		; a[53] @ 3392
	.word	08c2a7e59h,041220d47h		; a[54] @ 3456
	.word	01d64f2c9h,04110086bh		; a[55] @ 3520
	.word	0fcdb6a1fh,04124d9ech		; a[56] @ 3584
	.word	0387d4e09h,0411f4735h		; a[57] @ 3648
	.word	05dbb6aa5h,0412631a5h		; a[58] @ 3712
	.word	05f922963h,04125ad41h		; a[59] @ 3776
	.word	07feab368h,04126368dh		; a[60] @ 3840
	.word	013f65dc0h,041283cbfh		; a[61] @ 3904
	.word	0c21bd8a4h,0412ba7f5h		; a[62] @ 3968
	.word	058c2140ch,04122db3ch		; a[63] @ 4032
	.word	06f2ae07eh,040f23957h		; a[64] @ 4096
	.word	0b2319e08h,04113223bh		; a[65] @ 4160
	.word	01f05ea25h,040e2d284h		; a[66] @ 4224
	.word	0a346a352h,04124ed79h		; a[67] @ 4288
	.word	09c435844h,0412cad97h		; a[68] @ 4352
	.word	059ad2136h,041212e6dh		; a[69] @ 4416
	.word	0d7dd68fch,04123ba2eh		; a[70] @ 4480
	.word	0412a5f4fh,041084c18h		; a[71] @ 4544
	.word	0911cb03ah,041001909h		; a[72] @ 4608
	.word	0ee15d123h,041230cd6h		; a[73] @ 4672
	.word	01ae865b0h,041298aa9h		; a[74] @ 4736
	.word	00b3b67b5h,040e15eefh		; a[75] @ 4800
	.word	08183c36eh,040ed7e79h		; a[76] @ 4864
	.word	05f865d7dh,04105633eh		; a[77] @ 4928
	.word	036c8853fh,0411326bfh		; a[78] @ 4992
	.word	00ec980e8h,04124ad32h		; a[79] @ 5056
	.word	0c2aa0522h,04125f43eh		; a[80] @ 5120
	.word	0cf0f1daah,0411db3d4h		; a[81] @ 5184
	.word	028c4d80ch,0411689beh		; a[82] @ 5248
	.word	090e0a84ch,041076d08h		; a[83] @ 5312
	.word	062055e0eh,0412577bfh		; a[84] @ 5376
	.word	01b8179e8h,0411a39cdh		; a[85] @ 5440
	.word	0efac710dh,0412b3befh		; a[86] @ 5504
	.word	0aa0dd5ach,0410d19ddh		; a[87] @ 5568
	.word	0415aebdfh,041086339h		; a[88] @ 5632
	.word	0f8ac555eh,0411c1878h		; a[89] @ 5696
	.word	02a353c22h,04116bd96h		; a[90] @ 5760
	.word	05a908a26h,040f3c7c4h		; a[91] @ 5824
	.word	0936c2d50h,0412e4754h		; a[92] @ 5888
	.word	0380614edh,04123426bh		; a[93] @ 5952
	.word	023a73995h,0412abd5eh		; a[94] @ 6016
	.word	080f58cdfh,041211d7eh		; a[95] @ 6080
	.word	0e8e1932dh,0411b2e12h		; a[96] @ 6144
	.word	0a6f7d30bh,0412228b9h		; a[97] @ 6208
	.word	094cf4a56h,040f4f620h		; a[98] @ 6272
	.word	06e9f4fbch,040ff0d6eh		; a[99] @ 6336
	.word	04aedb4a4h,041203e1dh		; a[100] @ 6400
	.word	0f32a355eh,04121e2c6h		; a[101] @ 6464
	.word	09083f69ah,0410f6359h		; a[102] @ 6528
	.word	07ee9325eh,04128d96eh		; a[103] @ 6592
	.word	0ad5e071ch,04128dc5eh		; a[104] @ 6656
	.word	0231b65b7h,0411b02fch		; a[105] @ 6720
	.word	0b7215c71h,0410e86bch		; a[106] @ 6784
	.word	0fef72134h,0410fd030h		; a[107] @ 6848
	.word	0c94b167fh,0411b47a9h		; a[108] @ 6912
	.word	0c0512c42h,041222bafh		; a[109] @ 6976
	.word	0a5044509h,0411f9324h		; a[110] @ 7040
	.word	04a7c2515h,04124ed13h		; a[111] @ 7104
	.word	0bebbe29ah,041058158h		; a[112] @ 7168
	.word	0a6f5a2afh,040ed87f3h		; a[113] @ 7232
	.word	09db7d69ch,040fa6616h		; a[114] @ 7296
	.word	0b8770d7eh,0412bc170h		; a[115] @ 7360
	.word	04cf0d18fh,041155a32h		; a[116] @ 7424
	.word	0180f0557h,0411bf2d0h		; a[117] @ 7488
	.word	01f78897fh,041240945h		; a[118] @ 7552
	.word	069d44490h,04115082bh		; a[119] @ 7616
	.word	0565f3af9h,0412b5ab0h		; a[120] @ 7680
	.word	0e860b7d1h,0412e6a58h		; a[121] @ 7744
	.word	0fcfe6c82h,041183cbfh		; a[122] @ 7808
	.word	0ea2b8265h,040580f5dh		; a[123] @ 7872
	.word	0b738609ah,0411545a8h		; a[124] @ 7936
	.word	08263736dh,0411d6d9ah		; a[125] @ 8000
	.word	0d5c34b44h,041032985h		; a[126] @ 8064
	.word	0a32d905ch,0411cedc7h		; a[127] @ 8128
	.word	048bdf315h,04129812dh		; a[128] @ 8192
	.word	038776816h,041129a29h		; a[129] @ 8256
	.word	036283177h,04115f77ah		; a[130] @ 8320
	.word	0cab1df0bh,0412d6f9fh		; a[131] @ 8384
	.word	0dd9b3652h,040f0ab74h		; a[132] @ 8448
	.word	0eb1cb542h,0411c807fh		; a[133] @ 8512
	.word	0358298cch,040cc3746h		; a[134] @ 8576
	.word	0889019beh,0410ea824h		; a[135] @ 8640
	.word	013570245h,04116058dh		; a[136] @ 8704
	.word	05f3962f8h,041207ebah		; a[137] @ 8768
	.word	07784a292h,0412662dfh		; a[138] @ 8832
	.word	0de42e481h,04126032bh		; a[139] @ 8896
	.word	0a9843584h,04122f0bah		; a[140] @ 8960
	.word	029e55f6bh,04125c376h		; a[141] @ 9024
	.word	056059063h,04125d212h		; a[142] @ 9088
	.word	06f709b74h,04115aedeh		; a[143] @ 9152
	.word	0472cf95dh,04114828dh		; a[144] @ 9216
	.word	02c63d669h,041271e58h		; a[145] @ 9280
	.word	0a8c63503h,04127393ah		; a[146] @ 9344
	.word	01bb27533h,04125ad0eh		; a[147] @ 9408
	.word	039424448h,04122c68ch		; a[148] @ 9472
	.word	04f9350aah,040de77b6h		; a[149] @ 9536
	.word	056818ee1h,0410f12b9h		; a[150] @ 9600
	.word	086d34ec7h,0412d2addh		; a[151] @ 9664
	.word	08800218eh,041009132h		; a[152] @ 9728
	.word	0e4cb0b2ch,0411e8200h		; a[153] @ 9792
	.word	01dc69220h,041065c4eh		; a[154] @ 9856
	.word	09e73c199h,04129d164h		; a[155] @ 9920
	.word	07add6678h,04105e20ch		; a[156] @ 9984
	.word	02ca08cd3h,04125e94ch		; a[157] @ 10048
	.word	046177136h,040fd155fh		; a[158] @ 10112
	.word	0d08bc317h,0412673fah		; a[159] @ 10176
	.word	09eb862b2h,04122b1d8h		; a[160] @ 10240
	.word	0ebcbdc0ch,041292d49h		; a[161] @ 10304
	.word	05ccdd93ch,0410cb5f4h		; a[162] @ 10368
	.word	08cb62698h,041215912h		; a[163] @ 10432
	.word	0375d38c0h,0412bca10h		; a[164] @ 10496
	.word	07c47c668h,04121963fh		; a[165] @ 10560
	.word	0abfd5022h,041125a31h		; a[166] @ 10624
	.word	0a8e9e93dh,0412abe7fh		; a[167] @ 10688
	.word	099d3b0edh,04100ba0bh		; a[168] @ 10752
	.word	08f901df0h,04111db71h		; a[169] @ 10816
	.word	0db7a94f2h,04124335eh		; a[170] @ 10880
	.word	063604692h,0412869a2h		; a[171] @ 10944
	.word	0275455c3h,0412cd115h		; a[172] @ 11008
	.word	0f44a2fcfh,0412bac92h		; a[173] @ 11072
	.word	0bb38d60ah,041112c55h		; a[174] @ 11136
	.word	0bb729cd6h,040e9d28ch		; a[175] @ 11200
	.word	0e795266dh,04121bdbfh		; a[176] @ 11264
	.word	081c81400h,0412cf1f6h		; a[177] @ 11328
	.word	055e6d084h,041258dd1h		; a[178] @ 11392
	.word	09ec9e8edh,0412d71a7h		; a[179] @ 11456
	.word	0887ecc8fh,0412b096bh		; a[180] @ 11520
	.word	024b6dbcah,0411fbf65h		; a[181] @ 11584
	.word	0985a3429h,040efab9fh		; a[182] @ 11648
	.word	0c486cebch,0411b02a0h		; a[183] @ 11712
	.word	09c87f603h,0411215f1h		; a[184] @ 11776
	.word	0bb6df902h,04114c8b2h		; a[185] @ 11840
	.word	00bcabed6h,040f8c07fh		; a[186] @ 11904
	.word	088fce091h,0412e4faeh		; a[187] @ 11968
	.word	09732c478h,04129daddh		; a[188] @ 12032
	.word	0782c17b6h,04125c370h		; a[189] @ 12096
	.word	0a624dd2fh,0410045f7h		; a[190] @ 12160
	.word	0fa3cb817h,041261c92h		; a[191] @ 12224
	.word	0f824b9f4h,041035079h		; a[192] @ 12288
	.word	0427dd94ah,041204d21h		; a[193] @ 12352
	.word	060e42b8eh,040f5106fh		; a[194] @ 12416
	.word	0a67f9e46h,041135db2h		; a[195] @ 12480
	.word	09e395663h,0411b30a1h		; a[196] @ 12544
	.word	038aae445h,04111d92bh		; a[197] @ 12608
	.word	026e8f953h,0411d3709h		; a[198] @ 12672
	.word	0aa1130aah,040f1a205h		; a[199] @ 12736
	.word	0c7b2788eh,04120292bh		; a[200] @ 12800

;	C:\MATHLIB_Tools\CCSV5_5_0\ccsv5\tools\compiler\c6000_7.4.2\bin\opt6x.exe C:\\Users\\gtbldadm\\AppData\\Local\\Temp\\009928 C:\\Users\\gtbldadm\\AppData\\Local\\Temp\\0099210 
	.sect	".text:optci"
	.clink

;******************************************************************************
;* FUNCTION NAME: logdp_acoshdp_i                                             *
;*                                                                            *
;*   Regs Modified     : A0,A1,A3,A4,A5,A6,A7,A8,A9,B0,B4,B5,B6,B7,B8,B9,A16, *
;*                           A17,A18,A19,A20,A21,B16,B17,B18,B19              *
;*   Regs Used         : A0,A1,A3,A4,A5,A6,A7,A8,A9,B0,B3,B4,B5,B6,B7,B8,B9,  *
;*                           A16,A17,A18,A19,A20,A21,B16,B17,B18,B19          *
;*   Local Frame Size  : 0 Args + 0 Auto + 0 Save = 0 byte                    *
;******************************************************************************
logdp_acoshdp_i:
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 328
           CLR     .S1     A5,20,31,A3       ; |111| 
           EXTU    .S1     A5,1,21,A1        ; |106| 

           SET     .S1     A3,21,29,A7       ; |111| 
||         MV      .L1     A4,A6             ; |111| 

   [!A1]   ZERO    .L1     A7:A6             ; |114| 
||         ZERO    .L2     B9

           SET     .S2     B9,0x15,0x1d,B9
||         ZERO    .L2     B8                ; |117| 

           SUBDP   .L2X    A7:A6,B9:B8,B5:B4 ; |117| 
           MVKL    .S2     0x667f3bcd,B16
           MVKL    .S2     0x3fe6a09e,B17
           MVKH    .S2     0x667f3bcd,B16
           MVKH    .S2     0x3fe6a09e,B17
           MV      .L1X    B9,A9             ; |117| 
           ZERO    .L1     A8                ; |117| 
           SUBDP   .L2     B5:B4,B9:B8,B7:B6 ; |117| 
           CMPGTDP .S1X    A7:A6,B17:B16,A0  ; |123| 
           MPYDP   .M1     A9:A8,A7:A6,A7:A6 ; |118| 
           MVKL    .S1     0xbfe94415,A21
           MVKL    .S1     0xb356bd29,A20
           ZERO    .L1     A9
           SET     .S1     A9,0x1e,0x1e,A9

   [!A0]   MV      .L2     B5,B7             ; |124| 
|| [!A0]   MV      .S2     B4,B6             ; |124| 

   [!A0]   MPYDP   .M2     B9:B8,B7:B6,B17:B16 ; |125| 
           MV      .L2     B9,B5             ; |117| 
           MV      .L2     B8,B4             ; |125| 
           MVKH    .S1     0xbfe94415,A21
           MVKH    .S1     0xb356bd29,A20
           ADDDP   .L2X    B5:B4,A7:A6,B5:B4 ; |118| 
           NOP             4
   [!A0]   ADDDP   .L2     B9:B8,B17:B16,B5:B4 ; |125| 
           NOP             6
           RCPDP   .S2     B5:B4,B9:B8       ; |67| 
           NOP             1
           MPYDP   .M2     B5:B4,B9:B8,B17:B16 ; |67| 
           NOP             9
           NOP             1
           SUBDP   .L1X    A9:A8,B17:B16,A7:A6 ; |67| 
           NOP             6
           MPYDP   .M1X    B9:B8,A7:A6,A7:A6 ; |67| 
           NOP             9
           MPYDP   .M1X    B5:B4,A7:A6,A17:A16 ; |67| 
           NOP             9
           SUBDP   .L1     A9:A8,A17:A16,A17:A16 ; |67| 
           NOP             6
           MPYDP   .M1     A7:A6,A17:A16,A7:A6 ; |67| 
           NOP             9
           NOP             1
           MPYDP   .M2X    B5:B4,A7:A6,B5:B4 ; |67| 
           NOP             9
           SUBDP   .L2X    A9:A8,B5:B4,B5:B4 ; |67| 
           ZERO    .L1     A8                ; |65| 
           NOP             5
           MPYDP   .M2X    A7:A6,B5:B4,B5:B4 ; |67| 
           NOP             9
           MPYDP   .M2     B7:B6,B5:B4,B5:B4 ; |67| 
           ZERO    .L1     A7:A6             ; |69| 
           NOP             6
           CMPEQDP .S2X    B7:B6,A7:A6,B0    ; |69| 
           MVKL    .S1     0x40738083,A7
   [ B0]   ZERO    .L2     B5:B4             ; |70| 

           MV      .L2     B5,B17            ; |73| 
||         MV      .S2     B4,B16            ; |73| 

           MPYDP   .M2     B17:B16,B17:B16,B9:B8 ; |130| 
           MVKL    .S2     0xc041d580,B5
           MVKL    .S2     0x4b67ce0f,B4
           MVKH    .S2     0xc041d580,B5
           MVKH    .S2     0x4b67ce0f,B4
           MVKL    .S1     0xfa15267e,A6
           MVKH    .S1     0x40738083,A7
           MVKH    .S1     0xfa15267e,A6
           MVKL    .S2     0x4030624a,B7
           MVKL    .S2     0x2016afed,B6
           ADDDP   .L2     B5:B4,B9:B8,B5:B4 ; |65| 
           MVKH    .S2     0x4030624a,B7
           MVKH    .S2     0x2016afed,B6
           NOP             4
           MPYDP   .M2     B9:B8,B5:B4,B5:B4 ; |65| 
           NOP             9
           NOP             1
           ADDDP   .L1X    A7:A6,B5:B4,A7:A6 ; |65| 
           MVKL    .S2     0xc0880bfe,B5
           MVKL    .S2     0x9c0d9077,B4
           MVKH    .S2     0xc0880bfe,B5
           MVKH    .S2     0x9c0d9077,B4
           NOP             2
           MPYDP   .M1X    B9:B8,A7:A6,A7:A6 ; |65| 
           NOP             9
           ADDDP   .L1X    B5:B4,A7:A6,A7:A6 ; |65| 
           MV      .L2X    A9,B5             ; |67| 
           ZERO    .L2     B4                ; |65| 
           NOP             4
           RCPDP   .S1     A7:A6,A17:A16     ; |65| 
           NOP             1
           MPYDP   .M1     A17:A16,A7:A6,A19:A18 ; |65| 
           NOP             9
           SUBDP   .L1X    B5:B4,A19:A18,A19:A18 ; |65| 
           MPYDP   .M2X    A21:A20,B9:B8,B5:B4 ; |67| 
           NOP             5
           MPYDP   .M1     A17:A16,A19:A18,A17:A16 ; |65| 
           NOP             9
           MPYDP   .M1     A17:A16,A7:A6,A19:A18 ; |65| 
           ADDDP   .S2     B7:B6,B5:B4,B5:B4 ; |67| 
           ZERO    .L2     B7:B6             ; |69| 
           NOP             7
           SUBDP   .L1     A9:A8,A19:A18,A19:A18 ; |65| 
           ZERO    .S1     A8                ; |67| 
           MPYDP   .M2     B9:B8,B5:B4,B5:B4 ; |67| 
           NOP             4
           MPYDP   .M1     A17:A16,A19:A18,A17:A16 ; |65| 
           NOP             9
           MPYDP   .M1     A17:A16,A7:A6,A7:A6 ; |67| 
           NOP             9
           SUBDP   .L1     A9:A8,A7:A6,A7:A6 ; |67| 
           MVKL    .S1     0x12b3b59a,A8
           MVKH    .S1     0x12b3b59a,A8
           MVKL    .S1     0xc05007ff,A9
           MVKH    .S1     0xc05007ff,A9
           NOP             2
           MPYDP   .M1     A17:A16,A7:A6,A7:A6 ; |67| 
           ADDDP   .L2X    A9:A8,B5:B4,B19:B18 ; |67| 
           NOP             9
           MPYDP   .M2X    B19:B18,A7:A6,B5:B4 ; |67| 
           CMPEQDP .S2     B19:B18,B7:B6,B0  ; |69| 
           NOP             8
   [ B0]   ZERO    .L2     B5:B4             ; |70| 
           MPYDP   .M2     B9:B8,B5:B4,B5:B4 ; |136| 
           MVK     .S2     1022,B6           ; |106| 
           SUB     .L2X    A1,B6,B6          ; |106| 
   [!A0]   SUB     .L2     B6,1,B6           ; |126| 
           MVKL    .S1     0xbf2bd010,A7
           MVKL    .S1     0x5c610ca8,A6
           MVKH    .S1     0xbf2bd010,A7
           MVKH    .S1     0x5c610ca8,A6
           NOP             2
           MPYDP   .M2     B17:B16,B5:B4,B9:B8 ; |136| 
           INTDP   .L2     B6,B5:B4          ; |136| 
           NOP             5
           MPYDP   .M2X    A7:A6,B5:B4,B7:B6 ; |136| 
           NOP             2
           ADDDP   .L2     B9:B8,B17:B16,B9:B8 ; |136| 
           MVKL    .S1     0x3fe63000,A7
           MVKH    .S1     0x3fe63000,A7
           ZERO    .L1     A6                ; |136| 
           MPYDP   .M1X    A7:A6,B5:B4,A7:A6 ; |136| 
           NOP             2
           ADDDP   .L2     B9:B8,B7:B6,B5:B4 ; |136| 
           NOP             7
           ADDDP   .L1X    A7:A6,B5:B4,A7:A6 ; |136| 
           MVKL    .S2     0x7fefffff,B5
           MVKH    .S2     0x7fefffff,B5
           MVK     .L2     0xffffffff,B4     ; |138| 
           CMPGTDP .S2X    A5:A4,B5:B4,B0    ; |138| 
           NOP             1
           RET     .S2     B3                ; |143| 
   [ B0]   MVKL    .S1     0xfefa39ef,A6
   [ B0]   MVKL    .S1     0x40862e42,A7
   [ B0]   MVKH    .S1     0xfefa39ef,A6
   [ B0]   MVKH    .S1     0x40862e42,A7

           MV      .L1     A7,A5             ; |142| 
||         MV      .S1     A6,A4             ; |142| 

           ; BRANCH OCCURS {B3}              ; |143| 
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
;*   Local Frame Size  : 8 Args + 104 Auto + 56 Save = 168 byte               *
;******************************************************************************
main:
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 12
           STW     .D2T1   A11,*SP--(8)      ; |143| 
           STW     .D2T1   A10,*SP--(8)      ; |143| 
           STDW    .D2T2   B13:B12,*SP--     ; |143| 
           STDW    .D2T2   B11:B10,*SP--     ; |143| 
           STDW    .D2T1   A15:A14,*SP--     ; |143| 

           STDW    .D2T1   A13:A12,*SP--     ; |143| 
||         MVKL    .S1     $C$SL1+0,A4

           STW     .D2T2   B3,*SP--(120)     ; |143| 
||         CALLP   .S2     driver_init,B3
||         MVKH    .S1     $C$SL1+0,A4

$C$RL0:    ; CALL OCCURS {driver_init} {0}   ; |151| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 3

           MVK     .S2     0xc9,B4
||         MVKL    .S1     a,A10

           MVKH    .S1     a,A10
||         MVKL    .S2     output,B11

           CALL    .S1     acosh             ; |160| 
||         MV      .L1     A10,A11
||         MV      .D1X    B4,A12
||         MVKH    .S2     output,B11
||         ZERO    .L2     B10

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L1:    
;          EXCLUSIVE CPU CYCLES: 5
           LDDW    .D1T1   *A11++,A5:A4      ; |160| 
           ADDKPC  .S2     $C$RL1,B3,3       ; |160| 
$C$RL1:    ; CALL OCCURS {acosh} {0}         ; |160| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 7

           LDW     .D2T2   *B11,B4           ; |160| 
||         SUB     .L1     A12,1,A0          ; |159| 
||         SUB     .S1     A12,1,A12         ; |159| 

   [ A0]   BNOP    .S1     $C$L1,3           ; |159| 

           ADD     .L2     B10,B4,B4         ; |160| 
||         ADD     .S2     8,B10,B10         ; |159| 

   [ A0]   CALL    .S1     acosh             ; |160| 
||         STDW    .D2T1   A5:A4,*B4         ; |160| 
|| [!A0]   MVK     .S2     0xc9,B4

           ; BRANCHCC OCCURS {$C$L1}         ; |159| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 2

           ZERO    .L2     B10
||         MV      .L1     A10,A14
||         ADD     .S2     4,B11,B12

           MV      .L1X    B4,A11
||         CALL    .S1     acoshdp           ; |163| 

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L2:    
;          EXCLUSIVE CPU CYCLES: 5
           LDDW    .D1T1   *A10++,A5:A4      ; |163| 
           ADDKPC  .S2     $C$RL2,B3,3       ; |163| 
$C$RL2:    ; CALL OCCURS {acoshdp} {0}       ; |163| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 7

           LDW     .D2T2   *B12,B4           ; |163| 
||         SUB     .L1     A11,1,A0          ; |162| 
||         SUB     .S1     A11,1,A11         ; |162| 

   [ A0]   BNOP    .S1     $C$L2,3           ; |162| 

           ADD     .L2     B10,B4,B4         ; |163| 
||         ADD     .S2     8,B10,B10         ; |162| 

   [ A0]   CALL    .S1     acoshdp           ; |163| 
||         STDW    .D2T1   A5:A4,*B4         ; |163| 
|| [!A0]   MVK     .S2     0xc9,B4

           ; BRANCHCC OCCURS {$C$L2}         ; |162| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 2

           ADD     .L2     4,B12,B10
||         ZERO    .S2     B12
||         MV      .L1     A14,A10

           MV      .L1X    B4,A11
||         CALL    .S1     acoshdp_c         ; |166| 

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L3:    
;          EXCLUSIVE CPU CYCLES: 5
           LDDW    .D1T1   *A10++,A5:A4      ; |166| 
           ADDKPC  .S2     $C$RL3,B3,3       ; |166| 
$C$RL3:    ; CALL OCCURS {acoshdp_c} {0}     ; |166| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 7

           LDW     .D2T2   *B10,B4           ; |166| 
||         SUB     .L1     A11,1,A0          ; |165| 
||         SUB     .S1     A11,1,A11         ; |165| 

   [ A0]   BNOP    .S1     $C$L3,3           ; |165| 
|| [!A0]   ZERO    .L1     A3
|| [!A0]   ZERO    .D1     A25

           ADD     .L2     B12,B4,B4         ; |166| 
||         ADD     .S2     8,B12,B12         ; |165| 

   [ A0]   CALL    .S2     acoshdp_c         ; |166| 
||         STDW    .D2T1   A5:A4,*B4         ; |166| 
|| [!A0]   MVKL    .S1     0x3fe62e42,A4

           ; BRANCHCC OCCURS {$C$L3}         ; |165| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 8

           MVKL    .S1     0xfefa39ef,A29
||         ZERO    .L1     A31
||         ZERO    .D1     A23
||         MVK     .S2     0xc9,B1
||         ZERO    .L2     B23               ; |204| 
||         ZERO    .D2     B24               ; |204| 

           SET     .S1     A3,0x14,0x1d,A3
||         MVK     .L1     0xffffffff,A27
||         ZERO    .D1     A24               ; |204| 
||         ZERO    .L2     B22               ; |204| 
||         ADD     .S2     4,B10,B10
||         MVK     .D2     0xfffffffe,B12    ; |212| 

           SET     .S1     A25,0x15,0x1d,A25
||         STW     .D2T1   A3,*+SP(24)       ; |204| 
||         ZERO    .L1     A28               ; |204| 
||         ZERO    .D1     A12               ; |204| 
||         ZERO    .L2     B20               ; |204| 

           MVKH    .S1     0x3fe62e42,A4
||         ADD     .L2X    -1,A3,B13
||         STW     .D2T1   A27,*+SP(12)
||         MV      .L1     A25,A27           ; |167| 
||         MV      .D1     A25,A11           ; |167| 

           MVKH    .S1     0xfefa39ef,A29
||         STW     .D2T1   A4,*+SP(32)       ; |209| 
||         MV      .L2X    A25,B21           ; |167| 
||         ZERO    .L1     A26               ; |204| 
||         ZERO    .D1     A10               ; |204| 

           SET     .S1     A31,0x13,0x1d,A31
||         STW     .D2T1   A29,*+SP(28)      ; |209| 
||         MV      .L1     A25,A29           ; |167| 
||         ZERO    .D1     A30               ; |204| 

           SET     .S1     A23,0x0,0x1e,A4
||         MV      .L1     A31,A13           ; |167| 
||         MV      .D1     A31,A15           ; |167| 

           STW     .D2T1   A4,*+SP(16)
||         MV      .L1     A14,A2

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L4:    
;          EXCLUSIVE CPU CYCLES: 184
           LDDW    .D1T1   *A2++,A23:A22     ; |169| 
           LDW     .D2T1   *+SP(24),A5
           MV      .L1X    B23,A4
           ZERO    .L2     B5:B4             ; |173| 
           NOP             1
           MPYDP   .M1     A23:A22,A23:A22,A7:A6 ; |204| 
           NOP             9
           SUBDP   .L1     A7:A6,A5:A4,A5:A4 ; |204| 
           NOP             6
           RSQRDP  .S1     A5:A4,A7:A6       ; |167| 
           CMPEQDP .S2X    A5:A4,B5:B4,B0    ; |173| 
           MPYDP   .M1     A7:A6,A5:A4,A9:A8 ; |167| 
           NOP             9
           MPYDP   .M1     A7:A6,A9:A8,A9:A8 ; |167| 
           NOP             9
           MPYDP   .M1     A25:A24,A9:A8,A9:A8 ; |167| 
           NOP             9
           SUBDP   .L1     A31:A30,A9:A8,A9:A8 ; |167| 
           NOP             6
           MPYDP   .M1     A7:A6,A9:A8,A7:A6 ; |167| 
           NOP             9
           MPYDP   .M1     A7:A6,A5:A4,A9:A8 ; |167| 
           NOP             9
           MPYDP   .M1     A7:A6,A9:A8,A9:A8 ; |167| 
           NOP             9
           MPYDP   .M1     A29:A28,A9:A8,A9:A8 ; |167| 
           NOP             9
           SUBDP   .L1     A13:A12,A9:A8,A9:A8 ; |167| 
           NOP             6
           MPYDP   .M1     A7:A6,A9:A8,A7:A6 ; |167| 
           NOP             9
           MPYDP   .M1     A7:A6,A5:A4,A9:A8 ; |167| 
           NOP             9
           MPYDP   .M1     A7:A6,A9:A8,A7:A6 ; |167| 
           NOP             9
           MPYDP   .M1     A27:A26,A7:A6,A17:A16 ; |167| 
           NOP             7
           MV      .L1X    B22,A6
           MV      .L1     A15,A7
           SUBDP   .L1     A7:A6,A17:A16,A19:A18 ; |167| 
           ABSDP   .S1     A23:A22,A7:A6     ; |201| 
           NOP             1
           MPYDP   .M1     A7:A6,A7:A6,A17:A16 ; |169| 
           MPYDP   .M2X    B21:B20,A7:A6,B5:B4 ; |209| 
           NOP             2
           MPYDP   .M1     A9:A8,A19:A18,A9:A8 ; |167| 
           NOP             7
           CMPEQDP .S1     A5:A4,A17:A16,A0  ; |169| 
           NOP             1

   [ A0]   MV      .L1     A7,A9             ; |170| 
|| [ A0]   MV      .S1     A6,A8             ; |170| 

   [ B0]   ZERO    .L1     A9:A8             ; |174| 
           MPYDP   .M1     A11:A10,A9:A8,A5:A4 ; |209| 
           NOP             9
           ADDDP   .L1X    A5:A4,B5:B4,A5:A4 ; |209| 
           CALL    .S1     logdp_acoshdp_i   ; |209| 
           ADDKPC  .S2     $C$RL4,B3,4       ; |209| 
$C$RL4:    ; CALL OCCURS {logdp_acoshdp_i} {0}  ; |209| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 15

           ZERO    .L1     A3
||         LDW     .D2T1   *+SP(28),A6       ; |209| 

           LDW     .D2T1   *+SP(32),A7       ; |209| 
           LDW     .D2T2   *B10,B4           ; |169| 
           SUB     .L2     B1,1,B1           ; |168| 
           CMPGTDP .S2X    A23:A22,B13:B12,B0 ; |212| 
           SET     .S1     A3,0x0,0x1e,A3
           ADDDP   .L1     A7:A6,A5:A4,A5:A4 ; |209| 
           ADD     .L2     B24,B4,B4         ; |169| 
           ADD     .L2     8,B24,B24         ; |168| 

   [ B1]   BNOP    .S1     $C$L4,3           ; |168| 
|| [!B0]   LDW     .D2T1   *+SP(12),A4       ; |169| 

   [!B0]   MV      .L1     A3,A5             ; |213| 

   [!B1]   CALL    .S1     acoshdp_v         ; |171| 
||         STDW    .D2T1   A5:A4,*B4         ; |169| 

           ; BRANCHCC OCCURS {$C$L4}         ; |168| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           LDW     .D2T2   *+B11(16),B4      ; |171| 
           MV      .L1     A14,A4            ; |171| 
           MVK     .S1     0xc9,A6           ; |171| 
           ADDKPC  .S2     $C$RL5,B3,1       ; |171| 
$C$RL5:    ; CALL OCCURS {acoshdp_v} {0}     ; |171| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 42
           MVKL    .S2     0x3d719799,B7
           MVKL    .S2     0x812dea11,B6
           MVKH    .S2     0x3d719799,B7

           LDW     .D2T1   *B11,A4           ; |66| 
||         MVKH    .S2     0x812dea11,B6

           CALLP   .S2     isequal,B3
||         LDW     .D2T2   *+B11(4),B4       ; |66| 
||         MVK     .S1     0xc9,A6           ; |66| 
||         MVK     .L1     0x5,A8            ; |66| 

$C$RL6:    ; CALL OCCURS {isequal} {0}       ; |66| 
           MVKL    .S1     fcn_pass,A13
           MVKH    .S1     fcn_pass,A13
           MVKL    .S2     0x3d719799,B7

           MV      .L2X    A13,B6            ; |67| 
||         MVKH    .S2     0x3d719799,B7

           STW     .D2T1   A4,*+B6(4)        ; |66| 
||         MVKL    .S2     0x812dea11,B6

           LDW     .D2T2   *+B11(8),B4       ; |67| 
||         MVKH    .S2     0x812dea11,B6

           CALLP   .S2     isequal,B3
||         LDW     .D2T1   *B11,A4           ; |67| 
||         MVK     .S1     0xc9,A6           ; |67| 
||         MVK     .L1     0x5,A8            ; |67| 

$C$RL7:    ; CALL OCCURS {isequal} {0}       ; |67| 
           MVKL    .S2     0x3d719799,B7

           MV      .L2X    A13,B6            ; |68| 
||         MVKH    .S2     0x3d719799,B7

           STW     .D2T1   A4,*+B6(8)        ; |67| 
||         MVKL    .S2     0x812dea11,B6

           MV      .L2     B11,B5
||         LDW     .D2T2   *+B11(12),B4      ; |68| 
||         MVKH    .S2     0x812dea11,B6

           CALLP   .S2     isequal,B3
||         LDW     .D2T1   *B5,A4            ; |68| 
||         MVK     .S1     0xc9,A6           ; |68| 
||         MVK     .L1     0x5,A8            ; |68| 

$C$RL8:    ; CALL OCCURS {isequal} {0}       ; |68| 
           MVKL    .S2     0x812dea11,B6

           MV      .L2X    A13,B4
||         MVKL    .S2     0x3d719799,B7

           ADD     .L1X    4,B10,A3
||         STW     .D2T1   A4,*+B4(12)       ; |68| 
||         MVKH    .S2     0x812dea11,B6

           STW     .D2T1   A3,*+SP(36)
||         MVKH    .S2     0x3d719799,B7

           CALLP   .S2     isequal,B3
||         LDW     .D2T1   *B11,A4           ; |69| 
||         LDW     .D1T2   *A3,B4            ; |69| 
||         MVK     .S1     0xc9,A6           ; |69| 
||         MVK     .L1     0x5,A8            ; |69| 

$C$RL9:    ; CALL OCCURS {isequal} {0}       ; |69| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 12
           ADD     .L1     4,A13,A14
           LDW     .D1T1   *A14,A0           ; |72| 
           MV      .L2X    A13,B4            ; |72| 
           STW     .D2T1   A4,*+B4(16)       ; |69| 
           ADD     .L2X    8,A13,B4
           STW     .D2T2   B4,*+SP(40)       ; |69| 

   [!A0]   B       .S1     $C$L5             ; |72| 
|| [ A0]   LDW     .D2T2   *B4,B0            ; |72| 

   [!A0]   CALL    .S1     print_test_results ; |175| 
   [ A0]   ADD     .L2     4,B4,B4
   [!A0]   MV      .L1     A12,A3
   [!A0]   MVKL    .S2     all_pass,B4
   [!A0]   MVKH    .S2     all_pass,B4
           ; BRANCHCC OCCURS {$C$L5}         ; |72| 
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
||         MVK     .S1     0x1,A3            ; |72| 

   [!A0]   MV      .L1     A12,A3
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           CALL    .S1     print_test_results ; |175| 
           MVKL    .S2     all_pass,B4
           MVKH    .S2     all_pass,B4
           NOP             2
;** --------------------------------------------------------------------------*
$C$L5:    
;          EXCLUSIVE CPU CYCLES: 1

           MVK     .L1     0x1,A4            ; |175| 
||         STW     .D2T1   A3,*B4            ; |72| 
||         ADDKPC  .S2     $C$RL10,B3,0      ; |175| 

$C$RL10:   ; CALL OCCURS {print_test_results} {0}  ; |175| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 13
           LDW     .D2T2   *+SP(24),B5       ; |182| 
           LDW     .D2T1   *+SP(16),A7       ; |182| 
           LDW     .D2T1   *+SP(12),A6       ; |182| 

           MVKL    .S1     a_sc,A3
||         ZERO    .L2     B4                ; |186| 

           MVKH    .S1     a_sc,A3
||         ZERO    .L2     B9
||         STW     .D2T2   B4,*+SP(16)       ; |189| 

           ZERO    .L2     B7
||         STDW    .D1T2   B5:B4,*+A3(32)    ; |186| 
||         SET     .S2     B9,0x14,0x1e,B9
||         ZERO    .D2     B8                ; |184| 

           MVKH    .S2     0xbff00000,B7
||         ZERO    .L2     B6                ; |187| 
||         STDW    .D1T2   B9:B8,*+A3(16)    ; |184| 

           ZERO    .L1     A4
||         STDW    .D1T2   B7:B6,*+A3(40)    ; |187| 

           STDW    .D1T1   A7:A6,*+A3(48)    ; |188| 
||         SET     .S1     A4,0x0,0x1e,A4
||         ZERO    .L1     A5
||         STW     .D2T2   B5,*+SP(20)       ; |186| 
||         ZERO    .L2     B5:B4             ; |182| 

           MV      .L1     A6,A7             ; |188| 
||         MVKH    .S1     0xfff00000,A5
||         STDW    .D1T2   B5:B4,*A3         ; |182| 

           STDW    .D1T1   A7:A6,*+A3(56)    ; |189| 
||         ADD     .L1     1,A4,A7
||         ZERO    .S1     A4                ; |185| 

           ZERO    .L1     A6                ; |186| 
||         ZERO    .L2     B11               ; |191| 
||         STDW    .D1T1   A5:A4,*+A3(24)    ; |185| 

           STDW    .D1T1   A7:A6,*+A3(8)     ; |183| 
||         MV      .L1     A3,A10            ; |182| 
||         MV      .S1     A3,A12            ; |182| 
||         CMPEQ   .L2     B11,2,B0          ; |193| 

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains control code
;*----------------------------------------------------------------------------*
$C$L6:    
;          EXCLUSIVE CPU CYCLES: 6

   [ B0]   B       .S1     $C$L7             ; |193| 
|| [ B0]   MV      .L1     A12,A3
|| [!B0]   LDDW    .D1T1   *A10,A5:A4        ; |193| 

   [!B0]   CALL    .S1     acosh             ; |193| 
   [ B0]   CALL    .S1     acoshdp_c         ; |193| 
   [ B0]   LDDW    .D1T1   *+A3(16),A5:A4    ; |193| 
           NOP             2
           ; BRANCHCC OCCURS {$C$L7}         ; |193| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 1
           ADDKPC  .S2     $C$RL11,B3,0      ; |193| 
$C$RL11:   ; CALL OCCURS {acosh} {0}         ; |193| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 6

           B       .S1     $C$L8             ; |193| 
||         MVKL    .S2     output,B4
||         CMPEQ   .L2     B11,2,B0          ; |194| 
||         MV      .D2X    A4,B6             ; |193| 

           MVKH    .S2     output,B4
||         MV      .L2X    A5,B7             ; |193| 

   [ B0]   BNOP    .S1     $C$L9,3           ; |194| 
||         LDW     .D2T2   *B4,B4            ; |193| 

           ; BRANCH OCCURS {$C$L8}           ; |193| 
;** --------------------------------------------------------------------------*
$C$L7:    
;          EXCLUSIVE CPU CYCLES: 2
           ADDKPC  .S2     $C$RL12,B3,1      ; |193| 
$C$RL12:   ; CALL OCCURS {acoshdp_c} {0}     ; |193| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 6
           MVKL    .S2     output,B4

           MVKH    .S2     output,B4
||         CMPEQ   .L2     B11,2,B0          ; |194| 

   [ B0]   BNOP    .S1     $C$L9,1           ; |194| 
||         LDW     .D2T2   *B4,B4            ; |193| 

           MV      .L2X    A4,B6             ; |193| 
           MV      .L2X    A5,B7             ; |193| 
;** --------------------------------------------------------------------------*
$C$L8:    
;          EXCLUSIVE CPU CYCLES: 2
           NOP             1

   [!B0]   CALL    .S1     acosh             ; |194| 
||         STDW    .D2T2   B7:B6,*+B4[B11]   ; |193| 

           ; BRANCHCC OCCURS {$C$L9}         ; |194| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           LDDW    .D1T1   *A10,A5:A4        ; |194| 
           ADDKPC  .S2     $C$RL13,B3,3      ; |194| 
$C$RL13:   ; CALL OCCURS {acosh} {0}         ; |194| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 6

           B       .S1     $C$L10            ; |194| 
||         MVKL    .S2     output,B12

           MVKH    .S2     output,B12
           LDW     .D2T2   *+B12(4),B6       ; |194| 
           MV      .L2X    A4,B4             ; |194| 
           MV      .L2X    A5,B5             ; |194| 
           NOP             1
           ; BRANCH OCCURS {$C$L10}          ; |194| 
;** --------------------------------------------------------------------------*
$C$L9:    
;          EXCLUSIVE CPU CYCLES: 6

           CALL    .S1     acoshdp_c         ; |194| 
||         MV      .L1     A12,A3

           LDDW    .D1T1   *+A3(16),A5:A4    ; |194| 
           ADDKPC  .S2     $C$RL14,B3,3      ; |194| 
$C$RL14:   ; CALL OCCURS {acoshdp_c} {0}     ; |194| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 6
           MVKL    .S2     output,B12
           MVKH    .S2     output,B12
           LDW     .D2T2   *+B12(4),B6       ; |194| 
           MV      .L2X    A4,B4             ; |194| 
           MV      .L2X    A5,B5             ; |194| 
           NOP             1
;** --------------------------------------------------------------------------*
$C$L10:    
;          EXCLUSIVE CPU CYCLES: 7
           NOP             1

           STDW    .D2T2   B5:B4,*+B6[B11]   ; |194| 
||         CALL    .S1     acoshdp_c         ; |195| 

           LDDW    .D1T1   *A10,A5:A4        ; |195| 
           ADDKPC  .S2     $C$RL15,B3,3      ; |195| 
$C$RL15:   ; CALL OCCURS {acoshdp_c} {0}     ; |195| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 196
           LDW     .D2T2   *+B12(8),B4       ; |195| 
           ZERO    .L1     A7
           SET     .S1     A7,0x14,0x1d,A7
           ZERO    .L1     A6                ; |204| 
           MV      .L2X    A11,B5            ; |167| 
           STDW    .D2T1   A5:A4,*+B4[B11]   ; |195| 
           LDDW    .D1T1   *A10++,A23:A22    ; |196| 
           ZERO    .L2     B4                ; |167| 
           MV      .L2X    A15,B7            ; |167| 
           ZERO    .L2     B6                ; |167| 
           ZERO    .L1     A16               ; |209| 
           MPYDP   .M1     A23:A22,A23:A22,A5:A4 ; |204| 
           MV      .L1     A11,A17           ; |167| 
           NOP             8
           SUBDP   .L1     A5:A4,A7:A6,A5:A4 ; |204| 
           NOP             6
           RSQRDP  .S1     A5:A4,A7:A6       ; |167| 
           NOP             1
           MPYDP   .M1     A7:A6,A5:A4,A9:A8 ; |167| 
           NOP             9
           MPYDP   .M1     A7:A6,A9:A8,A9:A8 ; |167| 
           NOP             9
           NOP             1
           MPYDP   .M2X    B5:B4,A9:A8,B5:B4 ; |167| 
           NOP             9
           SUBDP   .L2     B7:B6,B5:B4,B5:B4 ; |167| 
           MV      .L1     A15,A9            ; |167| 
           ZERO    .L1     A8                ; |167| 
           NOP             4
           MPYDP   .M2X    A7:A6,B5:B4,B5:B4 ; |167| 
           NOP             9
           MPYDP   .M2X    B5:B4,A5:A4,B7:B6 ; |167| 
           MV      .L1     A11,A7            ; |167| 
           ZERO    .L1     A6                ; |167| 
           NOP             7
           MPYDP   .M2     B5:B4,B7:B6,B7:B6 ; |167| 
           NOP             9
           NOP             1
           MPYDP   .M1X    A7:A6,B7:B6,A7:A6 ; |167| 
           NOP             9
           SUBDP   .L1     A9:A8,A7:A6,A7:A6 ; |167| 
           MV      .L2X    A11,B7            ; |167| 
           ZERO    .L2     B6                ; |167| 
           NOP             5
           MPYDP   .M2X    B5:B4,A7:A6,B5:B4 ; |167| 
           NOP             9
           NOP             1
           MPYDP   .M1X    B5:B4,A5:A4,A9:A8 ; |167| 
           ABSDP   .S1     A23:A22,A7:A6     ; |201| 
           NOP             9
           MPYDP   .M2X    B5:B4,A9:A8,B5:B4 ; |167| 
           MPYDP   .M1     A7:A6,A7:A6,A19:A18 ; |169| 
           NOP             8
           MPYDP   .M2     B7:B6,B5:B4,B5:B4 ; |167| 
           CMPEQDP .S1     A5:A4,A19:A18,A0  ; |169| 
           NOP             7
           MV      .L2X    A15,B7            ; |167| 
           SUBDP   .L2     B7:B6,B5:B4,B5:B4 ; |167| 
           MV      .S2X    A11,B7            ; |167| 
           NOP             6
           MPYDP   .M1X    A9:A8,B5:B4,A9:A8 ; |167| 
           NOP             6
           ZERO    .L2     B5:B4             ; |173| 

           CMPEQDP .S2X    A5:A4,B5:B4,B0    ; |173| 
||         MPYDP   .M1X    B7:B6,A7:A6,A5:A4 ; |209| 

           NOP             1

   [ A0]   MV      .L1     A6,A8             ; |170| 
|| [ A0]   MV      .S1     A7,A9             ; |170| 

   [ B0]   ZERO    .L1     A9:A8             ; |174| 
           MPYDP   .M1     A17:A16,A9:A8,A7:A6 ; |209| 
           NOP             9
           ADDDP   .L1     A7:A6,A5:A4,A5:A4 ; |209| 
           CALLP   .S2     logdp_acoshdp_i,B3
$C$RL16:   ; CALL OCCURS {logdp_acoshdp_i} {0}  ; |209| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 22

           MVKL    .S1     0x3fe62e42,A7
||         ADDAW   .D2     B12,3,B4

           MVKL    .S1     0xfefa39ef,A6
           MVKH    .S1     0x3fe62e42,A7
           MVKH    .S1     0xfefa39ef,A6
           ADDDP   .L1     A7:A6,A5:A4,A5:A4 ; |209| 

           MVKL    .S1     0x3fefffff,A7
||         MVK     .D1     0xfffffffe,A6     ; |212| 

           MVKH    .S1     0x3fefffff,A7
           CMPGTDP .S1     A23:A22,A7:A6,A0  ; |212| 
           LDW     .D2T2   *B4,B4            ; |196| 
   [!A0]   LDW     .D2T1   *+SP(12),A4
           ZERO    .S1     A3
           SET     .S1     A3,0x0,0x1e,A3
   [!A0]   MV      .L1     A3,A5             ; |213| 
           NOP             1

           STDW    .D2T1   A5:A4,*+B4[B11]   ; |196| 
||         ADD     .L2     1,B11,B11         ; |191| 

           CMPLT   .L2     B11,8,B0          ; |191| 

   [ B0]   BNOP    .S1     $C$L6,5           ; |191| 
||         CMPEQ   .L2     B11,2,B0          ; |193| 

           ; BRANCHCC OCCURS {$C$L6}         ; |191| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 6

           CALLP   .S2     acoshdp_v,B3
||         LDW     .D2T2   *+B12(16),B4      ; |198| 
||         MV      .L1     A12,A4            ; |198| 
||         MVK     .S1     0x8,A6            ; |198| 

$C$RL17:   ; CALL OCCURS {acoshdp_v} {0}     ; |198| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 42
           MVKL    .S2     0x3d719799,B7
           MVKL    .S2     0x812dea11,B6
           MVKH    .S2     0x3d719799,B7

           LDW     .D2T1   *B12,A4           ; |66| 
||         MVKH    .S2     0x812dea11,B6

           CALLP   .S2     isequal,B3
||         LDW     .D2T2   *+B12(4),B4       ; |66| 
||         MVK     .L1     0x8,A6            ; |66| 
||         MVK     .S1     0x5,A8            ; |66| 

$C$RL18:   ; CALL OCCURS {isequal} {0}       ; |66| 
           MVKL    .S2     0x3d719799,B7
           MVKL    .S2     0x812dea11,B6

           MV      .L1     A13,A3            ; |66| 
||         MVKH    .S2     0x3d719799,B7

           STW     .D1T1   A4,*+A3(4)        ; |66| 
||         LDW     .D2T2   *+B12(8),B4       ; |67| 
||         MVKH    .S2     0x812dea11,B6

           CALLP   .S2     isequal,B3
||         LDW     .D2T1   *B12,A4           ; |67| 
||         MVK     .L1     0x8,A6            ; |67| 
||         MVK     .S1     0x5,A8            ; |67| 

$C$RL19:   ; CALL OCCURS {isequal} {0}       ; |67| 
           MVKL    .S2     0x3d719799,B7
           MVKL    .S2     0x812dea11,B6

           MV      .L1     A13,A3
||         MVKH    .S2     0x3d719799,B7

           MV      .L1X    B12,A5
||         STW     .D1T1   A4,*+A3(8)        ; |67| 
||         MVKH    .S2     0x812dea11,B6

           CALLP   .S2     isequal,B3
||         LDW     .D1T1   *A5,A4            ; |68| 
||         LDW     .D2T2   *+B12(12),B4      ; |68| 
||         MVK     .L1     0x8,A6            ; |68| 
||         MVK     .S1     0x5,A8            ; |68| 

$C$RL20:   ; CALL OCCURS {isequal} {0}       ; |68| 
           LDW     .D2T1   *+SP(36),A3       ; |68| 
           MVKL    .S2     0x812dea11,B6
           MV      .L1     A13,A5
           MVKL    .S2     0x3d719799,B7

           STW     .D1T1   A4,*+A5(12)       ; |68| 
||         MVKH    .S2     0x812dea11,B6

           MV      .L2X    A3,B4             ; |66| 
||         MV      .L1X    B12,A6
||         STW     .D2T1   A3,*+SP(44)       ; |68| 
||         MVKH    .S2     0x3d719799,B7

           CALLP   .S2     isequal,B3
||         LDW     .D2T2   *B4,B4            ; |69| 
||         LDW     .D1T1   *A6,A4            ; |69| 
||         MVK     .L1     0x8,A6            ; |69| 
||         MVK     .S1     0x5,A8            ; |69| 

$C$RL21:   ; CALL OCCURS {isequal} {0}       ; |69| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 12

           LDW     .D2T1   *+SP(40),A3
||         MV      .L2X    A14,B4            ; |69| 

           LDW     .D2T2   *B4,B0            ; |72| 
           MV      .L1     A13,A31           ; |72| 
           STW     .D1T1   A4,*+A31(16)      ; |69| 
           STW     .D2T1   A14,*+SP(48)      ; |69| 
           STW     .D2T1   A3,*+SP(52)       ; |72| 

   [!B0]   ZERO    .L1     A4                ; |72| 
|| [!B0]   B       .S1     $C$L11            ; |72| 
|| [ B0]   LDW     .D2T2   *+SP(52),B4

   [!B0]   CALL    .S1     print_test_results ; |202| 
   [!B0]   MVKL    .S1     all_pass,A3
           MV      .L2     B0,B1             ; guard predicate rewrite
   [!B0]   MVKH    .S1     all_pass,A3

   [ B0]   LDW     .D2T2   *B4,B0            ; |72| 
|| [ B1]   ADD     .L2     4,B4,B4

           ; BRANCHCC OCCURS {$C$L11}        ; |72| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 14
           CMPEQ   .L1     A4,0,A3           ; |72| 
           XOR     .L1     1,A3,A3           ; |72| 
           MVK     .L1     0x1,A4            ; |72| 
           NOP             1
   [ B0]   LDW     .D2T2   *B4,B4            ; |72| 
   [!B0]   ZERO    .L1     A0                ; |72| 
           NOP             3
   [ B0]   CMPEQ   .L2     B4,0,B4           ; |72| 
   [ B0]   XOR     .L2     1,B4,B4           ; |72| 
           NOP             1
   [ B0]   AND     .L1X    A3,B4,A0          ; |72| 
   [!A0]   ZERO    .L1     A4                ; |72| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           CALL    .S1     print_test_results ; |202| 
           MVKL    .S1     all_pass,A3
           MVKH    .S1     all_pass,A3
           NOP             2
;** --------------------------------------------------------------------------*
$C$L11:    
;          EXCLUSIVE CPU CYCLES: 1

           STW     .D1T1   A4,*A3            ; |72| 
||         MVK     .L1     0x3,A4            ; |202| 
||         ADDKPC  .S2     $C$RL22,B3,0      ; |202| 

$C$RL22:   ; CALL OCCURS {print_test_results} {0}  ; |202| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 25
           LDW     .D2T1   *+SP(28),A31      ; |209| 

           LDW     .D2T1   *+SP(24),A29      ; |167| 
||         MVKL    .S2     0x4000cccc,B5

           LDW     .D2T1   *+SP(32),A3       ; |212| 
||         MVKH    .S2     0x4000cccc,B5

           STW     .D2T2   B5,*+SP(112)      ; |211| 
           STW     .D2T2   B10,*+SP(104)     ; |212| 

           STW     .D2T2   B13,*+SP(100)     ; |212| 
||         ZERO    .L1     A5                ; |204| 

           STW     .D2T1   A5,*+SP(72)
||         ZERO    .L1     A4                ; |204| 

           STW     .D2T1   A4,*+SP(80)
||         ZERO    .L1     A28               ; |204| 

           STW     .D2T1   A28,*+SP(64)      ; |204| 

           STW     .D2T1   A28,*+SP(56)
||         MV      .L1     A15,A30           ; |209| 

           STW     .D2T1   A30,*+SP(60)      ; |167| 
           STW     .D2T1   A30,*+SP(76)      ; |167| 

           STW     .D2T1   A30,*+SP(88)      ; |167| 
||         MV      .L1     A11,A25           ; |167| 

           STW     .D2T1   A25,*+SP(84)      ; |167| 
           STW     .D2T1   A25,*+SP(68)      ; |167| 

           STW     .D2T1   A4,*+SP(28)       ; |204| 
||         MVK     .S2     0x3bd,B30

           STW     .D2T2   B30,*+SP(24)
||         MVKL    .S2     0xcccccccd,B31

           LDW     .D2T2   *+SP(20),B5       ; |205| 
||         MVKH    .S2     0xcccccccd,B31

           STW     .D2T2   B31,*+SP(108)     ; |211| 

           STW     .D2T1   A31,*+SP(92)      ; |209| 
||         MVKL    .S2     a_ext,B4

           STW     .D2T1   A3,*+SP(96)       ; |209| 
||         MVKH    .S2     a_ext,B4

           STW     .D2T1   A29,*+SP(32)      ; |204| 
||         MVK     .L2     0xfffffffe,B29    ; |212| 

           STW     .D2T2   B29,*+SP(20)      ; |205| 
||         ZERO    .L2     B4                ; |204| 
||         MV      .L1X    B4,A15            ; |205| 
||         MV      .S2     B4,B6             ; |205| 

           CALL    .S1     acosh             ; |207| 
||         STDW    .D2T2   B5:B4,*B6         ; |205| 
||         ZERO    .L1     A12               ; |204| 
||         MV      .L2     B12,B11           ; |204| 

           LDDW    .D1T1   *A15,A5:A4        ; |207| 
||         ZERO    .L2     B12               ; |204| 
||         ZERO    .S2     B10               ; |204| 
||         MV      .D2X    A11,B13           ; |167| 
||         MV      .L1     A11,A13           ; |167| 
||         ZERO    .S1     A10               ; |204| 

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
$C$L12:    
;          EXCLUSIVE CPU CYCLES: 4
           ADDKPC  .S2     $C$RL23,B3,3      ; |207| 
$C$RL23:   ; CALL OCCURS {acosh} {0}         ; |207| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 217
           LDW     .D2T2   *B11,B4           ; |207| 
           NOP             4
           ADD     .L2     B10,B4,B4         ; |207| 
           STDW    .D2T1   A5:A4,*B4         ; |207| 

           CALLP   .S2     acoshdp,B3
||         LDDW    .D1T1   *A15,A5:A4        ; |208| 

$C$RL24:   ; CALL OCCURS {acoshdp} {0}       ; |208| 
           LDW     .D2T2   *+B11(4),B4       ; |208| 
           NOP             4
           ADD     .L2     B10,B4,B4         ; |208| 
           STDW    .D2T1   A5:A4,*B4         ; |208| 

           CALLP   .S2     acoshdp_c,B3
||         LDDW    .D1T1   *A15,A5:A4        ; |209| 

$C$RL25:   ; CALL OCCURS {acoshdp_c} {0}     ; |209| 
           LDW     .D2T2   *+B11(8),B4       ; |209| 
           NOP             4
           ADD     .L2     B10,B4,B4         ; |209| 
           STDW    .D2T1   A5:A4,*B4         ; |209| 
           LDDW    .D1T1   *A15,A23:A22      ; |210| 
           LDW     .D2T1   *+SP(32),A5
           MV      .L1     A12,A4            ; |204| 
           ZERO    .L2     B5:B4             ; |173| 
           NOP             1
           MPYDP   .M1     A23:A22,A23:A22,A7:A6 ; |204| 
           NOP             9
           SUBDP   .L1     A7:A6,A5:A4,A5:A4 ; |204| 
           NOP             6
           RSQRDP  .S1     A5:A4,A9:A8       ; |167| 
           CMPEQDP .S2X    A5:A4,B5:B4,B0    ; |173| 
           MPYDP   .M1     A9:A8,A5:A4,A7:A6 ; |167| 
           NOP             9
           MPYDP   .M1     A9:A8,A7:A6,A17:A16 ; |167| 
           NOP             8

           MV      .L1     A13,A7            ; |167| 
||         MV      .S1     A12,A6            ; |167| 

           MPYDP   .M1     A7:A6,A17:A16,A17:A16 ; |167| 
           LDW     .D2T1   *+SP(60),A7
           NOP             8
           SUBDP   .L1     A7:A6,A17:A16,A7:A6 ; |167| 
           NOP             6
           MPYDP   .M1     A9:A8,A7:A6,A9:A8 ; |167| 
           NOP             9
           MPYDP   .M1     A9:A8,A5:A4,A7:A6 ; |167| 
           NOP             9
           MPYDP   .M1     A9:A8,A7:A6,A17:A16 ; |167| 
           NOP             8

           MV      .L1     A13,A7            ; |167| 
||         MV      .S1     A12,A6            ; |167| 

           MPYDP   .M1     A7:A6,A17:A16,A17:A16 ; |167| 
           LDW     .D2T1   *+SP(76),A7
           NOP             8
           SUBDP   .L1     A7:A6,A17:A16,A7:A6 ; |167| 
           NOP             6
           MPYDP   .M1     A9:A8,A7:A6,A7:A6 ; |167| 
           NOP             9
           MPYDP   .M1     A7:A6,A5:A4,A9:A8 ; |167| 
           NOP             9
           MPYDP   .M1     A7:A6,A9:A8,A7:A6 ; |167| 
           NOP             9
           MPYDP   .M1     A13:A12,A7:A6,A17:A16 ; |167| 
           LDW     .D2T1   *+SP(88),A7
           NOP             7
           MV      .L1     A12,A6            ; |167| 
           SUBDP   .L1     A7:A6,A17:A16,A19:A18 ; |167| 
           ABSDP   .S1     A23:A22,A7:A6     ; |201| 
           NOP             1
           MPYDP   .M1     A7:A6,A7:A6,A17:A16 ; |169| 
           MPYDP   .M2X    B13:B12,A7:A6,B5:B4 ; |209| 
           NOP             2
           MPYDP   .M1     A9:A8,A19:A18,A9:A8 ; |167| 
           NOP             7
           CMPEQDP .S1     A5:A4,A17:A16,A0  ; |169| 
           NOP             1

   [ A0]   MV      .L1     A6,A8             ; |170| 
|| [ A0]   MV      .S1     A7,A9             ; |170| 

   [ B0]   ZERO    .L1     A9:A8             ; |174| 
           MPYDP   .M1     A11:A10,A9:A8,A5:A4 ; |209| 
           NOP             9
           ADDDP   .L1X    A5:A4,B5:B4,A5:A4 ; |209| 
           CALLP   .S2     logdp_acoshdp_i,B3
$C$RL26:   ; CALL OCCURS {logdp_acoshdp_i} {0}  ; |209| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 36
           LDW     .D2T2   *+SP(104),B4      ; |209| 
           LDW     .D2T1   *+SP(96),A7       ; |209| 
           LDW     .D2T1   *+SP(92),A6       ; |209| 
           LDW     .D2T2   *+SP(100),B5
           ZERO    .L1     A3
           LDW     .D2T2   *B4,B6            ; |210| 
           LDW     .D2T2   *+SP(20),B4
           ADDDP   .L1     A7:A6,A5:A4,A5:A4 ; |209| 
           SET     .S1     A3,0x0,0x1e,A3
           NOP             2
           CMPGTDP .S2X    A23:A22,B5:B4,B0  ; |212| 
           ADD     .L2     B10,B6,B29        ; |210| 
   [!B0]   LDW     .D2T1   *+SP(12),A4       ; |213| 
           LDW     .D2T2   *+SP(108),B4
           LDW     .D2T2   *+SP(112),B5
   [!B0]   MV      .L1     A3,A5             ; |213| 
           LDW     .D2T2   *+SP(24),B6
           STDW    .D2T1   A5:A4,*B29        ; |210| 
           LDDW    .D1T1   *A15,A5:A4        ; |211| 
           ADD     .L2     8,B10,B10         ; |206| 
           NOP             3
           MPYDP   .M2X    B5:B4,A5:A4,B5:B4 ; |211| 
           SUB     .L2     B6,1,B28          ; |206| 
           SUB     .L1X    B6,1,A0           ; |206| 
           NOP             3
   [ A0]   BNOP    .S1     $C$L12,3          ; |206| 

   [ A0]   CALL    .S1     acosh             ; |207| 
||         STDW    .D1T2   B5:B4,*++A15      ; |211| 

   [!A0]   CALL    .S1     acoshdp_v         ; |213| 
|| [ A0]   LDDW    .D1T1   *A15,A5:A4        ; |207| 
||         STW     .D2T2   B28,*+SP(24)      ; |211| 

           ; BRANCHCC OCCURS {$C$L12}        ; |206| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           LDW     .D2T2   *+B11(16),B4      ; |213| 
           MVKL    .S1     a_ext,A4
           MVKH    .S1     a_ext,A4
           MVK     .S1     0x3bd,A6          ; |213| 
           ADDKPC  .S2     $C$RL27,B3,0      ; |213| 
$C$RL27:   ; CALL OCCURS {acoshdp_v} {0}     ; |213| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 43
           MVKL    .S2     0x3d719799,B7
           MVKL    .S2     0x812dea11,B6
           MVKH    .S2     0x3d719799,B7

           LDW     .D2T1   *B11,A4           ; |66| 
||         MVKH    .S2     0x812dea11,B6

           CALLP   .S2     isequal,B3
||         LDW     .D2T2   *+B11(4),B4       ; |66| 
||         MVK     .S1     0x3bd,A6          ; |66| 
||         MVK     .L1     0x5,A8            ; |66| 

$C$RL28:   ; CALL OCCURS {isequal} {0}       ; |66| 
           MVKL    .S2     fcn_pass,B10
           MVKL    .S2     0x3d719799,B7
           MVKH    .S2     fcn_pass,B10
           MVKL    .S2     0x812dea11,B6

           LDW     .D2T2   *+B11(8),B4       ; |67| 
||         MVKH    .S2     0x3d719799,B7

           STW     .D2T1   A4,*+B10(4)       ; |66| 
||         MVKH    .S2     0x812dea11,B6

           CALLP   .S2     isequal,B3
||         LDW     .D2T1   *B11,A4           ; |67| 
||         MVK     .S1     0x3bd,A6          ; |67| 
||         MVK     .L1     0x5,A8            ; |67| 

$C$RL29:   ; CALL OCCURS {isequal} {0}       ; |67| 
           MVKL    .S2     0x3d719799,B7
           MVKL    .S2     0x812dea11,B6
           MVKH    .S2     0x3d719799,B7

           MV      .L1X    B11,A3            ; |213| 
||         STW     .D2T1   A4,*+B10(8)       ; |67| 
||         MVKH    .S2     0x812dea11,B6

           CALLP   .S2     isequal,B3
||         LDW     .D1T1   *A3,A4            ; |68| 
||         LDW     .D2T2   *+B11(12),B4      ; |68| 
||         MVK     .S1     0x3bd,A6          ; |68| 
||         MVK     .L1     0x5,A8            ; |68| 

$C$RL30:   ; CALL OCCURS {isequal} {0}       ; |68| 
           LDW     .D2T1   *+SP(36),A3       ; |68| 
           MVKL    .S2     0x3d719799,B7
           MVKL    .S2     0x812dea11,B6
           MVKH    .S2     0x3d719799,B7

           STW     .D2T1   A4,*+B10(12)      ; |68| 
||         MVKH    .S2     0x812dea11,B6

           CALLP   .S2     isequal,B3
||         LDW     .D1T2   *A3,B4            ; |69| 
||         LDW     .D2T1   *B11,A4           ; |69| 
||         MVK     .S1     0x3bd,A6          ; |69| 
||         MVK     .L1     0x5,A8            ; |69| 

$C$RL31:   ; CALL OCCURS {isequal} {0}       ; |69| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 11

           LDW     .D1T1   *A14,A0           ; |72| 
||         LDW     .D2T2   *+SP(40),B4

           STW     .D2T1   A4,*+B10(16)      ; |69| 
           NOP             3

   [ A0]   ADD     .L2     4,B4,B4
|| [!A0]   B       .S1     $C$L13            ; |72| 
|| [ A0]   LDW     .D2T2   *B4,B0            ; |72| 

   [!A0]   CALL    .S1     print_test_results ; |219| 
   [!A0]   MVKL    .S1     all_pass,A3
   [!A0]   MVKH    .S1     all_pass,A3
   [!A0]   MV      .L2     B12,B4
   [!A0]   MV      .L2X    A3,B5
           ; BRANCHCC OCCURS {$C$L13}        ; |72| 
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

   [!A0]   MV      .L2     B12,B4
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           CALL    .S1     print_test_results ; |219| 
           MVKL    .S1     all_pass,A3
           MVKH    .S1     all_pass,A3
           NOP             1
           MV      .L2X    A3,B5
;** --------------------------------------------------------------------------*
$C$L13:    
;          EXCLUSIVE CPU CYCLES: 1

           MVK     .L1     0x4,A4            ; |219| 
||         STW     .D2T2   B4,*B5            ; |72| 
||         ADDKPC  .S2     $C$RL32,B3,0      ; |219| 

$C$RL32:   ; CALL OCCURS {print_test_results} {0}  ; |219| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 15
           MVKL    .S1     cycle_counts+24,A3

           MVKH    .S1     cycle_counts+24,A3
||         MV      .L2     B12,B4            ; |114| 
||         MV      .L1     A10,A11           ; |114| 

           MVC     .S2     B4,TSCL           ; |115| 
||         STDW    .D1T1   A11:A10,*A3       ; |114| 

           MVC     .S2     TSCL,B6           ; |116| 
           MVC     .S2     TSCH,B4           ; |116| 
           MVKL    .S1     t_start,A3

           MVKH    .S1     t_start,A3
||         MV      .L2     B4,B7             ; |116| 

           MVC     .S2     TSCL,B4           ; |117| 
||         STDW    .D1T2   B7:B6,*A3         ; |116| 

           MVC     .S2     TSCH,B8           ; |117| 

           MVKL    .S1     t_offset,A3
||         SUBU    .L2     B4,B6,B5:B4       ; |117| 

           CALL    .S1     gimme_random      ; |229| 
||         EXT     .S2     B5,24,24,B6       ; |117| 
||         SUB     .L2     B8,B7,B31         ; |117| 

           ADD     .L2     B31,B6,B5         ; |117| 
||         MVKH    .S1     t_offset,A3

           MVK     .S2     0x80,B4
||         STDW    .D1T2   B5:B4,*A3         ; |117| 

           ZERO    .L2     B5

           MV      .L2     B12,B4            ; |229| 
||         MV      .L1X    B4,A15            ; |117| 
||         MVKH    .S2     0xbff00000,B5
||         MV      .D1     A10,A4            ; |229| 
||         MV      .D2     B12,B10
||         MVKL    .S1     0x412e8482,A5

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L14:    
;          EXCLUSIVE CPU CYCLES: 1

           ADDKPC  .S2     $C$RL33,B3,0      ; |229| 
||         MVKH    .S1     0x412e8482,A5

$C$RL33:   ; CALL OCCURS {gimme_random} {0}  ; |229| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 196
           MVKL    .S2     input,B4
           MVKH    .S2     input,B4
           LDW     .D2T2   *B4,B4            ; |229| 
           NOP             4
           ADD     .L2     B10,B4,B4         ; |229| 

           STDW    .D2T1   A5:A4,*B4         ; |229| 
||         MVC     .S2     TSCL,B20          ; |122| 

           MVC     .S2     TSCH,B21          ; |122| 

           MV      .L1     A5,A23            ; |233| 
||         MV      .S1     A4,A22            ; |233| 

           MPYDP   .M1     A23:A22,A23:A22,A5:A4 ; |204| 
           ZERO    .L1     A7
           SET     .S1     A7,0x14,0x1d,A7
           MV      .L1     A10,A6            ; |204| 
           MV      .L2     B13,B5            ; |167| 
           MV      .L2     B12,B4            ; |167| 
           ZERO    .L2     B31
           ZERO    .L1     A31
           ZERO    .L1     A12               ; |209| 
           NOP             1
           SUBDP   .L1     A5:A4,A7:A6,A7:A6 ; |204| 
           NOP             6
           RSQRDP  .S1     A7:A6,A5:A4       ; |167| 
           NOP             1
           MPYDP   .M1     A5:A4,A7:A6,A9:A8 ; |167| 
           NOP             9
           MPYDP   .M1     A5:A4,A9:A8,A9:A8 ; |167| 
           NOP             9
           NOP             1
           MPYDP   .M2X    B5:B4,A9:A8,B7:B6 ; |167| 
           NOP             8
           SET     .S2     B31,0x13,0x1d,B5
           SUBDP   .L2     B5:B4,B7:B6,B5:B4 ; |167| 
           MV      .L1     A10,A8            ; |167| 
           SET     .S1     A31,0x13,0x1d,A9
           NOP             4
           MPYDP   .M2X    A5:A4,B5:B4,B5:B4 ; |167| 
           NOP             9
           MPYDP   .M2X    B5:B4,A7:A6,B7:B6 ; |167| 
           MV      .L1     A13,A5            ; |167| 
           MV      .L1     A10,A4            ; |167| 
           NOP             7
           MPYDP   .M2     B5:B4,B7:B6,B7:B6 ; |167| 
           NOP             9
           NOP             1
           MPYDP   .M1X    A5:A4,B7:B6,A5:A4 ; |167| 
           NOP             9
           SUBDP   .L1     A9:A8,A5:A4,A5:A4 ; |167| 
           MV      .L2     B13,B7            ; |167| 
           MV      .L2     B12,B6            ; |167| 
           NOP             5
           MPYDP   .M2X    B5:B4,A5:A4,B5:B4 ; |167| 
           NOP             9
           NOP             1
           MPYDP   .M1X    B5:B4,A7:A6,A5:A4 ; |167| 
           NOP             9
           NOP             1
           MPYDP   .M2X    B5:B4,A5:A4,B5:B4 ; |167| 
           NOP             9
           MPYDP   .M2     B7:B6,B5:B4,B5:B4 ; |167| 
           NOP             8
           MV      .L2X    A9,B7             ; |167| 
           SUBDP   .L2     B7:B6,B5:B4,B5:B4 ; |167| 
           ABSDP   .S1     A23:A22,A9:A8     ; |201| 
           NOP             2
           MPYDP   .M1     A9:A8,A9:A8,A17:A16 ; |169| 
           NOP             3
           MPYDP   .M1X    A5:A4,B5:B4,A5:A4 ; |167| 
           NOP             5

           MV      .L2     B6,B4             ; |167| 
||         MV      .S2     B13,B5            ; |167| 

           ZERO    .L2     B7:B6             ; |173| 

           CMPEQDP .S1     A7:A6,A17:A16,A0  ; |169| 
||         CMPEQDP .S2X    A7:A6,B7:B6,B0    ; |173| 
||         MPYDP   .M1X    B5:B4,A9:A8,A7:A6 ; |209| 

           NOP             1

   [ A0]   MV      .L1     A8,A4             ; |170| 
|| [ A0]   MV      .S1     A9,A5             ; |170| 

   [ B0]   ZERO    .L1     A5:A4             ; |174| 
           MPYDP   .M1     A13:A12,A5:A4,A5:A4 ; |209| 
           NOP             9
           ADDDP   .L1     A5:A4,A7:A6,A5:A4 ; |209| 
           CALLP   .S2     logdp_acoshdp_i,B3
$C$RL34:   ; CALL OCCURS {logdp_acoshdp_i} {0}  ; |209| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 30

           MVKL    .S1     0x3fe62e42,A9
||         MVK     .L1     0xfffffffe,A6     ; |212| 
||         MVKL    .S2     output+12,B4
||         ZERO    .D1     A3

           MVKL    .S1     0xfefa39ef,A8
||         MVKH    .S2     output+12,B4

           MVKH    .S1     0x3fe62e42,A9
||         LDW     .D2T2   *B4,B4            ; |233| 

           MVKH    .S1     0xfefa39ef,A8

           MVKL    .S1     0x3fefffff,A7
||         ADDDP   .L1     A9:A8,A5:A4,A5:A4 ; |209| 

           MVKH    .S1     0x3fefffff,A7
           CMPGTDP .S1     A23:A22,A7:A6,A0  ; |212| 
           ADD     .L2     B10,B4,B4         ; |233| 

   [!A0]   LDW     .D2T1   *+SP(12),A4       ; |233| 
||         SET     .S1     A3,0x0,0x1e,A3

           MVKL    .S1     t_start,A30
           MVKH    .S1     t_start,A30

   [!A0]   MV      .L1     A3,A5             ; |213| 
||         STDW    .D1T2   B21:B20,*A30

           NOP             1

           STDW    .D2T1   A5:A4,*B4         ; |233| 
||         MVC     .S2     TSCL,B16          ; |128| 

           MVC     .S2     TSCH,B8           ; |128| 

           MVKL    .S2     t_offset,B11
||         SUB     .L1     A15,1,A0          ; |227| 
||         MV      .L2     B8,B17            ; |128| 
||         MVKL    .S1     t_stop,A3

           MVKH    .S2     t_offset,B11
||         MVKH    .S1     t_stop,A3

           LDDW    .D2T2   *B11,B7:B6        ; |130| 
||         MVKL    .S2     cycle_counts+24,B9

           MVKH    .S2     cycle_counts+24,B9
||         STDW    .D1T2   B17:B16,*A3       ; |128| 

           LDDW    .D2T1   *B9,A7:A6         ; |130| 
           MV      .L1X    B9,A14            ; |130| 
           NOP             1
           ADDU    .L2     B6,B20,B5:B4      ; |130| 

           ADD     .S2     B5,B7,B6          ; |130| 
||         SUBU    .L2     B16,B4,B5:B4      ; |130| 

           ADD     .L2     B6,B21,B6         ; |130| 
|| [ A0]   B       .S1     $C$L14            ; |227| 

           SUB     .L2     B17,B6,B5         ; |130| 
||         EXT     .S2     B5,24,24,B6       ; |130| 
|| [ A0]   CALL    .S1     gimme_random      ; |229| 
||         ADDU    .L1X    A6,B4,A5:A4       ; |130| 

           ADD     .L2     B5,B6,B4          ; |130| 
||         ADD     .L1     A5,A7,A5          ; |130| 
|| [ A0]   ZERO    .S2     B5

   [ A0]   MVKH    .S2     0xbff00000,B5

           ADD     .L1X    A5,B4,A5          ; |130| 
||         SUB     .S1     A15,1,A15         ; |227| 
|| [ A0]   MV      .L2     B12,B4            ; |229| 

           STDW    .D1T1   A5:A4,*A14        ; |130| 
|| [ A0]   MVKL    .S1     0x412e8482,A5
||         ADD     .L2     8,B10,B10         ; |227| 
|| [ A0]   MV      .L1     A10,A4            ; |229| 

           ; BRANCHCC OCCURS {$C$L14}        ; |227| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 6

           CALLP   .S2     __c6xabi_fltllif,B3
||         LDDW    .D1T1   *A14,A5:A4        ; |135| 

$C$RL35:   ; CALL OCCURS {__c6xabi_fltllif} {0}  ; |135| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 15
           ZERO    .L1     A3
           SET     .S1     A3,0x1a,0x1d,A3
           MPYSP   .M1     A3,A4,A3          ; |135| 
           NOP             3
           SPDP    .S1     A3,A5:A4          ; |135| 
           NOP             1
           ADDDP   .L1     A13:A12,A5:A4,A5:A4 ; |135| 
           CALLP   .S2     __c6xabi_fixdlli,B3
$C$RL36:   ; CALL OCCURS {__c6xabi_fixdlli} {0}  ; |135| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 11
           SUBAW   .D1     A14,6,A3

           STDW    .D1T1   A11:A10,*A3       ; |114| 
||         MV      .L2     B12,B5            ; |114| 
||         MV      .S2X    A14,B4

           MVC     .S2     B5,TSCL           ; |115| 
||         STDW    .D2T1   A5:A4,*B4         ; |135| 

           MVC     .S2     TSCL,B5           ; |116| 
           MVC     .S2     TSCH,B4           ; |116| 
           MVC     .S2     TSCL,B6           ; |117| 
           MVC     .S2     TSCH,B8           ; |117| 
           SUBU    .L2     B6,B5,B7:B6       ; |117| 

           EXT     .S2     B7,24,24,B5       ; |117| 
||         SUB     .L2     B8,B4,B4          ; |117| 

           ADD     .L2     B4,B5,B7          ; |117| 

           STDW    .D2T2   B7:B6,*B11        ; |117| 
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
$C$L15:    
;          EXCLUSIVE CPU CYCLES: 15
           MVC     .S2     TSCL,B4           ; |122| 
           MVC     .S2     TSCH,B5           ; |122| 
           MVKL    .S1     input,A3
           MVKH    .S1     input,A3
           LDW     .D1T1   *A3,A3            ; |242| 
           MVKL    .S2     t_start,B6
           MVKH    .S2     t_start,B6
           STDW    .D2T2   B5:B4,*B6         ; |122| 
           NOP             1

           ADD     .L1     A12,A3,A3         ; |242| 
||         CALL    .S1     acosh             ; |242| 

           LDDW    .D1T1   *A3,A5:A4         ; |242| 
           ADDKPC  .S2     $C$RL37,B3,3      ; |242| 
$C$RL37:   ; CALL OCCURS {acosh} {0}         ; |242| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 24
           MVKL    .S2     output,B10
           MVKH    .S2     output,B10
           LDW     .D2T2   *B10,B4           ; |242| 
           NOP             4
           ADD     .L1X    A12,B4,A3         ; |242| 

           STDW    .D1T1   A5:A4,*A3         ; |242| 
||         MVC     .S2     TSCL,B16          ; |128| 

           MVC     .S2     TSCH,B4           ; |128| 

           MVKL    .S2     t_start,B5
||         MV      .L1X    B11,A15           ; |128| 
||         MVKL    .S1     cycle_counts,A3
||         SUB     .D1     A14,1,A0          ; |240| 
||         MV      .L2     B4,B17            ; |128| 

           MVKH    .S2     t_start,B5
||         LDDW    .D1T1   *A15,A5:A4        ; |130| 
||         MVKH    .S1     cycle_counts,A3
||         SUB     .L1     A14,1,A14         ; |240| 

           ADD     .L1     8,A12,A12         ; |240| 
||         LDDW    .D2T2   *B5,B7:B6         ; |130| 

           MVKL    .S1     t_stop,A31
           LDDW    .D1T1   *A3,A7:A6         ; |130| 
           MVKH    .S1     t_stop,A31
           STDW    .D1T2   B17:B16,*A31      ; |128| 

           ADDU    .L2X    A4,B6,B9:B8       ; |130| 
||         MVKL    .S2     cycle_counts,B6

   [ A0]   B       .S1     $C$L15            ; |240| 
||         SUBU    .L2     B16,B8,B5:B4      ; |130| 
||         ADD     .D2X    B9,A5,B8          ; |130| 
||         MVKH    .S2     cycle_counts,B6

           ADD     .D2     B8,B7,B7          ; |130| 
||         EXT     .S2     B5,24,24,B8       ; |130| 
||         ADDU    .L2X    A6,B4,B5:B4       ; |130| 

           SUB     .L2     B17,B7,B7         ; |130| 
||         ADD     .S2X    B5,A7,B5          ; |130| 
|| [!A0]   MV      .L1X    B6,A14

           ADD     .L2     B7,B8,B7          ; |130| 
           ADD     .L2     B5,B7,B5          ; |130| 

   [!A0]   CALL    .S1     __c6xabi_fltllif  ; |135| 
||         STDW    .D2T2   B5:B4,*B6         ; |130| 

           ; BRANCHCC OCCURS {$C$L15}        ; |240| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           LDDW    .D1T1   *A14,A5:A4        ; |135| 
           ADDKPC  .S2     $C$RL38,B3,3      ; |135| 
$C$RL38:   ; CALL OCCURS {__c6xabi_fltllif} {0}  ; |135| 
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
$C$RL39:   ; CALL OCCURS {__c6xabi_fixdlli} {0}  ; |135| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 10

           STDW    .D1T1   A11:A10,*+A14(16) ; |114| 
||         MV      .L2     B12,B4            ; |114| 

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
||         MV      .S2X    A15,B7            ; |117| 

           STDW    .D2T2   B5:B4,*B7         ; |117| 
||         MV      .L2X    A3,B11            ; |117| 

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
;          EXCLUSIVE CPU CYCLES: 15
           MVC     .S2     TSCL,B4           ; |122| 
           MVC     .S2     TSCH,B5           ; |122| 
           MVKL    .S1     input,A3
           MVKH    .S1     input,A3
           LDW     .D1T1   *A3,A3            ; |251| 
           MVKL    .S2     t_start,B6
           MVKH    .S2     t_start,B6
           STDW    .D2T2   B5:B4,*B6         ; |122| 
           NOP             1

           ADD     .L1     A12,A3,A3         ; |251| 
||         CALL    .S1     acoshdp_c         ; |251| 

           LDDW    .D1T1   *A3,A5:A4         ; |251| 
           ADDKPC  .S2     $C$RL40,B3,3      ; |251| 
$C$RL40:   ; CALL OCCURS {acoshdp_c} {0}     ; |251| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 23
           ADDAD   .D2     B10,1,B4
           LDW     .D2T2   *B4,B4            ; |251| 
           NOP             4
           ADD     .L1X    A12,B4,A3         ; |251| 

           STDW    .D1T1   A5:A4,*A3         ; |251| 
||         MVC     .S2     TSCL,B16          ; |128| 

           MVC     .S2     TSCH,B8           ; |128| 

           MVKL    .S2     t_start,B4
||         LDDW    .D1T1   *A15,A5:A4        ; |130| 
||         SUB     .L1X    B11,1,A0          ; |249| 
||         MVKL    .S1     t_stop,A31
||         MV      .L2     B8,B17            ; |128| 
||         SUB     .D2     B11,1,B11         ; |249| 

           MVKH    .S2     t_start,B4
||         ADDAD   .D1     A14,2,A3
||         MVKH    .S1     t_stop,A31
||         ADD     .L1     8,A12,A12         ; |249| 

           LDDW    .D2T2   *B4,B7:B6         ; |130| 
           MVK     .S2     16,B12
           LDDW    .D1T1   *A3,A7:A6         ; |130| 
           STDW    .D1T2   B17:B16,*A31      ; |128| 
           ADD     .L2X    A14,B12,B12
           ADDU    .L2X    A4,B6,B5:B4       ; |130| 

           ADD     .S2X    B5,A5,B6          ; |130| 
|| [ A0]   B       .S1     $C$L16            ; |249| 
||         SUBU    .L2     B16,B4,B5:B4      ; |130| 

           ADD     .D2     B6,B7,B6          ; |130| 
||         EXT     .S2     B5,24,24,B7       ; |130| 
||         ADDU    .L2X    A6,B4,B5:B4       ; |130| 

           SUB     .L2     B8,B6,B6          ; |130| 
||         ADD     .S2X    B5,A7,B5          ; |130| 

           ADD     .L2     B6,B7,B6          ; |130| 
           ADD     .L2     B5,B6,B5          ; |130| 

   [!A0]   CALL    .S1     __c6xabi_fltllif  ; |135| 
||         STDW    .D2T2   B5:B4,*B12        ; |130| 

           ; BRANCHCC OCCURS {$C$L16}        ; |249| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           LDDW    .D1T1   *+A14(16),A5:A4   ; |135| 
           ADDKPC  .S2     $C$RL41,B3,3      ; |135| 
$C$RL41:   ; CALL OCCURS {__c6xabi_fltllif} {0}  ; |135| 
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
$C$RL42:   ; CALL OCCURS {__c6xabi_fixdlli} {0}  ; |135| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 10

           STDW    .D1T1   A11:A10,*+A14(8)  ; |114| 
||         MV      .L2X    A11,B4            ; |114| 

           MVC     .S2     B4,TSCL           ; |115| 
||         STDW    .D2T1   A5:A4,*B12        ; |135| 

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
||         MV      .L2X    A3,B11            ; |117| 

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L17:    
;          EXCLUSIVE CPU CYCLES: 15
           MVC     .S2     TSCL,B4           ; |122| 
           MVC     .S2     TSCH,B5           ; |122| 
           MVKL    .S1     input,A3
           MVKH    .S1     input,A3
           LDW     .D1T1   *A3,A3            ; |260| 
           MVKL    .S2     t_start,B6
           MVKH    .S2     t_start,B6
           STDW    .D2T2   B5:B4,*B6         ; |122| 
           NOP             1

           ADD     .L1     A12,A3,A3         ; |260| 
||         CALL    .S1     acoshdp           ; |260| 

           LDDW    .D1T1   *A3,A5:A4         ; |260| 
           ADDKPC  .S2     $C$RL43,B3,3      ; |260| 
$C$RL43:   ; CALL OCCURS {acoshdp} {0}       ; |260| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 23
           ADD     .L2     4,B10,B4
           LDW     .D2T2   *B4,B4            ; |260| 
           NOP             4
           ADD     .L1X    A12,B4,A3         ; |260| 

           STDW    .D1T1   A5:A4,*A3         ; |260| 
||         MVC     .S2     TSCL,B8           ; |128| 

           MVC     .S2     TSCH,B4           ; |128| 

           MVKL    .S2     t_start,B12
||         LDDW    .D1T1   *A15,A5:A4        ; |130| 
||         SUB     .L1X    B11,1,A0          ; |258| 
||         MV      .L2     B4,B9             ; |128| 
||         MVKL    .S1     t_stop,A31
||         SUB     .D2     B11,1,B11         ; |258| 

           MVKH    .S1     t_stop,A31
||         ADD     .L1     8,A12,A12         ; |258| 
||         MVKH    .S2     t_start,B12

           LDDW    .D2T2   *B12,B7:B6        ; |130| 
           ADDAD   .D1     A14,1,A3
           LDDW    .D1T1   *A3,A7:A6         ; |130| 
           STDW    .D1T2   B9:B8,*A31        ; |128| 
           MV      .L2X    A3,B13            ; |128| 
           ADDU    .L2X    A4,B6,B17:B16     ; |130| 

           ADD     .S2X    B17,A5,B6         ; |130| 
|| [ A0]   B       .S1     $C$L17            ; |258| 
||         SUBU    .L2     B8,B16,B5:B4      ; |130| 

           ADD     .D2     B6,B7,B6          ; |130| 
||         EXT     .S2     B5,24,24,B7       ; |130| 
||         ADDU    .L2X    A6,B4,B5:B4       ; |130| 

           SUB     .L2     B9,B6,B6          ; |130| 
||         ADD     .S2X    B5,A7,B5          ; |130| 

           ADD     .L2     B6,B7,B6          ; |130| 
           ADD     .L2     B5,B6,B5          ; |130| 

   [!A0]   CALL    .S1     __c6xabi_fltllif  ; |135| 
||         STDW    .D2T2   B5:B4,*B13        ; |130| 

           ; BRANCHCC OCCURS {$C$L17}        ; |258| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           LDDW    .D1T1   *+A14(8),A5:A4    ; |135| 
           ADDKPC  .S2     $C$RL44,B3,3      ; |135| 
$C$RL44:   ; CALL OCCURS {__c6xabi_fltllif} {0}  ; |135| 
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
$C$RL45:   ; CALL OCCURS {__c6xabi_fixdlli} {0}  ; |135| 

           MV      .L2X    A11,B4            ; |114| 
||         MV      .L1X    B13,A12           ; |135| 
||         STDW    .D1T1   A11:A10,*+A14(32) ; |114| 

           STDW    .D1T1   A5:A4,*A12        ; |135| 
||         MVC     .S2     B4,TSCL           ; |115| 

           MVC     .S2     TSCL,B6           ; |116| 
           MVC     .S2     TSCH,B7           ; |116| 

           STDW    .D2T2   B7:B6,*B12        ; |116| 
||         MVC     .S2     TSCL,B8           ; |117| 

           MVC     .S2     TSCH,B5           ; |117| 

           MVKL    .S1     input,A3
||         SUBU    .L2     B8,B6,B9:B8       ; |117| 

           MVKH    .S1     input,A3
||         EXT     .S2     B9,24,24,B6       ; |117| 
||         SUB     .L2     B5,B7,B5          ; |117| 

           ADD     .L2     B5,B6,B9          ; |117| 

           MV      .L2X    A3,B4             ; |267| 
||         MV      .L1X    B10,A10           ; |117| 
||         STDW    .D1T2   B9:B8,*A15        ; |117| 

           CALLP   .S2     acoshdp_v,B3
||         LDW     .D2T1   *B4,A4            ; |267| 
||         LDW     .D1T2   *+A10(16),B4      ; |267| 
||         MVK     .S1     0x80,A6           ; |267| 

$C$RL46:   ; CALL OCCURS {acoshdp_v} {0}     ; |267| 
           MVC     .S2     TSCL,B16          ; |128| 
           MVC     .S2     TSCH,B4           ; |128| 

           LDDW    .D1T1   *A15,A5:A4        ; |130| 
||         LDDW    .D2T2   *B12,B9:B8        ; |130| 

           MVK     .S2     24,B10
           ADD     .L2X    A12,B10,B10
           LDDW    .D2T2   *B10,B7:B6        ; |130| 
           MVKL    .S1     t_stop,A3

           ADDU    .L1X    A4,B8,A7:A6       ; |130| 
||         MVKH    .S1     t_stop,A3

           ADD     .S1     A7,A5,A4          ; |130| 
||         SUBU    .L1X    B16,A6,A7:A6      ; |130| 

           MV      .L2     B4,B17            ; |128| 
||         MV      .S2X    A3,B4             ; |128| 
||         MV      .L1     A6,A3             ; |130| 

           ADD     .L2X    A4,B9,B5          ; |130| 
||         ADDU    .L1X    B6,A3,A5:A4       ; |130| 
||         EXT     .S1     A7,24,24,A3       ; |130| 

           SUB     .L2     B17,B5,B5         ; |130| 
           ADD     .L2X    B5,A3,B5          ; |130| 
           ADD     .L2X    A5,B7,B6          ; |130| 

           STDW    .D2T2   B17:B16,*B4       ; |128| 
||         ADD     .L2     B6,B5,B4          ; |130| 

           NOP             1

           CALLP   .S2     __c6xabi_fltllif,B3
||         MV      .L1X    B4,A5             ; |130| 

$C$RL47:   ; CALL OCCURS {__c6xabi_fltllif} {0}  ; |130| 
           ZERO    .L1     A3
           SET     .S1     A3,0x1a,0x1d,A3
           MPYSP   .M1     A3,A4,A3          ; |130| 
           MV      .L1     A11,A12           ; |130| 
           NOP             2
           SPDP    .S1     A3,A5:A4          ; |130| 
           NOP             1
           ADDDP   .L1     A13:A12,A5:A4,A5:A4 ; |130| 
           CALLP   .S2     __c6xabi_fixdlli,B3
$C$RL48:   ; CALL OCCURS {__c6xabi_fixdlli} {0}  ; |130| 
           MVKL    .S2     0x3d719799,B7
           MVKL    .S2     0x812dea11,B6
           MVKH    .S2     0x3d719799,B7

           STDW    .D2T1   A5:A4,*B10        ; |130| 
||         LDW     .D1T2   *+A10(4),B4       ; |66| 
||         MVKH    .S2     0x812dea11,B6

           CALLP   .S2     isequal,B3
||         LDW     .D1T1   *A10,A4           ; |66| 
||         MVK     .L1     0x5,A8            ; |66| 
||         MVK     .S1     0x80,A6           ; |66| 

$C$RL49:   ; CALL OCCURS {isequal} {0}       ; |66| 
           MVKL    .S2     0x812dea11,B6
           MVKL    .S2     0x3d719799,B7

           LDW     .D1T2   *+A10(8),B4       ; |67| 
||         MVKL    .S1     fcn_pass,A11
||         MVKH    .S2     0x812dea11,B6

           MV      .L1     A4,A3             ; |66| 
||         LDW     .D1T1   *A10,A4           ; |67| 
||         MVKH    .S1     fcn_pass,A11
||         MVKH    .S2     0x3d719799,B7

           CALLP   .S2     isequal,B3
||         STW     .D1T1   A3,*+A11(4)       ; |66| 
||         MVK     .S1     0x80,A6           ; |67| 
||         MVK     .L1     0x5,A8            ; |67| 

$C$RL50:   ; CALL OCCURS {isequal} {0}       ; |67| 
           MVKL    .S2     0x3d719799,B7
           MVKL    .S2     0x812dea11,B6

           STW     .D1T1   A4,*+A11(8)       ; |67| 
||         MVKH    .S2     0x3d719799,B7

           LDW     .D1T2   *+A10(12),B4      ; |68| 
||         MVKH    .S2     0x812dea11,B6

           CALLP   .S2     isequal,B3
||         LDW     .D1T1   *A10,A4           ; |68| 
||         MVK     .S1     0x80,A6           ; |68| 
||         MVK     .L1     0x5,A8            ; |68| 

$C$RL51:   ; CALL OCCURS {isequal} {0}       ; |68| 
           LDW     .D2T2   *+SP(44),B4       ; |68| 
           MVKL    .S2     0x3d719799,B7
           MVKL    .S2     0x812dea11,B6
           MVKH    .S2     0x3d719799,B7

           STW     .D1T1   A4,*+A11(12)      ; |68| 
||         MVKH    .S2     0x812dea11,B6

           CALLP   .S2     isequal,B3
||         LDW     .D2T2   *B4,B4            ; |69| 
||         LDW     .D1T1   *A10,A4           ; |69| 
||         MVK     .S1     0x80,A6           ; |69| 
||         MVK     .L1     0x5,A8            ; |69| 

$C$RL52:   ; CALL OCCURS {isequal} {0}       ; |69| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 16
           LDW     .D2T2   *+SP(48),B4       ; |69| 
           STW     .D1T1   A4,*+A11(16)      ; |69| 
           NOP             3
           LDW     .D2T2   *B4,B0            ; |72| 
           LDW     .D2T2   *+SP(52),B4
           NOP             3

   [!B0]   B       .S1     $C$L18            ; |72| 
||         MV      .L2     B0,B1             ; guard predicate rewrite

   [ B0]   LDW     .D2T2   *B4,B0            ; |72| 
   [ B1]   ADD     .L2     4,B4,B4
           NOP             3
           ; BRANCHCC OCCURS {$C$L18}        ; |72| 
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
   [ A0]   B       .S1     $C$L19            ; |72| 
   [ A0]   CALL    .S1     print_test_results ; |273| 
           MVK     .L1     0x1,A3            ; |72| 
   [ A0]   MVKL    .S1     all_pass,A4
   [ A0]   MVKH    .S1     all_pass,A4
           NOP             1
           ; BRANCHCC OCCURS {$C$L19}        ; |72| 
;** --------------------------------------------------------------------------*
$C$L18:    
;          EXCLUSIVE CPU CYCLES: 5
           CALL    .S1     print_test_results ; |273| 
           MVKL    .S1     all_pass,A4
           MVKH    .S1     all_pass,A4
           MV      .L1     A12,A3
           NOP             1
;** --------------------------------------------------------------------------*
$C$L19:    
;          EXCLUSIVE CPU CYCLES: 1

           STW     .D1T1   A3,*A4            ; |72| 
||         MVK     .L1     0x2,A4            ; |273| 
||         ADDKPC  .S2     $C$RL53,B3,0      ; |273| 

$C$RL53:   ; CALL OCCURS {print_test_results} {0}  ; |273| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 30
           MVKL    .S2     $C$SL2+0,B4
           MVKH    .S2     $C$SL2+0,B4

           CALLP   .S2     printf,B3
||         STW     .D2T2   B4,*+SP(4)        ; |274| 

$C$RL54:   ; CALL OCCURS {printf} {0}        ; |274| 
           MVKL    .S2     $C$SL3+0,B4
           MVKH    .S2     $C$SL3+0,B4

           CALLP   .S2     printf,B3
||         STW     .D2T2   B4,*+SP(4)        ; |274| 

$C$RL55:   ; CALL OCCURS {printf} {0}        ; |274| 
           MVKL    .S1     $C$SL1+0,A10
           MVKH    .S1     $C$SL1+0,A10

           CALLP   .S2     print_profile_results,B3
||         MV      .L1     A10,A4            ; |281| 

$C$RL56:   ; CALL OCCURS {print_profile_results} {0}  ; |281| 

           CALLP   .S2     print_memory_results,B3
||         MV      .L1     A10,A4            ; |284| 

$C$RL57:   ; CALL OCCURS {print_memory_results} {0}  ; |284| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 11
           LDW     .D2T2   *++SP(120),B3     ; |285| 
           LDDW    .D2T1   *++SP,A13:A12     ; |285| 
           LDDW    .D2T1   *++SP,A15:A14     ; |285| 
           LDDW    .D2T2   *++SP,B11:B10     ; |285| 
           LDDW    .D2T2   *++SP,B13:B12     ; |285| 

           LDW     .D2T1   *++SP(8),A10      ; |285| 
||         RET     .S2     B3                ; |285| 

           LDW     .D2T1   *++SP(8),A11      ; |285| 
           NOP             4
           ; BRANCH OCCURS {B3}              ; |285| 
;******************************************************************************
;* STRINGS                                                                    *
;******************************************************************************
	.sect	".const:.string"
$C$SL1:	.string	"acoshDP",0
$C$SL2:	.string	"----------------------------------------",0
$C$SL3:	.string	"----------------------------------------",10,0
;*****************************************************************************
;* UNDEFINED EXTERNAL REFERENCES                                             *
;*****************************************************************************
	.global	printf
	.global	acosh
	.global	driver_init
	.global	print_profile_results
	.global	print_memory_results
	.global	print_test_results
	.global	gimme_random
	.global	isequal
	.global	acoshdp_c
	.global	acoshdp
	.global	acoshdp_v
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
