;******************************************************************************
;* TMS320C6x C/C++ Codegen                                          PC v7.4.2 *
;* Date/Time created: Mon May 16 23:33:57 2016                                *
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
	.word	05be02646h,0412af0e3h		; _a[0] @ 0
	.word	020423b0eh,04121197ah		; _a[1] @ 64
	.word	066ce505bh,040fdd968h		; _a[2] @ 128
	.word	0bb561764h,0411dd368h		; _a[3] @ 192
	.word	09b258ad4h,040ed382dh		; _a[4] @ 256
	.word	09d3b8af1h,04121d565h		; _a[5] @ 320
	.word	0357bd563h,04116dda3h		; _a[6] @ 384
	.word	0dfabcffdh,0412bd534h		; _a[7] @ 448
	.word	09ea2edd6h,04129b83fh		; _a[8] @ 512
	.word	0f33d2956h,0411316d3h		; _a[9] @ 576
	.word	0dea31975h,0412616dbh		; _a[10] @ 640
	.word	0442a927bh,04128999fh		; _a[11] @ 704
	.word	0f4b223d4h,040ff1162h		; _a[12] @ 768
	.word	048aef7d0h,0412c7afbh		; _a[13] @ 832
	.word	02e682152h,041172716h		; _a[14] @ 896
	.word	024213a0ch,041027270h		; _a[15] @ 960
	.word	038de59bdh,041197540h		; _a[16] @ 1024
	.word	07a42ff59h,041093db2h		; _a[17] @ 1088
	.word	005c96031h,041008b60h		; _a[18] @ 1152
	.word	05caf84bdh,0411ec7d7h		; _a[19] @ 1216
	.word	09a7f221fh,041283555h		; _a[20] @ 1280
	.word	0d3cf04b5h,0411eac9bh		; _a[21] @ 1344
	.word	039f9c122h,04116eaf8h		; _a[22] @ 1408
	.word	0a6c4fb47h,040e6e078h		; _a[23] @ 1472
	.word	03822eae7h,0412d5011h		; _a[24] @ 1536
	.word	0bfeef292h,04127c24ah		; _a[25] @ 1600
	.word	09f912a5fh,040f71020h		; _a[26] @ 1664
	.word	0ca0f4d7bh,0411f93ddh		; _a[27] @ 1728
	.word	0dd928fbah,0410697d4h		; _a[28] @ 1792
	.word	0409807c9h,04122381ah		; _a[29] @ 1856
	.word	0117bc141h,0412a26cbh		; _a[30] @ 1920
	.word	047531048h,04110c1a9h		; _a[31] @ 1984
	.word	03d9fb898h,0411513c1h		; _a[32] @ 2048
	.word	0c0d5984dh,040f7c32ah		; _a[33] @ 2112
	.word	098b47263h,04129bddbh		; _a[34] @ 2176
	.word	08969a0aeh,0410ff548h		; _a[35] @ 2240
	.word	006488758h,0412b9a46h		; _a[36] @ 2304
	.word	006eb412ch,040d6a8f9h		; _a[37] @ 2368
	.word	0be2003ach,04128c59dh		; _a[38] @ 2432
	.word	04b40db92h,040d69449h		; _a[39] @ 2496
	.word	0e4d6eb34h,0412c62c5h		; _a[40] @ 2560
	.word	02aca361ah,0412575b2h		; _a[41] @ 2624
	.word	06a712282h,040fe2defh		; _a[42] @ 2688
	.word	0b2c9696bh,04124bc73h		; _a[43] @ 2752
	.word	03d4e0978h,040f240cfh		; _a[44] @ 2816
	.word	0d6f2a5a4h,040f30c52h		; _a[45] @ 2880
	.word	04f937238h,04126276dh		; _a[46] @ 2944
	.word	0403d3ca1h,0412d4cc8h		; _a[47] @ 3008
	.word	06b23eac1h,041220aeeh		; _a[48] @ 3072
	.word	03dc66326h,041243069h		; _a[49] @ 3136
	.word	0775cb5e3h,04104bdf4h		; _a[50] @ 3200
	.word	093161a1eh,04106d07ch		; _a[51] @ 3264
	.word	03d990951h,041131ff5h		; _a[52] @ 3328
	.word	073e56473h,04121564bh		; _a[53] @ 3392
	.word	08c2a7e59h,041220d47h		; _a[54] @ 3456
	.word	01d64f2c9h,04110086bh		; _a[55] @ 3520
	.word	0fcdb6a1fh,04124d9ech		; _a[56] @ 3584
	.word	0387d4e09h,0411f4735h		; _a[57] @ 3648
	.word	05dbb6aa5h,0412631a5h		; _a[58] @ 3712
	.word	05f922963h,04125ad41h		; _a[59] @ 3776
	.word	07feab368h,04126368dh		; _a[60] @ 3840
	.word	013f65dc0h,041283cbfh		; _a[61] @ 3904
	.word	0c21bd8a4h,0412ba7f5h		; _a[62] @ 3968
	.word	058c2140ch,04122db3ch		; _a[63] @ 4032
	.word	06f2ae07eh,040f23957h		; _a[64] @ 4096
	.word	0b2319e08h,04113223bh		; _a[65] @ 4160
	.word	01f05ea25h,040e2d284h		; _a[66] @ 4224
	.word	0a346a352h,04124ed79h		; _a[67] @ 4288
	.word	09c435844h,0412cad97h		; _a[68] @ 4352
	.word	059ad2136h,041212e6dh		; _a[69] @ 4416
	.word	0d7dd68fch,04123ba2eh		; _a[70] @ 4480
	.word	0412a5f4fh,041084c18h		; _a[71] @ 4544
	.word	0911cb03ah,041001909h		; _a[72] @ 4608
	.word	0ee15d123h,041230cd6h		; _a[73] @ 4672
	.word	01ae865b0h,041298aa9h		; _a[74] @ 4736
	.word	00b3b67b5h,040e15eefh		; _a[75] @ 4800
	.word	08183c36eh,040ed7e79h		; _a[76] @ 4864
	.word	05f865d7dh,04105633eh		; _a[77] @ 4928
	.word	036c8853fh,0411326bfh		; _a[78] @ 4992
	.word	00ec980e8h,04124ad32h		; _a[79] @ 5056
	.word	0c2aa0522h,04125f43eh		; _a[80] @ 5120
	.word	0cf0f1daah,0411db3d4h		; _a[81] @ 5184
	.word	028c4d80ch,0411689beh		; _a[82] @ 5248
	.word	090e0a84ch,041076d08h		; _a[83] @ 5312
	.word	062055e0eh,0412577bfh		; _a[84] @ 5376
	.word	01b8179e8h,0411a39cdh		; _a[85] @ 5440
	.word	0efac710dh,0412b3befh		; _a[86] @ 5504
	.word	0aa0dd5ach,0410d19ddh		; _a[87] @ 5568
	.word	0415aebdfh,041086339h		; _a[88] @ 5632
	.word	0f8ac555eh,0411c1878h		; _a[89] @ 5696
	.word	02a353c22h,04116bd96h		; _a[90] @ 5760
	.word	05a908a26h,040f3c7c4h		; _a[91] @ 5824
	.word	0936c2d50h,0412e4754h		; _a[92] @ 5888
	.word	0380614edh,04123426bh		; _a[93] @ 5952
	.word	023a73995h,0412abd5eh		; _a[94] @ 6016
	.word	080f58cdfh,041211d7eh		; _a[95] @ 6080
	.word	0e8e1932dh,0411b2e12h		; _a[96] @ 6144
	.word	0a6f7d30bh,0412228b9h		; _a[97] @ 6208
	.word	094cf4a56h,040f4f620h		; _a[98] @ 6272
	.word	06e9f4fbch,040ff0d6eh		; _a[99] @ 6336
	.word	04aedb4a4h,041203e1dh		; _a[100] @ 6400
	.word	0f32a355eh,04121e2c6h		; _a[101] @ 6464
	.word	09083f69ah,0410f6359h		; _a[102] @ 6528
	.word	07ee9325eh,04128d96eh		; _a[103] @ 6592
	.word	0ad5e071ch,04128dc5eh		; _a[104] @ 6656
	.word	0231b65b7h,0411b02fch		; _a[105] @ 6720
	.word	0b7215c71h,0410e86bch		; _a[106] @ 6784
	.word	0fef72134h,0410fd030h		; _a[107] @ 6848
	.word	0c94b167fh,0411b47a9h		; _a[108] @ 6912
	.word	0c0512c42h,041222bafh		; _a[109] @ 6976
	.word	0a5044509h,0411f9324h		; _a[110] @ 7040
	.word	04a7c2515h,04124ed13h		; _a[111] @ 7104
	.word	0bebbe29ah,041058158h		; _a[112] @ 7168
	.word	0a6f5a2afh,040ed87f3h		; _a[113] @ 7232
	.word	09db7d69ch,040fa6616h		; _a[114] @ 7296
	.word	0b8770d7eh,0412bc170h		; _a[115] @ 7360
	.word	04cf0d18fh,041155a32h		; _a[116] @ 7424
	.word	0180f0557h,0411bf2d0h		; _a[117] @ 7488
	.word	01f78897fh,041240945h		; _a[118] @ 7552
	.word	069d44490h,04115082bh		; _a[119] @ 7616
	.word	0565f3af9h,0412b5ab0h		; _a[120] @ 7680
	.word	0e860b7d1h,0412e6a58h		; _a[121] @ 7744
	.word	0fcfe6c82h,041183cbfh		; _a[122] @ 7808
	.word	0ea2b8265h,040580f5dh		; _a[123] @ 7872
	.word	0b738609ah,0411545a8h		; _a[124] @ 7936
	.word	08263736dh,0411d6d9ah		; _a[125] @ 8000
	.word	0d5c34b44h,041032985h		; _a[126] @ 8064
	.word	0a32d905ch,0411cedc7h		; _a[127] @ 8128
	.word	048bdf315h,04129812dh		; _a[128] @ 8192
	.word	038776816h,041129a29h		; _a[129] @ 8256
	.word	036283177h,04115f77ah		; _a[130] @ 8320
	.word	0cab1df0bh,0412d6f9fh		; _a[131] @ 8384
	.word	0dd9b3652h,040f0ab74h		; _a[132] @ 8448
	.word	0eb1cb542h,0411c807fh		; _a[133] @ 8512
	.word	0358298cch,040cc3746h		; _a[134] @ 8576
	.word	0889019beh,0410ea824h		; _a[135] @ 8640
	.word	013570245h,04116058dh		; _a[136] @ 8704
	.word	05f3962f8h,041207ebah		; _a[137] @ 8768
	.word	07784a292h,0412662dfh		; _a[138] @ 8832
	.word	0de42e481h,04126032bh		; _a[139] @ 8896
	.word	0a9843584h,04122f0bah		; _a[140] @ 8960
	.word	029e55f6bh,04125c376h		; _a[141] @ 9024
	.word	056059063h,04125d212h		; _a[142] @ 9088
	.word	06f709b74h,04115aedeh		; _a[143] @ 9152
	.word	0472cf95dh,04114828dh		; _a[144] @ 9216
	.word	02c63d669h,041271e58h		; _a[145] @ 9280
	.word	0a8c63503h,04127393ah		; _a[146] @ 9344
	.word	01bb27533h,04125ad0eh		; _a[147] @ 9408
	.word	039424448h,04122c68ch		; _a[148] @ 9472
	.word	04f9350aah,040de77b6h		; _a[149] @ 9536
	.word	056818ee1h,0410f12b9h		; _a[150] @ 9600
	.word	086d34ec7h,0412d2addh		; _a[151] @ 9664
	.word	08800218eh,041009132h		; _a[152] @ 9728
	.word	0e4cb0b2ch,0411e8200h		; _a[153] @ 9792
	.word	01dc69220h,041065c4eh		; _a[154] @ 9856
	.word	09e73c199h,04129d164h		; _a[155] @ 9920
	.word	07add6678h,04105e20ch		; _a[156] @ 9984
	.word	02ca08cd3h,04125e94ch		; _a[157] @ 10048
	.word	046177136h,040fd155fh		; _a[158] @ 10112
	.word	0d08bc317h,0412673fah		; _a[159] @ 10176
	.word	09eb862b2h,04122b1d8h		; _a[160] @ 10240
	.word	0ebcbdc0ch,041292d49h		; _a[161] @ 10304
	.word	05ccdd93ch,0410cb5f4h		; _a[162] @ 10368
	.word	08cb62698h,041215912h		; _a[163] @ 10432
	.word	0375d38c0h,0412bca10h		; _a[164] @ 10496
	.word	07c47c668h,04121963fh		; _a[165] @ 10560
	.word	0abfd5022h,041125a31h		; _a[166] @ 10624
	.word	0a8e9e93dh,0412abe7fh		; _a[167] @ 10688
	.word	099d3b0edh,04100ba0bh		; _a[168] @ 10752
	.word	08f901df0h,04111db71h		; _a[169] @ 10816
	.word	0db7a94f2h,04124335eh		; _a[170] @ 10880
	.word	063604692h,0412869a2h		; _a[171] @ 10944
	.word	0275455c3h,0412cd115h		; _a[172] @ 11008
	.word	0f44a2fcfh,0412bac92h		; _a[173] @ 11072
	.word	0bb38d60ah,041112c55h		; _a[174] @ 11136
	.word	0bb729cd6h,040e9d28ch		; _a[175] @ 11200
	.word	0e795266dh,04121bdbfh		; _a[176] @ 11264
	.word	081c81400h,0412cf1f6h		; _a[177] @ 11328
	.word	055e6d084h,041258dd1h		; _a[178] @ 11392
	.word	09ec9e8edh,0412d71a7h		; _a[179] @ 11456
	.word	0887ecc8fh,0412b096bh		; _a[180] @ 11520
	.word	024b6dbcah,0411fbf65h		; _a[181] @ 11584
	.word	0985a3429h,040efab9fh		; _a[182] @ 11648
	.word	0c486cebch,0411b02a0h		; _a[183] @ 11712
	.word	09c87f603h,0411215f1h		; _a[184] @ 11776
	.word	0bb6df902h,04114c8b2h		; _a[185] @ 11840
	.word	00bcabed6h,040f8c07fh		; _a[186] @ 11904
	.word	088fce091h,0412e4faeh		; _a[187] @ 11968
	.word	09732c478h,04129daddh		; _a[188] @ 12032
	.word	0782c17b6h,04125c370h		; _a[189] @ 12096
	.word	0a624dd2fh,0410045f7h		; _a[190] @ 12160
	.word	0fa3cb817h,041261c92h		; _a[191] @ 12224
	.word	0f824b9f4h,041035079h		; _a[192] @ 12288
	.word	0427dd94ah,041204d21h		; _a[193] @ 12352
	.word	060e42b8eh,040f5106fh		; _a[194] @ 12416
	.word	0a67f9e46h,041135db2h		; _a[195] @ 12480
	.word	09e395663h,0411b30a1h		; _a[196] @ 12544
	.word	038aae445h,04111d92bh		; _a[197] @ 12608
	.word	026e8f953h,0411d3709h		; _a[198] @ 12672
	.word	0aa1130aah,040f1a205h		; _a[199] @ 12736
	.word	0c7b2788eh,04120292bh		; _a[200] @ 12800
