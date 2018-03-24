;******************************************************************************
;* TMS320C6x C/C++ Codegen                                          PC v7.4.2 *
;* Date/Time created: Mon May 16 23:48:11 2016                                *
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
	.word	00343c7d6h,0412c14f1h		; a[0] @ 0
	.word	0e54f6d26h,041064358h		; a[1] @ 64
	.word	0adfb3596h,041175396h		; a[2] @ 128
	.word	0ba20791ch,04111c780h		; a[3] @ 192
	.word	06d42a597h,041267828h		; a[4] @ 256
	.word	0fb2e0fdeh,0411935b5h		; a[5] @ 320
	.word	0b9863030h,04122d449h		; a[6] @ 384
	.word	02b3ebf58h,04129379dh		; a[7] @ 448
	.word	0d342825ch,0410525cch		; a[8] @ 512
	.word	0439b9ca9h,04127ed39h		; a[9] @ 576
	.word	0c856be53h,0412dc983h		; a[10] @ 640
	.word	0dc57b9fbh,04116d45eh		; a[11] @ 704
	.word	014b92db4h,0412a203ch		; a[12] @ 768
	.word	0003324f0h,041189fefh		; a[13] @ 832
	.word	006705fe4h,04128dfb9h		; a[14] @ 896
	.word	0c42c6b99h,0411144bah		; a[15] @ 960
	.word	0f0ab20abh,0412a9619h		; a[16] @ 1024
	.word	07cbdf315h,0412a7cffh		; a[17] @ 1088
	.word	0e1cc6096h,0412d616ch		; a[18] @ 1152
	.word	041d94d0eh,04116dadfh		; a[19] @ 1216
	.word	0f8fbeb9eh,04127fa34h		; a[20] @ 1280
	.word	00628d93dh,0410ad955h		; a[21] @ 1344
	.word	0049fa8a7h,04125c25dh		; a[22] @ 1408
	.word	0695809ach,0412c6ca5h		; a[23] @ 1472
	.word	03eb484d7h,041232b49h		; a[24] @ 1536
	.word	0018aa1afh,0412e1b17h		; a[25] @ 1600
	.word	013341e15h,041294babh		; a[26] @ 1664
	.word	05e14925eh,04125c643h		; a[27] @ 1728
	.word	0e16a41bdh,0412b1b70h		; a[28] @ 1792
	.word	03ad5f494h,041030c41h		; a[29] @ 1856
	.word	0452c88f5h,041208eb1h		; a[30] @ 1920
	.word	0e53b9f12h,0412cbd88h		; a[31] @ 1984
	.word	0e01304c0h,041207f6ch		; a[32] @ 2048
	.word	01845e9efh,041063e34h		; a[33] @ 2112
	.word	088790ee0h,04120d38ah		; a[34] @ 2176
	.word	08d79de12h,04112ef68h		; a[35] @ 2240
	.word	01b40ce26h,040d47fa5h		; a[36] @ 2304
	.word	01928e780h,0412e8029h		; a[37] @ 2368
	.word	09f2594e5h,040e05f9dh		; a[38] @ 2432
	.word	08fddde6dh,0412e16efh		; a[39] @ 2496
	.word	0c2760972h,0410b2e44h		; a[40] @ 2560
	.word	04684746eh,0412e8169h		; a[41] @ 2624
	.word	030d04cb4h,04123101ah		; a[42] @ 2688
	.word	0a86e5cd5h,041221c2eh		; a[43] @ 2752
	.word	0b9e8d1e6h,0412037afh		; a[44] @ 2816
	.word	0169a7638h,040e73ba1h		; a[45] @ 2880
	.word	085c937edh,04119f8f4h		; a[46] @ 2944
	.word	097b733deh,0410c90c7h		; a[47] @ 3008
	.word	07c348bf9h,041280071h		; a[48] @ 3072
	.word	070082dcch,0411d5fa7h		; a[49] @ 3136
	.word	06e101373h,040d16b0bh		; a[50] @ 3200
	.word	0f9fd9ba2h,0411cf328h		; a[51] @ 3264
	.word	0472ba9d2h,04111d903h		; a[52] @ 3328
	.word	01945308ch,040f860c3h		; a[53] @ 3392
	.word	02883e278h,0411b211dh		; a[54] @ 3456
	.word	03f109c2fh,041159a6ah		; a[55] @ 3520
	.word	0e2e708b8h,0412958c2h		; a[56] @ 3584
	.word	0843060f1h,04105e96ah		; a[57] @ 3648
	.word	03dddbe8dh,0410a8e3eh		; a[58] @ 3712
	.word	0de2cc129h,04116d18dh		; a[59] @ 3776
	.word	0c71edb8dh,04123e189h		; a[60] @ 3840
	.word	0548612d4h,0411b7435h		; a[61] @ 3904
	.word	044711a1fh,04113a964h		; a[62] @ 3968
	.word	089c4cd24h,0411f3e51h		; a[63] @ 4032
	.word	0c84a14f7h,0411c43bch		; a[64] @ 4096
	.word	0052f2ec2h,040ff823eh		; a[65] @ 4160
	.word	0a82814f2h,041097435h		; a[66] @ 4224
	.word	005a45c6bh,04109c546h		; a[67] @ 4288
	.word	0fd413e8fh,0411c324ch		; a[68] @ 4352
	.word	0cd17507fh,0412b400bh		; a[69] @ 4416
	.word	0e2d19737h,041284bd2h		; a[70] @ 4480
	.word	0d01c7ebch,04117a83fh		; a[71] @ 4544
	.word	08c8a51feh,04112331eh		; a[72] @ 4608
	.word	08b391270h,0412b0b87h		; a[73] @ 4672
	.word	05623ffbah,0411ca923h		; a[74] @ 4736
	.word	0f9428abfh,0411951ffh		; a[75] @ 4800
	.word	03f894d1bh,040f6313dh		; a[76] @ 4864
	.word	0615c0fcbh,04125f01fh		; a[77] @ 4928
	.word	056dca07fh,040f613edh		; a[78] @ 4992
	.word	02d4ce231h,04101f732h		; a[79] @ 5056
	.word	095c556b7h,0411aa0c5h		; a[80] @ 5120
	.word	0fd3fdae1h,0411da481h		; a[81] @ 5184
	.word	04e384d4eh,0412e12aeh		; a[82] @ 5248
	.word	0c092e7cfh,0412b5a54h		; a[83] @ 5312
	.word	0e8723755h,04117e7a2h		; a[84] @ 5376
	.word	0d6106e0ch,041264e49h		; a[85] @ 5440
	.word	01876af8ah,0412d01adh		; a[86] @ 5504
	.word	048e4176ch,0411bc19fh		; a[87] @ 5568
	.word	02197b66bh,0411dfecah		; a[88] @ 5632
	.word	0dc860c1eh,0411d48bbh		; a[89] @ 5696
	.word	0efe1396bh,0410da195h		; a[90] @ 5760
	.word	08643e6e0h,040f2a875h		; a[91] @ 5824
	.word	0922f166eh,0412613e2h		; a[92] @ 5888
	.word	00ab7b437h,0410b2d0dh		; a[93] @ 5952
	.word	0008fd347h,04122516ch		; a[94] @ 6016
	.word	077dd1519h,0411dcbcdh		; a[95] @ 6080
	.word	01f151e75h,0412118bdh		; a[96] @ 6144
	.word	05eda4e96h,0412bafach		; a[97] @ 6208
	.word	0a48a3ddch,0410aa911h		; a[98] @ 6272
	.word	0b5b6291ch,0412aae5dh		; a[99] @ 6336
	.word	07dce1826h,0412cac84h		; a[100] @ 6400
	.word	06daefa54h,0412dd6ebh		; a[101] @ 6464
	.word	011a57cfdh,041275d7eh		; a[102] @ 6528
	.word	0bfba55d2h,0412bb32eh		; a[103] @ 6592
	.word	0f0fa955dh,04110253dh		; a[104] @ 6656
	.word	0f073de1eh,04113c9afh		; a[105] @ 6720
	.word	0decc956fh,04117e0d4h		; a[106] @ 6784
	.word	0f7823c86h,04125d002h		; a[107] @ 6848
	.word	0656f9768h,041189cach		; a[108] @ 6912
	.word	01d203021h,0411268cbh		; a[109] @ 6976
	.word	090bc2763h,041252e4ah		; a[110] @ 7040
	.word	0fb133135h,0412b3164h		; a[111] @ 7104
	.word	00130fdcfh,041256395h		; a[112] @ 7168
	.word	08073a513h,041271f43h		; a[113] @ 7232
	.word	03ab3d301h,0412700ceh		; a[114] @ 7296
	.word	02ac9f9b4h,0411f4f0fh		; a[115] @ 7360
	.word	0ef8264cah,0412d8884h		; a[116] @ 7424
	.word	08bec537bh,0412e3382h		; a[117] @ 7488
	.word	03ef78c94h,040fb329eh		; a[118] @ 7552
	.word	01049fa1fh,040faed8fh		; a[119] @ 7616
	.word	0e8c88a48h,0411d4349h		; a[120] @ 7680
	.word	0c4bd9bd7h,041276e3dh		; a[121] @ 7744
	.word	0c13f0422h,04127d50ah		; a[122] @ 7808
	.word	035477865h,041250daeh		; a[123] @ 7872
	.word	0dff33871h,0412e29e7h		; a[124] @ 7936
	.word	0cb7a3048h,041143b5dh		; a[125] @ 8000
	.word	0c3116f94h,0410df93eh		; a[126] @ 8064
	.word	051be497ch,041263428h		; a[127] @ 8128
	.word	0f96b11c7h,041259ee6h		; a[128] @ 8192
	.word	09545f684h,04117feebh		; a[129] @ 8256
	.word	0c6141cedh,0411bae97h		; a[130] @ 8320
	.word	05661f18dh,041041587h		; a[131] @ 8384
	.word	0b608794bh,04114295fh		; a[132] @ 8448
	.word	0d6c00036h,040fdefe2h		; a[133] @ 8512
	.word	022d2c534h,0412974aah		; a[134] @ 8576
	.word	00fb3d22ah,041198f1fh		; a[135] @ 8640
	.word	058a3e11bh,0412e763eh		; a[136] @ 8704
	.word	0fc02e58eh,04105c5a5h		; a[137] @ 8768
	.word	00eb7e68ch,041100039h		; a[138] @ 8832
	.word	08f55f27bh,04116525ah		; a[139] @ 8896
	.word	07ae26ef6h,04114cfaah		; a[140] @ 8960
	.word	04fa1c913h,041242885h		; a[141] @ 9024
	.word	0dad461edh,040fa98bbh		; a[142] @ 9088
	.word	08a2fa001h,041155bf9h		; a[143] @ 9152
	.word	05d74dc4bh,0411ba3fbh		; a[144] @ 9216
	.word	0918cad22h,04104bacah		; a[145] @ 9280
	.word	0f9cf6457h,041066b21h		; a[146] @ 9344
	.word	0214544aeh,041088232h		; a[147] @ 9408
	.word	075b4e3a2h,0412b23d0h		; a[148] @ 9472
	.word	004b2e672h,04126b95ah		; a[149] @ 9536
	.word	05fb7acaah,0412849a0h		; a[150] @ 9600
	.word	08146d755h,0410792dch		; a[151] @ 9664
	.word	0b8ea549dh,04124b74ah		; a[152] @ 9728
	.word	0287a728dh,0412bd5b0h		; a[153] @ 9792
	.word	0f08fbf25h,041258155h		; a[154] @ 9856
	.word	0e55ab2d4h,040f71540h		; a[155] @ 9920
	.word	0e5dd2ae9h,04113b51bh		; a[156] @ 9984
	.word	078602e3eh,0412428e8h		; a[157] @ 10048
	.word	064658a9eh,04100e48ch		; a[158] @ 10112
	.word	0cc4b4d05h,040fcdeb4h		; a[159] @ 10176
	.word	04c3b6383h,04127ef76h		; a[160] @ 10240
	.word	06542a8f2h,0411b906ah		; a[161] @ 10304
	.word	0f69c95cdh,041285c65h		; a[162] @ 10368
	.word	0c456d92bh,0412d7b8dh		; a[163] @ 10432
	.word	0728027d9h,0411eb0c5h		; a[164] @ 10496
	.word	0b42b1558h,041095f86h		; a[165] @ 10560
	.word	0174c0d1fh,0412a5204h		; a[166] @ 10624
	.word	02a7fa857h,041285505h		; a[167] @ 10688
	.word	0626dd4f0h,04116ec8eh		; a[168] @ 10752
	.word	0544a1852h,0411414ffh		; a[169] @ 10816
	.word	0f28603bbh,0412d42abh		; a[170] @ 10880
	.word	0cdd575e9h,0410d54edh		; a[171] @ 10944
	.word	077f87d55h,041280f0dh		; a[172] @ 11008
	.word	05d142b30h,04124c020h		; a[173] @ 11072
	.word	041cc532ah,0410864e2h		; a[174] @ 11136
	.word	0e87a728dh,0411831e1h		; a[175] @ 11200
	.word	07f1c8cffh,041215afch		; a[176] @ 11264
	.word	019bce274h,0412225ebh		; a[177] @ 11328
	.word	00d7f1c40h,04103edb0h		; a[178] @ 11392
	.word	09e2bf7d6h,04129479bh		; a[179] @ 11456
	.word	0546a1a50h,040e00917h		; a[180] @ 11520
	.word	0d6be3484h,0412a9f6ch		; a[181] @ 11584
	.word	054f8e483h,0412afc0fh		; a[182] @ 11648
	.word	0302c8316h,04121cf60h		; a[183] @ 11712
	.word	0b3721343h,0412d3e67h		; a[184] @ 11776
	.word	0e4340fd2h,041281592h		; a[185] @ 11840
	.word	02f5ceb93h,0412b2ca7h		; a[186] @ 11904
	.word	0ecbdc0c0h,04103e659h		; a[187] @ 11968
	.word	041d6cc2ah,041222c33h		; a[188] @ 12032
	.word	053081a81h,040f42823h		; a[189] @ 12096
	.word	0bba9237ah,0410279f0h		; a[190] @ 12160
	.word	03eed428eh,0412060d3h		; a[191] @ 12224
	.word	06ec4cfa8h,0412407e4h		; a[192] @ 12288
	.word	09d090dc6h,0412d630fh		; a[193] @ 12352
	.word	00b67c287h,040fe8871h		; a[194] @ 12416
	.word	0df96b915h,041027fc5h		; a[195] @ 12480
	.word	042ab6f85h,041145bb4h		; a[196] @ 12544
	.word	0392f108fh,040f8ee7ch		; a[197] @ 12608
	.word	07c2a5ccbh,041263069h		; a[198] @ 12672
	.word	015117eaeh,0412c120ah		; a[199] @ 12736
	.word	066054691h,04111270ah		; a[200] @ 12800

;	C:\MATHLIB_Tools\CCSV5_5_0\ccsv5\tools\compiler\c6000_7.4.2\bin\opt6x.exe C:\\Users\\gtbldadm\\AppData\\Local\\Temp\\010763 C:\\Users\\gtbldadm\\AppData\\Local\\Temp\\010765 
;**	Parameter deleted: req_flags == 9;
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
allequal:
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 10

           STW     .D2T1   A11,*SP--(8)      ; |63| 
||         MVKL    .S2     0xd9d7bdbb,B6

           STDW    .D2T1   A13:A12,*SP--     ; |63| 
||         MVKL    .S1     output,A11
||         MVKL    .S2     0x3ddb7cdf,B7

           STW     .D2T1   A10,*SP--(8)      ; |63| 
||         MVKH    .S1     output,A11
||         MVKH    .S2     0xd9d7bdbb,B6

           LDW     .D1T2   *+A11(4),B4       ; |66| 
||         MV      .L1     A4,A6             ; |63| 
||         MVKH    .S2     0x3ddb7cdf,B7
||         MVK     .S1     0x9,A8            ; |66| 

           MV      .L1X    B3,A13            ; |63| 
||         CALLP   .S2     isequal,B3
||         MV      .S1     A4,A10            ; |63| 
||         LDW     .D1T1   *A11,A4           ; |66| 

$C$RL0:    ; CALL OCCURS {isequal} {0}       ; |66| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 30
           MVKL    .S2     0x3ddb7cdf,B7
           MVKL    .S2     0xd9d7bdbb,B6

           LDW     .D1T2   *+A11(8),B4       ; |67| 
||         MVKL    .S1     fcn_pass,A12
||         MVKH    .S2     0x3ddb7cdf,B7

           MV      .L1     A4,A3             ; |66| 
||         LDW     .D1T1   *A11,A4           ; |67| 
||         MVKH    .S1     fcn_pass,A12
||         MVKH    .S2     0xd9d7bdbb,B6

           CALLP   .S2     isequal,B3
||         STW     .D1T1   A3,*+A12(4)       ; |66| 
||         MV      .L1     A10,A6            ; |67| 
||         MVK     .S1     0x9,A8            ; |67| 

$C$RL1:    ; CALL OCCURS {isequal} {0}       ; |67| 
           MVKL    .S2     0xd9d7bdbb,B6
           MVKL    .S2     0x3ddb7cdf,B7

           LDW     .D1T2   *+A11(12),B4      ; |68| 
||         MVKH    .S2     0xd9d7bdbb,B6

           MV      .L1     A4,A3             ; |67| 
||         LDW     .D1T1   *A11,A4           ; |68| 
||         MVKH    .S2     0x3ddb7cdf,B7

           CALLP   .S2     isequal,B3
||         STW     .D1T1   A3,*+A12(8)       ; |67| 
||         MV      .L1     A10,A6            ; |68| 
||         MVK     .S1     0x9,A8            ; |68| 

$C$RL2:    ; CALL OCCURS {isequal} {0}       ; |68| 
           MVKL    .S2     0x3ddb7cdf,B7
           MVKL    .S2     0xd9d7bdbb,B6

           STW     .D1T1   A4,*+A12(12)      ; |68| 
||         MVKH    .S2     0x3ddb7cdf,B7

           MV      .L1     A11,A3            ; |66| 
||         LDW     .D1T2   *+A11(16),B4      ; |69| 
||         MVKH    .S2     0xd9d7bdbb,B6

           CALLP   .S2     isequal,B3
||         LDW     .D1T1   *A3,A4            ; |69| 
||         MV      .L1     A10,A6            ; |69| 
||         MVK     .S1     0x9,A8            ; |69| 

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
;*   Local Frame Size  : 8 Args + 188 Auto + 56 Save = 252 byte               *
;******************************************************************************
main:
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 14
           STW     .D2T1   A11,*SP--(8)      ; |132| 
           STW     .D2T1   A10,*SP--(8)      ; |132| 
           STDW    .D2T2   B13:B12,*SP--     ; |132| 
           STDW    .D2T2   B11:B10,*SP--     ; |132| 
           STDW    .D2T1   A15:A14,*SP--     ; |132| 
           STDW    .D2T1   A13:A12,*SP--     ; |132| 
           STW     .D2T2   B3,*SP--(8)       ; |132| 

           MVKL    .S1     $C$SL1+0,A4
||         ADDK    .S2     -200,SP           ; |132| 

           CALLP   .S2     driver_init,B3
||         MVKH    .S1     $C$SL1+0,A4

$C$RL4:    ; CALL OCCURS {driver_init} {0}   ; |140| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 9
           MVKL    .S1     a,A12
           MVKL    .S1     output,A3
           MVKH    .S1     a,A12
           MVKH    .S1     output,A3

           MV      .L1     A12,A13
||         CALL    .S1     log10             ; |149| 
||         LDW     .D1T1   *A3,A11

           LDDW    .D1T1   *A13++,A5:A4      ; |149| 
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
           ADDKPC  .S2     $C$RL5,B3,0       ; |149| 
$C$RL5:    ; CALL OCCURS {log10} {0}         ; |149| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 7

           SUB     .L1     A10,1,A0          ; |148| 
||         STDW    .D1T1   A5:A4,*A11++      ; |149| 
||         SUB     .S1     A10,1,A10         ; |148| 

   [ A0]   B       .S2     $C$L3             ; |148| 
|| [!A0]   MVKL    .S1     output,A3
|| [ A0]   LDDW    .D1T1   *A13++,A5:A4      ; |149| 
|| [!A0]   ZERO    .L2     B10

   [ A0]   CALL    .S2     log10             ; |149| 
|| [!A0]   MVKH    .S1     output,A3

   [!A0]   MVK     .S2     0xc9,B4
   [!A0]   ADD     .L2X    4,A3,B5
   [!A0]   MV      .L1X    B4,A10
   [!A0]   STW     .D2T2   B5,*+SP(20)
           ; BRANCHCC OCCURS {$C$L3}         ; |148| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 1
           CALL    .S1     log10dp           ; |152| 
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L4:    
;          EXCLUSIVE CPU CYCLES: 5
           LDDW    .D1T1   *A12++,A5:A4      ; |152| 
           ADDKPC  .S2     $C$RL6,B3,3       ; |152| 
$C$RL6:    ; CALL OCCURS {log10dp} {0}       ; |152| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 12
           LDW     .D2T2   *+SP(20),B4       ; |152| 
           SUB     .L1     A10,1,A0          ; |151| 
           SUB     .L1     A10,1,A10         ; |151| 
           NOP             2
           LDW     .D2T2   *B4,B4            ; |152| 
   [ A0]   BNOP    .S1     $C$L4,3           ; |151| 

           ADD     .L2     B10,B4,B4         ; |152| 
||         ADD     .S2     8,B10,B10         ; |151| 

   [ A0]   CALL    .S1     log10dp           ; |152| 
||         STDW    .D2T1   A5:A4,*B4         ; |152| 

           ; BRANCHCC OCCURS {$C$L4}         ; |151| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 7

           ZERO    .L2     B10
||         LDW     .D2T2   *+SP(20),B4

           MVKL    .S1     a,A10
           MVK     .S2     0xc9,B5
           MVKH    .S1     a,A10
           MV      .L1X    B5,A11
           ADD     .L2     4,B4,B4

           STW     .D2T2   B4,*+SP(24)
||         CALL    .S1     log10dp_c         ; |155| 

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L5:    
;          EXCLUSIVE CPU CYCLES: 5
           LDDW    .D1T1   *A10++,A5:A4      ; |155| 
           ADDKPC  .S2     $C$RL7,B3,3       ; |155| 
$C$RL7:    ; CALL OCCURS {log10dp_c} {0}     ; |155| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 12

           LDW     .D2T2   *+SP(24),B4       ; |155| 
||         SUB     .L1     A11,1,A0          ; |154| 

   [!A0]   LDW     .D2T1   *+SP(24),A3
           SUB     .L1     A11,1,A11         ; |154| 
   [!A0]   MVKL    .S2     a,B22
           NOP             1
           LDW     .D2T2   *B4,B4            ; |155| 

   [ A0]   BNOP    .S1     $C$L5,3           ; |154| 
|| [!A0]   ADD     .L1     4,A3,A15

           ADD     .L2     B10,B4,B4         ; |155| 
||         ADD     .S2     8,B10,B10         ; |154| 

   [ A0]   CALL    .S1     log10dp_c         ; |155| 
||         STDW    .D2T1   A5:A4,*B4         ; |155| 

           ; BRANCHCC OCCURS {$C$L5}         ; |154| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 2

           MVK     .S2     0xc9,B1
||         MVK     .S1     0xfffffc01,A18
||         ZERO    .L2     B31
||         MVK     .D2     0xffffffff,B12    ; |111| 
||         LDW     .D1T1   *A15,A3

           ZERO    .L2     B10               ; |111| 
||         MVKH    .S2     a,B22

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains control code
;*----------------------------------------------------------------------------*
$C$L6:    
;          EXCLUSIVE CPU CYCLES: 32

           LDDW    .D2T2   *B22++,B21:B20    ; |81| 
||         ZERO    .L2     B9
||         MVKL    .S2     0x3fe6a09e,B5
||         ZERO    .L1     A20               ; |99| 
||         ADD     .S1     1,A18,A19

           SET     .S2     B9,0x15,0x1d,B9
           MVKL    .S2     0x667f3bcd,B8

           MV      .L1X    B9,A4             ; |99| 
||         MVKH    .S2     0x3fe6a09e,B5

           MVKH    .S2     0x667f3bcd,B8
||         STW     .D2T2   B5,*+SP(16)       ; |94| 
||         MV      .L1X    B9,A21            ; |100| 

           CLR     .S2     B21,20,31,B4      ; |88| 
||         MV      .L1X    B5,A9             ; |94| 

           EXTU    .S2     B21,1,21,B0       ; |83| 

           OR      .S1X    A4,B4,A8          ; |88| 
|| [!B0]   ZERO    .L1     A5:A4             ; |88| 
||         ZERO    .L2     B4                ; |99| 

   [ B0]   MV      .L1     A8,A5             ; |88| 
||         MV      .S1X    B8,A8             ; |94| 

   [ B0]   MV      .L1X    B20,A4            ; |88| 

           CMPGTDP .S1     A5:A4,A9:A8,A0    ; |94| 
||         ADD     .L1X    A19,B0,A19        ; |83| 

           ZERO    .L1     A8                ; |99| 
   [!A0]   MV      .L2     B9,B5             ; |99| 
   [!A0]   SUBDP   .L2X    A5:A4,B5:B4,B7:B6 ; |99| 
   [ A0]   MV      .L1     A20,A8            ; |96| 
   [ A0]   MV      .L1     A20,A6
   [ A0]   MV      .L1X    B9,A7
   [ A0]   MPYDP   .M1     A7:A6,A5:A4,A7:A6 ; |96| 
   [!A0]   MV      .L1X    B9,A9             ; |99| 
   [ A0]   MV      .L1X    B9,A9
   [ A0]   SUBDP   .L1     A5:A4,A9:A8,A5:A4 ; |95| 
   [!A0]   MPYDP   .M1X    A9:A8,B7:B6,A9:A8 ; |100| 
           STW     .D2T2   B9,*+SP(28)       ; |99| 
           STW     .D2T2   B8,*+SP(12)       ; |94| 
   [ A0]   MV      .L2     B9,B7             ; |95| 
   [ A0]   MV      .L2     B9,B5             ; |95| 
   [ A0]   MV      .L2     B4,B6             ; |95| 
   [!A0]   ADD     .L1X    A18,B0,A19        ; |101| 
   [ A0]   ADDDP   .L1X    B5:B4,A7:A6,A7:A6 ; |96| 
   [ A0]   SUBDP   .L2X    A5:A4,B7:B6,B7:B6 ; |95| 
           NOP             1
   [!A0]   ADDDP   .L1     A21:A20,A9:A8,A7:A6 ; |100| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 204
           ZERO    .L2     B5
           SET     .S2     B5,0x1e,0x1e,B5
           STW     .D2T2   B5,*+SP(32)       ; |105| 
           ZERO    .L1     A31
           MV      .L2X    A20,B8            ; |105| 
           MVKL    .S2     0x4b67ce0f,B16
           RCPDP   .S1     A7:A6,A5:A4       ; |105| 
           MVKL    .S2     0xc041d580,B17
           MPYDP   .M1     A7:A6,A5:A4,A9:A8 ; |105| 
           MVKH    .S2     0x4b67ce0f,B16
           STW     .D2T2   B16,*+SP(36)      ; |53| 
           MVKH    .S2     0xc041d580,B17
           STW     .D2T2   B17,*+SP(40)      ; |53| 
           MVKL    .S1     0x40738083,A11
           MVKL    .S1     0xfa15267e,A10
           MVKH    .S1     0x40738083,A11
           MVKH    .S1     0xfa15267e,A10
           MVKL    .S1     0xc0880bfe,A13
           MVKL    .S1     0x9c0d9077,A12
           SUBDP   .L2X    B5:B4,A9:A8,B5:B4 ; |105| 
           SET     .S1     A31,0x1e,0x1e,A9
           MV      .L1     A20,A8            ; |105| 
           MV      .L2X    A9,B9             ; |105| 
           MVKH    .S1     0xc0880bfe,A13
           MVKH    .S1     0x9c0d9077,A12
           ZERO    .S2     B11
           MPYDP   .M2X    A5:A4,B5:B4,B5:B4 ; |105| 
           SET     .S2     B11,0x14,0x14,B11
           CMPLTDP .S2     B21:B20,B11:B10,B0 ; |111| 
           NOP             8
           MPYDP   .M1X    A7:A6,B5:B4,A5:A4 ; |105| 
   [ B0]   MVK     .L1     0xffffffff,A16    ; |111| 
   [ B0]   MVKL    .S1     0xffefffff,A17
   [ B0]   MVKH    .S1     0xffefffff,A17
           NOP             6
           SUBDP   .L1     A9:A8,A5:A4,A5:A4 ; |105| 
           NOP             7
           MPYDP   .M2X    B5:B4,A5:A4,B5:B4 ; |105| 
           NOP             9
           NOP             1
           MPYDP   .M1X    A7:A6,B5:B4,A5:A4 ; |105| 
           NOP             9
           NOP             1
           SUBDP   .L2X    B9:B8,A5:A4,B9:B8 ; |105| 
           NOP             6
           MPYDP   .M2     B5:B4,B9:B8,B5:B4 ; |105| 
           NOP             9
           MPYDP   .M2     B7:B6,B5:B4,B9:B8 ; |105| 
           NOP             9
           MPYDP   .M2     B9:B8,B9:B8,B5:B4 ; |105| 
           NOP             9
           ADDDP   .L2     B17:B16,B5:B4,B17:B16 ; |53| 
           NOP             6
           MPYDP   .M2     B5:B4,B17:B16,B17:B16 ; |53| 
           NOP             9
           NOP             1
           ADDDP   .L1X    A11:A10,B17:B16,A5:A4 ; |53| 
           ZERO    .L2     B16               ; |53| 
           SET     .S2     B31,0x1e,0x1e,B17
           NOP             4
           MPYDP   .M1X    B5:B4,A5:A4,A5:A4 ; |53| 
           NOP             9
           ADDDP   .L1     A13:A12,A5:A4,A9:A8 ; |53| 
           NOP             6
           RCPDP   .S1     A9:A8,A5:A4       ; |53| 
           NOP             1
           MPYDP   .M1     A5:A4,A9:A8,A21:A20 ; |53| 
           NOP             9
           SUBDP   .L1X    B17:B16,A21:A20,A21:A20 ; |53| 
           NOP             6
           MPYDP   .M1     A5:A4,A21:A20,A5:A4 ; |53| 
           NOP             9
           MPYDP   .M1     A5:A4,A9:A8,A21:A20 ; |53| 
           NOP             9
           NOP             1
           SUBDP   .L2X    B17:B16,A21:A20,B17:B16 ; |53| 
           NOP             1
   [ B0]   BNOP    .S1     $C$L7,4           ; |111| 

           MPYDP   .M2X    A5:A4,B17:B16,B17:B16 ; |53| 