$C$IR_1:	.set	1608

	.global	_a
_a:	.usect	".far",1608,8
;	C:\MATHLIB_Tools\CCSV5_5_0\ccsv5\tools\compiler\c6000_7.4.2\bin\opt6x.exe C:\\Users\\gtbldadm\\AppData\\Local\\Temp\\025962 C:\\Users\\gtbldadm\\AppData\\Local\\Temp\\025964 
	.sect	".text:optci"
	.clink

;******************************************************************************
;* FUNCTION NAME: logdp_asinhdp_i                                             *
;*                                                                            *
;*   Regs Modified     : A0,A1,A3,A4,A5,A6,A7,A8,A9,B0,B4,B5,B6,B7,B8,B9,A16, *
;*                           A17,A18,A19,A20,A21,B16,B17,B18,B19              *
;*   Regs Used         : A0,A1,A3,A4,A5,A6,A7,A8,A9,B0,B3,B4,B5,B6,B7,B8,B9,  *
;*                           A16,A17,A18,A19,A20,A21,B16,B17,B18,B19          *
;*   Local Frame Size  : 0 Args + 0 Auto + 0 Save = 0 byte                    *
;******************************************************************************
_logdp_asinhdp_i:
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 328
           CLR     .S1     A5,20,31,A3       ; |110| 
           EXTU    .S1     A5,1,21,A1        ; |105| 

           SET     .S1     A3,21,29,A7       ; |110| 
||         MV      .L1     A4,A6             ; |110| 

   [!A1]   ZERO    .L1     A7:A6             ; |113| 
||         ZERO    .L2     B9

           SET     .S2     B9,0x15,0x1d,B9
||         ZERO    .L2     B8                ; |116| 

           SUBDP   .L2X    A7:A6,B9:B8,B5:B4 ; |116| 
           MVKL    .S2     0x667f3bcd,B16
           MVKL    .S2     0x3fe6a09e,B17
           MVKH    .S2     0x667f3bcd,B16
           MVKH    .S2     0x3fe6a09e,B17
           MV      .L1X    B9,A9             ; |116| 
           ZERO    .L1     A8                ; |116| 
           SUBDP   .L2     B5:B4,B9:B8,B7:B6 ; |116| 
           CMPGTDP .S1X    A7:A6,B17:B16,A0  ; |122| 
           MPYDP   .M1     A9:A8,A7:A6,A7:A6 ; |117| 
           MVKL    .S1     0xbfe94415,A21
           MVKL    .S1     0xb356bd29,A20
           ZERO    .L1     A9
           SET     .S1     A9,0x1e,0x1e,A9

   [!A0]   MV      .L2     B5,B7             ; |123| 
|| [!A0]   MV      .S2     B4,B6             ; |123| 

   [!A0]   MPYDP   .M2     B9:B8,B7:B6,B17:B16 ; |124| 
           MV      .L2     B9,B5             ; |116| 
           MV      .L2     B8,B4             ; |124| 
           MVKH    .S1     0xbfe94415,A21
           MVKH    .S1     0xb356bd29,A20
           ADDDP   .L2X    B5:B4,A7:A6,B5:B4 ; |117| 
           NOP             4
   [!A0]   ADDDP   .L2     B9:B8,B17:B16,B5:B4 ; |124| 
           NOP             6
           RCPDP   .S2     B5:B4,B9:B8       ; |66| 
           NOP             1
           MPYDP   .M2     B5:B4,B9:B8,B17:B16 ; |66| 
           NOP             9
           NOP             1
           SUBDP   .L1X    A9:A8,B17:B16,A7:A6 ; |66| 
           NOP             6
           MPYDP   .M1X    B9:B8,A7:A6,A7:A6 ; |66| 
           NOP             9
           MPYDP   .M1X    B5:B4,A7:A6,A17:A16 ; |66| 
           NOP             9
           SUBDP   .L1     A9:A8,A17:A16,A17:A16 ; |66| 
           NOP             6
           MPYDP   .M1     A7:A6,A17:A16,A7:A6 ; |66| 
           NOP             9
           NOP             1
           MPYDP   .M2X    B5:B4,A7:A6,B5:B4 ; |66| 
           NOP             9
           SUBDP   .L2X    A9:A8,B5:B4,B5:B4 ; |66| 
           ZERO    .L1     A8                ; |64| 
           NOP             5
           MPYDP   .M2X    A7:A6,B5:B4,B5:B4 ; |66| 
           NOP             9
           MPYDP   .M2     B7:B6,B5:B4,B5:B4 ; |66| 
           ZERO    .L1     A7:A6             ; |68| 
           NOP             6
           CMPEQDP .S2X    B7:B6,A7:A6,B0    ; |68| 
           MVKL    .S1     0x40738083,A7
   [ B0]   ZERO    .L2     B5:B4             ; |69| 

           MV      .L2     B5,B17            ; |72| 
||         MV      .S2     B4,B16            ; |72| 

           MPYDP   .M2     B17:B16,B17:B16,B9:B8 ; |129| 
           MVKL    .S2     0xc041d580,B5
           MVKL    .S2     0x4b67ce0f,B4
           MVKH    .S2     0xc041d580,B5
           MVKH    .S2     0x4b67ce0f,B4
           MVKL    .S1     0xfa15267e,A6
           MVKH    .S1     0x40738083,A7
           MVKH    .S1     0xfa15267e,A6
           MVKL    .S2     0x4030624a,B7
           MVKL    .S2     0x2016afed,B6
           ADDDP   .L2     B5:B4,B9:B8,B5:B4 ; |64| 
           MVKH    .S2     0x4030624a,B7
           MVKH    .S2     0x2016afed,B6
           NOP             4
           MPYDP   .M2     B9:B8,B5:B4,B5:B4 ; |64| 
           NOP             9
           NOP             1
           ADDDP   .L1X    A7:A6,B5:B4,A7:A6 ; |64| 
           MVKL    .S2     0xc0880bfe,B5
           MVKL    .S2     0x9c0d9077,B4
           MVKH    .S2     0xc0880bfe,B5
           MVKH    .S2     0x9c0d9077,B4
           NOP             2
           MPYDP   .M1X    B9:B8,A7:A6,A7:A6 ; |64| 
           NOP             9
           ADDDP   .L1X    B5:B4,A7:A6,A7:A6 ; |64| 
           MV      .L2X    A9,B5             ; |66| 
           ZERO    .L2     B4                ; |64| 
           NOP             4
           RCPDP   .S1     A7:A6,A17:A16     ; |64| 
           NOP             1
           MPYDP   .M1     A17:A16,A7:A6,A19:A18 ; |64| 
           NOP             9
           SUBDP   .L1X    B5:B4,A19:A18,A19:A18 ; |64| 
           MPYDP   .M2X    A21:A20,B9:B8,B5:B4 ; |66| 
           NOP             5
           MPYDP   .M1     A17:A16,A19:A18,A17:A16 ; |64| 
           NOP             9
           MPYDP   .M1     A17:A16,A7:A6,A19:A18 ; |64| 
           ADDDP   .S2     B7:B6,B5:B4,B5:B4 ; |66| 
           ZERO    .L2     B7:B6             ; |68| 
           NOP             7
           SUBDP   .L1     A9:A8,A19:A18,A19:A18 ; |64| 
           ZERO    .S1     A8                ; |66| 
           MPYDP   .M2     B9:B8,B5:B4,B5:B4 ; |66| 
           NOP             4
           MPYDP   .M1     A17:A16,A19:A18,A17:A16 ; |64| 
           NOP             9
           MPYDP   .M1     A17:A16,A7:A6,A7:A6 ; |66| 
           NOP             9
           SUBDP   .L1     A9:A8,A7:A6,A7:A6 ; |66| 
           MVKL    .S1     0x12b3b59a,A8
           MVKH    .S1     0x12b3b59a,A8
           MVKL    .S1     0xc05007ff,A9
           MVKH    .S1     0xc05007ff,A9
           NOP             2
           MPYDP   .M1     A17:A16,A7:A6,A7:A6 ; |66| 
           ADDDP   .L2X    A9:A8,B5:B4,B19:B18 ; |66| 
           NOP             9
           MPYDP   .M2X    B19:B18,A7:A6,B5:B4 ; |66| 
           CMPEQDP .S2     B19:B18,B7:B6,B0  ; |68| 
           NOP             8
   [ B0]   ZERO    .L2     B5:B4             ; |69| 
           MPYDP   .M2     B9:B8,B5:B4,B5:B4 ; |135| 
           MVK     .S2     1022,B6           ; |105| 
           SUB     .L2X    A1,B6,B6          ; |105| 
   [!A0]   SUB     .L2     B6,1,B6           ; |125| 
           MVKL    .S1     0xbf2bd010,A7
           MVKL    .S1     0x5c610ca8,A6
           MVKH    .S1     0xbf2bd010,A7
           MVKH    .S1     0x5c610ca8,A6
           NOP             2
           MPYDP   .M2     B17:B16,B5:B4,B9:B8 ; |135| 
           INTDP   .L2     B6,B5:B4          ; |135| 
           NOP             5
           MPYDP   .M2X    A7:A6,B5:B4,B7:B6 ; |135| 
           NOP             2
           ADDDP   .L2     B9:B8,B17:B16,B9:B8 ; |135| 
           MVKL    .S1     0x3fe63000,A7
           MVKH    .S1     0x3fe63000,A7
           ZERO    .L1     A6                ; |135| 
           MPYDP   .M1X    A7:A6,B5:B4,A7:A6 ; |135| 
           NOP             2
           ADDDP   .L2     B9:B8,B7:B6,B5:B4 ; |135| 
           NOP             7
           ADDDP   .L1X    A7:A6,B5:B4,A7:A6 ; |135| 
           MVKL    .S2     0x7fefffff,B5
           MVKH    .S2     0x7fefffff,B5
           MVK     .L2     0xffffffff,B4     ; |137| 
           CMPGTDP .S2X    A5:A4,B5:B4,B0    ; |137| 
           NOP             1
           RET     .S2     B3                ; |142| 
   [ B0]   MVKL    .S1     0xfefa39ef,A6
   [ B0]   MVKL    .S1     0x40862e42,A7
   [ B0]   MVKH    .S1     0xfefa39ef,A6
   [ B0]   MVKH    .S1     0x40862e42,A7

           MV      .L1     A7,A5             ; |141| 
||         MV      .S1     A6,A4             ; |141| 

           ; BRANCH OCCURS {B3}              ; |142| 
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
;*   Local Frame Size  : 8 Args + 132 Auto + 56 Save = 196 byte               *
;******************************************************************************
_main:
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 14
           STW     .D2T1   A11,*SP--(8)      ; |143| 
           STW     .D2T1   A10,*SP--(8)      ; |143| 
           STDW    .D2T2   B13:B12,*SP--     ; |143| 
           STDW    .D2T2   B11:B10,*SP--     ; |143| 
           STDW    .D2T1   A15:A14,*SP--     ; |143| 
           STDW    .D2T1   A13:A12,*SP--     ; |143| 
           STW     .D2T2   B3,*SP--(8)       ; |143| 

           MVKL    .S1     $C$SL1+0,A4
||         ADDK    .S2     -144,SP           ; |143| 

           CALLP   .S2     _driver_init,B3
||         MVKH    .S1     $C$SL1+0,A4

$C$RL0:    ; CALL OCCURS {_driver_init} {0}  ; |151| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 3

           MVK     .S2     0xc9,B4
||         MVKL    .S1     _a,A10

           MVKH    .S1     _a,A10

           CALL    .S1     _asinh            ; |160| 
||         MV      .L1     A10,A11
||         MV      .D1X    B4,A12
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
$C$RL1:    ; CALL OCCURS {_asinh} {0}        ; |160| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 9

           MVKL    .S2     _output,B4
||         SUB     .L1     A12,1,A0          ; |159| 
||         SUB     .S1     A12,1,A12         ; |159| 

           MVKH    .S2     _output,B4
           LDW     .D2T2   *B4,B4            ; |160| 
   [ A0]   BNOP    .S1     $C$L1,3           ; |159| 

           ADD     .L2     B10,B4,B4         ; |160| 
||         ADD     .S2     8,B10,B10         ; |159| 

   [ A0]   CALL    .S1     _asinh            ; |160| 
||         STDW    .D2T1   A5:A4,*B4         ; |160| 
|| [!A0]   MVKL    .S2     _output,B4

           ; BRANCHCC OCCURS {$C$L1}         ; |159| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 4

           ZERO    .L2     B10
||         MVKH    .S2     _output,B4

           ADD     .L2     4,B4,B11
||         MVK     .S2     0xc9,B4

           MV      .L1     A10,A14

           MV      .L1X    B4,A11
||         CALL    .S1     _asinhdp          ; |163| 

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L2:    
;          EXCLUSIVE CPU CYCLES: 5
           LDDW    .D1T1   *A10++,A5:A4      ; |163| 
           ADDKPC  .S2     $C$RL2,B3,3       ; |163| 
$C$RL2:    ; CALL OCCURS {_asinhdp} {0}      ; |163| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 7

           LDW     .D2T2   *B11,B4           ; |163| 
||         SUB     .L1     A11,1,A0          ; |162| 
||         SUB     .S1     A11,1,A11         ; |162| 

   [ A0]   BNOP    .S1     $C$L2,3           ; |162| 

           ADD     .L2     B10,B4,B4         ; |163| 
||         ADD     .S2     8,B10,B10         ; |162| 

   [ A0]   CALL    .S1     _asinhdp          ; |163| 
||         STDW    .D2T1   A5:A4,*B4         ; |163| 
|| [!A0]   MVK     .S2     0xc9,B4

           ; BRANCHCC OCCURS {$C$L2}         ; |162| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 2

           ADD     .L2     4,B11,B10
||         ZERO    .S2     B11
||         MV      .L1     A14,A10

           MV      .L1X    B4,A11