||         INTDP   .L1     A19,A5:A4         ; |111| 

           ; BRANCHCC OCCURS {$C$L7}         ; |111| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 91
           MVKL    .S2     0xbfe94415,B19
           MVKL    .S2     0xb356bd29,B18
           MVKH    .S2     0xbfe94415,B19
           MVKH    .S2     0xb356bd29,B18
           MPYDP   .M2     B19:B18,B5:B4,B19:B18 ; |111| 
           MVKL    .S1     0x4030624a,A17
           MVKL    .S1     0x2016afed,A16
           MVKH    .S1     0x4030624a,A17
           MVKH    .S1     0x2016afed,A16
           ZERO    .L1     A31
           MPYDP   .M1X    B17:B16,A9:A8,A9:A8 ; |111| 
           MVKL    .S2     0xc05007ff,B25
           MVKL    .S2     0x12b3b59a,B24
           MVKH    .S2     0xc05007ff,B25
           ADDDP   .L2X    A17:A16,B19:B18,B19:B18 ; |111| 
           SET     .S1     A31,0x1e,0x1e,A17
           MV      .L1X    B10,A16           ; |111| 
           MVKH    .S2     0x12b3b59a,B24
           NOP             2
           SUBDP   .L1     A17:A16,A9:A8,A9:A8 ; |111| 
           MPYDP   .M2     B5:B4,B19:B18,B19:B18 ; |111| 
           NOP             6
           MPYDP   .M2X    B17:B16,A9:A8,B17:B16 ; |111| 
           NOP             2
           ADDDP   .L2     B25:B24,B19:B18,B19:B18 ; |111| 
           MVKL    .S1     0xbf2bd010,A9
           MVKL    .S1     0x5c610ca8,A8
           MVKH    .S1     0xbf2bd010,A9
           MVKH    .S1     0x5c610ca8,A8
           MPYDP   .M1     A9:A8,A5:A4,A9:A8 ; |111| 
           NOP             1
           MPYDP   .M2     B19:B18,B17:B16,B17:B16 ; |111| 
           NOP             9
           MPYDP   .M2     B5:B4,B17:B16,B5:B4 ; |111| 
           NOP             9
           MPYDP   .M2     B9:B8,B5:B4,B5:B4 ; |111| 
           NOP             9
           ADDDP   .L2     B5:B4,B9:B8,B5:B4 ; |111| 
           MV      .S2     B10,B8            ; |111| 
           MVKL    .S2     0x3fe63000,B9
           MVKH    .S2     0x3fe63000,B9
           MPYDP   .M2X    B9:B8,A5:A4,B9:B8 ; |111| 
           NOP             3
           ADDDP   .L1X    B5:B4,A9:A8,A5:A4 ; |111| 
           MVKL    .S1     0x3fdbcb7b,A9
           MVKL    .S1     0x1526e50e,A8
           MVKH    .S1     0x3fdbcb7b,A9
           MVKH    .S1     0x1526e50e,A8
           NOP             2
           ADDDP   .L1X    B9:B8,A5:A4,A5:A4 ; |111| 
           NOP             6
           MPYDP   .M1     A9:A8,A5:A4,A17:A16 ; |111| 
;** --------------------------------------------------------------------------*
$C$L7:    
;          EXCLUSIVE CPU CYCLES: 11

           MVKL    .S2     0x7fefffff,B13
||         SUB     .L2     B1,1,B1           ; |157| 

           MVKH    .S2     0x7fefffff,B13
           CMPGTDP .S2     B21:B20,B13:B12,B0 ; |111| 
   [!B1]   ADD     .S1     4,A15,A14
   [ B0]   MVKL    .S1     0x510ea7e7,A4

   [ B1]   BNOP    .S2     $C$L6,1           ; |157| 
|| [ B0]   MVKL    .S1     0x40734413,A5

   [ B0]   MVKH    .S1     0x510ea7e7,A4
   [ B0]   MVKH    .S1     0x40734413,A5

   [!B0]   MV      .L1     A17,A5            ; |111| 
|| [!B0]   MV      .S1     A16,A4            ; |111| 

   [!B1]   CALL    .S1     log10dp_v         ; |160| 
||         STDW    .D1T1   A5:A4,*A3++       ; |111| 

           ; BRANCHCC OCCURS {$C$L6}         ; |157| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           LDW     .D1T2   *A14,B4           ; |160| 
           MVKL    .S1     a,A4
           MVKH    .S1     a,A4
           MVK     .S1     0xc9,A6           ; |160| 
           ADDKPC  .S2     $C$RL8,B3,0       ; |160| 
$C$RL8:    ; CALL OCCURS {log10dp_v} {0}     ; |160| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 12

           CALLP   .S2     allequal,B3
||         MVK     .S1     0xc9,A4           ; |163| 

$C$RL9:    ; CALL OCCURS {allequal} {0}      ; |163| 

           CALLP   .S2     print_test_results,B3
||         MVK     .L1     0x1,A4            ; |164| 

$C$RL10:   ; CALL OCCURS {print_test_results} {0}  ; |164| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 49
           LDW     .D2T1   *+SP(40),A26      ; |105| 
           LDW     .D2T1   *+SP(32),A24      ; |105| 
           LDW     .D2T1   *+SP(36),A25      ; |105| 
           LDW     .D2T1   *+SP(28),A23      ; |105| 
           STW     .D2T1   A10,*+SP(84)      ; |105| 
           LDW     .D2T1   *+SP(16),A22      ; |99| 

           LDW     .D2T1   *+SP(12),A21
||         ZERO    .L2     B23               ; |114| 

           STW     .D2T2   B23,*+SP(172)     ; |172| 
           STW     .D2T1   A12,*+SP(76)      ; |105| 
           STW     .D2T1   A15,*+SP(188)     ; |117| 
           STW     .D2T2   B11,*+SP(176)     ; |114| 
           STW     .D2T1   A11,*+SP(88)      ; |105| 

           STW     .D2T1   A13,*+SP(80)      ; |105| 
||         MVKL    .S1     0x12b3b59a,A31

           STW     .D2T2   B13,*+SP(184)     ; |117| 
||         MVKH    .S1     0x12b3b59a,A31
||         MVKL    .S2     0x3fdbcb7b,B4

           STW     .D2T1   A31,*+SP(116)     ; |53| 
||         MVKH    .S2     0x3fdbcb7b,B4

           STW     .D2T2   B4,*+SP(152)      ; |111| 
||         ZERO    .L2     B22               ; |105| 

           STW     .D2T2   B22,*+SP(68)      ; |172| 
||         ZERO    .L1     A2                ; |53| 

           STW     .D2T1   A2,*+SP(140)      ; |174| 
||         ZERO    .L1     A1                ; |53| 

           STW     .D2T1   A1,*+SP(108)      ; |174| 
||         ZERO    .L2     B25               ; |105| 

           STW     .D2T2   B25,*+SP(60)      ; |174| 
||         ZERO    .L2     B24               ; |105| 

           STW     .D2T2   B24,*+SP(52)      ; |174| 
||         ZERO    .L1     A9                ; |53| 

           STW     .D2T1   A9,*+SP(100)      ; |175| 
||         MVKL    .S2     0x5c610ca8,B28
||         ZERO    .L2     B27               ; |95| 

           STW     .D2T2   B27,*+SP(48)      ; |175| 
||         MVKL    .S2     0xbf2bd010,B29
||         ZERO    .L1     A17               ; |95| 

           STW     .D2T1   A17,*+SP(44)      ; |176| 
||         MVKL    .S2     0x3fe63000,B30
||         ZERO    .L2     B26               ; |100| 

           STW     .D2T2   B26,*+SP(40)      ; |175| 
||         MVKL    .S1     0xb356bd29,A27
||         MVKL    .S2     0x1526e50e,B31
||         ZERO    .L1     A19               ; |99| 

           STW     .D2T1   A19,*+SP(32)      ; |171| 
||         MVKH    .S2     0x5c610ca8,B28
||         MVKL    .S1     0xbfe94415,A28

           STW     .D2T2   B28,*+SP(164)     ; |111| 
||         MVKH    .S2     0xbf2bd010,B29
||         MVKL    .S1     0x2016afed,A29

           STW     .D2T2   B29,*+SP(168)     ; |111| 
||         MVKH    .S2     0x3fe63000,B30
||         MVKL    .S1     0x4030624a,A30

           STW     .D2T2   B30,*+SP(160)     ; |111| 
||         MVKH    .S2     0x1526e50e,B31
||         MVKL    .S1     0xc05007ff,A3

           STW     .D2T2   B31,*+SP(148)     ; |111| 
||         MVKH    .S1     0xb356bd29,A27

           STW     .D2T1   A27,*+SP(132)     ; |53| 
||         MVKH    .S1     0xbfe94415,A28

           STW     .D2T1   A28,*+SP(136)     ; |53| 
||         MVKH    .S1     0x2016afed,A29

           STW     .D2T1   A29,*+SP(124)     ; |53| 
||         MVKH    .S1     0x4030624a,A30

           STW     .D2T1   A30,*+SP(128)     ; |53| 
||         MVKH    .S1     0xc05007ff,A3

           STW     .D2T1   A3,*+SP(120)      ; |53| 
           STW     .D2T1   A24,*+SP(56)      ; |105| 
           STW     .D2T1   A24,*+SP(64)      ; |105| 
           STW     .D2T1   A24,*+SP(72)      ; |105| 
           STW     .D2T1   A24,*+SP(104)     ; |105| 

           STW     .D2T1   A24,*+SP(112)     ; |105| 
||         MVKL    .S2     a_sc,B16

           STW     .D2T1   A24,*+SP(144)     ; |105| 
||         MVKH    .S2     a_sc,B16

           STW     .D2T1   A25,*+SP(92)      ; |105| 
||         ZERO    .L1     A7
||         ADD     .L2     1,B13,B9

           STW     .D2T1   A26,*+SP(96)      ; |105| 
||         MV      .L1X    B16,A20
||         ZERO    .S1     A5
||         ZERO    .D1     A6                ; |176| 
||         ZERO    .L2     B7
||         MV      .S2     B10,B8

           STW     .D2T1   A23,*+SP(36)      ; |99| 
||         STDW    .D1T2   B9:B8,*+A20(16)   ; |173| 
||         MV      .L1X    B16,A16           ; |176| 
||         SET     .S2     B7,0x14,0x1d,B7
||         ZERO    .S1     A4                ; |174| 
||         ZERO    .L2     B6                ; |175| 

           ZERO    .L2     B9:B8             ; |171| 
||         STDW    .D1T2   B7:B6,*+A16(32)   ; |175| 
||         STW     .D2T1   A22,*+SP(28)
||         MV      .L1X    B16,A18           ; |171| 
||         ZERO    .S1     A10               ; |96| 
||         ZERO    .S2     B5

           MVK     .L2     0x6,B8
||         STDW    .D1T2   B9:B8,*A20        ; |171| 
||         STW     .D2T1   A21,*+SP(16)
||         MV      .L1X    B16,A8            ; |175| 
||         ZERO    .S2     B23               ; |111| 
||         MVKH    .S1     0xbff00000,A7

           STDW    .D1T1   A7:A6,*+A18(40)   ; |176| 
||         STW     .D2T2   B23,*+SP(156)     ; |172| 
||         MV      .L1X    B16,A0            ; |174| 
||         MVKH    .S1     0xfff00000,A5
||         MVKL    .S2     output,B10
||         ZERO    .L2     B12               ; |96| 

           ADD     .L1X    -7,B8,A31
||         STW     .D2T2   B8,*+SP(12)       ; |176| 
||         STDW    .D1T1   A5:A4,*+A8(24)    ; |174| 
||         ZERO    .L2     B4                ; |172| 
||         MVKH    .S2     0x80000000,B5
||         ZERO    .S1     A12               ; |100| 

           CALL    .S1     log10             ; |178| 
||         STW     .D2T1   A31,*+SP(180)     ; |172| 
||         STDW    .D1T2   B5:B4,*+A0(8)     ; |172| 
||         SUB     .L1X    B16,8,A15
||         MVKH    .S2     output,B10
||         ZERO    .L2     B11

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L8:    
;          EXCLUSIVE CPU CYCLES: 5
           LDDW    .D1T1   *++A15,A5:A4      ; |178| 
           ADDKPC  .S2     $C$RL11,B3,3      ; |178| 
$C$RL11:   ; CALL OCCURS {log10} {0}         ; |178| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 26
           LDW     .D2T2   *B10,B6           ; |178| 
           MV      .L2X    A4,B4             ; |178| 
           MV      .L2X    A5,B5             ; |178| 
           NOP             2
           ADD     .L2     B11,B6,B6         ; |178| 
           STDW    .D2T2   B5:B4,*B6         ; |178| 

           CALLP   .S2     log10dp,B3
||         LDDW    .D1T1   *A15,A5:A4        ; |179| 

$C$RL12:   ; CALL OCCURS {log10dp} {0}       ; |179| 
           LDW     .D2T2   *+B10(4),B4       ; |179| 
           NOP             4
           ADD     .L2     B11,B4,B4         ; |179| 
           STDW    .D2T1   A5:A4,*B4         ; |179| 

           CALLP   .S2     log10dp_c,B3
||         LDDW    .D1T1   *A15,A5:A4        ; |180| 

$C$RL13:   ; CALL OCCURS {log10dp_c} {0}     ; |180| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 352
           LDW     .D2T2   *+B10(8),B4       ; |180| 
           ZERO    .L1     A31
           LDW     .D2T2   *+SP(28),B5
           MVK     .S1     0xfffffc02,A30
           LDW     .D2T2   *+SP(188),B31     ; |114| 
           ADD     .L2     B11,B4,B4         ; |180| 
           STDW    .D2T1   A5:A4,*B4         ; |180| 
           LDDW    .D1T1   *A15,A19:A18      ; |81| 
           SET     .S1     A31,0x15,0x1d,A5
           LDW     .D2T2   *+SP(16),B4
           NOP             2

           CLR     .S1     A19,20,31,A3      ; |88| 
||         MV      .L1     A18,A4            ; |88| 

           OR      .L1     A5,A3,A5          ; |88| 
||         EXTU    .S1     A19,1,21,A0       ; |83| 

   [!A0]   ZERO    .L1     A5:A4             ; |91| 
           NOP             1
           CMPGTDP .S2X    A5:A4,B5:B4,B0    ; |94| 
           NOP             1
   [!B0]   LDW     .D2T1   *+SP(36),A7
   [!B0]   MV      .L1     A10,A6            ; |94| 
   [ B0]   ZERO    .L1     A11
   [ B0]   SET     .S1     A11,0x15,0x1d,A11
   [ B0]   MPYDP   .M1     A11:A10,A5:A4,A7:A6 ; |96| 
   [!B0]   SUBDP   .L1     A5:A4,A7:A6,A5:A4 ; |99| 
   [!B0]   ZERO    .S1     A13
   [!B0]   SET     .S1     A13,0x15,0x1d,A13
   [ B0]   ZERO    .L2     B13
   [!B0]   ZERO    .L2     B4
   [!B0]   SET     .S2     B4,0x15,0x1d,B4
   [!B0]   MV      .L2     B4,B5             ; |100| 
   [!B0]   MPYDP   .M1     A13:A12,A5:A4,A7:A6 ; |100| 
   [ B0]   SET     .S2     B13,0x15,0x1d,B13
   [!B0]   MV      .L2     B12,B4            ; |96| 
   [ B0]   ADDDP   .L2X    B13:B12,A7:A6,B7:B6 ; |96| 
   [ B0]   ZERO    .L1     A3
   [ B0]   SET     .S1     A3,0x15,0x1d,A3
   [ B0]   MV      .L1     A3,A7
   [ B0]   MV      .L1     A10,A6            ; |95| 
   [ B0]   SUBDP   .L1     A5:A4,A7:A6,A5:A4 ; |95| 
   [ B0]   MV      .S1     A10,A6            ; |95| 
           ADD     .L1     A30,A0,A3         ; |83| 
   [!B0]   ADDDP   .L2X    B5:B4,A7:A6,B7:B6 ; |100| 
           LDW     .D2T2   *+SP(56),B5
           MV      .L2     B12,B4            ; |105| 
   [!B0]   SUB     .S1     A3,1,A3           ; |101| 
           NOP             3
           RCPDP   .S2     B7:B6,B9:B8       ; |105| 
           NOP             1
           MPYDP   .M2     B7:B6,B9:B8,B17:B16 ; |105| 
           NOP             9
           SUBDP   .L2     B5:B4,B17:B16,B5:B4 ; |105| 
           NOP             6
           MPYDP   .M2     B9:B8,B5:B4,B9:B8 ; |105| 
           LDW     .D2T2   *+SP(64),B5
           NOP             8
           MPYDP   .M2     B7:B6,B9:B8,B17:B16 ; |105| 
           MV      .L2     B12,B4            ; |105| 
           NOP             8
           SUBDP   .L2     B5:B4,B17:B16,B5:B4 ; |105| 
           NOP             6
           MPYDP   .M2     B9:B8,B5:B4,B5:B4 ; |105| 
           NOP             9
           MPYDP   .M2     B7:B6,B5:B4,B9:B8 ; |105| 
           LDW     .D2T2   *+SP(72),B7
           NOP             7
           MV      .L2     B12,B6            ; |105| 
           SUBDP   .L2     B7:B6,B9:B8,B7:B6 ; |105| 
           LDW     .D2T2   *+SP(160),B9
           MV      .L2     B12,B8            ; |111| 
           NOP             4
           MPYDP   .M2     B5:B4,B7:B6,B5:B4 ; |105| 
           NOP             2
   [ B0]   ZERO    .L2     B6
   [ B0]   SET     .S2     B6,0x15,0x1d,B6
           NOP             1
   [ B0]   MV      .L1X    B6,A7
   [ B0]   SUBDP   .L1     A5:A4,A7:A6,A5:A4 ; |95| 
           INTDP   .L2X    A3,B7:B6          ; |111| 
           NOP             5
           MPYDP   .M1X    A5:A4,B5:B4,A9:A8 ; |105| 
           LDW     .D2T1   *+SP(96),A5
           LDW     .D2T1   *+SP(92),A4
           LDW     .D2T2   *+SP(168),B5
           LDW     .D2T2   *+SP(164),B4
           NOP             5
           MPYDP   .M1     A9:A8,A9:A8,A7:A6 ; |105| 
           MPYDP   .M2     B5:B4,B7:B6,B5:B4 ; |111| 
           NOP             8
           ADDDP   .L1     A5:A4,A7:A6,A5:A4 ; |53| 
           MPYDP   .M2     B9:B8,B7:B6,B7:B6 ; |111| 
           NOP             5
           MPYDP   .M1     A7:A6,A5:A4,A17:A16 ; |53| 
           LDW     .D2T1   *+SP(88),A5
           LDW     .D2T1   *+SP(84),A4
           NOP             7
           ADDDP   .L1     A5:A4,A17:A16,A5:A4 ; |53| 
           NOP             6
           MPYDP   .M1     A7:A6,A5:A4,A17:A16 ; |53| 
           LDW     .D2T1   *+SP(80),A5
           LDW     .D2T1   *+SP(76),A4
           NOP             7
           ADDDP   .L1     A5:A4,A17:A16,A23:A22 ; |53| 
           LDW     .D2T1   *+SP(104),A5
           MV      .L1     A10,A4            ; |53| 
           NOP             4
           RCPDP   .S1     A23:A22,A17:A16   ; |53| 
           NOP             1
           MPYDP   .M1     A17:A16,A23:A22,A21:A20 ; |53| 
           NOP             9
           SUBDP   .L1     A5:A4,A21:A20,A5:A4 ; |53| 
           NOP             6
           MPYDP   .M1     A17:A16,A5:A4,A17:A16 ; |53| 
           LDW     .D2T1   *+SP(112),A5
           NOP             8
           MPYDP   .M1     A17:A16,A23:A22,A21:A20 ; |53| 
           MV      .L1     A10,A4            ; |53| 
           NOP             8
           SUBDP   .L1     A5:A4,A21:A20,A5:A4 ; |53| 
           NOP             6

           MPYDP   .M1     A17:A16,A5:A4,A17:A16 ; |53| 
||         LDW     .D2T1   *+SP(136),A5

           LDW     .D2T1   *+SP(132),A4
           NOP             4
           MPYDP   .M1     A5:A4,A7:A6,A21:A20 ; |53| 
           LDW     .D2T1   *+SP(128),A5
           LDW     .D2T1   *+SP(124),A4
           NOP             2
           MPYDP   .M1     A17:A16,A23:A22,A23:A22 ; |53| 
           NOP             4

           ADDDP   .L1     A5:A4,A21:A20,A21:A20 ; |53| 
||         LDW     .D2T1   *+SP(144),A5

           MV      .S1     A10,A4            ; |53| 
           NOP             3
           SUBDP   .L1     A5:A4,A23:A22,A5:A4 ; |53| 
           NOP             2
           MPYDP   .M1     A7:A6,A21:A20,A21:A20 ; |53| 
           NOP             3

           MPYDP   .M1     A17:A16,A5:A4,A17:A16 ; |53| 
||         LDW     .D2T1   *+SP(120),A5

           LDW     .D2T1   *+SP(116),A4
           NOP             4
           ADDDP   .L1     A5:A4,A21:A20,A5:A4 ; |53| 
           NOP             6
           MPYDP   .M1     A5:A4,A17:A16,A5:A4 ; |53| 
           NOP             9
           MPYDP   .M1     A7:A6,A5:A4,A5:A4 ; |111| 
           NOP             9
           MPYDP   .M1     A9:A8,A5:A4,A5:A4 ; |111| 
           NOP             9
           ADDDP   .L1     A5:A4,A9:A8,A5:A4 ; |111| 
           NOP             7
           ADDDP   .L2X    A5:A4,B5:B4,B5:B4 ; |111| 
           LDW     .D2T1   *+SP(184),A5      ; |114| 
           LDW     .D2T1   *+SP(180),A4      ; |114| 
           NOP             4
           ADDDP   .L2     B7:B6,B5:B4,B7:B6 ; |111| 
           LDW     .D2T2   *+SP(152),B5
           LDW     .D2T2   *+SP(148),B4
           CMPGTDP .S1     A19:A18,A5:A4,A0  ; |117| 
           NOP             3

           MPYDP   .M2     B5:B4,B7:B6,B5:B4 ; |111| 
||         LDW     .D2T2   *+SP(176),B7

           NOP             3
           MV      .L2     B8,B6             ; |111| 

           CMPLTDP .S2X    A19:A18,B7:B6,B0  ; |114| 
||         LDW     .D2T2   *+SP(12),B7       ; |181| 

           LDW     .D2T2   *B31,B6           ; |181| 
           NOP             3

           SUB     .L1X    B7,1,A2           ; |177| 
|| [ B0]   MVKL    .S2     0xffefffff,B5
|| [ B0]   MV      .L2X    A4,B4             ; |118| 
||         SUB     .D2     B7,1,B30          ; |177| 

   [ A2]   B       .S1     $C$L8             ; |177| 
|| [ B0]   MVKH    .S2     0xffefffff,B5
||         ADD     .L2     B11,B6,B6         ; |181| 
||         STW     .D2T2   B30,*+SP(12)      ; |181| 

   [ A0]   MVKL    .S2     0x40734413,B5
||         ADD     .L2     8,B11,B11         ; |177| 

   [ A0]   MVKL    .S2     0x510ea7e7,B4
   [ A0]   MVKH    .S2     0x40734413,B5
   [ A0]   MVKH    .S2     0x510ea7e7,B4

   [ A2]   CALL    .S1     log10             ; |178| 
||         STDW    .D2T2   B5:B4,*B6         ; |181| 

           ; BRANCHCC OCCURS {$C$L8}         ; |177| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 6
           CALL    .S1     log10dp_v         ; |183| 
           LDW     .D1T2   *A14,B4           ; |183| 
           MVKL    .S1     a_sc,A4
           MVKH    .S1     a_sc,A4
           ADDKPC  .S2     $C$RL14,B3,0      ; |183| 
           MVK     .L1     0x6,A6            ; |183| 
$C$RL14:   ; CALL OCCURS {log10dp_v} {0}     ; |183| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 12

           CALLP   .S2     allequal,B3
||         MVK     .L1     0x6,A4            ; |186| 

$C$RL15:   ; CALL OCCURS {allequal} {0}      ; |186| 

           CALLP   .S2     print_test_results,B3
||         MVK     .L1     0x3,A4            ; |187| 

$C$RL16:   ; CALL OCCURS {print_test_results} {0}  ; |187| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 10
           MVKL    .S2     0xc000cccc,B4
           MVKL    .S2     0xcccccccd,B31
           MVK     .S2     0x777,B7

           LDW     .D2T2   *+SP(176),B5      ; |196| 
||         MVKL    .S2     a_ext,B6

           MVKH    .S2     0xc000cccc,B4

           STW     .D2T2   B4,*+SP(196)      ; |196| 
||         MVKH    .S2     0xcccccccd,B31

           STW     .D2T2   B7,*+SP(12)
||         MVKH    .S2     a_ext,B6

           MV      .L2     B12,B4            ; |105| 