||         CALL    .S1     _asinhdp_c        ; |166| 

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L3:    
;          EXCLUSIVE CPU CYCLES: 5
           LDDW    .D1T1   *A10++,A5:A4      ; |166| 
           ADDKPC  .S2     $C$RL3,B3,3       ; |166| 
$C$RL3:    ; CALL OCCURS {_asinhdp_c} {0}    ; |166| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 7

           LDW     .D2T2   *B10,B4           ; |166| 
||         SUB     .L1     A11,1,A0          ; |165| 
||         SUB     .S1     A11,1,A11         ; |165| 

   [!A0]   ZERO    .L1     A3
|| [!A0]   ZERO    .S1     A25
|| [!A0]   ZERO    .D1     A13
|| [ A0]   B       .S2     $C$L3             ; |165| 

   [!A0]   SET     .S1     A3,0x13,0x1d,A3
|| [!A0]   MVKL    .S2     0x8d02093f,B19

   [!A0]   STW     .D2T1   A3,*+SP(12)       ; |166| 
|| [!A0]   SET     .S1     A13,0x15,0x1d,A13
|| [!A0]   MVKL    .S2     0xbfc55555,B27

   [!A0]   MV      .L2X    A3,B20
|| [!A0]   MVKL    .S1     0x93a79b50,A26

           ADD     .L2     B11,B4,B4         ; |166| 
||         ADD     .S2     8,B11,B11         ; |165| 
|| [!A0]   MV      .D2X    A3,B24
|| [!A0]   SET     .S1     A25,0x14,0x1d,A3

           STDW    .D2T1   A5:A4,*B4         ; |166| 
|| [!A0]   MVKL    .S2     0x3f9fd78f,B4
|| [ A0]   CALL    .S1     _asinhdp_c        ; |166| 

           ; BRANCHCC OCCURS {$C$L3}         ; |165| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 16

           MVKL    .S1     0x3fd33333,A31
||         MVKL    .S2     0x2884c094,B31
||         ADD     .L2     4,B10,B18
||         ZERO    .D2     B28               ; |166| 
||         ZERO    .L1     A10               ; |166| 
||         ZERO    .D1     A12               ; |166| 

           MVKL    .S1     0x33333333,A30
||         MVKL    .S2     0x3fb3335d,B30
||         STW     .D2T2   B18,*+SP(64)
||         ZERO    .L2     B21               ; |166| 
||         MV      .L1     A14,A2
||         MV      .D1     A13,A11           ; |166| 

           MVKL    .S1     0x3fe62e42,A29
||         MVKL    .S2     0x9b04cad8,B29
||         ZERO    .L2     B26               ; |166| 
||         ZERO    .D2     B25               ; |166| 

           MVKL    .S1     0xfefa39ec,A28
||         MVKH    .S2     0x2884c094,B31
||         ZERO    .L2     B22               ; |166| 
||         MV      .D2X    A13,B23           ; |166| 

           MVKL    .S1     0xbfa6e4ec,A27
||         MVKH    .S2     0x3fb3335d,B30
||         STW     .D2T2   B31,*+SP(16)      ; |232| 
||         MV      .L2X    A3,B11            ; |166| 

           MVKH    .S1     0x3fd33333,A31
||         MVKH    .S2     0x9b04cad8,B29
||         STW     .D2T2   B30,*+SP(36)      ; |232| 

           MVKH    .S1     0x33333333,A30
||         MVKL    .S2     0xbf978498,B13
||         STW     .D2T1   A31,*+SP(60)      ; |241| 
||         MV      .L1     A13,A31           ; |166| 

           MVKH    .S1     0x3fe62e42,A29
||         MVKL    .S2     0x92c0541a,B12
||         STW     .D2T1   A30,*+SP(56)      ; |241| 
||         ZERO    .L1     A30               ; |166| 

           MVKH    .S1     0xfefa39ec,A28
||         MVKH    .S2     0xbfc55555,B27
||         STW     .D2T1   A29,*+SP(52)      ; |238| 
||         MV      .L1     A13,A29           ; |166| 

           MVKH    .S1     0xbfa6e4ec,A27
||         MVKH    .S2     0x8d02093f,B19
||         STW     .D2T1   A28,*+SP(48)      ; |238| 
||         ZERO    .L1     A28               ; |166| 

           MVKH    .S1     0x93a79b50,A26
||         MVKH    .S2     0x3f9fd78f,B4
||         STW     .D2T2   B29,*+SP(32)      ; |232| 

           STW     .D2T1   A27,*+SP(28)      ; |232| 
||         MVKH    .S2     0xbf978498,B13

           MVKH    .S2     0x92c0541a,B12
||         STW     .D2T2   B27,*+SP(44)      ; |232| 
||         ZERO    .L2     B27               ; |166| 

           STW     .D2T1   A26,*+SP(24)      ; |232| 
||         MVK     .S2     0xc9,B1

           STW     .D2T2   B19,*+SP(40)      ; |232| 
           STW     .D2T2   B4,*+SP(20)       ; |232| 
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L4:    
;          EXCLUSIVE CPU CYCLES: 183
           LDDW    .D1T1   *A2++,A25:A24     ; |169| 
           MV      .L1X    B11,A5
           MV      .L1X    B28,A4
           NOP             2
           MPYDP   .M1     A25:A24,A25:A24,A23:A22 ; |221| 
           ABSDP   .S1     A25:A24,A27:A26   ; |214| 
           NOP             8
           ADDDP   .L1     A5:A4,A23:A22,A7:A6 ; |166| 
           MPYDP   .M2X    B23:B22,A27:A26,B5:B4 ; |238| 
           NOP             5
           RSQRDP  .S1     A7:A6,A9:A8       ; |166| 
           NOP             1
           MPYDP   .M1     A9:A8,A7:A6,A5:A4 ; |166| 
           NOP             9
           MPYDP   .M1     A9:A8,A5:A4,A5:A4 ; |166| 
           NOP             9
           MPYDP   .M1     A13:A12,A5:A4,A17:A16 ; |166| 
           NOP             7
           MV      .L1X    B20,A5
           MV      .L1X    B27,A4
           SUBDP   .L1     A5:A4,A17:A16,A5:A4 ; |166| 
           NOP             6
           MPYDP   .M1     A9:A8,A5:A4,A9:A8 ; |166| 
           NOP             9
           MPYDP   .M1     A9:A8,A7:A6,A5:A4 ; |166| 
           NOP             9
           MPYDP   .M1     A9:A8,A5:A4,A5:A4 ; |166| 
           NOP             9
           MPYDP   .M1     A11:A10,A5:A4,A17:A16 ; |166| 
           NOP             7
           MV      .L1X    B24,A5
           MV      .L1X    B26,A4
           SUBDP   .L1     A5:A4,A17:A16,A5:A4 ; |166| 
           NOP             6
           MPYDP   .M1     A9:A8,A5:A4,A9:A8 ; |166| 
           NOP             9
           MPYDP   .M1     A9:A8,A7:A6,A5:A4 ; |167| 
           NOP             9
           MPYDP   .M1     A9:A8,A5:A4,A9:A8 ; |167| 
           NOP             9
           MPYDP   .M1     A31:A30,A9:A8,A17:A16 ; |167| 
           NOP             7
           MV      .L1X    B20,A9
           MV      .L1X    B25,A8
           SUBDP   .L1     A9:A8,A17:A16,A17:A16 ; |167| 
           MPYDP   .M1     A27:A26,A27:A26,A9:A8 ; |169| 
           NOP             5
           MPYDP   .M1     A5:A4,A17:A16,A5:A4 ; |167| 
           NOP             7
           CMPEQDP .S1     A7:A6,A9:A8,A0    ; |169| 
           NOP             1

   [ A0]   MV      .L1     A27,A5            ; |170| 
|| [ A0]   MV      .S1     A26,A4            ; |170| 

           MPYDP   .M1     A29:A28,A5:A4,A5:A4 ; |238| 
           NOP             9
           ADDDP   .L1X    A5:A4,B5:B4,A5:A4 ; |238| 
           CALL    .S1     _logdp_asinhdp_i  ; |238| 
           ADDKPC  .S2     $C$RL4,B3,4       ; |238| 
$C$RL4:    ; CALL OCCURS {_logdp_asinhdp_i} {0}  ; |238| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 78
           MPYDP   .M1     A23:A22,A23:A22,A7:A6 ; |222| 
           LDW     .D2T2   *+SP(40),B4
           LDW     .D2T2   *+SP(44),B5
           LDW     .D2T1   *+SP(28),A19
           LDW     .D2T2   *+SP(36),B7
           LDW     .D2T2   *+SP(32),B6
           LDW     .D2T1   *+SP(24),A18
           MPYDP   .M2X    B5:B4,A23:A22,B5:B4 ; |232| 
           LDW     .D2T2   *+SP(20),B9       ; |232| 
           LDW     .D2T2   *+SP(16),B8       ; |232| 
           MPYDP   .M1     A7:A6,A7:A6,A17:A16 ; |224| 
           MPYDP   .M2X    B7:B6,A7:A6,B7:B6 ; |232| 
           LDW     .D2T2   *+SP(64),B29
           SUB     .L2     B1,1,B1           ; |168| 
           MPYDP   .M1     A23:A22,A7:A6,A9:A8 ; |223| 
   [!B1]   MVKL    .S2     _output,B10
   [!B1]   MVKH    .S2     _output,B10
           NOP             7
           MPYDP   .M1     A19:A18,A9:A8,A19:A18 ; |232| 
           MPYDP   .M2X    B9:B8,A17:A16,B9:B8 ; |232| 
           ADDDP   .L2     B7:B6,B5:B4,B5:B4 ; |232| 
           NOP             1
           MPYDP   .M1     A9:A8,A7:A6,A7:A6 ; |225| 
           LDW     .D2T1   *+SP(52),A9       ; |217| 
           LDW     .D2T1   *+SP(48),A8       ; |217| 
           NOP             4
           ADDDP   .L2X    B9:B8,A19:A18,B7:B6 ; |232| 
           ADDDP   .L1     A9:A8,A5:A4,A5:A4 ; |238| 
           NOP             2
           MPYDP   .M2X    B13:B12,A7:A6,B9:B8 ; |232| 
           LDW     .D2T1   *+SP(60),A7       ; |217| 
           LDW     .D2T1   *+SP(56),A6       ; |217| 
           ADDDP   .S2     B7:B6,B5:B4,B5:B4 ; |232| 
           ZERO    .L2     B7:B6             ; |217| 
           CMPLTDP .S2X    A25:A24,B7:B6,B0  ; |217| 
           NOP             4
           ADDDP   .L2     B9:B8,B5:B4,B5:B4 ; |232| 
           CMPGTDP .S1     A27:A26,A7:A6,A0  ; |241| 
   [!B0]   MV      .L1X    B11,A7            ; |217| 
   [ B0]   ZERO    .L1     A7
   [ B0]   ZERO    .L1     A6                ; |217| 
   [!B0]   ZERO    .L1     A6                ; |217| 
   [ B0]   MVKH    .S1     0xbff00000,A7
           MPYDP   .M2X    A25:A24,B5:B4,B5:B4 ; |232| 
           NOP             9
           NOP             1

           ADDDP   .L1X    A25:A24,B5:B4,A9:A8 ; |232| 
|| [ A0]   MPYDP   .M1     A7:A6,A5:A4,A9:A8 ; |242| 
||         LDW     .D2T2   *B29,B4           ; |169| 

           NOP             4

   [ B1]   BNOP    .S1     $C$L4,4           ; |168| 
||         ADD     .L2     B21,B4,B4         ; |169| 
||         ADD     .S2     8,B21,B21         ; |168| 

   [!B1]   CALL    .S1     _asinhdp_v        ; |171| 
||         STDW    .D2T1   A9:A8,*B4         ; |169| 

           ; BRANCHCC OCCURS {$C$L4}         ; |168| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           LDW     .D2T2   *+B10(16),B4      ; |171| 
           MVK     .S1     0xc9,A6           ; |171| 
           MV      .L1     A14,A4            ; |171| 
           ADDKPC  .S2     $C$RL5,B3,1       ; |171| 
$C$RL5:    ; CALL OCCURS {_asinhdp_v} {0}    ; |171| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 46
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
           MVKL    .S2     _fcn_pass,B6
           MVKL    .S2     0x3ddb7cdf,B7
           MVKH    .S2     _fcn_pass,B6
           MVKH    .S2     0x3ddb7cdf,B7

           STW     .D2T1   A4,*+B6(4)        ; |66| 
||         MVKL    .S2     0xd9d7bdbb,B6

           LDW     .D2T2   *+B10(8),B4       ; |67| 
||         MVKH    .S2     0xd9d7bdbb,B6

           CALLP   .S2     _isequal,B3
||         LDW     .D2T1   *B10,A4           ; |67| 
||         MVK     .S1     0xc9,A6           ; |67| 
||         MVK     .L1     0x9,A8            ; |67| 

$C$RL7:    ; CALL OCCURS {_isequal} {0}      ; |67| 
           MVKL    .S2     _fcn_pass,B6
           MVKL    .S2     0x3ddb7cdf,B7
           MVKH    .S2     _fcn_pass,B6
           MVKH    .S2     0x3ddb7cdf,B7

           STW     .D2T1   A4,*+B6(8)        ; |67| 
||         MVKL    .S2     0xd9d7bdbb,B6

           MV      .L2     B10,B5            ; |67| 
||         LDW     .D2T2   *+B10(12),B4      ; |68| 
||         MVKH    .S2     0xd9d7bdbb,B6

           CALLP   .S2     _isequal,B3
||         LDW     .D2T1   *B5,A4            ; |68| 
||         MVK     .S1     0xc9,A6           ; |68| 
||         MVK     .L1     0x9,A8            ; |68| 

$C$RL8:    ; CALL OCCURS {_isequal} {0}      ; |68| 

           LDW     .D2T1   *+SP(64),A3       ; |68| 
||         MVKL    .S2     _fcn_pass,B5

           MVKL    .S2     0xd9d7bdbb,B6
           MVKL    .S2     0x3ddb7cdf,B7
           MVKH    .S2     _fcn_pass,B5
           MVKH    .S2     0xd9d7bdbb,B6

           ADD     .L1     4,A3,A15
||         MV      .L2     B10,B4
||         STW     .D2T1   A4,*+B5(12)       ; |68| 
||         MVKH    .S2     0x3ddb7cdf,B7

           CALLP   .S2     _isequal,B3
||         LDW     .D2T1   *B4,A4            ; |69| 
||         LDW     .D1T2   *A15,B4           ; |69| 
||         MVK     .S1     0xc9,A6           ; |69| 
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
           STW     .D2T2   B4,*+SP(72)       ; |69| 
           STW     .D2T1   A3,*+SP(68)

   [!A0]   B       .S1     $C$L5             ; |72| 
|| [ A0]   LDW     .D2T2   *B4,B0            ; |72| 

   [!A0]   CALL    .S1     _print_test_results ; |175| 
   [ A0]   ADD     .L2     4,B4,B4
   [!A0]   MVKL    .S2     _all_pass,B5
   [!A0]   MV      .L2X    A10,B4
   [!A0]   MVKH    .S2     _all_pass,B5
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
||         MVK     .L2     0x1,B4            ; |72| 

   [!A0]   MV      .L2X    A10,B4
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           CALL    .S1     _print_test_results ; |175| 
           MVKL    .S2     _all_pass,B5
           MVKH    .S2     _all_pass,B5
           NOP             2
;** --------------------------------------------------------------------------*
$C$L5:    
;          EXCLUSIVE CPU CYCLES: 1

           MVK     .L1     0x1,A4            ; |175| 
||         STW     .D2T2   B4,*B5            ; |72| 
||         ADDKPC  .S2     $C$RL10,B3,0      ; |175| 

$C$RL10:   ; CALL OCCURS {_print_test_results} {0}  ; |175| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 10

           MVKL    .S2     _a_sc,B16
||         MVK     .L2     0xffffffff,B5     ; |189| 

           MVKH    .S2     _a_sc,B16
||         MV      .L2     B5,B4             ; |189| 
||         ZERO    .L1     A9

           STDW    .D2T2   B5:B4,*+B16(56)   ; |189| 
||         MVKH    .S1     0xfff00000,A9
||         ZERO    .L2     B6                ; |187| 
||         ZERO    .S2     B7
||         ZERO    .L1     A8                ; |185| 

           STDW    .D2T1   A9:A8,*+B16(24)   ; |185| 
||         MVKH    .S2     0xbff00000,B7
||         ZERO    .L2     B9

           STDW    .D2T2   B7:B6,*+B16(40)   ; |187| 
||         SET     .S2     B9,0x14,0x1e,B9
||         ZERO    .L1     A10               ; |191| 
||         ZERO    .S1     A7
||         ZERO    .L2     B8                ; |184| 

           ZERO    .L2     B5:B4             ; |182| 
||         STDW    .D2T2   B9:B8,*+B16(16)   ; |184| 
||         MV      .L1X    B5,A4
||         MVKH    .S1     0x80000000,A7

           CMPEQ   .L2X    A10,3,B4          ; |193| 
||         STDW    .D2T2   B5:B4,*B16        ; |182| 
||         ADD     .L1     -1,A7,A5
||         MV      .S1X    B11,A14           ; |182| 

           MV      .S1X    B11,A5            ; |182| 
||         STDW    .D2T1   A5:A4,*+B16(48)   ; |188| 
||         CMPEQ   .L1     A10,2,A3          ; |193| 
||         ZERO    .D1     A6                ; |183| 

           OR      .L1X    B4,A3,A0          ; |193| 
||         MV      .S1     A12,A4            ; |182| 
||         STDW    .D2T1   A7:A6,*+B16(8)    ; |183| 

   [!A0]   B       .S1     $C$L7             ; |193| 
||         STDW    .D2T1   A5:A4,*+B16(32)   ; |186| 
||         MV      .L1X    B16,A11           ; |184| 

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains control code
;*----------------------------------------------------------------------------*
$C$L6:    
;          EXCLUSIVE CPU CYCLES: 5

   [ A0]   CALL    .S1     _asinhdp_c        ; |193| 
|| [ A0]   LDDW    .D1T1   *A11,A5:A4        ; |193| 

   [!A0]   CALL    .S1     _asinh            ; |193| 
   [!A0]   LDDW    .D1T1   *A11,A5:A4        ; |193| 
           NOP             2
           ; BRANCHCC OCCURS {$C$L7}         ; |193| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 1
           ADDKPC  .S2     $C$RL11,B3,0      ; |193| 
$C$RL11:   ; CALL OCCURS {_asinhdp_c} {0}    ; |193| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 6

           B       .S2     $C$L8             ; |193| 
||         MVKL    .S1     _output,A12

           MVKH    .S1     _output,A12
           LDW     .D1T1   *A12,A3           ; |193| 
           NOP             3
           ; BRANCH OCCURS {$C$L8}           ; |193| 
;** --------------------------------------------------------------------------*
$C$L7:    
;          EXCLUSIVE CPU CYCLES: 8
           ADDKPC  .S2     $C$RL12,B3,1      ; |193| 
$C$RL12:   ; CALL OCCURS {_asinh} {0}        ; |193| 
           MVKL    .S1     _output,A12
           MVKH    .S1     _output,A12
           LDW     .D1T1   *A12,A3           ; |193| 
           NOP             3
;** --------------------------------------------------------------------------*
$C$L8:    
;          EXCLUSIVE CPU CYCLES: 7
           NOP             1

           STDW    .D1T1   A5:A4,*+A3[A10]   ; |193| 
||         CALL    .S1     _asinhdp          ; |194| 

           LDDW    .D1T1   *A11,A5:A4        ; |194| 
           ADDKPC  .S2     $C$RL13,B3,3      ; |194| 
$C$RL13:   ; CALL OCCURS {_asinhdp} {0}      ; |194| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 207
           LDW     .D1T1   *+A12(4),A3       ; |194| 
           NOP             4
           STDW    .D1T1   A5:A4,*+A3[A10]   ; |194| 

           CALLP   .S2     _asinhdp_c,B3
||         LDDW    .D1T1   *A11,A5:A4        ; |195| 

$C$RL14:   ; CALL OCCURS {_asinhdp_c} {0}    ; |195| 
           LDW     .D1T1   *+A12(8),A3       ; |195| 
           MV      .L2X    A13,B5            ; |166| 
           ZERO    .L2     B4                ; |166| 
           ZERO    .L2     B7
           SET     .S2     B7,0x13,0x1d,B7
           STDW    .D1T1   A5:A4,*+A3[A10]   ; |195| 
           LDDW    .D1T1   *A11++,A25:A24    ; |196| 
           MV      .L1     A14,A5            ; |221| 
           ZERO    .L1     A4                ; |166| 
           ZERO    .L2     B6                ; |166| 
           ZERO    .L1     A31
           MPYDP   .M1     A25:A24,A25:A24,A23:A22 ; |221| 
           ABSDP   .S1     A25:A24,A27:A26   ; |214| 
           NOP             8
           ADDDP   .L1     A5:A4,A23:A22,A9:A8 ; |166| 
           MPYDP   .M1     A27:A26,A27:A26,A17:A16 ; |169| 
           NOP             5
           RSQRDP  .S1     A9:A8,A5:A4       ; |166| 
           NOP             1
           MPYDP   .M1     A5:A4,A9:A8,A7:A6 ; |166| 
           NOP             9
           MPYDP   .M1     A5:A4,A7:A6,A7:A6 ; |166| 
           CMPEQDP .S1     A9:A8,A17:A16,A0  ; |169| 
           NOP             9
           MPYDP   .M2X    B5:B4,A7:A6,B5:B4 ; |166| 
           NOP             9
           SUBDP   .L2     B7:B6,B5:B4,B5:B4 ; |166| 
           SET     .S1     A31,0x13,0x1d,A7
           ZERO    .L1     A6                ; |166| 
           NOP             4
           MPYDP   .M2X    A5:A4,B5:B4,B5:B4 ; |166| 
           NOP             9
           MPYDP   .M2X    B5:B4,A9:A8,B7:B6 ; |166| 
           MV      .L1     A13,A5            ; |166| 
           ZERO    .L1     A4                ; |166| 
           NOP             7
           MPYDP   .M2     B5:B4,B7:B6,B7:B6 ; |166| 
           NOP             9
           NOP             1
           MPYDP   .M1X    A5:A4,B7:B6,A5:A4 ; |166| 
           NOP             9
           SUBDP   .L1     A7:A6,A5:A4,A5:A4 ; |166| 
           MV      .L2X    A13,B7            ; |167| 
           ZERO    .L2     B6                ; |166| 
           NOP             5
           MPYDP   .M2X    B5:B4,A5:A4,B5:B4 ; |166| 
           NOP             9
           NOP             1
           MPYDP   .M1X    B5:B4,A9:A8,A5:A4 ; |167| 
           NOP             9
           NOP             1
           MPYDP   .M2X    B5:B4,A5:A4,B5:B4 ; |167| 
           NOP             9
           MPYDP   .M2     B7:B6,B5:B4,B5:B4 ; |167| 
           NOP             8
           MV      .L2X    A7,B7             ; |167| 
           SUBDP   .L2     B7:B6,B5:B4,B5:B4 ; |167| 
           MV      .L1     A13,A7            ; |167| 
           NOP             6
           MPYDP   .M1X    A5:A4,B5:B4,A5:A4 ; |167| 
           NOP             4

           MV      .L2     B6,B4             ; |167| 
||         MV      .S2X    A13,B5            ; |167| 

           NOP             1
           MPYDP   .M1X    B5:B4,A27:A26,A9:A8 ; |238| 
           NOP             2

   [ A0]   MV      .L1     A27,A5            ; |170| 
|| [ A0]   MV      .S1     A26,A4            ; |170| 

           MPYDP   .M1     A7:A6,A5:A4,A5:A4 ; |238| 
           NOP             9
           ADDDP   .L1     A5:A4,A9:A8,A5:A4 ; |238| 
           CALLP   .S2     _logdp_asinhdp_i,B3
$C$RL15:   ; CALL OCCURS {_logdp_asinhdp_i} {0}  ; |238| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 86
           MPYDP   .M1     A23:A22,A23:A22,A7:A6 ; |222| 
           MVKL    .S1     0x93a79b50,A18
           MVKL    .S2     0x3f9fd78f,B9
           MVKL    .S1     0xbfa6e4ec,A19
           MVKL    .S2     0x2884c094,B8
           MVKH    .S1     0x93a79b50,A18
           MVKH    .S2     0x3f9fd78f,B9
           MVKH    .S1     0xbfa6e4ec,A19
           MVKH    .S2     0x2884c094,B8
           MVKL    .S2     0x9b04cad8,B6
           MPYDP   .M1     A23:A22,A7:A6,A9:A8 ; |223| 
           MVKL    .S2     0x3fb3335d,B7
           MVKL    .S2     0x8d02093f,B4
           MVKL    .S2     0xbfc55555,B5
           MPYDP   .M1     A7:A6,A7:A6,A17:A16 ; |224| 
           MVKH    .S2     0x8d02093f,B4
           MVKH    .S2     0xbfc55555,B5
           MPYDP   .M2X    B5:B4,A23:A22,B5:B4 ; |232| 
           MVKH    .S2     0x9b04cad8,B6
           MVKH    .S2     0x3fb3335d,B7
           MPYDP   .M1     A19:A18,A9:A8,A19:A18 ; |232| 
           MPYDP   .M2X    B7:B6,A7:A6,B7:B6 ; |232| 
           ADDAW   .D1     A12,3,A3
           LDW     .D1T1   *A3,A3            ; |196| 
           MPYDP   .M1X    B9:B8,A17:A16,A17:A16 ; |232| 
           NOP             3
           MPYDP   .M1     A9:A8,A7:A6,A7:A6 ; |225| 
           NOP             5
           ADDDP   .L1     A17:A16,A19:A18,A17:A16 ; |232| 
           ADDDP   .L2     B7:B6,B5:B4,B5:B4 ; |232| 
           MV      .L1X    B13,A9            ; |225| 
           MV      .L1X    B12,A8            ; |232| 
           MPYDP   .M1     A9:A8,A7:A6,A7:A6 ; |232| 
           MVKL    .S2     0x33333333,B6
           MVKL    .S2     0x3fd33333,B7
           MVKH    .S2     0x33333333,B6
           ADDDP   .L2X    A17:A16,B5:B4,B5:B4 ; |232| 
           ZERO    .L1     A9:A8             ; |217| 
           CMPLTDP .S1     A25:A24,A9:A8,A0  ; |217| 
           MVKH    .S2     0x3fd33333,B7
   [!A0]   ZERO    .L2     B10               ; |217| 
           CMPGTDP .S1X    A27:A26,B7:B6,A1  ; |241| 
   [!A0]   MV      .S2X    A14,B11           ; |217| 
           ADDDP   .L2X    A7:A6,B5:B4,B5:B4 ; |232| 
           MVKL    .S1     0xfefa39ec,A6
           MVKL    .S1     0x3fe62e42,A7
           MVKH    .S1     0xfefa39ec,A6
           MVKH    .S1     0x3fe62e42,A7
           ADDDP   .L1     A7:A6,A5:A4,A5:A4 ; |238| 
   [ A0]   ZERO    .S2     B11
           MPYDP   .M2X    A25:A24,B5:B4,B5:B4 ; |232| 
   [ A0]   ZERO    .L2     B10               ; |217| 
   [ A0]   MVKH    .S2     0xbff00000,B11
           NOP             7
           ADDDP   .L2X    A25:A24,B5:B4,B5:B4 ; |232| 
           NOP             1
   [ A1]   MPYDP   .M2X    B11:B10,A5:A4,B5:B4 ; |242| 
           NOP             9

           STDW    .D1T2   B5:B4,*+A3[A10]   ; |196| 
||         ADD     .L1     1,A10,A10         ; |191| 

           CMPLT   .L1     A10,8,A0          ; |191| 

   [ A0]   BNOP    .S1     $C$L6,2           ; |191| 
||         CMPEQ   .L2X    A10,3,B4          ; |193| 
|| [ A0]   CMPEQ   .L1     A10,2,A3          ; |193| 
||         MV      .D1     A0,A2             ; guard predicate rewrite

           OR      .L1X    B4,A3,A0          ; |193| 
   [!A2]   MVK     .L1     0x1,A0            ; |193| nullify predicate
   [!A0]   B       .S1     $C$L7             ; |193| 
           ; BRANCHCC OCCURS {$C$L6}         ; |191| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 7

           MV      .L2X    A12,B10           ; |198| 
||         MVKL    .S1     _a_sc,A4

           CALLP   .S2     _asinhdp_v,B3
||         LDW     .D2T2   *+B10(16),B4      ; |198| 
||         MVKH    .S1     _a_sc,A4
||         MVK     .L1     0x8,A6            ; |198| 

$C$RL16:   ; CALL OCCURS {_asinhdp_v} {0}    ; |198| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 46
           MVKL    .S2     0x3ddb7cdf,B7
           MVKL    .S2     0xd9d7bdbb,B6
           MVKH    .S2     0x3ddb7cdf,B7

           LDW     .D2T1   *B10,A4           ; |66| 