||         STW     .D2T2   B31,*+SP(192)     ; |196| 

           CALL    .S1     log10             ; |192| 
||         STDW    .D2T2   B5:B4,*B6         ; |190| 
||         MV      .L1X    B6,A15            ; |190| 

           LDDW    .D1T1   *A15,A5:A4        ; |192| 
||         MV      .L2     B12,B10           ; |105| 
||         LDW     .D2T2   *+SP(188),B11     ; |196| 

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L9:    
;          EXCLUSIVE CPU CYCLES: 4
           ADDKPC  .S2     $C$RL17,B3,3      ; |192| 
$C$RL17:   ; CALL OCCURS {log10} {0}         ; |192| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 30
           MVKL    .S2     output,B4
           MVKH    .S2     output,B4
           LDW     .D2T2   *B4,B4            ; |192| 
           NOP             4
           ADD     .L2     B10,B4,B4         ; |192| 
           STDW    .D2T1   A5:A4,*B4         ; |192| 

           CALLP   .S2     log10dp,B3
||         LDDW    .D1T1   *A15,A5:A4        ; |193| 

$C$RL18:   ; CALL OCCURS {log10dp} {0}       ; |193| 
           MVKL    .S2     output,B4
           MVKH    .S2     output,B4
           LDW     .D2T2   *+B4(4),B4        ; |193| 
           NOP             4
           ADD     .L2     B10,B4,B4         ; |193| 
           STDW    .D2T1   A5:A4,*B4         ; |193| 

           CALLP   .S2     log10dp_c,B3
||         LDDW    .D1T1   *A15,A5:A4        ; |194| 

$C$RL19:   ; CALL OCCURS {log10dp_c} {0}     ; |194| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 370
           MVKL    .S2     output,B4
           MVKH    .S2     output,B4
           LDW     .D2T2   *+B4(8),B4        ; |194| 
           ZERO    .L1     A31
           LDW     .D2T2   *+SP(28),B5
           MVK     .S1     0xfffffc02,A30
           LDW     .D2T2   *B11,B31          ; |195| 
           ADD     .L2     B10,B4,B4         ; |194| 
           STDW    .D2T1   A5:A4,*B4         ; |194| 
           LDDW    .D1T1   *A15,A19:A18      ; |81| 
           SET     .S1     A31,0x15,0x1d,A5
           LDW     .D2T2   *+SP(16),B4
           NOP             2

           CLR     .S1     A19,20,31,A3      ; |88| 
||         MV      .L1     A18,A4            ; |88| 

           OR      .L1     A5,A3,A5          ; |88| 
||         EXTU    .S1     A19,1,21,A0       ; |83| 

   [!A0]   ZERO    .L1     A5:A4             ; |91| 
           ADD     .L1     A30,A0,A3         ; |83| 
           CMPGTDP .S2X    A5:A4,B5:B4,B0    ; |94| 
           NOP             1
   [!B0]   LDW     .D2T1   *+SP(36),A7
   [!B0]   MV      .L1     A12,A6            ; |94| 
   [ B0]   ZERO    .L1     A11
   [ B0]   SET     .S1     A11,0x15,0x1d,A11
   [ B0]   MPYDP   .M1     A11:A10,A5:A4,A7:A6 ; |96| 
   [!B0]   SUBDP   .L1     A5:A4,A7:A6,A5:A4 ; |99| 
   [!B0]   ZERO    .S1     A13
   [!B0]   SET     .S1     A13,0x15,0x1d,A13
   [ B0]   ZERO    .L2     B4
   [!B0]   ZERO    .L2     B4
   [ B0]   SET     .S2     B4,0x15,0x1d,B4
   [ B0]   MV      .L2     B4,B5             ; |96| 
   [!B0]   MPYDP   .M1     A13:A12,A5:A4,A7:A6 ; |100| 
   [ B0]   MV      .L2     B12,B4            ; |100| 
   [!B0]   SET     .S2     B4,0x15,0x1d,B4
   [!B0]   MV      .L2     B4,B5             ; |100| 
   [ B0]   ADDDP   .S2X    B5:B4,A7:A6,B7:B6 ; |96| 
   [!B0]   MV      .L2     B12,B4            ; |96| 
   [ B0]   MV      .L1     A12,A6            ; |95| 
   [ B0]   ZERO    .L2     B13
   [ B0]   SET     .S2     B13,0x15,0x1d,B13
   [!B0]   SUB     .L1     A3,1,A3           ; |101| 
           NOP             1
   [!B0]   ADDDP   .L2X    B5:B4,A7:A6,B7:B6 ; |100| 
           LDW     .D2T2   *+SP(56),B5
           MV      .L2     B12,B4            ; |105| 
           NOP             4
           RCPDP   .S2     B7:B6,B9:B8       ; |105| 
           NOP             1
           MPYDP   .M2     B7:B6,B9:B8,B17:B16 ; |105| 
           NOP             9
           SUBDP   .L2     B5:B4,B17:B16,B5:B4 ; |105| 
           NOP             6
           MPYDP   .M2     B9:B8,B5:B4,B9:B8 ; |105| 
           LDW     .D2T2   *+SP(64),B5
           NOP             8
           MPYDP   .M2     B7:B6,B9:B8,B17:B16 ; |105| 
           MV      .L2     B12,B4            ; |105| 
           NOP             8
           SUBDP   .L2     B5:B4,B17:B16,B5:B4 ; |105| 
           NOP             6
           MPYDP   .M2     B9:B8,B5:B4,B5:B4 ; |105| 
           NOP             9
           MPYDP   .M2     B7:B6,B5:B4,B9:B8 ; |105| 
           LDW     .D2T2   *+SP(72),B7
           NOP             7
           MV      .L2     B12,B6            ; |105| 
           SUBDP   .L2     B7:B6,B9:B8,B7:B6 ; |105| 
   [ B0]   ZERO    .S2     B8
   [ B0]   SET     .S2     B8,0x15,0x1d,B8
           LDW     .D2T2   *+SP(160),B9
   [ B0]   MV      .L1X    B8,A7
   [ B0]   SUBDP   .L1     A5:A4,A7:A6,A5:A4 ; |95| 
           MV      .S2     B12,B8            ; |111| 
           MPYDP   .M2     B5:B4,B7:B6,B5:B4 ; |105| 
           LDW     .D2T2   *+SP(168),B7
           LDW     .D2T2   *+SP(164),B6
           NOP             2
   [ B0]   SUBDP   .L1X    A5:A4,B13:B12,A5:A4 ; |95| 
           NOP             6
           MPYDP   .M1X    A5:A4,B5:B4,A9:A8 ; |105| 
           LDW     .D2T1   *+SP(96),A5
           LDW     .D2T1   *+SP(92),A4
           INTDP   .L2X    A3,B5:B4          ; |111| 
           NOP             6
           MPYDP   .M1     A9:A8,A9:A8,A7:A6 ; |105| 
           MPYDP   .M2     B7:B6,B5:B4,B7:B6 ; |111| 
           NOP             8
           ADDDP   .L1     A5:A4,A7:A6,A5:A4 ; |53| 
           MPYDP   .M2     B9:B8,B5:B4,B5:B4 ; |111| 
           NOP             5
           MPYDP   .M1     A7:A6,A5:A4,A17:A16 ; |53| 
           LDW     .D2T1   *+SP(88),A5
           LDW     .D2T1   *+SP(84),A4
           NOP             7
           ADDDP   .L1     A5:A4,A17:A16,A5:A4 ; |53| 
           NOP             6
           MPYDP   .M1     A7:A6,A5:A4,A17:A16 ; |53| 
           LDW     .D2T1   *+SP(80),A5
           LDW     .D2T1   *+SP(76),A4
           NOP             7
           ADDDP   .L1     A5:A4,A17:A16,A23:A22 ; |53| 
           LDW     .D2T1   *+SP(104),A5
           MV      .L1     A12,A4            ; |53| 
           NOP             4
           RCPDP   .S1     A23:A22,A17:A16   ; |53| 
           NOP             1
           MPYDP   .M1     A17:A16,A23:A22,A21:A20 ; |53| 
           NOP             9
           SUBDP   .L1     A5:A4,A21:A20,A5:A4 ; |53| 
           NOP             6
           MPYDP   .M1     A17:A16,A5:A4,A17:A16 ; |53| 
           LDW     .D2T1   *+SP(112),A5
           NOP             8
           MPYDP   .M1     A17:A16,A23:A22,A21:A20 ; |53| 
           MV      .L1     A12,A4            ; |53| 
           NOP             8
           SUBDP   .L1     A5:A4,A21:A20,A5:A4 ; |53| 
           NOP             6

           MPYDP   .M1     A17:A16,A5:A4,A17:A16 ; |53| 
||         LDW     .D2T1   *+SP(136),A5

           LDW     .D2T1   *+SP(132),A4
           NOP             4
           MPYDP   .M1     A5:A4,A7:A6,A21:A20 ; |53| 
           LDW     .D2T1   *+SP(128),A5
           LDW     .D2T1   *+SP(124),A4
           NOP             2
           MPYDP   .M1     A17:A16,A23:A22,A23:A22 ; |53| 
           NOP             4

           ADDDP   .L1     A5:A4,A21:A20,A21:A20 ; |53| 
||         LDW     .D2T1   *+SP(144),A5

           MV      .S1     A12,A4            ; |53| 
           NOP             3
           SUBDP   .L1     A5:A4,A23:A22,A5:A4 ; |53| 
           NOP             2
           MPYDP   .M1     A7:A6,A21:A20,A21:A20 ; |53| 
           NOP             3

           MPYDP   .M1     A17:A16,A5:A4,A17:A16 ; |53| 
||         LDW     .D2T1   *+SP(120),A5

           LDW     .D2T1   *+SP(116),A4
           NOP             4
           ADDDP   .L1     A5:A4,A21:A20,A5:A4 ; |53| 
           NOP             6
           MPYDP   .M1     A5:A4,A17:A16,A5:A4 ; |53| 
           NOP             9
           MPYDP   .M1     A7:A6,A5:A4,A5:A4 ; |111| 
           NOP             9
           MPYDP   .M1     A9:A8,A5:A4,A5:A4 ; |111| 
           NOP             9
           ADDDP   .L1     A5:A4,A9:A8,A5:A4 ; |111| 
           NOP             7
           ADDDP   .L2X    A5:A4,B7:B6,B7:B6 ; |111| 
           LDW     .D2T1   *+SP(176),A5
           MV      .L1     A12,A4            ; |111| 
           NOP             4
           ADDDP   .L2     B5:B4,B7:B6,B7:B6 ; |111| 
           LDW     .D2T2   *+SP(152),B5
           LDW     .D2T2   *+SP(148),B4
           CMPLTDP .S1     A19:A18,A5:A4,A1  ; |114| 
           LDW     .D2T1   *+SP(184),A5
           LDW     .D2T1   *+SP(180),A4
           NOP             1
           MPYDP   .M2     B5:B4,B7:B6,B5:B4 ; |111| 
           NOP             7
           CMPGTDP .S1     A19:A18,A5:A4,A0  ; |117| 
           ADD     .L2     B10,B31,B6        ; |195| 

   [ A1]   MVKL    .S2     0xffefffff,B5
|| [ A1]   MV      .L2X    A4,B4             ; |118| 

   [ A1]   MVKH    .S2     0xffefffff,B5
   [ A0]   MVKL    .S2     0x40734413,B5
   [ A0]   MVKL    .S2     0x510ea7e7,B4
   [ A0]   MVKH    .S2     0x40734413,B5
   [ A0]   MVKH    .S2     0x510ea7e7,B4
           STDW    .D2T2   B5:B4,*B6         ; |195| 

           LDDW    .D1T1   *A15,A5:A4        ; |196| 
||         LDW     .D2T2   *+SP(196),B5

           LDW     .D2T2   *+SP(192),B4
           LDW     .D2T2   *+SP(12),B6
           ADD     .L2     8,B10,B10         ; |191| 
           NOP             2
           MPYDP   .M2X    B5:B4,A5:A4,B5:B4 ; |196| 
           SUB     .L2     B6,1,B30          ; |191| 
           SUB     .L1X    B6,1,A0           ; |191| 
   [!A0]   MVKL    .S2     output,B11
   [!A0]   MVKH    .S2     output,B11
           NOP             1
   [ A0]   BNOP    .S1     $C$L9,3           ; |191| 

   [ A0]   CALL    .S1     log10             ; |192| 
||         STDW    .D1T2   B5:B4,*++A15      ; |196| 

   [!A0]   CALL    .S1     log10dp_v         ; |198| 
|| [ A0]   LDDW    .D1T1   *A15,A5:A4        ; |192| 
||         STW     .D2T2   B30,*+SP(12)      ; |196| 

           ; BRANCHCC OCCURS {$C$L9}         ; |191| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           LDW     .D2T2   *+B11(16),B4      ; |198| 
           MVKL    .S1     a_ext,A4
           MVKH    .S1     a_ext,A4
           MVK     .S1     0x777,A6          ; |198| 
           ADDKPC  .S2     $C$RL20,B3,0      ; |198| 
$C$RL20:   ; CALL OCCURS {log10dp_v} {0}     ; |198| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 42
           MVKL    .S2     0x3ddb7cdf,B7
           MVKL    .S2     0xd9d7bdbb,B6
           MVKH    .S2     0x3ddb7cdf,B7

           LDW     .D2T1   *B11,A4           ; |66| 
||         MVKH    .S2     0xd9d7bdbb,B6

           CALLP   .S2     isequal,B3
||         LDW     .D2T2   *+B11(4),B4       ; |66| 
||         MVK     .S1     0x777,A6          ; |66| 
||         MVK     .L1     0x9,A8            ; |66| 

$C$RL21:   ; CALL OCCURS {isequal} {0}       ; |66| 
           MVKL    .S2     fcn_pass,B10
           MVKL    .S2     0x3ddb7cdf,B7
           MVKH    .S2     fcn_pass,B10
           MVKL    .S2     0xd9d7bdbb,B6

           LDW     .D2T2   *+B11(8),B4       ; |67| 