||         MVKH    .S2     0xd9d7bdbb,B6

           CALLP   .S2     _isequal,B3
||         LDW     .D2T2   *+B10(4),B4       ; |66| 
||         MVK     .L1     0x8,A6            ; |66| 
||         MVK     .S1     0x9,A8            ; |66| 

$C$RL17:   ; CALL OCCURS {_isequal} {0}      ; |66| 
           MVKL    .S2     _fcn_pass,B6
           MVKL    .S2     0x3ddb7cdf,B7
           MVKH    .S2     _fcn_pass,B6
           MVKH    .S2     0x3ddb7cdf,B7

           STW     .D2T1   A4,*+B6(4)        ; |66| 
||         MVKL    .S2     0xd9d7bdbb,B6

           LDW     .D2T2   *+B10(8),B4       ; |67| 
||         MVKH    .S2     0xd9d7bdbb,B6

           CALLP   .S2     _isequal,B3
||         LDW     .D2T1   *B10,A4           ; |67| 
||         MVK     .L1     0x8,A6            ; |67| 
||         MVK     .S1     0x9,A8            ; |67| 

$C$RL18:   ; CALL OCCURS {_isequal} {0}      ; |67| 
           MVKL    .S2     _fcn_pass,B5
           MVKL    .S2     0x3ddb7cdf,B7
           MVKL    .S2     0xd9d7bdbb,B6
           MVKH    .S2     _fcn_pass,B5
           MVKH    .S2     0x3ddb7cdf,B7

           STW     .D2T1   A4,*+B5(8)        ; |67| 
||         MVKH    .S2     0xd9d7bdbb,B6

           CALLP   .S2     _isequal,B3
||         LDW     .D1T1   *A12,A4           ; |68| 
||         LDW     .D2T2   *+B10(12),B4      ; |68| 
||         MVK     .L1     0x8,A6            ; |68| 
||         MVK     .S1     0x9,A8            ; |68| 

$C$RL19:   ; CALL OCCURS {_isequal} {0}      ; |68| 
           MVKL    .S2     _fcn_pass,B4
           MVKL    .S2     0xd9d7bdbb,B6
           MVKL    .S2     0x3ddb7cdf,B7
           MVKH    .S2     _fcn_pass,B4
           MVKH    .S2     0xd9d7bdbb,B6

           STW     .D2T1   A4,*+B4(12)       ; |68| 
||         LDW     .D1T2   *A15,B4           ; |69| 
||         MVKH    .S2     0x3ddb7cdf,B7

           CALLP   .S2     _isequal,B3
||         LDW     .D1T1   *A12,A4           ; |69| 
||         MVK     .L1     0x8,A6            ; |69| 
||         MVK     .S1     0x9,A8            ; |69| 

$C$RL20:   ; CALL OCCURS {_isequal} {0}      ; |69| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 17
           LDW     .D2T1   *+SP(68),A3       ; |69| 
           MVKL    .S2     _fcn_pass,B31
           MVKH    .S2     _fcn_pass,B31
           STW     .D2T1   A4,*+B31(16)      ; |69| 
           NOP             1

           MV      .L2X    A3,B4             ; |69| 
||         STW     .D2T1   A3,*+SP(76)       ; |69| 

           LDW     .D2T2   *B4,B0            ; |72| 
           LDW     .D2T1   *+SP(72),A3
           NOP             3

   [!B0]   B       .S1     $C$L9             ; |72| 
|| [!B0]   ZERO    .L1     A4                ; |72| 
||         MV      .L2     B0,B1             ; guard predicate rewrite

   [!B0]   CALL    .S2     _print_test_results ; |202| 
|| [ B0]   MV      .L2X    A3,B4
||         STW     .D2T1   A3,*+SP(80)       ; |72| 
|| [!B0]   MVKL    .S1     _all_pass,A3

   [!B0]   MVKH    .S1     _all_pass,A3
|| [ B0]   LDW     .D2T2   *B4,B0            ; |72| 

   [ B1]   ADD     .L2     4,B4,B4
           NOP             2
           ; BRANCHCC OCCURS {$C$L9}         ; |72| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 11
           CMPEQ   .L1     A4,0,A3           ; |72| 
   [ B0]   LDW     .D2T2   *B4,B4            ; |72| 
           XOR     .L1     1,A3,A3           ; |72| 
   [!B0]   ZERO    .L1     A0                ; |72| 
           MVK     .L1     0x1,A4            ; |72| 
           NOP             1
   [ B0]   CMPEQ   .L2     B4,0,B4           ; |72| 
   [ B0]   XOR     .L2     1,B4,B4           ; |72| 
           NOP             1
   [ B0]   AND     .L1X    A3,B4,A0          ; |72| 
   [!A0]   ZERO    .L1     A4                ; |72| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           CALL    .S1     _print_test_results ; |202| 
           MVKL    .S1     _all_pass,A3
           MVKH    .S1     _all_pass,A3
           NOP             2
;** --------------------------------------------------------------------------*
$C$L9:    
;          EXCLUSIVE CPU CYCLES: 1

           STW     .D1T1   A4,*A3            ; |72| 
||         MVK     .L1     0x3,A4            ; |202| 
||         ADDKPC  .S2     $C$RL21,B3,0      ; |202| 

$C$RL21:   ; CALL OCCURS {_print_test_results} {0}  ; |202| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 46
           LDW     .D2T1   *+SP(24),A24      ; |167| 
           LDW     .D2T1   *+SP(64),A3       ; |211| 
           LDW     .D2T1   *+SP(52),A29      ; |238| 
           LDW     .D2T1   *+SP(28),A25      ; |167| 
           LDW     .D2T1   *+SP(36),A23      ; |167| 
           LDW     .D2T1   *+SP(12),A21      ; |167| 
           LDW     .D2T2   *+SP(40),B10      ; |167| 
           LDW     .D2T1   *+SP(56),A30      ; |238| 
           LDW     .D2T1   *+SP(60),A31      ; |238| 
           LDW     .D2T1   *+SP(48),A28      ; |238| 
           LDW     .D2T1   *+SP(20),A27      ; |167| 
           LDW     .D2T1   *+SP(16),A26      ; |167| 
           LDW     .D2T1   *+SP(32),A22      ; |167| 
           LDW     .D2T2   *+SP(44),B11      ; |167| 
           STW     .D2T1   A14,*+SP(24)      ; |166| 
           STW     .D2T2   B12,*+SP(84)      ; |167| 
           STW     .D2T2   B13,*+SP(88)      ; |167| 

           STW     .D2T1   A3,*+SP(132)      ; |238| 
||         ZERO    .L1     A6                ; |166| 

           STW     .D2T1   A6,*+SP(52)
||         ZERO    .L1     A7                ; |166| 

           STW     .D2T1   A7,*+SP(28)

           STW     .D2T1   A6,*+SP(36)       ; |166| 
||         MVK     .S2     0x777,B30

           STW     .D2T2   B30,*+SP(12)
||         MVKL    .S2     0xc000cccc,B5
||         MV      .L1     A13,A20           ; |166| 

           STW     .D2T1   A20,*+SP(40)      ; |166| 
||         MVKL    .S2     0xcccccccd,B31

           STW     .D2T1   A20,*+SP(56)      ; |166| 
||         MVKH    .S2     0xc000cccc,B5

           STW     .D2T2   B5,*+SP(140)      ; |211| 
||         MVKH    .S2     0xcccccccd,B31

           STW     .D2T2   B31,*+SP(136)     ; |211| 
           STW     .D2T1   A31,*+SP(128)     ; |238| 
           STW     .D2T1   A30,*+SP(124)     ; |238| 
           STW     .D2T1   A29,*+SP(120)     ; |238| 
           STW     .D2T1   A28,*+SP(116)     ; |238| 
           STW     .D2T1   A27,*+SP(96)      ; |167| 
           STW     .D2T1   A26,*+SP(92)      ; |167| 
           STW     .D2T1   A25,*+SP(104)     ; |167| 
           STW     .D2T1   A24,*+SP(100)     ; |167| 
           STW     .D2T1   A23,*+SP(112)     ; |167| 
           STW     .D2T1   A22,*+SP(108)     ; |167| 
           STW     .D2T1   A21,*+SP(48)      ; |166| 

           STW     .D2T1   A21,*+SP(32)      ; |166| 
||         MVKL    .S2     _a_ext,B4
||         ZERO    .L1     A5

           STW     .D2T1   A21,*+SP(64)      ; |166| 
||         SET     .S1     A5,0x14,0x14,A5
||         MVKH    .S2     _a_ext,B4
||         ZERO    .L1     A4                ; |166| 

           ZERO    .L1     A3                ; |166| 
||         STDW    .D2T1   A5:A4,*B4         ; |205| 

           STW     .D2T1   A3,*+SP(20)       ; |166| 
           STW     .D2T1   A3,*+SP(60)       ; |205| 

           MV      .L2X    A3,B4             ; |205| 
||         STW     .D2T1   A3,*+SP(44)
||         MV      .L1X    B4,A14            ; |205| 

           CALL    .S1     _asinh            ; |207| 
||         STW     .D2T2   B4,*+SP(16)       ; |205| 

           LDDW    .D1T1   *A14,A5:A4        ; |207| 

           ZERO    .L2     B12               ; |166| 
||         MV      .S2X    A13,B13           ; |166| 
||         MV      .L1     A13,A11           ; |166| 
||         ZERO    .S1     A10               ; |166| 
||         ZERO    .D1     A12               ; |166| 

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
$C$L10:    
;          EXCLUSIVE CPU CYCLES: 3
           ADDKPC  .S2     $C$RL22,B3,2      ; |207| 
$C$RL22:   ; CALL OCCURS {_asinh} {0}        ; |207| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 222
           MVKL    .S2     _output,B4

           MVKH    .S2     _output,B4
||         LDW     .D2T2   *+SP(16),B5

           LDW     .D2T2   *B4,B4            ; |207| 
           NOP             4
           ADD     .L2     B5,B4,B4          ; |207| 
           STDW    .D2T1   A5:A4,*B4         ; |207| 

           CALLP   .S2     _asinhdp,B3
||         LDDW    .D1T1   *A14,A5:A4        ; |208| 

$C$RL23:   ; CALL OCCURS {_asinhdp} {0}      ; |208| 
           MVKL    .S2     _output,B4

           MVKH    .S2     _output,B4
||         LDW     .D2T2   *+SP(16),B5

           LDW     .D2T2   *+B4(4),B4        ; |208| 
           NOP             4
           ADD     .L2     B5,B4,B4          ; |208| 
           STDW    .D2T1   A5:A4,*B4         ; |208| 

           CALLP   .S2     _asinhdp_c,B3
||         LDDW    .D1T1   *A14,A5:A4        ; |209| 

$C$RL24:   ; CALL OCCURS {_asinhdp_c} {0}    ; |209| 
           MVKL    .S2     _output,B4

           MVKH    .S2     _output,B4
||         LDW     .D2T2   *+SP(16),B5

           LDW     .D2T2   *+B4(8),B4        ; |209| 
           NOP             4
           ADD     .L2     B5,B4,B4          ; |209| 
           STDW    .D2T1   A5:A4,*B4         ; |209| 
           LDDW    .D1T1   *A14,A25:A24      ; |210| 
           LDW     .D2T1   *+SP(24),A5
           MV      .L1     A12,A4            ; |221| 
           NOP             2
           MPYDP   .M1     A25:A24,A25:A24,A23:A22 ; |221| 
           ABSDP   .S1     A25:A24,A27:A26   ; |214| 
           NOP             8
           ADDDP   .L1     A5:A4,A23:A22,A7:A6 ; |166| 
           MPYDP   .M2X    B13:B12,A27:A26,B5:B4 ; |238| 
           NOP             5
           RSQRDP  .S1     A7:A6,A9:A8       ; |166| 
           NOP             1
           MPYDP   .M1     A9:A8,A7:A6,A5:A4 ; |166| 
           NOP             9
           MPYDP   .M1     A9:A8,A5:A4,A17:A16 ; |166| 
           NOP             8

           MV      .L1     A11,A5            ; |166| 
||         MV      .S1     A12,A4            ; |166| 

           MPYDP   .M1     A5:A4,A17:A16,A17:A16 ; |166| 
           LDW     .D2T1   *+SP(32),A5
           NOP             8
           SUBDP   .L1     A5:A4,A17:A16,A5:A4 ; |166| 
           NOP             6
           MPYDP   .M1     A9:A8,A5:A4,A9:A8 ; |166| 
           NOP             9
           MPYDP   .M1     A9:A8,A7:A6,A5:A4 ; |166| 
           NOP             9
           MPYDP   .M1     A9:A8,A5:A4,A17:A16 ; |166| 
           NOP             8

           MV      .L1     A11,A5            ; |166| 
||         MV      .S1     A12,A4            ; |166| 

           MPYDP   .M1     A5:A4,A17:A16,A17:A16 ; |166| 
           LDW     .D2T1   *+SP(48),A5
           NOP             8
           SUBDP   .L1     A5:A4,A17:A16,A5:A4 ; |166| 
           NOP             6
           MPYDP   .M1     A9:A8,A5:A4,A9:A8 ; |166| 
           NOP             9
           MPYDP   .M1     A9:A8,A7:A6,A5:A4 ; |167| 
           NOP             9
           MPYDP   .M1     A9:A8,A5:A4,A9:A8 ; |167| 
           NOP             9
           MPYDP   .M1     A13:A12,A9:A8,A17:A16 ; |167| 
           LDW     .D2T1   *+SP(64),A9
           NOP             7
           MV      .L1     A12,A8            ; |167| 
           SUBDP   .L1     A9:A8,A17:A16,A17:A16 ; |167| 
           MPYDP   .M1     A27:A26,A27:A26,A9:A8 ; |169| 
           NOP             5
           MPYDP   .M1     A5:A4,A17:A16,A5:A4 ; |167| 
           NOP             7
           CMPEQDP .S1     A7:A6,A9:A8,A0    ; |169| 
           NOP             1

   [ A0]   MV      .L1     A27,A5            ; |170| 
|| [ A0]   MV      .S1     A26,A4            ; |170| 

           MPYDP   .M1     A11:A10,A5:A4,A5:A4 ; |238| 
           NOP             9
           ADDDP   .L1X    A5:A4,B5:B4,A5:A4 ; |238| 
           CALLP   .S2     _logdp_asinhdp_i,B3
$C$RL25:   ; CALL OCCURS {_logdp_asinhdp_i} {0}  ; |238| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 96
           MPYDP   .M1     A23:A22,A23:A22,A7:A6 ; |222| 
           MPYDP   .M2X    B11:B10,A23:A22,B5:B4 ; |232| 
           LDW     .D2T2   *+SP(112),B7
           LDW     .D2T2   *+SP(108),B6
           LDW     .D2T1   *+SP(104),A19
           LDW     .D2T1   *+SP(100),A18
           LDW     .D2T2   *+SP(96),B9       ; |232| 
           LDW     .D2T2   *+SP(92),B8       ; |232| 
           LDW     .D2T2   *+SP(132),B29
           LDW     .D2T2   *+SP(16),B28
           MPYDP   .M1     A7:A6,A7:A6,A17:A16 ; |224| 
           MPYDP   .M2X    B7:B6,A7:A6,B7:B6 ; |232| 
           LDW     .D2T2   *+SP(16),B27
           NOP             1
           MPYDP   .M1     A23:A22,A7:A6,A9:A8 ; |223| 
           NOP             9
           MPYDP   .M1     A19:A18,A9:A8,A19:A18 ; |232| 
           MPYDP   .M2X    B9:B8,A17:A16,B9:B8 ; |232| 
           ADDDP   .L2     B7:B6,B5:B4,B7:B6 ; |232| 
           LDW     .D2T2   *+SP(88),B5
           MPYDP   .M1     A9:A8,A7:A6,A7:A6 ; |225| 
           LDW     .D2T2   *+SP(84),B4
           LDW     .D2T1   *+SP(120),A9      ; |217| 
           LDW     .D2T1   *+SP(116),A8      ; |217| 
           ADD     .S2     8,B27,B26         ; |206| 
           NOP             2
           ADDDP   .L2X    B9:B8,A19:A18,B9:B8 ; |232| 
           ADDDP   .L1     A9:A8,A5:A4,A5:A4 ; |238| 
           NOP             2
           MPYDP   .M2X    B5:B4,A7:A6,B5:B4 ; |232| 
           LDW     .D2T1   *+SP(128),A7      ; |217| 
           LDW     .D2T1   *+SP(124),A6      ; |217| 
           ADDDP   .L2     B9:B8,B7:B6,B7:B6 ; |232| 
           NOP             6
           ADDDP   .S2     B5:B4,B7:B6,B5:B4 ; |232| 
           ZERO    .L2     B7:B6             ; |217| 
           CMPLTDP .S2X    A25:A24,B7:B6,B0  ; |217| 
           CMPGTDP .S1     A27:A26,A7:A6,A0  ; |241| 
   [!B0]   ZERO    .L1     A6                ; |217| 
   [!B0]   ZERO    .L1     A7
   [ B0]   ZERO    .L1     A7
           MPYDP   .M2X    A25:A24,B5:B4,B5:B4 ; |232| 
   [ B0]   ZERO    .L1     A6                ; |217| 
   [!B0]   SET     .S1     A7,0x14,0x1d,A7
   [ B0]   MVKH    .S1     0xbff00000,A7
           LDW     .D2T2   *+SP(12),B7
           NOP             6

           ADDDP   .L1X    A25:A24,B5:B4,A9:A8 ; |232| 
|| [ A0]   MPYDP   .M1     A7:A6,A5:A4,A9:A8 ; |242| 

           LDW     .D2T2   *B29,B4           ; |210| 
           LDW     .D2T2   *+SP(140),B5
           SUB     .L2     B7,1,B25          ; |206| 
           SUB     .L1X    B7,1,A2           ; |206| 
   [!A2]   MVKL    .S2     _output,B10
           ADD     .L2     B28,B4,B4         ; |210| 
   [!A2]   MVKH    .S2     _output,B10
           NOP             2
           STDW    .D2T1   A9:A8,*B4         ; |210| 

           LDDW    .D1T1   *A14,A5:A4        ; |211| 
||         LDW     .D2T2   *+SP(136),B4

           NOP             4
           MPYDP   .M2X    B5:B4,A5:A4,B5:B4 ; |211| 
           NOP             6
   [ A2]   BNOP    .S1     $C$L10,2          ; |206| 

   [ A2]   CALL    .S1     _asinh            ; |207| 
||         STDW    .D1T2   B5:B4,*++A14      ; |211| 

   [ A2]   LDDW    .D1T1   *A14,A5:A4        ; |207| 
||         STW     .D2T2   B26,*+SP(16)      ; |211| 

   [!A2]   CALL    .S1     _asinhdp_v        ; |213| 
||         STW     .D2T2   B25,*+SP(12)      ; |211| 

           ; BRANCHCC OCCURS {$C$L10}        ; |206| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           LDW     .D2T2   *+B10(16),B4      ; |213| 
           MVKL    .S1     _a_ext,A4
           MVKH    .S1     _a_ext,A4
           MVK     .S1     0x777,A6          ; |213| 
           ADDKPC  .S2     $C$RL26,B3,0      ; |213| 
$C$RL26:   ; CALL OCCURS {_asinhdp_v} {0}    ; |213| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 42
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
           MVKL    .S2     0x3ddb7cdf,B7
           MVKL    .S2     0xd9d7bdbb,B6
           MVKH    .S2     0x3ddb7cdf,B7

           MV      .L1     A15,A5            ; |68| 
||         MV      .L2     B10,B4            ; |68| 
||         STW     .D2T1   A4,*+B11(12)      ; |68| 
||         MVKH    .S2     0xd9d7bdbb,B6

           CALLP   .S2     _isequal,B3
||         LDW     .D2T1   *B4,A4            ; |69| 
||         LDW     .D1T2   *A5,B4            ; |69| 
||         MVK     .S1     0x777,A6          ; |69| 
||         MVK     .L1     0x9,A8            ; |69| 

$C$RL30:   ; CALL OCCURS {_isequal} {0}      ; |69| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 16
           LDW     .D2T1   *+SP(68),A3       ; |69| 
           LDW     .D2T2   *+SP(72),B4
           STW     .D2T1   A4,*+B11(16)      ; |69| 
           NOP             2
           LDW     .D1T1   *A3,A0            ; |72| 
           NOP             4

   [ A0]   ADD     .L2     4,B4,B4
|| [!A0]   B       .S1     $C$L11            ; |72| 
|| [ A0]   LDW     .D2T2   *B4,B0            ; |72| 

   [!A0]   CALL    .S1     _print_test_results ; |219| 
   [!A0]   MVKL    .S1     _all_pass,A3
   [!A0]   MVKH    .S1     _all_pass,A3
   [!A0]   MV      .L2     B12,B4
   [!A0]   MV      .L2X    A3,B5
           ; BRANCHCC OCCURS {$C$L11}        ; |72| 
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
           CALL    .S1     _print_test_results ; |219| 
           MVKL    .S1     _all_pass,A3
           MVKH    .S1     _all_pass,A3
           NOP             1
           MV      .L2X    A3,B5
;** --------------------------------------------------------------------------*
$C$L11:    
;          EXCLUSIVE CPU CYCLES: 1

           MVK     .L1     0x4,A4            ; |219| 
||         STW     .D2T2   B4,*B5            ; |72| 
||         ADDKPC  .S2     $C$RL31,B3,0      ; |219| 

$C$RL31:   ; CALL OCCURS {_print_test_results} {0}  ; |219| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 14
           MVKL    .S1     _cycle_counts+24,A3

           MVKH    .S1     _cycle_counts+24,A3
||         MV      .L2     B12,B4            ; |114| 
||         MV      .L1     A10,A13           ; |114| 

           MVC     .S2     B4,TSCL           ; |115| 
||         STDW    .D1T1   A13:A12,*A3       ; |114| 

           MVC     .S2     TSCL,B6           ; |116| 
           MVC     .S2     TSCH,B7           ; |116| 
           MVKL    .S1     _t_start,A3
           MVKH    .S1     _t_start,A3

           MVC     .S2     TSCL,B4           ; |117| 
||         STDW    .D1T2   B7:B6,*A3         ; |116| 

           MVC     .S2     TSCH,B8           ; |117| 

           CALL    .S1     _gimme_random     ; |229| 
||         SUBU    .L2     B4,B6,B5:B4       ; |117| 

           EXT     .S2     B5,24,24,B6       ; |117| 
||         SUB     .L2     B8,B7,B31         ; |117| 
||         MVKL    .S1     _t_offset,A3

           ADD     .L2     B31,B6,B5         ; |117| 
||         MVKH    .S1     _t_offset,A3
||         MVK     .S2     0x80,B10

           MVKL    .S2     0xc0b38800,B5
||         STDW    .D1T2   B5:B4,*A3         ; |117| 
||         MVKL    .S1     0x412e8482,A5

           MVKH    .S2     0xc0b38800,B5
||         MV      .L2     B12,B4            ; |229| 
||         MVKH    .S1     0x412e8482,A5
||         MV      .L1     A13,A14           ; |117| 
||         MV      .D1     A12,A4            ; |229| 

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
$C$L12:    
;          EXCLUSIVE CPU CYCLES: 1
           ADDKPC  .S2     $C$RL32,B3,0      ; |229| 
$C$RL32:   ; CALL OCCURS {_gimme_random} {0}  ; |229| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 195
           MVKL    .S1     _input,A3
           MVKH    .S1     _input,A3
           LDW     .D1T1   *A3,A3            ; |229| 
           NOP             4
           ADD     .L1     A14,A3,A3         ; |229| 

           STDW    .D1T1   A5:A4,*A3         ; |229| 
||         MVC     .S2     TSCL,B20          ; |122| 

           MVC     .S2     TSCH,B21          ; |122| 

           MV      .L1     A5,A23            ; |233| 
||         MV      .S1     A4,A22            ; |233| 

           MPYDP   .M1     A23:A22,A23:A22,A25:A24 ; |221| 
           ZERO    .L1     A5
           SET     .S1     A5,0x14,0x1d,A5
           MV      .L1     A12,A4            ; |166| 
           MV      .L2     B13,B5            ; |166| 
           MV      .L2     B12,B4            ; |166| 
           ZERO    .L2     B31
           ZERO    .L1     A31
           ZERO    .L2     B30
           ABSDP   .S1     A23:A22,A27:A26   ; |214| 
           ADDDP   .L1     A5:A4,A25:A24,A7:A6 ; |166| 
           NOP             6
           RSQRDP  .S1     A7:A6,A5:A4       ; |166| 
           NOP             1
           MPYDP   .M1     A5:A4,A7:A6,A9:A8 ; |166| 
           NOP             9
           MPYDP   .M1     A5:A4,A9:A8,A9:A8 ; |166| 
           NOP             9
           NOP             1
           MPYDP   .M2X    B5:B4,A9:A8,B7:B6 ; |166| 
           NOP             8
           SET     .S2     B31,0x13,0x1d,B5
           SUBDP   .L2     B5:B4,B7:B6,B5:B4 ; |166| 
           NOP             6
           MPYDP   .M2X    A5:A4,B5:B4,B5:B4 ; |166| 
           NOP             9
           MPYDP   .M2X    B5:B4,A7:A6,B7:B6 ; |166| 
           MV      .L1     A11,A5            ; |166| 
           MV      .L1     A12,A4            ; |166| 
           NOP             7
           MPYDP   .M2     B5:B4,B7:B6,B7:B6 ; |166| 
           NOP             9
           NOP             1
           MPYDP   .M1X    A5:A4,B7:B6,A9:A8 ; |166| 
           NOP             8
           SET     .S1     A31,0x13,0x1d,A5
           SUBDP   .L1     A5:A4,A9:A8,A5:A4 ; |166| 
           MV      .L2     B13,B7            ; |167| 
           MV      .L2     B12,B6            ; |167| 
           MPYDP   .M1     A27:A26,A27:A26,A9:A8 ; |169| 
           NOP             4
           MPYDP   .M2X    B5:B4,A5:A4,B5:B4 ; |166| 
           NOP             9
           NOP             1
           MPYDP   .M1X    B5:B4,A7:A6,A5:A4 ; |167| 
           CMPEQDP .S1     A7:A6,A9:A8,A0    ; |169| 
           NOP             9
           MPYDP   .M2X    B5:B4,A5:A4,B5:B4 ; |167| 
           NOP             9
           MPYDP   .M2     B7:B6,B5:B4,B5:B4 ; |167| 
           NOP             8
           SET     .S2     B30,0x13,0x1d,B7
           SUBDP   .L2     B7:B6,B5:B4,B5:B4 ; |167| 
           NOP             7
           MPYDP   .M1X    A5:A4,B5:B4,A5:A4 ; |167| 
           NOP             4

           MV      .L2     B13,B5            ; |167| 
||         MV      .S2     B6,B4             ; |167| 

           NOP             1
           MPYDP   .M1X    B5:B4,A27:A26,A7:A6 ; |238| 
           NOP             2

   [ A0]   MV      .L1     A27,A5            ; |170| 
|| [ A0]   MV      .S1     A26,A4            ; |170| 

           MPYDP   .M1     A11:A10,A5:A4,A5:A4 ; |238| 
           NOP             9
           ADDDP   .L1     A5:A4,A7:A6,A5:A4 ; |238| 
           CALLP   .S2     _logdp_asinhdp_i,B3