||         MVKH    .S2     0x3ddb7cdf,B7

           STW     .D2T1   A4,*+B10(4)       ; |66| 
||         MVKH    .S2     0xd9d7bdbb,B6

           CALLP   .S2     isequal,B3
||         LDW     .D2T1   *B11,A4           ; |67| 
||         MVK     .S1     0x777,A6          ; |67| 
||         MVK     .L1     0x9,A8            ; |67| 

$C$RL22:   ; CALL OCCURS {isequal} {0}       ; |67| 
           MVKL    .S2     0x3ddb7cdf,B7
           MVKL    .S2     0xd9d7bdbb,B6

           STW     .D2T1   A4,*+B10(8)       ; |67| 
||         MVKH    .S2     0x3ddb7cdf,B7

           MV      .L2     B11,B5            ; |67| 
||         LDW     .D2T2   *+B11(12),B4      ; |68| 
||         MVKH    .S2     0xd9d7bdbb,B6

           CALLP   .S2     isequal,B3
||         LDW     .D2T1   *B5,A4            ; |68| 
||         MVK     .S1     0x777,A6          ; |68| 
||         MVK     .L1     0x9,A8            ; |68| 

$C$RL23:   ; CALL OCCURS {isequal} {0}       ; |68| 
           MVKL    .S2     0x3ddb7cdf,B7
           MVKL    .S2     0xd9d7bdbb,B6
           MVKH    .S2     0x3ddb7cdf,B7

           MV      .L1     A14,A5            ; |68| 
||         MV      .L2     B11,B4            ; |68| 
||         STW     .D2T1   A4,*+B10(12)      ; |68| 
||         MVKH    .S2     0xd9d7bdbb,B6

           CALLP   .S2     isequal,B3
||         LDW     .D2T1   *B4,A4            ; |69| 
||         LDW     .D1T2   *A5,B4            ; |69| 
||         MVK     .S1     0x777,A6          ; |69| 
||         MVK     .L1     0x9,A8            ; |69| 

$C$RL24:   ; CALL OCCURS {isequal} {0}       ; |69| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 12
           ADD     .L2     4,B10,B4
           LDW     .D2T2   *B4,B0            ; |72| 
           STW     .D2T1   A4,*+B10(16)      ; |69| 
           ADD     .L2     8,B10,B13
           STW     .D2T2   B4,*+SP(28)
           NOP             1

   [!B0]   MVKL    .S1     all_pass,A3
|| [!B0]   B       .S2     $C$L10            ; |72| 
|| [!B0]   MV      .L1     A10,A4
||         MV      .L2     B0,B1             ; guard predicate rewrite

   [!B0]   CALL    .S2     print_test_results ; |202| 
|| [!B0]   MVKH    .S1     all_pass,A3
|| [ B0]   LDW     .D2T2   *B13,B0           ; |72| 

   [ B1]   ADD     .L2     4,B13,B4
           NOP             3
           ; BRANCHCC OCCURS {$C$L10}        ; |72| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 10
   [ B0]   LDW     .D2T2   *B4,B4            ; |72| 
           CMPEQ   .L1     A4,0,A3           ; |72| 
           XOR     .L1     1,A3,A3           ; |72| 
           MVK     .L1     0x1,A4            ; |72| 
   [!B0]   MV      .L1     A10,A0            ; |72| 
   [ B0]   CMPEQ   .L2     B4,0,B4           ; |72| 
   [ B0]   XOR     .L2     1,B4,B4           ; |72| 
           NOP             1
   [ B0]   AND     .L1X    A3,B4,A0          ; |72| 
   [!A0]   MV      .L1     A10,A4
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           CALL    .S1     print_test_results ; |202| 
           MVKL    .S1     all_pass,A3
           MVKH    .S1     all_pass,A3
           NOP             2
;** --------------------------------------------------------------------------*
$C$L10:    
;          EXCLUSIVE CPU CYCLES: 1

           STW     .D1T1   A4,*A3            ; |72| 
||         MVK     .L1     0x4,A4            ; |202| 
||         ADDKPC  .S2     $C$RL25,B3,0      ; |202| 

$C$RL25:   ; CALL OCCURS {print_test_results} {0}  ; |202| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 14
           MV      .L2     B12,B4            ; |114| 

           STW     .D2T2   B4,*+SP(12)       ; |114| 
||         MV      .L2     B12,B5            ; |114| 
||         MVKL    .S1     cycle_counts+24,A3

           MVKH    .S1     cycle_counts+24,A3
||         STW     .D2T2   B5,*+SP(16)       ; |114| 
||         MV      .L2     B12,B6            ; |114| 

           MVC     .S2     B6,TSCL           ; |115| 
||         STDW    .D1T2   B5:B4,*A3         ; |114| 

           MVC     .S2     TSCL,B4           ; |116| 
           MVC     .S2     TSCH,B5           ; |116| 
           MVKL    .S1     t_start,A3
           MVKH    .S1     t_start,A3

           MVC     .S2     TSCL,B6           ; |117| 
||         STDW    .D1T2   B5:B4,*A3         ; |116| 

           MVC     .S2     TSCH,B8           ; |117| 

           SUBU    .L2     B6,B4,B7:B6       ; |117| 
||         MVKL    .S1     0x412e8482,A5

           EXT     .S2     B7,24,24,B5       ; |117| 
||         SUB     .L2     B8,B5,B4          ; |117| 
||         MVKL    .S1     t_offset,A3

           ADD     .L2     B4,B5,B7          ; |117| 
||         MVKH    .S1     t_offset,A3
||         MVK     .S2     0x80,B11

           STDW    .D1T2   B7:B6,*A3         ; |117| 
||         ZERO    .L2     B5
||         MVKL    .S2     input,B4
||         MVKH    .S1     0x412e8482,A5
||         MV      .L1     A10,A4            ; |212| 
||         MV      .D2     B12,B10           ; |117| 

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L11:    
;          EXCLUSIVE CPU CYCLES: 6

           CALL    .S1     gimme_random      ; |212| 
||         MVKH    .S2     input,B4

           LDW     .D2T2   *B4,B12           ; |212| 
           MV      .L2X    A10,B4            ; |212| 
           MVKH    .S2     0xbff00000,B5
           ADDKPC  .S2     $C$RL26,B3,1      ; |212| 
$C$RL26:   ; CALL OCCURS {gimme_random} {0}  ; |212| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 359
           ADD     .L2     B12,B10,B4        ; |212| 

           STDW    .D2T1   A5:A4,*B4         ; |212| 
||         MVC     .S2     TSCL,B16          ; |122| 

           MVC     .S2     TSCH,B17          ; |122| 

           ADD     .L2     B12,B10,B4        ; |90| 
||         ZERO    .L1     A11
||         CLR     .S1     A5,20,31,A16      ; |88| 

           LDDW    .D2T1   *B4,A7:A6         ; |90| 
||         SET     .S1     A11,0x15,0x1d,A11

           MV      .L1     A11,A3            ; |88| 
||         MVKL    .S1     0x667f3bcd,A8

           MVKL    .S1     0x3fe6a09e,A9
           MVKH    .S1     0x667f3bcd,A8
           MVKH    .S1     0x3fe6a09e,A9

           EXTU    .S1     A7,1,21,A0        ; |90| 
||         MV      .L1     A4,A6             ; |81| 
||         OR      .D1     A3,A16,A7         ; |88| 

   [!A0]   ZERO    .L1     A7:A6             ; |91| 
           CMPGTDP .S1     A7:A6,A9:A8,A0    ; |94| 
           MV      .L2X    A10,B4            ; |99| 
   [!A0]   SUBDP   .L1     A7:A6,A11:A10,A7:A6 ; |99| 
   [ A0]   MV      .L2X    A11,B5            ; |99| 
   [ A0]   MPYDP   .M2X    B5:B4,A7:A6,B7:B6 ; |96| 
           MV      .L1     A10,A8            ; |100| 
   [ A0]   MV      .L1     A3,A9             ; |100| 
           ZERO    .L2     B19
   [!A0]   MV      .L2X    A11,B5            ; |96| 
           MV      .L2X    A10,B18           ; |105| 
   [!A0]   MPYDP   .M2X    B5:B4,A7:A6,B7:B6 ; |100| 
           SET     .S2     B19,0x1e,0x1e,B19
           MV      .L1     A10,A18           ; |105| 
           MV      .L1X    B19,A19           ; |105| 
   [!A0]   MV      .L2X    A11,B5            ; |100| 
   [ A0]   ADDDP   .L2X    A9:A8,B7:B6,B7:B6 ; |96| 
           MV      .L1X    B19,A9            ; |105| 
           MV      .L1     A10,A20           ; |53| 
           MV      .L1X    B19,A21           ; |53| 
           MVKL    .S1     0xc05007ff,A23
   [!A0]   ADDDP   .L2     B5:B4,B7:B6,B7:B6 ; |100| 
           MVKL    .S1     0x12b3b59a,A22
           MVKH    .S1     0xc05007ff,A23
           MVKH    .S1     0x12b3b59a,A22
           MVK     .S1     0xfffffc02,A30
           EXTU    .S1     A5,1,21,A31       ; |83| 
           ZERO    .L1     A29
           RCPDP   .S2     B7:B6,B5:B4       ; |105| 
           MVKL    .S1     t_start,A15
           MPYDP   .M2     B7:B6,B5:B4,B9:B8 ; |105| 
           MVKL    .S2     output+12,B31
           MVKH    .S2     output+12,B31
           MVKH    .S1     t_start,A15
           STDW    .D1T2   B17:B16,*A15
           NOP             5
           SUBDP   .L2     B19:B18,B9:B8,B9:B8 ; |105| 
           NOP             6
           MPYDP   .M2     B5:B4,B9:B8,B5:B4 ; |105| 
           NOP             9
           MPYDP   .M2     B7:B6,B5:B4,B9:B8 ; |105| 
           NOP             9
           NOP             1
           SUBDP   .L1X    A9:A8,B9:B8,A9:A8 ; |105| 
           NOP             6
           MPYDP   .M1X    B5:B4,A9:A8,A9:A8 ; |105| 
           NOP             9
           MPYDP   .M1X    B7:B6,A9:A8,A17:A16 ; |105| 
   [ A0]   MV      .L2X    A11,B5            ; |105| 
           MV      .L2     B18,B4            ; |105| 
           NOP             7
           SUBDP   .L1     A19:A18,A17:A16,A17:A16 ; |105| 
   [ A0]   SUBDP   .S1X    A7:A6,B5:B4,A7:A6 ; |95| 
           MVKL    .S2     0x4b67ce0f,B4
           MVKL    .S2     0xc041d580,B5
           MVKH    .S2     0x4b67ce0f,B4
           MVKH    .S2     0xc041d580,B5
           NOP             1
           MPYDP   .M1     A9:A8,A17:A16,A17:A16 ; |105| 
           NOP             2

           MV      .L1     A18,A8            ; |105| 
|| [ A0]   MV      .S1     A3,A9             ; |105| 

   [ A0]   SUBDP   .L1     A7:A6,A9:A8,A7:A6 ; |95| 
           ADD     .S1     A30,A31,A3        ; |83| 
   [!A0]   SUB     .L1     A3,1,A3           ; |101| 
           NOP             4
           MPYDP   .M1     A7:A6,A17:A16,A9:A8 ; |105| 
           NOP             9
           MPYDP   .M1     A9:A8,A9:A8,A7:A6 ; |105| 
           MVKL    .S1     0x40738083,A17
           MVKL    .S1     0xfa15267e,A16
           MVKH    .S1     0x40738083,A17
           MVKH    .S1     0xfa15267e,A16
           NOP             6
           ADDDP   .L2X    B5:B4,A7:A6,B5:B4 ; |53| 
           NOP             6
           MPYDP   .M2X    A7:A6,B5:B4,B5:B4 ; |53| 
           NOP             9
           NOP             1
           ADDDP   .L1X    A17:A16,B5:B4,A17:A16 ; |53| 
           MVKL    .S2     0xc0880bfe,B5
           MVKL    .S2     0x9c0d9077,B4
           MVKH    .S2     0xc0880bfe,B5
           MVKH    .S2     0x9c0d9077,B4
           NOP             2
           MPYDP   .M1     A7:A6,A17:A16,A17:A16 ; |53| 
           NOP             9
           NOP             1
           ADDDP   .L2X    B5:B4,A17:A16,B5:B4 ; |53| 
           MV      .L1     A18,A16           ; |53| 
           MV      .L1     A19,A17           ; |53| 
           MVKL    .S1     0xbfe94415,A19
           MVKL    .S1     0xb356bd29,A18
           MVKH    .S1     0xbfe94415,A19
           MVKH    .S1     0xb356bd29,A18
           RCPDP   .S2     B5:B4,B7:B6       ; |53| 
           MPYDP   .M1     A19:A18,A7:A6,A19:A18 ; |53| 
           MPYDP   .M2     B7:B6,B5:B4,B9:B8 ; |53| 
           NOP             9
           NOP             1
           SUBDP   .L1X    A17:A16,B9:B8,A17:A16 ; |53| 
           MV      .L2     B18,B8            ; |53| 
           MV      .L2     B19,B9            ; |53| 
           NOP             4
           MPYDP   .M1X    B7:B6,A17:A16,A17:A16 ; |53| 
           NOP             9
           NOP             1
           MPYDP   .M2X    A17:A16,B5:B4,B7:B6 ; |53| 
           NOP             9
           SUBDP   .L2     B9:B8,B7:B6,B7:B6 ; |53| 
           NOP             7
           MPYDP   .M1X    A17:A16,B7:B6,A17:A16 ; |53| 
           NOP             8
           MVKL    .S2     0x4030624a,B7
           MVKL    .S2     0x2016afed,B6
           MPYDP   .M2X    A17:A16,B5:B4,B5:B4 ; |53| 
           MVKH    .S2     0x4030624a,B7
           MVKH    .S2     0x2016afed,B6
           NOP             1
           ADDDP   .L1X    B7:B6,A19:A18,A19:A18 ; |53| 
           LDW     .D2T2   *B31,B6           ; |216| 
           NOP             5

           SUBDP   .L1X    A21:A20,B5:B4,A19:A18 ; |53| 