$C$RL33:   ; CALL OCCURS {_logdp_asinhdp_i} {0}  ; |238| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 94
           MPYDP   .M1     A25:A24,A25:A24,A9:A8 ; |222| 
           MVKL    .S1     0xbfa6e4ec,A19
           MVKL    .S2     0x3f9fd78f,B7
           MVKL    .S1     0x93a79b50,A18
           MVKL    .S2     0x2884c094,B6
           MVKH    .S1     0xbfa6e4ec,A19
           MVKH    .S2     0x3f9fd78f,B7
           MVKH    .S2     0x2884c094,B6
           MVKL    .S2     0x3fb3335d,B5
           MVKL    .S2     0x9b04cad8,B4
           MPYDP   .M1     A9:A8,A9:A8,A7:A6 ; |224| 
           MVKL    .S2     0x8d02093f,B8
           MVKL    .S2     0xbfc55555,B9
           MVKH    .S2     0x3fb3335d,B5
           MPYDP   .M1     A25:A24,A9:A8,A17:A16 ; |223| 
           MVKH    .S2     0x9b04cad8,B4
           MPYDP   .M2X    B5:B4,A9:A8,B5:B4 ; |232| 
           MVKH    .S2     0x8d02093f,B8
           MVKH    .S2     0xbfc55555,B9
           MVKH    .S1     0x93a79b50,A18
           MPYDP   .M1X    B7:B6,A7:A6,A7:A6 ; |232| 
           MPYDP   .M2X    B9:B8,A25:A24,B7:B6 ; |232| 
           MVKL    .S1     _output+12,A3
           MVKH    .S1     _output+12,A3
           MPYDP   .M1     A19:A18,A17:A16,A19:A18 ; |232| 
           LDW     .D1T1   *A3,A3            ; |233| 
           MVKL    .S2     _t_start,B29
           MVKH    .S2     _t_start,B29
           MPYDP   .M1     A17:A16,A9:A8,A9:A8 ; |225| 
           STDW    .D2T2   B21:B20,*B29
           ADD     .L1     A14,A3,A3         ; |233| 
           ADDDP   .L2     B5:B4,B7:B6,B5:B4 ; |232| 
           MVKL    .S1     0xbf978498,A17
           MVKL    .S1     0x92c0541a,A16
           ADDDP   .L1     A7:A6,A19:A18,A19:A18 ; |232| 
           MVKH    .S1     0xbf978498,A17
           MVKH    .S1     0x92c0541a,A16
           MVKL    .S2     0x3fd33333,B7
           MPYDP   .M1     A17:A16,A9:A8,A7:A6 ; |232| 
           MVKL    .S2     0x33333333,B6
           MVKH    .S2     0x3fd33333,B7
           MVKH    .S2     0x33333333,B6
           ADDDP   .L2X    A19:A18,B5:B4,B5:B4 ; |232| 
           CMPGTDP .S1X    A27:A26,B7:B6,A1  ; |241| 
           NOP             5
           ADDDP   .L2X    A7:A6,B5:B4,B5:B4 ; |232| 
           MVKL    .S1     0xfefa39ec,A8
           MVKL    .S1     0x3fe62e42,A9
           MVKH    .S1     0xfefa39ec,A8
           MVKH    .S1     0x3fe62e42,A9
           ZERO    .L1     A7:A6             ; |217| 
           CMPLTDP .S1     A23:A22,A7:A6,A0  ; |217| 
           MPYDP   .M2X    A23:A22,B5:B4,B5:B4 ; |232| 
           ADDDP   .L1     A9:A8,A5:A4,A5:A4 ; |238| 
   [!A0]   ZERO    .L2     B8                ; |217| 
   [ A0]   ZERO    .L2     B9
   [!A0]   ZERO    .L2     B9
   [ A0]   ZERO    .L2     B8                ; |217| 
   [ A0]   MVKH    .S2     0xbff00000,B9
   [!A0]   SET     .S2     B9,0x14,0x1d,B9
           NOP             2
           ADDDP   .L2X    A23:A22,B5:B4,B5:B4 ; |232| 
           NOP             1
   [ A1]   MPYDP   .M2X    B9:B8,A5:A4,B5:B4 ; |242| 
           NOP             9

           STDW    .D1T2   B5:B4,*A3         ; |233| 
||         MVC     .S2     TSCL,B6           ; |128| 

           MVC     .S2     TSCH,B7           ; |128| 

           MVKL    .S1     _t_offset,A3
||         SUB     .L1X    B10,1,A0          ; |227| 
||         MVKL    .S2     _cycle_counts+24,B11
||         ADD     .D1     8,A14,A14         ; |227| 
||         SUB     .L2     B10,1,B10         ; |227| 

           MVKH    .S1     _t_offset,A3
||         MVKH    .S2     _cycle_counts+24,B11

           LDDW    .D1T1   *A3,A5:A4         ; |130| 
||         MVKL    .S1     _cycle_counts+24,A30

           MVKH    .S1     _cycle_counts+24,A30

           LDDW    .D1T1   *A30,A7:A6        ; |130| 
||         MVKL    .S1     _t_stop,A29

           MVKH    .S1     _t_stop,A29
           STDW    .D1T2   B7:B6,*A29        ; |128| 

           ADDU    .L2X    A4,B20,B5:B4      ; |130| 
|| [ A0]   MV      .L1     A12,A4            ; |229| 

           ADD     .D2X    B5,A5,B16         ; |130| 
|| [ A0]   B       .S2     $C$L12            ; |227| 
||         SUBU    .L2     B6,B4,B5:B4       ; |130| 
|| [ A0]   MVKL    .S1     0x412e8482,A5

   [ A0]   CALL    .S1     _gimme_random     ; |229| 
||         ADD     .L2     B16,B21,B16       ; |130| 
||         EXT     .S2     B5,24,24,B5       ; |130| 

           ADDU    .L2X    A6,B4,B17:B16     ; |130| 
||         SUB     .S2     B7,B16,B4         ; |130| 
|| [ A0]   MVKH    .S1     0x412e8482,A5

           ADD     .L2     B4,B5,B5          ; |130| 
||         ADD     .S2X    B17,A7,B4         ; |130| 

           ADD     .L2     B4,B5,B17         ; |130| 
|| [ A0]   MVKL    .S2     0xc0b38800,B5
|| [ A0]   MV      .D2     B12,B4            ; |229| 

   [!A0]   CALL    .S1     __fltllif         ; |135| 
||         STDW    .D2T2   B17:B16,*B11      ; |130| 
|| [ A0]   MVKH    .S2     0xc0b38800,B5

           ; BRANCHCC OCCURS {$C$L12}        ; |227| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           LDDW    .D2T1   *B11,A5:A4        ; |135| 
           ADDKPC  .S2     $C$RL34,B3,3      ; |135| 
$C$RL34:   ; CALL OCCURS {__fltllif} {0}     ; |135| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 15
           ZERO    .L1     A3
           SET     .S1     A3,0x1a,0x1d,A3
           MPYSP   .M1     A3,A4,A3          ; |135| 
           NOP             3
           SPDP    .S1     A3,A5:A4          ; |135| 
           NOP             1
           ADDDP   .L1     A11:A10,A5:A4,A5:A4 ; |135| 
           CALLP   .S2     __fixdlli,B3
$C$RL35:   ; CALL OCCURS {__fixdlli} {0}     ; |135| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 13
           MVK     .S1     24,A3

           SUB     .L1X    B11,A3,A3
||         MV      .L2     B12,B4            ; |114| 
||         STDW    .D2T1   A5:A4,*B11        ; |135| 

           STDW    .D1T1   A13:A12,*A3       ; |114| 
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
$C$L13:    
;          EXCLUSIVE CPU CYCLES: 15
           MVC     .S2     TSCL,B4           ; |122| 
           MVC     .S2     TSCH,B5           ; |122| 
           MVKL    .S1     _input,A3
           MVKH    .S1     _input,A3
           LDW     .D1T1   *A3,A3            ; |242| 
           MVKL    .S2     _t_start,B6
           MVKH    .S2     _t_start,B6
           STDW    .D2T2   B5:B4,*B6         ; |122| 
           NOP             1

           ADD     .L1     A10,A3,A3         ; |242| 
||         CALL    .S1     _asinh            ; |242| 

           LDDW    .D1T1   *A3,A5:A4         ; |242| 
           ADDKPC  .S2     $C$RL36,B3,3      ; |242| 
$C$RL36:   ; CALL OCCURS {_asinh} {0}        ; |242| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 24
           MVKL    .S2     _output,B11
           MVKH    .S2     _output,B11
           LDW     .D2T2   *B11,B4           ; |242| 
           NOP             4
           ADD     .L1X    A10,B4,A3         ; |242| 

           STDW    .D1T1   A5:A4,*A3         ; |242| 
||         MVC     .S2     TSCL,B16          ; |128| 

           MVC     .S2     TSCH,B4           ; |128| 

           MVKL    .S1     _t_offset,A14
||         MVKL    .S2     _t_start,B5
||         SUB     .L1X    B10,1,A0          ; |240| 
||         MV      .L2     B4,B17            ; |128| 
||         ADD     .D1     8,A10,A10         ; |240| 
||         SUB     .D2     B10,1,B10         ; |240| 

           MVKH    .S1     _t_offset,A14
||         MVKH    .S2     _t_start,B5

           LDDW    .D1T1   *A14,A5:A4        ; |130| 
||         LDDW    .D2T2   *B5,B7:B6         ; |130| 
||         MVKL    .S1     _cycle_counts,A3
||         MVKL    .S2     _cycle_counts,B4

           MVKH    .S1     _cycle_counts,A3
||         MVKH    .S2     _cycle_counts,B4

           LDDW    .D1T1   *A3,A7:A6         ; |130| 
||         MVKL    .S1     _t_stop,A31

           MVKH    .S1     _t_stop,A31
|| [!A0]   MV      .L1X    B4,A3

           STDW    .D1T2   B17:B16,*A31      ; |128| 
           ADDU    .L2X    A4,B6,B9:B8       ; |130| 

           ADD     .S2X    B9,A5,B5          ; |130| 
|| [ A0]   B       .S1     $C$L13            ; |240| 
||         SUBU    .L2     B16,B8,B9:B8      ; |130| 

           ADD     .D2     B5,B7,B5          ; |130| 
||         ADDU    .L2X    A6,B8,B7:B6       ; |130| 
||         EXT     .S2     B9,24,24,B8       ; |130| 

           SUB     .L2     B17,B5,B5         ; |130| 

           ADD     .L2X    B7,A7,B5          ; |130| 
||         ADD     .S2     B5,B8,B7          ; |130| 

           ADD     .L2     B5,B7,B7          ; |130| 

   [!A0]   CALL    .S1     __fltllif         ; |135| 
||         STDW    .D2T2   B7:B6,*B4         ; |130| 

           ; BRANCHCC OCCURS {$C$L13}        ; |240| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           LDDW    .D1T1   *A3,A5:A4         ; |135| 
           ADDKPC  .S2     $C$RL37,B3,3      ; |135| 
$C$RL37:   ; CALL OCCURS {__fltllif} {0}     ; |135| 
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
$C$RL38:   ; CALL OCCURS {__fixdlli} {0}     ; |135| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 12
           MVKL    .S1     _cycle_counts,A3
           MVKH    .S1     _cycle_counts,A3

           STDW    .D1T1   A13:A12,*+A3(8)   ; |114| 
||         MV      .L2     B12,B4            ; |114| 

           MVC     .S2     B4,TSCL           ; |115| 
||         STDW    .D1T1   A5:A4,*A3         ; |135| 

           MVC     .S2     TSCL,B5           ; |116| 
           MVC     .S2     TSCH,B4           ; |116| 
           MVC     .S2     TSCL,B6           ; |117| 
           MVC     .S2     TSCH,B9           ; |117| 
           SUBU    .L2     B6,B5,B7:B6       ; |117| 

           EXT     .S2     B7,24,24,B5       ; |117| 
||         MVK     .S1     0x80,A3
||         SUB     .L2     B9,B4,B4          ; |117| 

           ADD     .L2     B4,B5,B7          ; |117| 
||         MV      .S2X    A14,B8            ; |117| 

           STDW    .D2T2   B7:B6,*B8         ; |117| 
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
;          EXCLUSIVE CPU CYCLES: 15
           MVC     .S2     TSCL,B4           ; |122| 
           MVC     .S2     TSCH,B5           ; |122| 
           MVKL    .S1     _input,A3
           MVKH    .S1     _input,A3
           LDW     .D1T1   *A3,A3            ; |251| 
           MVKL    .S2     _t_start,B6
           MVKH    .S2     _t_start,B6
           STDW    .D2T2   B5:B4,*B6         ; |122| 
           NOP             1

           ADD     .L1     A10,A3,A3         ; |251| 
||         CALL    .S1     _asinhdp          ; |251| 

           LDDW    .D1T1   *A3,A5:A4         ; |251| 
           ADDKPC  .S2     $C$RL39,B3,3      ; |251| 
$C$RL39:   ; CALL OCCURS {_asinhdp} {0}      ; |251| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 23
           ADD     .L2     4,B11,B4
           LDW     .D2T2   *B4,B4            ; |251| 
           NOP             4
           ADD     .L1X    A10,B4,A3         ; |251| 

           STDW    .D1T1   A5:A4,*A3         ; |251| 
||         MVC     .S2     TSCL,B8           ; |128| 

           MVC     .S2     TSCH,B9           ; |128| 

           MVKL    .S2     _t_start,B12
||         LDDW    .D1T1   *A14,A5:A4        ; |130| 
||         MVKL    .S1     _cycle_counts+8,A3
||         SUB     .L1X    B10,1,A0          ; |249| 
||         SUB     .L2     B10,1,B10         ; |249| 

           MVKH    .S2     _t_start,B12
||         MVKH    .S1     _cycle_counts+8,A3
||         ADD     .L1     8,A10,A10         ; |249| 

           LDDW    .D2T2   *B12,B7:B6        ; |130| 
||         LDDW    .D1T1   *A3,A7:A6         ; |130| 
||         MVKL    .S1     _t_stop,A31

           MV      .L2X    A3,B13            ; |130| 
||         MVKH    .S1     _t_stop,A31

           STDW    .D1T2   B9:B8,*A31        ; |128| 
   [!A0]   MVK     .S1     8,A3
   [!A0]   SUB     .L1X    B13,A3,A3
           ADDU    .L2X    A4,B6,B5:B4       ; |130| 

           ADD     .S2X    B5,A5,B6          ; |130| 
|| [ A0]   B       .S1     $C$L14            ; |249| 
||         SUBU    .L2     B8,B4,B5:B4       ; |130| 

           ADD     .D2     B6,B7,B6          ; |130| 
||         EXT     .S2     B5,24,24,B7       ; |130| 
||         ADDU    .L2X    A6,B4,B5:B4       ; |130| 

           SUB     .L2     B9,B6,B6          ; |130| 
||         ADD     .S2X    B5,A7,B5          ; |130| 

           ADD     .L2     B6,B7,B6          ; |130| 
           ADD     .L2     B5,B6,B5          ; |130| 

   [!A0]   CALL    .S1     __fltllif         ; |135| 
||         STDW    .D2T2   B5:B4,*B13        ; |130| 

           ; BRANCHCC OCCURS {$C$L14}        ; |249| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           LDDW    .D1T1   *+A3(8),A5:A4     ; |135| 
           ADDKPC  .S2     $C$RL40,B3,3      ; |135| 
$C$RL40:   ; CALL OCCURS {__fltllif} {0}     ; |135| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 70
           ZERO    .L1     A3
           SET     .S1     A3,0x1a,0x1d,A3
           MPYSP   .M1     A3,A4,A3          ; |135| 
           MV      .L1     A12,A10           ; |135| 
           NOP             2
           SPDP    .S1     A3,A5:A4          ; |135| 
           NOP             1
           ADDDP   .L1     A11:A10,A5:A4,A5:A4 ; |135| 
           CALLP   .S2     __fixdlli,B3
$C$RL41:   ; CALL OCCURS {__fixdlli} {0}     ; |135| 
           MV      .L1X    B13,A10           ; |135| 
           SUBAW   .D1     A10,2,A3

           MV      .L2X    A13,B4            ; |114| 
||         STDW    .D1T1   A5:A4,*A10        ; |135| 

           STDW    .D1T1   A13:A12,*+A3(32)  ; |114| 
||         MVC     .S2     B4,TSCL           ; |115| 

           MVC     .S2     TSCL,B4           ; |116| 
           MVC     .S2     TSCH,B5           ; |116| 

           STDW    .D2T2   B5:B4,*B12        ; |116| 
||         MVC     .S2     TSCL,B6           ; |117| 

           MVC     .S2     TSCH,B8           ; |117| 
           MVKL    .S1     _input,A3

           SUBU    .L2     B6,B4,B7:B6       ; |117| 
||         MVKH    .S1     _input,A3

           SUB     .L2     B8,B5,B4          ; |117| 
||         EXT     .S2     B7,24,24,B5       ; |117| 
||         LDW     .D1T1   *A3,A4            ; |258| 

           ADD     .L2     B4,B5,B7          ; |117| 
||         LDW     .D1T2   *A15,B4           ; |258| 

           CALLP   .S2     _asinhdp_v,B3
||         STDW    .D1T2   B7:B6,*A14        ; |117| 
||         MVK     .S1     0x80,A6           ; |258| 

$C$RL42:   ; CALL OCCURS {_asinhdp_v} {0}    ; |258| 
           MVC     .S2     TSCL,B16          ; |128| 
           MVC     .S2     TSCH,B4           ; |128| 

           LDDW    .D2T2   *B12,B9:B8        ; |130| 
||         LDDW    .D1T1   *A14,A5:A4        ; |130| 

           MVK     .S2     24,B10
           ADD     .L2X    A10,B10,B10
           LDDW    .D2T2   *B10,B7:B6        ; |130| 
           MVKL    .S1     _t_stop,A3

           ADDU    .L1X    A4,B8,A7:A6       ; |130| 
||         MVKH    .S1     _t_stop,A3

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

           CALLP   .S2     __fltllif,B3
||         MV      .L1X    B4,A5             ; |130| 

$C$RL43:   ; CALL OCCURS {__fltllif} {0}     ; |130| 
           ZERO    .L1     A3
           SET     .S1     A3,0x1a,0x1d,A3
           MPYSP   .M1     A3,A4,A3          ; |130| 
           MV      .L1     A12,A10           ; |130| 
           NOP             2
           SPDP    .S1     A3,A5:A4          ; |130| 
           NOP             1
           ADDDP   .L1     A11:A10,A5:A4,A5:A4 ; |130| 
           CALLP   .S2     __fixdlli,B3
$C$RL44:   ; CALL OCCURS {__fixdlli} {0}     ; |130| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 11
           MVK     .S1     8,A3

           SUB     .L1X    B13,A3,A3
||         STDW    .D2T1   A5:A4,*B10        ; |130| 
||         MV      .L2X    A13,B4            ; |114| 

           MVC     .S2     B4,TSCL           ; |115| 
||         STDW    .D1T1   A13:A12,*+A3(16)  ; |114| 

           MVC     .S2     TSCL,B5           ; |116| 
           MVC     .S2     TSCH,B4           ; |116| 
           MVC     .S2     TSCL,B6           ; |117| 
           MVC     .S2     TSCH,B8           ; |117| 
           SUBU    .L2     B6,B5,B7:B6       ; |117| 

           EXT     .S2     B7,24,24,B5       ; |117| 
||         SUB     .L2     B8,B4,B4          ; |117| 

           ADD     .L2     B4,B5,B7          ; |117| 
||         MVK     .S1     0x80,A3

           STDW    .D1T2   B7:B6,*A14        ; |117| 
||         MV      .L1     A3,A10            ; |117| 

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
           MVKL    .S1     _input,A3
           MVKH    .S1     _input,A3
           LDW     .D1T1   *A3,A3            ; |266| 
           MV      .L2     B12,B6            ; |266| 
           STDW    .D2T2   B5:B4,*B6         ; |122| 
           NOP             2

           ADD     .L1     A12,A3,A3         ; |266| 
||         CALL    .S1     _asinhdp_c        ; |266| 

           LDDW    .D1T1   *A3,A5:A4         ; |266| 
           ADDKPC  .S2     $C$RL45,B3,3      ; |266| 
$C$RL45:   ; CALL OCCURS {_asinhdp_c} {0}    ; |266| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 22
           ADDAD   .D2     B11,1,B4
           LDW     .D2T2   *B4,B4            ; |266| 
           NOP             4
           ADD     .L1X    A12,B4,A3         ; |266| 

           STDW    .D1T1   A5:A4,*A3         ; |266| 
||         MVC     .S2     TSCL,B8           ; |128| 

           MVC     .S2     TSCH,B6           ; |128| 

           MV      .L2     B12,B4            ; |128| 
||         MV      .L1     A14,A3            ; |128| 
||         MVK     .S1     8,A31
||         SUB     .D1     A10,1,A0          ; |264| 
||         MV      .S2     B6,B9             ; |128| 
||         ADDAD   .D2     B13,1,B10

           LDDW    .D1T1   *A3,A5:A4         ; |130| 
||         LDDW    .D2T2   *B4,B17:B16       ; |130| 
||         ADD     .L1X    B13,A31,A3
||         MVKL    .S1     _t_stop,A30

           MVKH    .S1     _t_stop,A30
||         SUB     .L1     A10,1,A10         ; |264| 

           LDDW    .D1T1   *A3,A7:A6         ; |130| 
           ADD     .L1     8,A12,A12         ; |264| 
           STDW    .D1T2   B9:B8,*A30        ; |128| 
           ADDU    .L2X    A4,B16,B5:B4      ; |130| 

   [ A0]   B       .S1     $C$L15            ; |264| 
||         ADD     .S2X    B5,A5,B6          ; |130| 
||         SUBU    .L2     B8,B4,B5:B4       ; |130| 

           ADD     .D2     B6,B17,B6         ; |130| 
||         EXT     .S2     B5,24,24,B31      ; |130| 
||         ADDU    .L2X    A6,B4,B5:B4       ; |130| 

           SUB     .L2     B9,B6,B7          ; |130| 
||         ADD     .S2X    B5,A7,B6          ; |130| 

           ADD     .L2     B7,B31,B5         ; |130| 
           ADD     .L2     B6,B5,B5          ; |130| 

   [!A0]   CALL    .S1     __fltllif         ; |135| 
||         STDW    .D2T2   B5:B4,*B10        ; |130| 

           ; BRANCHCC OCCURS {$C$L15}        ; |264| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           LDDW    .D2T1   *B10,A5:A4        ; |135| 
           ADDKPC  .S2     $C$RL46,B3,3      ; |135| 
$C$RL46:   ; CALL OCCURS {__fltllif} {0}     ; |135| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 55
           ZERO    .L1     A3
           SET     .S1     A3,0x1a,0x1d,A3
           MPYSP   .M1     A3,A4,A3          ; |135| 
           MV      .L1     A13,A10           ; |135| 
           NOP             2
           SPDP    .S1     A3,A5:A4          ; |135| 
           NOP             1
           ADDDP   .L1     A11:A10,A5:A4,A5:A4 ; |135| 
           CALLP   .S2     __fixdlli,B3
$C$RL47:   ; CALL OCCURS {__fixdlli} {0}     ; |135| 
           MVKL    .S2     0xd9d7bdbb,B6
           MVKL    .S2     0x3ddb7cdf,B7

           MV      .L1X    B11,A10           ; |135| 
||         MVKH    .S2     0xd9d7bdbb,B6

           LDW     .D1T2   *+A10(4),B4       ; |66| 
||         STDW    .D2T1   A5:A4,*B10        ; |135| 
||         MVKH    .S2     0x3ddb7cdf,B7

           CALLP   .S2     _isequal,B3
||         LDW     .D1T1   *A10,A4           ; |66| 
||         MVK     .S1     0x80,A6           ; |66| 
||         MVK     .L1     0x9,A8            ; |66| 

$C$RL48:   ; CALL OCCURS {_isequal} {0}      ; |66| 

           MVKL    .S1     _fcn_pass,A3
||         MVKL    .S2     0xd9d7bdbb,B6

           MVKH    .S1     _fcn_pass,A3
||         MVKL    .S2     0x3ddb7cdf,B7

           MVKH    .S2     0xd9d7bdbb,B6

           MV      .L1     A4,A5             ; |66| 
||         LDW     .D1T1   *A10,A4           ; |67| 
||         MV      .L2X    A3,B10            ; |66| 
||         MVKH    .S2     0x3ddb7cdf,B7

           CALLP   .S2     _isequal,B3
||         LDW     .D1T2   *+A10(8),B4       ; |67| 
||         STW     .D2T1   A5,*+B10(4)       ; |66| 
||         MVK     .S1     0x80,A6           ; |67| 
||         MVK     .L1     0x9,A8            ; |67| 

$C$RL49:   ; CALL OCCURS {_isequal} {0}      ; |67| 
           MVKL    .S2     0xd9d7bdbb,B6
           MVKL    .S2     0x3ddb7cdf,B7

           MV      .L1     A4,A3             ; |67| 
||         MVKH    .S2     0xd9d7bdbb,B6

           LDW     .D1T2   *+A10(12),B4      ; |68| 
||         STW     .D2T1   A3,*+B10(8)       ; |67| 
||         MVKH    .S2     0x3ddb7cdf,B7

           CALLP   .S2     _isequal,B3
||         LDW     .D1T1   *A10,A4           ; |68| 
||         MVK     .S1     0x80,A6           ; |68| 
||         MVK     .L1     0x9,A8            ; |68| 

$C$RL50:   ; CALL OCCURS {_isequal} {0}      ; |68| 
           MVKL    .S2     0x3ddb7cdf,B7
           MVKL    .S2     0xd9d7bdbb,B6
           MVKH    .S2     0x3ddb7cdf,B7

           STW     .D2T1   A4,*+B10(12)      ; |68| 
||         MVKH    .S2     0xd9d7bdbb,B6

           CALLP   .S2     _isequal,B3
||         LDW     .D1T2   *+A10(16),B4      ; |69| 
||         LDW     .D2T1   *B11,A4           ; |69| 
||         MVK     .S1     0x80,A6           ; |69| 
||         MVK     .L1     0x9,A8            ; |69| 

$C$RL51:   ; CALL OCCURS {_isequal} {0}      ; |69| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 16
           LDW     .D2T2   *+SP(76),B4       ; |69| 
           STW     .D2T1   A4,*+B10(16)      ; |69| 
           NOP             3
           LDW     .D2T2   *B4,B0            ; |72| 
           LDW     .D2T2   *+SP(80),B4
           NOP             3

   [!B0]   B       .S1     $C$L16            ; |72| 
||         MV      .L2     B0,B1             ; guard predicate rewrite

   [ B0]   LDW     .D2T2   *B4,B0            ; |72| 
   [ B1]   ADD     .L2     4,B4,B4
           NOP             3
           ; BRANCHCC OCCURS {$C$L16}        ; |72| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 15
   [ B0]   LDW     .D2T2   *B4,B4            ; |72| 
   [!B0]   MV      .L1     A13,A0            ; |72| 
           CMPEQ   .L1     A4,0,A3           ; |72| 
           XOR     .L1     1,A3,A3           ; |72| 
           NOP             1
   [ B0]   CMPEQ   .L2     B4,0,B4           ; |72| 
   [ B0]   XOR     .L2     1,B4,B4           ; |72| 
           NOP             1
   [ B0]   AND     .L1X    A3,B4,A0          ; |72| 
   [ A0]   B       .S1     $C$L17            ; |72| 
   [ A0]   CALL    .S1     _print_test_results ; |273| 
           MVK     .L1     0x1,A3            ; |72| 
   [ A0]   MVKL    .S1     _all_pass,A4
   [ A0]   MVKH    .S1     _all_pass,A4
           NOP             1
           ; BRANCHCC OCCURS {$C$L17}        ; |72| 
;** --------------------------------------------------------------------------*
$C$L16:    
;          EXCLUSIVE CPU CYCLES: 5
           CALL    .S1     _print_test_results ; |273| 
           MVKL    .S1     _all_pass,A4
           MVKH    .S1     _all_pass,A4
           MV      .L1     A13,A3
           NOP             1
;** --------------------------------------------------------------------------*
$C$L17:    
;          EXCLUSIVE CPU CYCLES: 1

           STW     .D1T1   A3,*A4            ; |72| 
||         MVK     .L1     0x2,A4            ; |273| 
||         ADDKPC  .S2     $C$RL52,B3,0      ; |273| 

$C$RL52:   ; CALL OCCURS {_print_test_results} {0}  ; |273| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 30
           MVKL    .S2     $C$SL2+0,B4
           MVKH    .S2     $C$SL2+0,B4

           CALLP   .S2     _printf,B3
||         STW     .D2T2   B4,*+SP(4)        ; |274| 

$C$RL53:   ; CALL OCCURS {_printf} {0}       ; |274| 
           MVKL    .S2     $C$SL3+0,B4
           MVKH    .S2     $C$SL3+0,B4

           CALLP   .S2     _printf,B3
||         STW     .D2T2   B4,*+SP(4)        ; |274| 

$C$RL54:   ; CALL OCCURS {_printf} {0}       ; |274| 
           MVKL    .S1     $C$SL1+0,A10
           MVKH    .S1     $C$SL1+0,A10

           CALLP   .S2     _print_profile_results,B3
||         MV      .L1     A10,A4            ; |281| 

$C$RL55:   ; CALL OCCURS {_print_profile_results} {0}  ; |281| 

           CALLP   .S2     _print_memory_results,B3
||         MV      .L1     A10,A4            ; |284| 

$C$RL56:   ; CALL OCCURS {_print_memory_results} {0}  ; |284| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 12
           ADDK    .S2     144,SP            ; |285| 
           LDW     .D2T2   *++SP(8),B3       ; |285| 
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
$C$SL1:	.string	"asinhDP",0
$C$SL2:	.string	"----------------------------------------",0
$C$SL3:	.string	"----------------------------------------",10,0
;*****************************************************************************
;* UNDEFINED EXTERNAL REFERENCES                                             *
;*****************************************************************************
	.global	_printf
	.global	_asinh
	.global	_driver_init
	.global	_print_profile_results
	.global	_print_memory_results
	.global	_print_test_results
	.global	_gimme_random
	.global	_isequal
	.global	_asinhdp_c
	.global	_asinhdp
	.global	_asinhdp_v
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