||         MPYDP   .M1     A7:A6,A19:A18,A21:A20 ; |53| 

           MVKL    .S2     0xbf2bd010,B5
           MVKL    .S2     0x5c610ca8,B4
           MVKH    .S2     0xbf2bd010,B5
           MVKH    .S2     0x5c610ca8,B4
           ADD     .L2     B10,B6,B6         ; |216| 
           NOP             1
           MPYDP   .M1     A17:A16,A19:A18,A17:A16 ; |53| 
           NOP             2
           ADDDP   .L1     A23:A22,A21:A20,A19:A18 ; |53| 
           NOP             6
           MPYDP   .M1     A19:A18,A17:A16,A17:A16 ; |53| 
           NOP             9
           MPYDP   .M1     A7:A6,A17:A16,A7:A6 ; |111| 
           NOP             9
           MPYDP   .M1     A9:A8,A7:A6,A17:A16 ; |111| 
           INTDP   .L1     A3,A7:A6          ; |111| 
           NOP             5
           MPYDP   .M1X    B5:B4,A7:A6,A19:A18 ; |111| 
           NOP             2
           ADDDP   .L1     A17:A16,A9:A8,A9:A8 ; |111| 
           MV      .L2     B8,B4             ; |111| 
           MVKL    .S2     0x3fe63000,B5
           MVKH    .S2     0x3fe63000,B5
           MPYDP   .M2X    B5:B4,A7:A6,B5:B4 ; |111| 
           NOP             2
           ADDDP   .L1     A9:A8,A19:A18,A7:A6 ; |111| 
           SET     .S1     A29,0x14,0x14,A9
           MV      .L1     A10,A8            ; |111| 
           CMPLTDP .S1     A5:A4,A9:A8,A1    ; |114| 
           NOP             4
           ADDDP   .L2X    B5:B4,A7:A6,B5:B4 ; |111| 
           MVKL    .S1     0x3fdbcb7b,A7
           MVKL    .S1     0x1526e50e,A6
           MVKH    .S1     0x3fdbcb7b,A7
           MVKH    .S1     0x1526e50e,A6
           NOP             2
           MPYDP   .M2X    A7:A6,B5:B4,B5:B4 ; |111| 
           NOP             5
           MVK     .L1     0xffffffff,A6     ; |117| 
           MVKL    .S1     0x7fefffff,A7
           MVKH    .S1     0x7fefffff,A7
           CMPGTDP .S1     A5:A4,A7:A6,A0    ; |117| 

   [ A1]   MVKL    .S2     0xffefffff,B5
|| [ A1]   MV      .L2X    A6,B4             ; |118| 

   [ A1]   MVKH    .S2     0xffefffff,B5
   [ A0]   MVKL    .S2     0x40734413,B5
   [ A0]   MVKL    .S2     0x510ea7e7,B4
   [ A0]   MVKH    .S2     0x40734413,B5
   [ A0]   MVKH    .S2     0x510ea7e7,B4

           STDW    .D2T2   B5:B4,*B6         ; |216| 
||         MVC     .S2     TSCL,B6           ; |128| 

           MVC     .S2     TSCH,B7           ; |128| 

           MVKL    .S2     t_offset,B4
||         SUB     .L1X    B11,1,A0          ; |210| 
||         MVKL    .S1     t_stop,A13
||         ADD     .L2     8,B10,B10         ; |210| 
||         SUB     .D2     B11,1,B11         ; |210| 

           MVKH    .S2     t_offset,B4
||         MVKL    .S1     cycle_counts+24,A12
|| [ A0]   MV      .L1     A10,A4            ; |212| 

           LDDW    .D2T2   *B4,B19:B18       ; |130| 
||         MVKL    .S2     cycle_counts+24,B30
|| [ A0]   MVKL    .S1     0x412e8482,A5

           MVKH    .S2     cycle_counts+24,B30
||         MVKH    .S1     t_stop,A13

           LDDW    .D2T2   *B30,B9:B8        ; |130| 
||         MVKH    .S1     cycle_counts+24,A12

           STDW    .D1T2   B7:B6,*A13        ; |128| 
   [ A0]   MVKH    .S1     0x412e8482,A5
           ADDU    .L2     B18,B16,B5:B4     ; |130| 

           ADD     .S2     B5,B19,B16        ; |130| 
|| [ A0]   B       .S1     $C$L11            ; |210| 
||         SUBU    .L2     B6,B4,B5:B4       ; |130| 

           ADD     .L2     B16,B17,B16       ; |130| 

           ADDU    .L2     B8,B4,B5:B4       ; |130| 
||         SUB     .D2     B7,B16,B8         ; |130| 
||         EXT     .S2     B5,24,24,B16      ; |130| 

           ADD     .L2     B8,B16,B8         ; |130| 
||         ADD     .S2     B5,B9,B5          ; |130| 

           ADD     .L2     B5,B8,B5          ; |130| 

   [!A0]   CALL    .S1     __c6xabi_fltllif  ; |135| 
||         STDW    .D1T2   B5:B4,*A12        ; |130| 
|| [ A0]   MVKL    .S2     input,B4
|| [ A0]   ZERO    .L2     B5

           ; BRANCHCC OCCURS {$C$L11}        ; |210| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           LDDW    .D1T1   *A12,A5:A4        ; |135| 
           ADDKPC  .S2     $C$RL27,B3,3      ; |135| 
$C$RL27:   ; CALL OCCURS {__c6xabi_fltllif} {0}  ; |135| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 15
           ZERO    .L1     A3
           SET     .S1     A3,0x1a,0x1d,A3
           MPYSP   .M1     A3,A4,A3          ; |135| 
           NOP             3
           SPDP    .S1     A3,A5:A4          ; |135| 
           NOP             1
           ADDDP   .L1     A11:A10,A5:A4,A5:A4 ; |135| 
           CALLP   .S2     __c6xabi_fixdlli,B3
$C$RL28:   ; CALL OCCURS {__c6xabi_fixdlli} {0}  ; |135| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 18
           MV      .L2X    A12,B6
           MV      .L2X    A10,B4

           MVK     .S2     24,B10
||         MV      .L2X    A10,B5

           SUB     .L2X    A12,B10,B10
||         STDW    .D2T1   A5:A4,*B6         ; |135| 

           STDW    .D2T2   B5:B4,*B10        ; |114| 
||         MVC     .S2     B4,TSCL           ; |115| 

           MVC     .S2     TSCL,B6           ; |116| 
           MVC     .S2     TSCH,B4           ; |116| 
           MV      .L2     B4,B7             ; |116| 

           STDW    .D1T2   B7:B6,*A15        ; |116| 
||         MVC     .S2     TSCL,B4           ; |117| 

           MVC     .S2     TSCH,B8           ; |117| 

           SUBU    .L2     B4,B6,B5:B4       ; |117| 
||         MVKL    .S2     t_offset,B11

           EXT     .S2     B5,24,24,B6       ; |117| 
||         SUB     .L2     B8,B7,B31         ; |117| 
||         MVKL    .S1     output,A3

           ADD     .L2     B31,B6,B5         ; |117| 
||         MVKH    .S2     t_offset,B11
||         MVKH    .S1     output,A3

           STDW    .D2T2   B5:B4,*B11        ; |117| 
||         MV      .L1X    B12,A10
||         CALL    .S1     log10             ; |224| 
||         LDW     .D1T1   *A3,A12

           LDDW    .D1T1   *A10++,A5:A4      ; |224| 
           MVK     .S2     0x80,B12
           NOP             2
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L12:    
;          EXCLUSIVE CPU CYCLES: 1
           ADDKPC  .S2     $C$RL29,B3,0      ; |224| 
$C$RL29:   ; CALL OCCURS {log10} {0}         ; |224| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 7

           SUB     .L1X    B12,1,A0          ; |223| 
||         STDW    .D1T1   A5:A4,*A12++      ; |224| 

   [ A0]   B       .S1     $C$L12            ; |223| 
   [ A0]   CALL    .S1     log10             ; |224| 
   [ A0]   LDDW    .D1T1   *A10++,A5:A4      ; |224| 
           SUB     .L2     B12,1,B12         ; |223| 
           NOP             2
           ; BRANCHCC OCCURS {$C$L12}        ; |223| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 18
           MVC     .S2     TSCL,B8           ; |128| 
           MVC     .S2     TSCH,B4           ; |128| 

           LDDW    .D1T1   *A15,A5:A4        ; |130| 
||         LDDW    .D2T2   *B11,B7:B6        ; |130| 

           MV      .L2     B4,B9             ; |128| 
           MV      .L2X    A13,B30           ; |130| 
           NOP             2
           ADDU    .L1X    B6,A4,A7:A6       ; |130| 

           ADD     .L1X    A7,B7,A3          ; |130| 
||         LDDW    .D2T2   *B10,B7:B6        ; |130| 

           ADD     .L1     A3,A5,A3          ; |130| 
||         SUBU    .L2X    B8,A6,B5:B4       ; |130| 

           EXT     .S2     B5,24,24,B16      ; |130| 
           SUB     .L2X    B9,A3,B31         ; |130| 
           CALL    .S1     __c6xabi_fltllif  ; |130| 

           ADDU    .L2     B6,B4,B5:B4       ; |130| 
||         ADD     .S2     B31,B16,B6        ; |130| 

           ADD     .L2     B5,B7,B5          ; |130| 

           MV      .L1X    B4,A4             ; |130| 
||         ADD     .L2     B5,B6,B4          ; |130| 

           STDW    .D2T2   B9:B8,*B30        ; |128| 

           ADDKPC  .S2     $C$RL30,B3,0      ; |130| 
||         MV      .L1X    B4,A5             ; |130| 

$C$RL30:   ; CALL OCCURS {__c6xabi_fltllif} {0}  ; |130| 
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
$C$RL31:   ; CALL OCCURS {__c6xabi_fixdlli} {0}  ; |130| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 14
           MV      .L2X    A10,B4            ; |130| 

           MV      .L2X    A10,B5            ; |130| 
||         STDW    .D2T1   A5:A4,*B10        ; |130| 

           MVC     .S2     B4,TSCL           ; |115| 
||         STDW    .D2T2   B5:B4,*+B10(8)    ; |114| 

           MVC     .S2     TSCL,B6           ; |116| 
           MVC     .S2     TSCH,B4           ; |116| 
           MV      .L2     B4,B7             ; |116| 

           MVC     .S2     TSCL,B4           ; |117| 
||         STDW    .D1T2   B7:B6,*A15        ; |116| 

           MVC     .S2     TSCH,B8           ; |117| 
           SUBU    .L2     B4,B6,B5:B4       ; |117| 

           EXT     .S2     B5,24,24,B6       ; |117| 
||         SUB     .L2     B8,B7,B31         ; |117| 

           ADD     .L2     B31,B6,B5         ; |117| 

           MVK     .S2     0x80,B4
||         STDW    .D2T2   B5:B4,*B11        ; |117| 

           MVKL    .S1     input,A13

           MV      .L1X    B4,A10            ; |117| 
||         MVKH    .S1     input,A13
||         LDW     .D2T2   *+SP(20),B12      ; |117| 
||         MV      .D1     A10,A12

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L13:    
;          EXCLUSIVE CPU CYCLES: 11
           LDW     .D1T1   *A13,A3           ; |232| 
           NOP             4

           ADD     .L1     A12,A3,A3         ; |232| 
||         CALL    .S1     log10dp           ; |232| 

           LDDW    .D1T1   *A3,A5:A4         ; |232| 
           ADDKPC  .S2     $C$RL32,B3,3      ; |232| 
$C$RL32:   ; CALL OCCURS {log10dp} {0}       ; |232| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 7

           LDW     .D2T2   *B12,B4           ; |232| 
||         SUB     .L1     A10,1,A0          ; |231| 
||         SUB     .S1     A10,1,A10         ; |231| 

   [ A0]   BNOP    .S1     $C$L13,3          ; |231| 

           ADD     .L1X    A12,B4,A3         ; |232| 
||         ADD     .S1     8,A12,A12         ; |231| 

           STDW    .D1T1   A5:A4,*A3         ; |232| 
           ; BRANCHCC OCCURS {$C$L13}        ; |231| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 19
           MVC     .S2     TSCL,B6           ; |128| 
           MVC     .S2     TSCH,B5           ; |128| 

           MV      .L2     B11,B4            ; |128| 
||         LDDW    .D1T1   *A15,A5:A4        ; |130| 

           LDDW    .D2T2   *B4,B9:B8         ; |130| 
           MVKL    .S2     t_stop,B31
           MV      .L2     B5,B7             ; |128| 
           LDDW    .D2T2   *+B10(8),B5:B4    ; |130| 
           MVKH    .S2     t_stop,B31
           ADDU    .L1X    B8,A4,A7:A6       ; |130| 
           MV      .L1     A6,A3             ; |130| 
           STDW    .D2T2   B7:B6,*B31        ; |128| 

           ADD     .L1X    A7,B9,A3          ; |130| 
||         SUBU    .L2X    B6,A3,B9:B8       ; |130| 

           ADD     .L1     A3,A5,A3          ; |130| 
||         EXT     .S2     B9,24,24,B16      ; |130| 
||         ADDU    .L2     B4,B8,B9:B8       ; |130| 

           CALL    .S1     __c6xabi_fltllif  ; |130| 
||         ADD     .L2     B9,B5,B5          ; |130| 

           SUB     .L2X    B7,A3,B4          ; |130| 
||         MV      .L1X    B8,A4             ; |130| 

           ADD     .L2     B4,B16,B8         ; |130| 
           ADD     .L2     B5,B8,B4          ; |130| 
           ADDKPC  .S2     $C$RL33,B3,0      ; |130| 
           MV      .L1X    B4,A5             ; |130| 
$C$RL33:   ; CALL OCCURS {__c6xabi_fltllif} {0}  ; |130| 
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
$C$RL34:   ; CALL OCCURS {__c6xabi_fixdlli} {0}  ; |130| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 13

           MV      .L2X    A10,B5
||         ADDAD   .D2     B10,1,B11

           STDW    .D2T1   A5:A4,*B11        ; |130| 
||         MV      .L2X    A10,B4

           MVC     .S2     B4,TSCL           ; |115| 
||         STDW    .D2T2   B5:B4,*+B10(16)   ; |114| 

           MVC     .S2     TSCL,B6           ; |116| 
           MVC     .S2     TSCH,B4           ; |116| 
           MV      .L2     B4,B7             ; |116| 

           MVC     .S2     TSCL,B4           ; |117| 
||         STDW    .D1T2   B7:B6,*A15        ; |116| 

           MVC     .S2     TSCH,B5           ; |117| 

           SUBU    .L2     B4,B6,B9:B8       ; |117| 
||         MVKL    .S2     t_offset,B31

           EXT     .S2     B9,24,24,B5       ; |117| 
||         SUB     .L2     B5,B7,B4          ; |117| 

           MVK     .S2     0x80,B4
||         ADD     .L2     B4,B5,B7          ; |117| 

           MV      .L2     B8,B6             ; |117| 
||         MVKH    .S2     t_offset,B31
||         LDW     .D2T2   *+SP(24),B12      ; |117| 

           MV      .L1X    B4,A10            ; |117| 
||         STDW    .D2T2   B7:B6,*B31        ; |117| 
||         MV      .S1     A10,A12

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L14:    
;          EXCLUSIVE CPU CYCLES: 11
           LDW     .D1T1   *A13,A3           ; |240| 
           NOP             4

           ADD     .L1     A12,A3,A3         ; |240| 
||         CALL    .S1     log10dp_c         ; |240| 

           LDDW    .D1T1   *A3,A5:A4         ; |240| 
           ADDKPC  .S2     $C$RL35,B3,3      ; |240| 
$C$RL35:   ; CALL OCCURS {log10dp_c} {0}     ; |240| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 7

           LDW     .D2T2   *B12,B4           ; |240| 
||         SUB     .L1     A10,1,A0          ; |239| 
||         SUB     .S1     A10,1,A10         ; |239| 

   [ A0]   BNOP    .S1     $C$L14,3          ; |239| 

           ADD     .L1X    A12,B4,A3         ; |240| 
||         ADD     .S1     8,A12,A12         ; |239| 

           STDW    .D1T1   A5:A4,*A3         ; |240| 
           ; BRANCHCC OCCURS {$C$L14}        ; |239| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 17
           MVC     .S2     TSCL,B8           ; |128| 
           MVC     .S2     TSCH,B4           ; |128| 

           MVKL    .S2     t_offset,B5
||         MV      .L1     A15,A12           ; |128| 

           MVKH    .S2     t_offset,B5
||         LDDW    .D1T1   *A12,A5:A4        ; |130| 

           LDDW    .D2T2   *B5,B7:B6         ; |130| 
           LDDW    .D2T2   *+B10(16),B17:B16 ; |130| 
           MV      .L2     B4,B9             ; |128| 
           NOP             2
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
||         MVKL    .S2     t_stop,B6

           ADD     .L2     B31,B5,B4         ; |130| 
||         MVKH    .S2     t_stop,B6

           STDW    .D2T2   B9:B8,*B6         ; |128| 

           MV      .L1X    B4,A5             ; |130| 
||         ADDKPC  .S2     $C$RL36,B3,0      ; |130| 

$C$RL36:   ; CALL OCCURS {__c6xabi_fltllif} {0}  ; |130| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 110
           ZERO    .L1     A3
           SET     .S1     A3,0x1a,0x1d,A3
           MPYSP   .M1     A3,A4,A3          ; |130| 
           ZERO    .L1     A10               ; |130| 
           NOP             3
           SPDP    .S2X    A3,B5:B4          ; |130| 
           NOP             2
           ADDDP   .L1X    A11:A10,B5:B4,A5:A4 ; |130| 
           CALLP   .S2     __c6xabi_fixdlli,B3
$C$RL37:   ; CALL OCCURS {__c6xabi_fixdlli} {0}  ; |130| 

           ADDAD   .D2     B11,1,B12
||         MV      .L2X    A10,B5

           MV      .L2X    A10,B4
||         STDW    .D2T1   A5:A4,*B12        ; |130| 

           STDW    .D2T2   B5:B4,*+B10(32)   ; |114| 
||         MVC     .S2     B4,TSCL           ; |115| 

           MVC     .S2     TSCL,B6           ; |116| 
           MVC     .S2     TSCH,B7           ; |116| 

           STDW    .D1T2   B7:B6,*A15        ; |116| 
||         MVC     .S2     TSCL,B4           ; |117| 

           MVC     .S2     TSCH,B8           ; |117| 
           MVKL    .S1     t_offset,A3

           MVKH    .S1     t_offset,A3
||         SUBU    .L2     B4,B6,B5:B4       ; |117| 

           EXT     .S2     B5,24,24,B6       ; |117| 
||         SUB     .L2     B8,B7,B31         ; |117| 

           MVKL    .S1     output,A10
||         MV      .L2X    A3,B10            ; |117| 
||         ADD     .S2     B31,B6,B5         ; |117| 

           MVKH    .S1     output,A10
||         MV      .L2X    A13,B9            ; |247| 
||         STDW    .D2T2   B5:B4,*B10        ; |117| 

           CALLP   .S2     log10dp_v,B3
||         LDW     .D1T2   *+A10(16),B4      ; |247| 
||         LDW     .D2T1   *B9,A4            ; |247| 
||         MVK     .S1     0x80,A6           ; |247| 

$C$RL38:   ; CALL OCCURS {log10dp_v} {0}     ; |247| 
           MVC     .S2     TSCL,B8           ; |128| 
           MVC     .S2     TSCH,B4           ; |128| 

           LDDW    .D1T1   *A15,A7:A6        ; |130| 
||         LDDW    .D2T2   *B10,B7:B6        ; |130| 

           MVK     .S1     16,A12
           ADD     .L1X    B12,A12,A12
           LDDW    .D1T1   *A12,A9:A8        ; |130| 
           MVKL    .S1     t_stop,A3
           ADDU    .L1X    B6,A6,A5:A4       ; |130| 

           MVKH    .S1     t_stop,A3
||         SUBU    .L1X    B8,A4,A17:A16     ; |130| 

           ADD     .L1X    A5,B7,A4          ; |130| 
||         MV      .L2     B4,B9             ; |128| 

           ADD     .L1     A4,A7,A4          ; |130| 
||         MV      .L2X    A3,B4             ; |128| 
||         MV      .D1     A16,A3            ; |130| 
||         EXT     .S1     A17,24,24,A6      ; |130| 

           SUB     .S1X    B9,A4,A3          ; |130| 
||         ADDU    .L1     A8,A3,A5:A4       ; |130| 

           ADD     .L1     A5,A9,A3          ; |130| 
||         ADD     .S1     A3,A6,A5          ; |130| 

           CALLP   .S2     __c6xabi_fltllif,B3
||         ADD     .L1     A3,A5,A5          ; |130| 
||         STDW    .D2T2   B9:B8,*B4         ; |128| 

$C$RL39:   ; CALL OCCURS {__c6xabi_fltllif} {0}  ; |130| 
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
$C$RL40:   ; CALL OCCURS {__c6xabi_fixdlli} {0}  ; |130| 
           MVKL    .S2     0x3ddb7cdf,B7
           MVKL    .S2     0xd9d7bdbb,B6

           STDW    .D1T1   A5:A4,*A12        ; |130| 
||         MVKH    .S2     0x3ddb7cdf,B7

           LDW     .D1T2   *+A10(4),B4       ; |66| 
||         MVKH    .S2     0xd9d7bdbb,B6

           CALLP   .S2     isequal,B3
||         LDW     .D1T1   *A10,A4           ; |66| 
||         MVK     .S1     0x80,A6           ; |66| 
||         MVK     .L1     0x9,A8            ; |66| 

$C$RL41:   ; CALL OCCURS {isequal} {0}       ; |66| 

           MVKL    .S1     fcn_pass,A3
||         MVKL    .S2     0xd9d7bdbb,B6

           MVKH    .S1     fcn_pass,A3
||         MVKL    .S2     0x3ddb7cdf,B7

           MVKH    .S2     0xd9d7bdbb,B6

           MV      .L1     A4,A5             ; |66| 
||         LDW     .D1T1   *A10,A4           ; |67| 
||         MV      .L2X    A3,B10            ; |66| 
||         MVKH    .S2     0x3ddb7cdf,B7

           CALLP   .S2     isequal,B3
||         LDW     .D1T2   *+A10(8),B4       ; |67| 
||         STW     .D2T1   A5,*+B10(4)       ; |66| 
||         MVK     .S1     0x80,A6           ; |67| 
||         MVK     .L1     0x9,A8            ; |67| 

$C$RL42:   ; CALL OCCURS {isequal} {0}       ; |67| 
           MVKL    .S2     0x3ddb7cdf,B7
           MVKL    .S2     0xd9d7bdbb,B6
           MVKH    .S2     0x3ddb7cdf,B7

           STW     .D2T1   A4,*+B10(8)       ; |67| 
||         LDW     .D1T2   *+A10(12),B4      ; |68| 
||         MVKH    .S2     0xd9d7bdbb,B6

           CALLP   .S2     isequal,B3
||         LDW     .D1T1   *A10,A4           ; |68| 
||         MVK     .S1     0x80,A6           ; |68| 
||         MVK     .L1     0x9,A8            ; |68| 

$C$RL43:   ; CALL OCCURS {isequal} {0}       ; |68| 
           MVKL    .S2     0x3ddb7cdf,B7
           MVKL    .S2     0xd9d7bdbb,B6
           MVKH    .S2     0x3ddb7cdf,B7

           STW     .D2T1   A4,*+B10(12)      ; |68| 
||         LDW     .D1T2   *A14,B4           ; |69| 
||         MVKH    .S2     0xd9d7bdbb,B6

           CALLP   .S2     isequal,B3
||         LDW     .D1T1   *A10,A4           ; |69| 
||         MVK     .S1     0x80,A6           ; |69| 
||         MVK     .L1     0x9,A8            ; |69| 

$C$RL44:   ; CALL OCCURS {isequal} {0}       ; |69| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 16
           LDW     .D2T2   *+SP(28),B5       ; |69| 
           MV      .L2X    A4,B4             ; |69| 
           STW     .D2T2   B4,*+B10(16)      ; |69| 
           NOP             2
           LDW     .D2T2   *B5,B0            ; |72| 
           NOP             4

   [!B0]   BNOP    .S1     $C$L15,4          ; |72| 
||         MV      .L2     B0,B1             ; guard predicate rewrite
|| [ B0]   LDW     .D2T2   *B13,B0           ; |72| 

   [ B1]   ADD     .L2     4,B13,B5
           ; BRANCHCC OCCURS {$C$L15}        ; |72| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 14
   [ B0]   LDW     .D2T2   *B5,B6            ; |72| 
           CMPEQ   .L2     B4,0,B31          ; |72| 
           XOR     .L2     1,B31,B5          ; |72| 
           MVK     .L1     0x1,A4            ; |72| 
           NOP             1
   [ B0]   CMPEQ   .L2     B6,0,B4           ; |72| 
   [ B0]   XOR     .L2     1,B4,B4           ; |72| 

   [ B0]   AND     .L2     B5,B4,B0          ; |72| 
|| [!B0]   ZERO    .S2     B0                ; |72| 

   [ B0]   B       .S1     $C$L16            ; |72| 
   [ B0]   CALL    .S1     print_test_results ; |253| 
   [ B0]   MVKL    .S1     all_pass,A3
   [ B0]   MVKH    .S1     all_pass,A3
           NOP             2
           ; BRANCHCC OCCURS {$C$L16}        ; |72| 
;** --------------------------------------------------------------------------*
$C$L15:    
;          EXCLUSIVE CPU CYCLES: 5
           CALL    .S1     print_test_results ; |253| 
           MVKL    .S1     all_pass,A3
           MVKH    .S1     all_pass,A3
           ZERO    .L1     A4                ; |72| 
           NOP             1
;** --------------------------------------------------------------------------*
$C$L16:    
;          EXCLUSIVE CPU CYCLES: 1

           STW     .D1T1   A4,*A3            ; |72| 
||         MVK     .L1     0x2,A4            ; |253| 
||         ADDKPC  .S2     $C$RL45,B3,0      ; |253| 

$C$RL45:   ; CALL OCCURS {print_test_results} {0}  ; |253| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 30
           MVKL    .S2     $C$SL2+0,B4
           MVKH    .S2     $C$SL2+0,B4

           CALLP   .S2     printf,B3
||         STW     .D2T2   B4,*+SP(4)        ; |254| 

$C$RL46:   ; CALL OCCURS {printf} {0}        ; |254| 
           MVKL    .S2     $C$SL3+0,B4
           MVKH    .S2     $C$SL3+0,B4

           CALLP   .S2     printf,B3
||         STW     .D2T2   B4,*+SP(4)        ; |254| 

$C$RL47:   ; CALL OCCURS {printf} {0}        ; |254| 
           MVKL    .S1     $C$SL1+0,A10
           MVKH    .S1     $C$SL1+0,A10

           CALLP   .S2     print_profile_results,B3
||         MV      .L1     A10,A4            ; |261| 

$C$RL48:   ; CALL OCCURS {print_profile_results} {0}  ; |261| 

           CALLP   .S2     print_memory_results,B3
||         MV      .L1     A10,A4            ; |264| 

$C$RL49:   ; CALL OCCURS {print_memory_results} {0}  ; |264| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 12
           ADDK    .S2     200,SP            ; |265| 
           LDW     .D2T2   *++SP(8),B3       ; |265| 
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
$C$SL1:	.string	"log10DP",0
$C$SL2:	.string	"----------------------------------------",0
$C$SL3:	.string	"----------------------------------------",10,0
;*****************************************************************************
;* UNDEFINED EXTERNAL REFERENCES                                             *
;*****************************************************************************
	.global	printf
	.global	log10
	.global	driver_init
	.global	print_profile_results
	.global	print_memory_results
	.global	print_test_results
	.global	gimme_random
	.global	isequal
	.global	log10dp
	.global	log10dp_c
	.global	log10dp_v
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
