;******************************************************************************
;* TMS320C6x C/C++ Codegen                                          PC v7.4.2 *
;* Date/Time created: Mon May 16 23:45:11 2016                                *
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
	.word	0d404cf73h,0c02472e5h		; _a[0] @ 0
	.word	039581062h,0c04513b4h		; _a[1] @ 64
	.word	0a770f2b1h,04051c119h		; _a[2] @ 128
	.word	01c25d074h,040226b7ah		; _a[3] @ 192
	.word	0894df1fbh,0404beddah		; _a[4] @ 256
	.word	06cb1da02h,0c054c9c1h		; _a[5] @ 320
	.word	08d8c451dh,0c054282fh		; _a[6] @ 384
	.word	06cf4f5e1h,0c0289eb1h		; _a[7] @ 448
	.word	06aa9c206h,0c01d99ddh		; _a[8] @ 512
	.word	0a0acb352h,04052448eh		; _a[9] @ 576
	.word	097d1427dh,0c04de639h		; _a[10] @ 640
	.word	0d74babd0h,0c04a6f5dh		; _a[11] @ 704
	.word	053289c00h,0c04e9216h		; _a[12] @ 768
	.word	0b8c0a64eh,040538e8ah		; _a[13] @ 832
	.word	0a4fd7aebh,04046c635h		; _a[14] @ 896
	.word	033fbb00fh,040235f28h		; _a[15] @ 960
	.word	044c7b02dh,0c034ed4ah		; _a[16] @ 1024
	.word	06b6b88e5h,0c051ca7ah		; _a[17] @ 1088
	.word	0147d6586h,04056ddbfh		; _a[18] @ 1152
	.word	07016e951h,040458d85h		; _a[19] @ 1216
	.word	0e6f99ebdh,0c04c5e48h		; _a[20] @ 1280
	.word	0a38c61a3h,0c0433bcdh		; _a[21] @ 1344
	.word	0331d63beh,04053b3f5h		; _a[22] @ 1408
	.word	0f4a8b3e9h,0404d93b8h		; _a[23] @ 1472
	.word	049f1bb9ah,03fe90b82h		; _a[24] @ 1536
	.word	023663696h,0404e6f21h		; _a[25] @ 1600
	.word	018471ea3h,0c04953abh		; _a[26] @ 1664
	.word	049c39871h,04024fcf5h		; _a[27] @ 1728
	.word	091d72d79h,0405139d9h		; _a[28] @ 1792
	.word	045efce5ah,0404a25c5h		; _a[29] @ 1856
	.word	09b9d7fd8h,0c0201736h		; _a[30] @ 1920
	.word	0dd136beeh,0c008a169h		; _a[31] @ 1984
	.word	029259337h,0401a549fh		; _a[32] @ 2048
	.word	0a8e63db7h,0c0574a48h		; _a[33] @ 2112
	.word	0b1f32cb3h,040429b16h		; _a[34] @ 2176
	.word	081c7ebbch,0404ebdb2h		; _a[35] @ 2240
	.word	084fb7ce4h,04030c8fdh		; _a[36] @ 2304
	.word	00966b10fh,0c04e9cd7h		; _a[37] @ 2368
	.word	0e1cde5d2h,0404e3e5ah		; _a[38] @ 2432
	.word	0f63b5b20h,0c027cb58h		; _a[39] @ 2496
	.word	07b1620d4h,04046dc79h		; _a[40] @ 2560
	.word	00afa2f06h,0401344d2h		; _a[41] @ 2624
	.word	008553917h,0c032d4f5h		; _a[42] @ 2688
	.word	007d25c59h,0c0576c81h		; _a[43] @ 2752
	.word	08800eae2h,0c02f32bbh		; _a[44] @ 2816
	.word	09836c30bh,0c0572e3ch		; _a[45] @ 2880
	.word	06caa4d46h,0404dc50eh		; _a[46] @ 2944
	.word	05b3fc1b7h,04056cb3dh		; _a[47] @ 3008
	.word	06d2b7c86h,04050f5cch		; _a[48] @ 3072
	.word	092669f71h,0c0222ba2h		; _a[49] @ 3136
	.word	0bb34f4d4h,0c0580cc9h		; _a[50] @ 3200
	.word	0aef8a66fh,0c044a4f7h		; _a[51] @ 3264
	.word	0fad94f92h,040523033h		; _a[52] @ 3328
	.word	03c5afa22h,0c04af761h		; _a[53] @ 3392
	.word	0f6b6ab22h,0404f8799h		; _a[54] @ 3456
	.word	089613d32h,040519e87h		; _a[55] @ 3520
	.word	079321b05h,0c05373deh		; _a[56] @ 3584
	.word	015f60b8ah,040034c5ah		; _a[57] @ 3648
	.word	0f406cd7ah,0403fff1dh		; _a[58] @ 3712
	.word	0b3e5753ah,0c051603ch		; _a[59] @ 3776
	.word	06accfd74h,04054394bh		; _a[60] @ 3840
	.word	0f72b4528h,0c04e0e02h		; _a[61] @ 3904
	.word	050caf3afh,04046b370h		; _a[62] @ 3968
	.word	0926196f4h,0c028cb80h		; _a[63] @ 4032
	.word	0797968a2h,0c0446895h		; _a[64] @ 4096
	.word	0e49469afh,04053716fh		; _a[65] @ 4160
	.word	00980b242h,04055e3dch		; _a[66] @ 4224
	.word	04b78a457h,04040ed28h		; _a[67] @ 4288
	.word	041a40f3eh,0c056bcc0h		; _a[68] @ 4352
	.word	0974a3401h,04053a47eh		; _a[69] @ 4416
	.word	0a0a1cb97h,0405484efh		; _a[70] @ 4480
	.word	0156efd0eh,04015521fh		; _a[71] @ 4544
	.word	0499dd8c3h,0403c11f6h		; _a[72] @ 4608
	.word	088a2d151h,0c0480856h		; _a[73] @ 4672
	.word	0476af89ch,0405889f1h		; _a[74] @ 4736
	.word	05c00b1d7h,0c0336d7fh		; _a[75] @ 4800
	.word	0ecc30c5ah,0c046410ah		; _a[76] @ 4864
	.word	0958a4060h,04048352ch		; _a[77] @ 4928
	.word	02fdeeaddh,0c04a480bh		; _a[78] @ 4992
	.word	0351159c5h,0c0304dd1h		; _a[79] @ 5056
	.word	0120fccfdh,040536d58h		; _a[80] @ 5120
	.word	0c64ba94ch,0404fad31h		; _a[81] @ 5184
	.word	04e2f37fch,0c029b17ch		; _a[82] @ 5248
	.word	028f190d1h,0c031f095h		; _a[83] @ 5312
	.word	054287641h,0c0537f81h		; _a[84] @ 5376
	.word	069d22bb1h,04041ab82h		; _a[85] @ 5440
	.word	06c749d61h,0c054f24eh		; _a[86] @ 5504
	.word	0cdc1bf53h,04055c298h		; _a[87] @ 5568
	.word	03c2e8478h,0c044278ah		; _a[88] @ 5632
	.word	06d38e87fh,0c049bb7ch		; _a[89] @ 5696
	.word	0ddc1e796h,0c035af59h		; _a[90] @ 5760
	.word	0ae876768h,0c047c4fah		; _a[91] @ 5824
	.word	0b851eb85h,0401b751eh		; _a[92] @ 5888
	.word	0f99c38b0h,0c051cdd5h		; _a[93] @ 5952
	.word	0156acb50h,0c0430458h		; _a[94] @ 6016
	.word	0424cabaah,0c0370b33h		; _a[95] @ 6080
	.word	02ad23ba2h,040354f44h		; _a[96] @ 6144
	.word	0221bb3bbh,040469413h		; _a[97] @ 6208
	.word	09955a6fch,0c00533ceh		; _a[98] @ 6272
	.word	0d5e7fe81h,0c05898a5h		; _a[99] @ 6336
	.word	03b7d8490h,0c056d189h		; _a[100] @ 6400
	.word	0aaac1095h,0c055ba17h		; _a[101] @ 6464
	.word	0bac2084eh,0c0444796h		; _a[102] @ 6528
	.word	0ad8bbee6h,0402d5456h		; _a[103] @ 6592
	.word	0ee8d10f5h,0c0557620h		; _a[104] @ 6656
	.word	01287c201h,040569fadh		; _a[105] @ 6720
	.word	0a38d3862h,040510128h		; _a[106] @ 6784
	.word	037edad17h,0c04bc724h		; _a[107] @ 6848
	.word	07fec496ah,0403c3625h		; _a[108] @ 6912
	.word	0d1526d8bh,040533b58h		; _a[109] @ 6976
	.word	0d0bd1c56h,040552292h		; _a[110] @ 7040
	.word	05bfd56d8h,0404f4513h		; _a[111] @ 7104
	.word	01556a95ah,0c02b62d0h		; _a[112] @ 7168
	.word	05c4072b7h,0c0540703h		; _a[113] @ 7232
	.word	052c244b4h,0c054fdb8h		; _a[114] @ 7296
	.word	0ce05b1f1h,040564ee3h		; _a[115] @ 7360
	.word	0d645f253h,040509475h		; _a[116] @ 7424
	.word	0eef0e403h,0401f0f6dh		; _a[117] @ 7488
	.word	06d7a56deh,04027fe36h		; _a[118] @ 7552
	.word	05406e852h,0405508c9h		; _a[119] @ 7616
	.word	0535af0e7h,0405624eah		; _a[120] @ 7680
	.word	07fd679f5h,040523de7h		; _a[121] @ 7744
	.word	02e5d0a9dh,0c0416b87h		; _a[122] @ 7808
	.word	0eb70fcc2h,0404972c9h		; _a[123] @ 7872
	.word	00d3b51e6h,04033c362h		; _a[124] @ 7936
	.word	0fccc6ed9h,0c0202bb4h		; _a[125] @ 8000
	.word	0689ffc8ah,0c0555943h		; _a[126] @ 8064
	.word	0d25c58c6h,0c04e4007h		; _a[127] @ 8128
	.word	091489240h,0c03e2f6bh		; _a[128] @ 8192
	.word	0cdb7ae58h,0c02de454h		; _a[129] @ 8256
	.word	07234d0c2h,0c04dd727h		; _a[130] @ 8320
	.word	01303e8c3h,040446bc9h		; _a[131] @ 8384
	.word	05a964e8bh,0c02357efh		; _a[132] @ 8448
	.word	0af1a345fh,04030da2fh		; _a[133] @ 8512
	.word	048cf7caah,040512984h		; _a[134] @ 8576
	.word	00ac555e0h,0c01f476dh		; _a[135] @ 8640
	.word	076930454h,04053d17eh		; _a[136] @ 8704
	.word	07cfd81a0h,0c0171700h		; _a[137] @ 8768
	.word	0d78a95f1h,040508386h		; _a[138] @ 8832
	.word	046aa087dh,0c03c58afh		; _a[139] @ 8896
	.word	04f6dfc5dh,0c036ee90h		; _a[140] @ 8960
	.word	0c857f306h,0c03f1b5ch		; _a[141] @ 9024
	.word	05ba2be06h,0404775afh		; _a[142] @ 9088
	.word	0e02f8020h,0c0584040h		; _a[143] @ 9152
	.word	0fb69984ah,0c0405057h		; _a[144] @ 9216
	.word	019835ec5h,0c04fb4aeh		; _a[145] @ 9280
	.word	026a301f8h,04050a155h		; _a[146] @ 9344
	.word	0ec17ebafh,0404af986h		; _a[147] @ 9408
	.word	01af1f3ceh,04053db05h		; _a[148] @ 9472
	.word	0003254e7h,040422554h		; _a[149] @ 9536
	.word	0ec39799eh,0c052603eh		; _a[150] @ 9600
	.word	0a19e4ad9h,04041c06eh		; _a[151] @ 9664
	.word	0df97aaach,0405508e9h		; _a[152] @ 9728
	.word	0d5b6805ah,0c048e4ach		; _a[153] @ 9792
	.word	082385404h,0c0401754h		; _a[154] @ 9856
	.word	071575b31h,03ff17c4fh		; _a[155] @ 9920
	.word	0369d4affh,040584e99h		; _a[156] @ 9984
	.word	0cd69aabfh,0c057a8c5h		; _a[157] @ 10048
	.word	0e1bc481ah,04053d863h		; _a[158] @ 10112
	.word	08b2f738bh,0404942e4h		; _a[159] @ 10176
	.word	0a67041b1h,0c0365a53h		; _a[160] @ 10240
	.word	0002ef9e9h,04051cd68h		; _a[161] @ 10304
	.word	0156efd0eh,04057221fh		; _a[162] @ 10368
	.word	025c58c67h,04039447dh		; _a[163] @ 10432
	.word	0e305f436h,0c0518496h		; _a[164] @ 10496
	.word	0cf19ae27h,0c0423556h		; _a[165] @ 10560
	.word	09e0b1862h,0c032219dh		; _a[166] @ 10624
	.word	02e62131bh,0c0561929h		; _a[167] @ 10688
	.word	0f9774fc3h,04058adb1h		; _a[168] @ 10752
	.word	0195e75d7h,04043360ah		; _a[169] @ 10816
	.word	05153afaah,040507f61h		; _a[170] @ 10880
	.word	050331e3ah,040432319h		; _a[171] @ 10944
	.word	0717d1adeh,0c0376d4eh		; _a[172] @ 11008
	.word	012e83a11h,04058828eh		; _a[173] @ 11072
	.word	086112699h,040209da6h		; _a[174] @ 11136
	.word	0da7cb8b8h,04053e517h		; _a[175] @ 11200
	.word	081097fdch,0c0083901h		; _a[176] @ 11264
	.word	073ce2df6h,04055fe1fh		; _a[177] @ 11328
	.word	0cceaffbeh,0402bcd98h		; _a[178] @ 11392
	.word	09dfcd5a9h,0404a2592h		; _a[179] @ 11456
	.word	02e04f609h,0c04eea34h		; _a[180] @ 11520
	.word	06b4ba875h,04057dbf8h		; _a[181] @ 11584
	.word	07a02249dh,04040b786h		; _a[182] @ 11648
	.word	03548b729h,0c05516c7h		; _a[183] @ 11712
	.word	0d882e375h,0c053953eh		; _a[184] @ 11776
	.word	0ab6dd774h,0c04636b4h		; _a[185] @ 11840
	.word	0aa2ae155h,0c043fcd9h		; _a[186] @ 11904
	.word	01ef15ccfh,0c035a7b1h		; _a[187] @ 11968
	.word	02d2a04b6h,04029fa6dh		; _a[188] @ 12032
	.word	0d88567b3h,04046364fh		; _a[189] @ 12096
	.word	0461c4403h,0403ecf9ch		; _a[190] @ 12160
	.word	08ddcccf5h,04055544fh		; _a[191] @ 12224
	.word	0703e567dh,04035aa3ah		; _a[192] @ 12288
	.word	068448cf8h,040541e04h		; _a[193] @ 12352
	.word	0ef325263h,0403bbb27h		; _a[194] @ 12416
	.word	02a19aefeh,0403e2f10h		; _a[195] @ 12480
	.word	04e5fdf64h,0c058af9ah		; _a[196] @ 12544
	.word	0a08da9a1h,0c051a967h		; _a[197] @ 12608
	.word	0cee0a343h,04052fd2ah		; _a[198] @ 12672
	.word	08022d00fh,0c049e140h		; _a[199] @ 12736
	.word	0f07cd53eh,0c04a1d35h		; _a[200] @ 12800
$C$IR_1:	.set	1608

	.global	_a
_a:	.usect	".far",1608,8
;	C:\MATHLIB_Tools\CCSV5_5_0\ccsv5\tools\compiler\c6000_7.4.2\bin\opt6x.exe C:\\Users\\gtbldadm\\AppData\\Local\\Temp\\027003 C:\\Users\\gtbldadm\\AppData\\Local\\Temp\\027005 
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
;*   Local Frame Size  : 8 Args + 188 Auto + 56 Save = 252 byte               *
;******************************************************************************
_main:
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 14
           STW     .D2T1   A11,*SP--(8)      ; |112| 
           STW     .D2T1   A10,*SP--(8)      ; |112| 
           STDW    .D2T2   B13:B12,*SP--     ; |112| 
           STDW    .D2T2   B11:B10,*SP--     ; |112| 
           STDW    .D2T1   A15:A14,*SP--     ; |112| 
           STDW    .D2T1   A13:A12,*SP--     ; |112| 
           STW     .D2T2   B3,*SP--(8)       ; |112| 

           MVKL    .S1     $C$SL1+0,A4
||         ADDK    .S2     -200,SP           ; |112| 

           CALLP   .S2     _driver_init,B3
||         MVKH    .S1     $C$SL1+0,A4

$C$RL0:    ; CALL OCCURS {_driver_init} {0}  ; |120| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 3

           MVK     .S2     0xc9,B4
||         MVKL    .S1     _a,A14

           MVKH    .S1     _a,A14

           CALL    .S1     _exp2             ; |129| 
||         MV      .L1     A14,A10
||         MV      .D1X    B4,A11
||         ZERO    .L2     B10

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L1:    
;          EXCLUSIVE CPU CYCLES: 5
           LDDW    .D1T1   *A10++,A5:A4      ; |129| 
           ADDKPC  .S2     $C$RL1,B3,3       ; |129| 
$C$RL1:    ; CALL OCCURS {_exp2} {0}         ; |129| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 9

           MVKL    .S2     _output,B4
||         SUB     .L1     A11,1,A0          ; |128| 
||         SUB     .S1     A11,1,A11         ; |128| 

           MVKH    .S2     _output,B4
           LDW     .D2T2   *B4,B4            ; |129| 
   [ A0]   BNOP    .S1     $C$L1,3           ; |128| 

           ADD     .L2     B10,B4,B4         ; |129| 
||         ADD     .S2     8,B10,B10         ; |128| 

   [ A0]   CALL    .S1     _exp2             ; |129| 
||         STDW    .D2T1   A5:A4,*B4         ; |129| 
|| [!A0]   MVKL    .S2     _output,B4

           ; BRANCHCC OCCURS {$C$L1}         ; |128| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 4

           MVKH    .S2     _output,B4
||         ZERO    .L2     B10
||         MV      .L1     A14,A11

           ADD     .L2     4,B4,B5
||         MVK     .S2     0xc9,B4

           STW     .D2T2   B5,*+SP(20)

           MV      .L1X    B4,A10
||         CALL    .S1     _exp2dp           ; |132| 

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L2:    
;          EXCLUSIVE CPU CYCLES: 5
           LDDW    .D1T1   *A11++,A5:A4      ; |132| 
           ADDKPC  .S2     $C$RL2,B3,3       ; |132| 
$C$RL2:    ; CALL OCCURS {_exp2dp} {0}       ; |132| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 12
           LDW     .D2T2   *+SP(20),B4       ; |132| 
           SUB     .L1     A10,1,A0          ; |131| 
           SUB     .L1     A10,1,A10         ; |131| 
           NOP             2
           LDW     .D2T2   *B4,B4            ; |132| 
   [ A0]   BNOP    .S1     $C$L2,3           ; |131| 

           ADD     .L2     B10,B4,B4         ; |132| 
||         ADD     .S2     8,B10,B10         ; |131| 

   [ A0]   CALL    .S1     _exp2dp           ; |132| 
||         STDW    .D2T1   A5:A4,*B4         ; |132| 

           ; BRANCHCC OCCURS {$C$L2}         ; |131| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 8
           LDW     .D2T2   *+SP(20),B4
           ZERO    .L2     B10
           MV      .L1     A14,A10
           NOP             2

           ADD     .L2     4,B4,B5
||         MVK     .S2     0xc9,B4

           STW     .D2T2   B5,*+SP(24)

           MV      .L1X    B4,A11
||         CALL    .S1     _exp2dp_c         ; |135| 

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L3:    
;          EXCLUSIVE CPU CYCLES: 5
           LDDW    .D1T1   *A10++,A5:A4      ; |135| 
           ADDKPC  .S2     $C$RL3,B3,3       ; |135| 
$C$RL3:    ; CALL OCCURS {_exp2dp_c} {0}     ; |135| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 12
           LDW     .D2T2   *+SP(24),B4       ; |135| 
           SUB     .L1     A11,1,A0          ; |134| 
           SUB     .L1     A11,1,A11         ; |134| 
           NOP             2
           LDW     .D2T2   *B4,B4            ; |135| 
   [ A0]   BNOP    .S1     $C$L3,3           ; |134| 

           ADD     .L2     B10,B4,B4         ; |135| 
||         ADD     .S2     8,B10,B10         ; |134| 

   [ A0]   CALL    .S1     _exp2dp_c         ; |135| 
||         STDW    .D2T1   A5:A4,*B4         ; |135| 

           ; BRANCHCC OCCURS {$C$L3}         ; |134| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 21

           LDW     .D2T2   *+SP(24),B26      ; |53| 
||         ZERO    .L2     B4
||         MVKL    .S1     0xc08ff000,A3
||         MVKL    .S2     0x3f7c70e4,B30
||         ZERO    .L1     A31
||         ZERO    .D1     A24               ; |53| 

           MVKH    .S2     0x40900000,B4
||         MVKH    .S1     0xc08ff000,A3
||         ZERO    .L2     B31
||         ZERO    .D2     B13
||         ZERO    .L1     A26               ; |53| 
||         ZERO    .D1     A10               ; |53| 

           MVKL    .S1     0x3fac718e,A30
||         MVKL    .S2     0x6fb3f6e0,B29
||         STW     .D2T2   B4,*+SP(84)       ; |53| 
||         ZERO    .L2     B20               ; |53| 
||         ZERO    .L1     A20               ; |53| 
||         ZERO    .D1     A17               ; |53| 

           MVKL    .S1     0x714251b3,A29
||         MVKL    .S2     0xbf2bd010,B28
||         STW     .D2T1   A3,*+SP(88)       ; |53| 
||         ZERO    .L2     B12               ; |53| 
||         MV      .L1     A14,A6
||         ZERO    .D1     A7                ; |53| 

           MVKL    .S1     0x3ff71547,A28
||         MVKL    .S2     0x5c610ca8,B27

           MVKL    .S1     0x652b82fe,A27
||         MVKH    .S2     0x3f7c70e4,B30
||         ADD     .L2     4,B26,B5
||         ADD     .D2     4,B26,B4

           MVKL    .S1     0x3fe62e42,A25
||         MVKH    .S2     0x6fb3f6e0,B29
||         STW     .D2T2   B5,*+SP(28)

           MVKL    .S1     0xfefa39ef,A23
||         MVKH    .S2     0xbf2bd010,B28
||         STW     .D2T2   B30,*+SP(64)      ; |53| 

           SET     .S1     A31,0x15,0x1d,A3
||         MVKH    .S2     0x3fd00000,B31
||         STW     .D2T2   B29,*+SP(60)      ; |53| 

           MVKH    .S1     0x3fac718e,A30
||         SET     .S2     B13,0x1e,0x1e,B13
||         STW     .D2T1   A3,*+SP(68)       ; |53| 

           MVKH    .S1     0x714251b3,A29
||         MVKH    .S2     0x5c610ca8,B27
||         LDW     .D2T1   *B4,A3
||         ZERO    .L2     B4                ; |53| 

           MVKH    .S1     0x3ff71547,A28
||         MVKL    .S2     0x3ef152a4,B11
||         STW     .D2T1   A30,*+SP(76)      ; |53| 

           MVKH    .S1     0x652b82fe,A27
||         MVKL    .S2     0x6f58dc1c,B10
||         STW     .D2T1   A29,*+SP(72)      ; |53| 

           MVKH    .S1     0x3fe62e42,A25
||         STW     .D2T1   A28,*+SP(44)      ; |53| 
||         MVKH    .S2     0x3ef152a4,B11

           MVKH    .S1     0xfefa39ef,A23
||         STW     .D2T1   A27,*+SP(40)      ; |53| 
||         MVKH    .S2     0x6f58dc1c,B10

           MVKL    .S1     0x3f403f99,A13
||         STW     .D2T1   A25,*+SP(36)      ; |53| 
||         ZERO    .L1     A25               ; |53| 
||         MVK     .S2     0xc9,B1

           MVKL    .S1     0x6fde3809,A12
||         STW     .D2T2   B28,*+SP(52)      ; |53| 

           MVKL    .S1     0x3fe63000,A11
||         STW     .D2T1   A23,*+SP(32)      ; |53| 

           STW     .D2T2   B31,*+SP(56)      ; |53| 
||         MVKH    .S1     0x3f403f99,A13

           STW     .D2T2   B13,*+SP(80)      ; |53| 
||         MVKH    .S1     0x6fde3809,A12

           STW     .D2T2   B27,*+SP(48)      ; |53| 
||         MVKH    .S1     0x3fe63000,A11

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*
;*      Disqualified loop: Did not find partition
;*----------------------------------------------------------------------------*
$C$L4:    
;          EXCLUSIVE CPU CYCLES: 7
           LDDW    .D1T1   *A6++,A5:A4       ; |53| 
           LDW     .D2T1   *+SP(32),A8
           LDW     .D2T1   *+SP(36),A9
           NOP             4
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 228
           MPYDP   .M1     A9:A8,A5:A4,A19:A18 ; |53| 
           LDW     .D2T1   *+SP(44),A9
           LDW     .D2T1   *+SP(40),A8
           LDW     .D2T2   *+SP(48),B6
           LDW     .D2T2   *+SP(52),B7
           LDW     .D2T2   *+SP(84),B5
           MV      .L2     B13,B21           ; |53| 
           SUB     .L2     B1,1,B1           ; |137| 
           NOP             2
           MPYDP   .M1     A9:A8,A19:A18,A9:A8 ; |53| 
           CMPGTDP .S2X    A5:A4,B5:B4,B0    ; |53| 
           NOP             8
           DPINT   .L1     A9:A8,A16         ; |53| 
           NOP             3
           INTDP   .L1     A16,A9:A8         ; |53| 
           NOP             4
           MPYDP   .M1     A11:A10,A9:A8,A23:A22 ; |53| 
           MPYDP   .M2X    B7:B6,A9:A8,B7:B6 ; |53| 
           NOP             8
           SUBDP   .L1     A19:A18,A23:A22,A9:A8 ; |53| 
           LDW     .D2T1   *+SP(76),A19
           LDW     .D2T1   *+SP(72),A18
           NOP             5
           SUBDP   .L2X    A9:A8,B7:B6,B17:B16 ; |53| 
           LDW     .D2T2   *+SP(64),B7       ; |53| 
           LDW     .D2T2   *+SP(60),B6       ; |53| 
           NOP             4
           MPYDP   .M2     B17:B16,B17:B16,B9:B8 ; |53| 
           NOP             9
           MPYDP   .M2     B11:B10,B9:B8,B19:B18 ; |53| 
           MPYDP   .M1X    A13:A12,B9:B8,A9:A8 ; |53| 
           NOP             8
           ADDDP   .L2     B7:B6,B19:B18,B7:B6 ; |53| 
           ADDDP   .L1     A19:A18,A9:A8,A9:A8 ; |53| 
           LDW     .D2T1   *+SP(68),A19
           MV      .L1     A25,A18
           NOP             3
           MPYDP   .M2     B9:B8,B7:B6,B7:B6 ; |53| 
           MPYDP   .M1X    B9:B8,A9:A8,A9:A8 ; |53| 
           LDW     .D2T2   *+SP(56),B9       ; |53| 
   [!B0]   MV      .L1     A19,A21           ; |53| 
           MV      .L2X    A26,B8            ; |53| 
           NOP             5
           ADDDP   .L2     B9:B8,B7:B6,B7:B6 ; |53| 
           ADDDP   .L1     A19:A18,A9:A8,A9:A8 ; |53| 
           NOP             5
           MPYDP   .M2     B17:B16,B7:B6,B17:B16 ; |53| 
           NOP             9
           SUBDP   .L2X    A9:A8,B17:B16,B7:B6 ; |53| 
           MV      .L1     A7,A8             ; |53| 
           MVK     .S1     0x400,A9
   [ B0]   MVK     .L1     0xffffffff,A8     ; |53| 
   [ B0]   MVKL    .S1     0x7fefffff,A9
   [!B0]   ADD     .L1     A9,A16,A9         ; |53| 
   [!B0]   SHL     .S1     A9,20,A9          ; |53| 
           RCPDP   .S2     B7:B6,B9:B8       ; |53| 
   [ B0]   MVKH    .S1     0x7fefffff,A9
           MPYDP   .M2     B9:B8,B7:B6,B19:B18 ; |53| 
           NOP             9
           SUBDP   .L2     B13:B12,B19:B18,B19:B18 ; |53| 
   [!B1]   MVKL    .S2     _output,B12
   [!B1]   MVKH    .S2     _output,B12
           NOP             4
           MPYDP   .M2     B9:B8,B19:B18,B9:B8 ; |53| 
           NOP             9
           MPYDP   .M2     B9:B8,B7:B6,B23:B22 ; |53| 
           MV      .L2X    A24,B18
           MV      .L2     B13,B19
           NOP             7
           SUBDP   .L2     B19:B18,B23:B22,B19:B18 ; |53| 
           NOP             6
           MPYDP   .M2     B9:B8,B19:B18,B9:B8 ; |53| 
           NOP             9
   [!B0]   MPYDP   .M2     B9:B8,B7:B6,B7:B6 ; |53| 
           NOP             9
   [!B0]   SUBDP   .L2     B21:B20,B7:B6,B7:B6 ; |53| 
           NOP             6
   [!B0]   MPYDP   .M2     B9:B8,B7:B6,B7:B6 ; |53| 
           NOP             9
   [!B0]   MPYDP   .M2     B17:B16,B7:B6,B7:B6 ; |53| 
           NOP             9
           NOP             1
   [!B0]   ADDDP   .L1X    A21:A20,B7:B6,A19:A18 ; |53| 
           NOP             6

   [!B0]   MPYDP   .M1     A9:A8,A19:A18,A9:A8 ; |53| 
||         LDW     .D2T1   *+SP(88),A19

           NOP             3
           MV      .L1     A17,A18
           CMPLTDP .S1     A5:A4,A19:A18,A0  ; |53| 
   [ B1]   BNOP    .S2     $C$L4,2           ; |137| 
   [ A0]   ZERO    .L1     A5:A4             ; |53| 

   [!A0]   MV      .L1     A9,A5             ; |53| 
|| [!A0]   MV      .S1     A8,A4             ; |53| 

   [!B1]   CALL    .S1     _exp2dp_v         ; |140| 
||         STDW    .D1T1   A5:A4,*A3++       ; |53| 

           ; BRANCHCC OCCURS {$C$L4}         ; |137| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           LDW     .D2T2   *+B12(16),B4      ; |140| 
           MV      .L1     A14,A4            ; |140| 
           MVK     .S1     0xc9,A6           ; |140| 
           ADDKPC  .S2     $C$RL4,B3,1       ; |140| 
$C$RL4:    ; CALL OCCURS {_exp2dp_v} {0}     ; |140| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 47
           MVKL    .S2     0x3ddb7cdf,B7
           MVKL    .S2     0xd9d7bdbb,B6
           MVKH    .S2     0x3ddb7cdf,B7

           LDW     .D2T1   *B12,A4           ; |66| 
||         MVKH    .S2     0xd9d7bdbb,B6

           CALLP   .S2     _isequal,B3
||         LDW     .D2T2   *+B12(4),B4       ; |66| 
||         MVK     .S1     0xc9,A6           ; |66| 
||         MVK     .L1     0x1,A8            ; |66| 

$C$RL5:    ; CALL OCCURS {_isequal} {0}      ; |66| 
           MVKL    .S2     _fcn_pass,B6
           MVKL    .S2     0x3ddb7cdf,B7
           MVKH    .S2     _fcn_pass,B6
           MVKH    .S2     0x3ddb7cdf,B7

           STW     .D2T1   A4,*+B6(4)        ; |66| 
||         MVKL    .S2     0xd9d7bdbb,B6

           LDW     .D2T2   *+B12(8),B4       ; |67| 
||         MVKH    .S2     0xd9d7bdbb,B6

           CALLP   .S2     _isequal,B3
||         LDW     .D2T1   *B12,A4           ; |67| 
||         MVK     .S1     0xc9,A6           ; |67| 
||         MVK     .L1     0x1,A8            ; |67| 

$C$RL6:    ; CALL OCCURS {_isequal} {0}      ; |67| 
           MVKL    .S2     _fcn_pass,B6
           MVKL    .S2     0x3ddb7cdf,B7
           MVKH    .S2     _fcn_pass,B6
           MVKH    .S2     0x3ddb7cdf,B7

           STW     .D2T1   A4,*+B6(8)        ; |67| 
||         MVKL    .S2     0xd9d7bdbb,B6

           MV      .L2     B12,B5            ; |67| 
||         LDW     .D2T2   *+B12(12),B4      ; |68| 
||         MVKH    .S2     0xd9d7bdbb,B6

           CALLP   .S2     _isequal,B3
||         LDW     .D2T1   *B5,A4            ; |68| 
||         MVK     .S1     0xc9,A6           ; |68| 
||         MVK     .L1     0x1,A8            ; |68| 

$C$RL7:    ; CALL OCCURS {_isequal} {0}      ; |68| 
           LDW     .D2T1   *+SP(28),A3       ; |68| 
           MVKL    .S2     _fcn_pass,B4
           MVKL    .S2     0xd9d7bdbb,B6
           MVKL    .S2     0x3ddb7cdf,B7
           MVKH    .S2     _fcn_pass,B4

           ADD     .L1     4,A3,A3
||         STW     .D2T1   A4,*+B4(12)       ; |68| 
||         MVKH    .S2     0xd9d7bdbb,B6

           MV      .L2     B12,B31           ; |69| 
||         STW     .D2T1   A3,*+SP(92)
||         MVKH    .S2     0x3ddb7cdf,B7

           CALLP   .S2     _isequal,B3
||         LDW     .D1T2   *A3,B4            ; |69| 
||         LDW     .D2T1   *B31,A4           ; |69| 
||         MVK     .S1     0xc9,A6           ; |69| 
||         MVK     .L1     0x1,A8            ; |69| 

$C$RL8:    ; CALL OCCURS {_isequal} {0}      ; |69| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 14
           MVKL    .S1     _fcn_pass,A3
           MVKH    .S1     _fcn_pass,A3
           ADD     .L1     4,A3,A15
           LDW     .D1T1   *A15,A0           ; |72| 
           MV      .L2X    A3,B5             ; |72| 
           STW     .D2T1   A4,*+B5(16)       ; |69| 
           ADD     .L2X    8,A3,B4
           STW     .D2T2   B4,*+SP(96)       ; |69| 

   [!A0]   B       .S1     $C$L5             ; |72| 
|| [ A0]   LDW     .D2T2   *B4,B0            ; |72| 

   [!A0]   CALL    .S1     _print_test_results ; |144| 
   [ A0]   ADD     .L2     4,B4,B4
   [!A0]   MVKL    .S1     _all_pass,A3
   [!A0]   MV      .L2X    A10,B4
   [!A0]   MVKH    .S1     _all_pass,A3
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
           CALL    .S1     _print_test_results ; |144| 
           MVKL    .S1     _all_pass,A3
           MVKH    .S1     _all_pass,A3
           NOP             2
;** --------------------------------------------------------------------------*
$C$L5:    
;          EXCLUSIVE CPU CYCLES: 1

           MVK     .L1     0x1,A4            ; |144| 
||         STW     .D1T2   B4,*A3            ; |72| 
||         ADDKPC  .S2     $C$RL9,B3,0       ; |144| 

$C$RL9:    ; CALL OCCURS {_print_test_results} {0}  ; |144| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 53
           ZERO    .L1     A20               ; |53| 
           STW     .D2T1   A20,*+SP(132)     ; |152| 
           LDW     .D2T1   *+SP(36),A21
           LDW     .D2T1   *+SP(40),A22
           LDW     .D2T1   *+SP(44),A23
           LDW     .D2T1   *+SP(60),A24      ; |53| 
           LDW     .D2T1   *+SP(64),A25      ; |53| 
           LDW     .D2T1   *+SP(56),A26      ; |53| 
           LDW     .D2T1   *+SP(72),A27      ; |53| 
           LDW     .D2T1   *+SP(76),A28      ; |53| 
           LDW     .D2T1   *+SP(68),A29      ; |53| 
           LDW     .D2T1   *+SP(84),A30      ; |100| 
           LDW     .D2T1   *+SP(88),A31      ; |100| 

           LDW     .D2T1   *+SP(28),A3       ; |152| 
||         ZERO    .L2     B26               ; |92| 

           ZERO    .L2     B28               ; |53| 
||         STW     .D2T2   B26,*+SP(172)     ; |152| 

           ZERO    .L2     B30               ; |53| 
||         STW     .D2T2   B28,*+SP(156)     ; |153| 

           MVK     .L2     0x7,B31
||         STW     .D2T2   B30,*+SP(116)     ; |154| 

           STW     .D2T2   B31,*+SP(12)      ; |155| 
           LDW     .D2T1   *+SP(32),A20
           STW     .D2T2   B13,*+SP(168)     ; |53| 
           STW     .D2T2   B13,*+SP(160)     ; |53| 

           MVKL    .S2     _a_sc,B4
||         MVK     .L2     0xffffffff,B7     ; |157| 
||         ZERO    .L1     A19               ; |100| 
||         STW     .D2T2   B13,*+SP(152)     ; |53| 

           MVKH    .S2     _a_sc,B4
||         MV      .L2     B7,B6             ; |157| 
||         STW     .D2T1   A19,*+SP(188)     ; |152| 

           STDW    .D2T2   B7:B6,*+B4(48)    ; |157| 

           ZERO    .S1     A9
||         ZERO    .L1     A17:A16           ; |151| 
||         LDW     .D2T2   *+SP(48),B12

           MVKH    .S1     0xbff00000,A9
||         ZERO    .L1     A8                ; |156| 
||         STDW    .D2T1   A17:A16,*B4       ; |151| 

           STDW    .D2T1   A9:A8,*+B4(40)    ; |156| 
           STW     .D2T1   A21,*+SP(104)
           STW     .D2T1   A22,*+SP(108)
           STW     .D2T1   A23,*+SP(112)
           STW     .D2T1   A24,*+SP(124)     ; |53| 
           STW     .D2T1   A25,*+SP(128)     ; |53| 
           STW     .D2T1   A26,*+SP(120)     ; |53| 
           STW     .D2T1   A27,*+SP(140)     ; |53| 
           STW     .D2T1   A28,*+SP(144)     ; |53| 
           STW     .D2T1   A29,*+SP(136)     ; |53| 
           STW     .D2T1   A29,*+SP(176)     ; |53| 
           STW     .D2T1   A30,*+SP(184)     ; |95| 
           STW     .D2T1   A31,*+SP(192)     ; |100| 

           ZERO    .L2     B26               ; |95| 
||         STW     .D2T1   A3,*+SP(196)      ; |100| 

           ZERO    .L2     B28               ; |53| 
||         STW     .D2T2   B26,*+SP(180)     ; |152| 

           MV      .L1X    B4,A14            ; |151| 
||         ZERO    .L2     B30               ; |53| 
||         STW     .D2T2   B28,*+SP(164)     ; |153| 

           ZERO    .L2     B9
||         ZERO    .S2     B31
||         STW     .D2T2   B30,*+SP(148)     ; |154| 

           MV      .L2X    A14,B29           ; |154| 
||         ZERO    .L1     A7
||         ZERO    .S2     B8                ; |155| 
||         STW     .D2T2   B31,*+SP(16)      ; |155| 

           ZERO    .L2     B5
||         MV      .S2     B29,B27           ; |153| 
||         MVKH    .S1     0x80000000,A7
||         ZERO    .L1     A6                ; |152| 
||         STW     .D2T1   A20,*+SP(100)

           MV      .L2     B4,B6             ; |151| 
||         SET     .S2     B9,0x14,0x1d,B9
||         STDW    .D2T1   A7:A6,*+B27(8)    ; |152| 

           ZERO    .L1     A5
||         STDW    .D2T2   B9:B8,*+B6(32)    ; |155| 
||         ZERO    .L2     B4                ; |153| 
||         SET     .S2     B5,0x14,0x1e,B5

           MV      .L2X    A14,B6            ; |155| 
||         MVKH    .S1     0xfff00000,A5
||         ZERO    .L1     A4                ; |154| 
||         STDW    .D2T2   B5:B4,*+B29(16)   ; |153| 

           STDW    .D2T1   A5:A4,*+B6(24)    ; |154| 
||         CALL    .S1     _exp2             ; |159| 

           LDDW    .D1T1   *A14,A5:A4        ; |159| 
||         LDW     .D2T2   *+SP(52),B13      ; |53| 

           ZERO    .L1     A10               ; |53| 
           NOP             2
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L6:    
;          EXCLUSIVE CPU CYCLES: 1
           ADDKPC  .S2     $C$RL10,B3,0      ; |159| 
$C$RL10:   ; CALL OCCURS {_exp2} {0}         ; |159| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 30
           MVKL    .S2     _output,B4

           MVKH    .S2     _output,B4
||         LDW     .D2T2   *+SP(16),B5

           LDW     .D2T2   *B4,B4            ; |159| 
           NOP             4
           ADD     .L2     B5,B4,B4          ; |159| 
           STDW    .D2T1   A5:A4,*B4         ; |159| 

           CALLP   .S2     _exp2dp,B3
||         LDDW    .D1T1   *A14,A5:A4        ; |160| 

$C$RL11:   ; CALL OCCURS {_exp2dp} {0}       ; |160| 
           MVKL    .S2     _output,B4

           MVKH    .S2     _output,B4
||         LDW     .D2T2   *+SP(16),B5

           LDW     .D2T2   *+B4(4),B4        ; |160| 
           NOP             4
           ADD     .L2     B5,B4,B4          ; |160| 
           STDW    .D2T1   A5:A4,*B4         ; |160| 

           CALLP   .S2     _exp2dp_c,B3
||         LDDW    .D1T1   *A14,A5:A4        ; |161| 

$C$RL12:   ; CALL OCCURS {_exp2dp_c} {0}     ; |161| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 251

           MVKL    .S2     _output,B4
||         LDW     .D2T2   *+SP(16),B5

           MVKH    .S2     _output,B4
           LDW     .D2T2   *+B4(8),B4        ; |161| 
           LDW     .D2T2   *+SP(128),B9      ; |53| 
           LDW     .D2T2   *+SP(124),B8      ; |53| 
           MVK     .S1     0x400,A31
           LDW     .D2T2   *+SP(196),B31
           ADD     .L2     B5,B4,B4          ; |161| 
           STDW    .D2T1   A5:A4,*B4         ; |161| 
           LDDW    .D1T1   *A14++,A7:A6      ; |162| 
           LDW     .D2T1   *+SP(104),A5
           LDW     .D2T1   *+SP(100),A4
           LDW     .D2T2   *+SP(16),B30      ; |96| 
           LDW     .D2T2   *+SP(16),B29      ; |101| 
           NOP             2
           MPYDP   .M1     A5:A4,A7:A6,A9:A8 ; |53| 
           LDW     .D2T1   *+SP(112),A5
           LDW     .D2T1   *+SP(108),A4
           ADD     .L2     8,B29,B28         ; |158| 
           STW     .D2T2   B28,*+SP(16)      ; |162| 
           NOP             5
           MPYDP   .M1     A5:A4,A9:A8,A5:A4 ; |53| 
           NOP             9
           DPINT   .L1     A5:A4,A3          ; |53| 
           NOP             3
           INTDP   .L1     A3,A5:A4          ; |53| 
           ADD     .L1     A31,A3,A3         ; |92| 
           NOP             3
           MPYDP   .M1     A11:A10,A5:A4,A17:A16 ; |53| 
           MPYDP   .M2X    B13:B12,A5:A4,B5:B4 ; |53| 
           NOP             8
           SUBDP   .L1     A9:A8,A17:A16,A5:A4 ; |53| 
           NOP             7
           SUBDP   .L2X    A5:A4,B5:B4,B7:B6 ; |53| 
           LDW     .D2T1   *+SP(144),A5
           LDW     .D2T1   *+SP(140),A4
           NOP             4
           MPYDP   .M2     B7:B6,B7:B6,B5:B4 ; |53| 
           NOP             9
           MPYDP   .M2     B11:B10,B5:B4,B17:B16 ; |53| 
           MPYDP   .M1X    A13:A12,B5:B4,A9:A8 ; |53| 
           NOP             8
           ADDDP   .L2     B9:B8,B17:B16,B9:B8 ; |53| 
           ADDDP   .L1     A5:A4,A9:A8,A5:A4 ; |53| 
           LDW     .D2T1   *+SP(136),A9
           MV      .L1     A10,A8            ; |53| 
           NOP             3
           MPYDP   .M2     B5:B4,B9:B8,B9:B8 ; |53| 
           MPYDP   .M1X    B5:B4,A5:A4,A5:A4 ; |53| 
           LDW     .D2T2   *+SP(120),B5      ; |53| 
           NOP             6
           MV      .L2X    A10,B4            ; |53| 
           ADDDP   .L2     B5:B4,B9:B8,B5:B4 ; |53| 
           ADDDP   .L1     A9:A8,A5:A4,A5:A4 ; |53| 
           NOP             5
           MPYDP   .M2     B7:B6,B5:B4,B9:B8 ; |53| 
           LDW     .D2T2   *+SP(152),B5
           NOP             8
           SUBDP   .L2X    A5:A4,B9:B8,B7:B6 ; |53| 
           SHL     .S1     A3,20,A5          ; |92| 
           MV      .L2X    A10,B4            ; |53| 
           MV      .L1     A8,A4             ; |92| 
           NOP             3
           RCPDP   .S2     B7:B6,B17:B16     ; |53| 
           NOP             1
           MPYDP   .M2     B17:B16,B7:B6,B19:B18 ; |53| 
           NOP             9
           SUBDP   .L2     B5:B4,B19:B18,B5:B4 ; |53| 
           NOP             6
           MPYDP   .M2     B17:B16,B5:B4,B17:B16 ; |53| 
           LDW     .D2T2   *+SP(160),B5
           NOP             8
           MPYDP   .M2     B17:B16,B7:B6,B19:B18 ; |53| 
           MV      .L2X    A10,B4            ; |53| 
           NOP             8
           SUBDP   .L2     B5:B4,B19:B18,B5:B4 ; |53| 
           NOP             6
           MPYDP   .M2     B5:B4,B17:B16,B17:B16 ; |53| 
           LDW     .D2T2   *+SP(168),B5
           NOP             8
           MPYDP   .M2     B17:B16,B7:B6,B7:B6 ; |53| 
           MV      .L2X    A10,B4            ; |53| 
           NOP             8
           SUBDP   .L2     B5:B4,B7:B6,B5:B4 ; |53| 
           NOP             6
           MPYDP   .M2     B17:B16,B5:B4,B5:B4 ; |53| 
           NOP             9
           MPYDP   .M2     B9:B8,B5:B4,B7:B6 ; |53| 
           NOP             7
           MV      .L2X    A9,B5             ; |53| 
           MV      .L2X    A10,B4            ; |53| 
           ADDDP   .L2     B5:B4,B7:B6,B5:B4 ; |92| 
           LDW     .D2T2   *B31,B6           ; |162| 
           LDW     .D2T1   *+SP(192),A9      ; |162| 
           NOP             5

           MPYDP   .M1X    A5:A4,B5:B4,A5:A4 ; |92| 
||         LDW     .D2T2   *+SP(184),B5      ; |162| 

           CMPLTDP .S1     A7:A6,A9:A8,A0    ; |100| 
           NOP             2
           MV      .L2X    A10,B4            ; |162| 
           CMPGTDP .S2X    A7:A6,B5:B4,B0    ; |95| 

           ADD     .L2     B30,B6,B4         ; |162| 
||         LDW     .D2T2   *+SP(12),B6       ; |101| 

           NOP             3

   [ B0]   MVKL    .S1     0x7fefffff,A5
|| [ B0]   MVK     .L1     0xffffffff,A4     ; |96| 

   [ B0]   MVKH    .S1     0x7fefffff,A5
||         SUB     .L2     B6,1,B5           ; |158| 

   [ A0]   ZERO    .L1     A5:A4             ; |101| 
||         SUB     .S1X    B6,1,A0           ; |158| 
||         STW     .D2T2   B5,*+SP(12)       ; |162| 

   [ A0]   B       .S1     $C$L6             ; |158| 
|| [!A0]   MVKL    .S2     _output,B12
||         STDW    .D2T1   A5:A4,*B4         ; |162| 

   [ A0]   CALL    .S1     _exp2             ; |159| 
|| [!A0]   MVKH    .S2     _output,B12
|| [ A0]   LDDW    .D1T1   *A14,A5:A4        ; |159| 

   [!A0]   CALL    .S1     _exp2dp_v         ; |164| 
   [!A0]   LDW     .D2T2   *+B12(16),B4      ; |164| 
   [!A0]   MVKL    .S1     _a_sc,A4
           NOP             1
           ; BRANCHCC OCCURS {$C$L6}         ; |158| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 2
           MVKH    .S1     _a_sc,A4

           MVK     .L1     0x7,A6            ; |164| 
||         ADDKPC  .S2     $C$RL13,B3,0      ; |164| 

$C$RL13:   ; CALL OCCURS {_exp2dp_v} {0}     ; |164| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 46
           MVKL    .S2     0x3ddb7cdf,B7
           MVKL    .S2     0xd9d7bdbb,B6
           MVKH    .S2     0x3ddb7cdf,B7

           LDW     .D2T1   *B12,A4           ; |66| 
||         MVKH    .S2     0xd9d7bdbb,B6

           CALLP   .S2     _isequal,B3
||         LDW     .D2T2   *+B12(4),B4       ; |66| 
||         MVK     .L1     0x7,A6            ; |66| 
||         MVK     .S1     0x1,A8            ; |66| 

$C$RL14:   ; CALL OCCURS {_isequal} {0}      ; |66| 
           MVKL    .S2     _fcn_pass,B6
           MVKL    .S2     0x3ddb7cdf,B7
           MVKH    .S2     _fcn_pass,B6
           MVKH    .S2     0x3ddb7cdf,B7

           STW     .D2T1   A4,*+B6(4)        ; |66| 
||         MVKL    .S2     0xd9d7bdbb,B6

           LDW     .D2T2   *+B12(8),B4       ; |67| 
||         MVKH    .S2     0xd9d7bdbb,B6

           CALLP   .S2     _isequal,B3
||         LDW     .D2T1   *B12,A4           ; |67| 
||         MVK     .L1     0x7,A6            ; |67| 
||         MVK     .S1     0x1,A8            ; |67| 

$C$RL15:   ; CALL OCCURS {_isequal} {0}      ; |67| 
           MVKL    .S2     _fcn_pass,B5
           MVKL    .S2     0x3ddb7cdf,B7
           MVKL    .S2     0xd9d7bdbb,B6
           MVKH    .S2     _fcn_pass,B5
           MVKH    .S2     0x3ddb7cdf,B7

           MV      .L1X    B12,A3            ; |67| 
||         STW     .D2T1   A4,*+B5(8)        ; |67| 
||         MVKH    .S2     0xd9d7bdbb,B6

           CALLP   .S2     _isequal,B3
||         LDW     .D1T1   *A3,A4            ; |68| 
||         LDW     .D2T2   *+B12(12),B4      ; |68| 
||         MVK     .L1     0x7,A6            ; |68| 
||         MVK     .S1     0x1,A8            ; |68| 

$C$RL16:   ; CALL OCCURS {_isequal} {0}      ; |68| 

           LDW     .D2T1   *+SP(92),A3       ; |68| 
||         MVKL    .S2     _fcn_pass,B4

           MVKL    .S2     0xd9d7bdbb,B6
           MVKL    .S2     0x3ddb7cdf,B7
           MVKH    .S2     _fcn_pass,B4

           STW     .D2T1   A4,*+B4(12)       ; |68| 
||         MVKH    .S2     0xd9d7bdbb,B6

           MV      .L2     B12,B31           ; |69| 
||         STW     .D2T1   A3,*+SP(100)      ; |68| 
||         MVKH    .S2     0x3ddb7cdf,B7

           CALLP   .S2     _isequal,B3
||         LDW     .D1T2   *A3,B4            ; |69| 
||         LDW     .D2T1   *B31,A4           ; |69| 
||         MVK     .L1     0x7,A6            ; |69| 
||         MVK     .S1     0x1,A8            ; |69| 

$C$RL17:   ; CALL OCCURS {_isequal} {0}      ; |69| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 12

           MV      .L2X    A15,B4            ; |69| 
||         LDW     .D2T1   *+SP(96),A3

           LDW     .D2T2   *B4,B0            ; |72| 
           MVKL    .S2     _fcn_pass,B31
           MVKH    .S2     _fcn_pass,B31
           STW     .D2T1   A4,*+B31(16)      ; |69| 
           STW     .D2T1   A3,*+SP(108)      ; |72| 

   [!B0]   B       .S2     $C$L7             ; |72| 
|| [ B0]   MV      .L2X    A3,B4
|| [!B0]   MVKL    .S1     _all_pass,A3
|| [!B0]   MV      .L1     A10,A4
||         MV      .D2     B0,B1             ; guard predicate rewrite

   [!B0]   CALL    .S2     _print_test_results ; |168| 
|| [!B0]   MVKH    .S1     _all_pass,A3
|| [ B0]   LDW     .D2T2   *B4,B0            ; |72| 

           STW     .D2T1   A15,*+SP(104)     ; |69| 
   [ B1]   ADD     .L2     4,B4,B4
           NOP             2
           ; BRANCHCC OCCURS {$C$L7}         ; |72| 
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
           CALL    .S1     _print_test_results ; |168| 
           MVKL    .S1     _all_pass,A3
           MVKH    .S1     _all_pass,A3
           NOP             2
;** --------------------------------------------------------------------------*
$C$L7:    
;          EXCLUSIVE CPU CYCLES: 1

           STW     .D1T1   A4,*A3            ; |72| 
||         MVK     .L1     0x3,A4            ; |168| 
||         ADDKPC  .S2     $C$RL18,B3,0      ; |168| 

$C$RL18:   ; CALL OCCURS {_print_test_results} {0}  ; |168| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 34
           LDW     .D2T1   *+SP(80),A29      ; |95| 
           LDW     .D2T1   *+SP(84),A30      ; |100| 
           STW     .D2T1   A12,*+SP(80)      ; |53| 
           STW     .D2T1   A13,*+SP(84)      ; |53| 
           LDW     .D2T2   *+SP(48),B12
           LDW     .D2T1   *+SP(32),A27
           LDW     .D2T1   *+SP(40),A12
           LDW     .D2T1   *+SP(28),A3       ; |177| 
           LDW     .D2T1   *+SP(44),A13
           LDW     .D2T1   *+SP(88),A31      ; |100| 

           LDW     .D2T1   *+SP(68),A28      ; |53| 
||         MV      .L2X    A10,B30

           MV      .L2X    A10,B6
||         STW     .D2T2   B30,*+SP(16)

           MVK     .S2     0x777,B29
||         STW     .D2T2   B6,*+SP(52)

           MV      .L1     A10,A26
||         STW     .D2T2   B29,*+SP(12)

           MV      .L2X    A10,B7
||         MVKL    .S2     0xc000cccc,B5
||         STW     .D2T1   A26,*+SP(136)     ; |171| 

           MVKL    .S2     0xcccccccd,B31
||         STW     .D2T2   B7,*+SP(48)

           MVKH    .S2     0xc000cccc,B5
||         STW     .D2T2   B7,*+SP(32)

           MVKH    .S2     0xcccccccd,B31
||         STW     .D2T2   B5,*+SP(152)      ; |177| 

           MV      .L2     B7,B28            ; |171| 
||         STW     .D2T2   B31,*+SP(148)     ; |177| 

           MV      .L2     B7,B27            ; |171| 
||         STW     .D2T2   B28,*+SP(128)     ; |171| 

           MV      .L1     A10,A4
||         STW     .D2T2   B27,*+SP(120)     ; |171| 

           STW     .D2T1   A4,*+SP(40)       ; |171| 
           STW     .D2T2   B6,*+SP(44)
           STW     .D2T1   A3,*+SP(144)      ; |100| 
           STW     .D2T1   A31,*+SP(140)     ; |100| 
           STW     .D2T1   A30,*+SP(132)     ; |95| 
           STW     .D2T1   A29,*+SP(116)     ; |53| 
           STW     .D2T1   A29,*+SP(112)     ; |53| 

           MVKL    .S2     _a_ext,B4
||         STW     .D2T1   A28,*+SP(124)     ; |53| 

           MVKH    .S2     _a_ext,B4
||         ZERO    .L1     A5
||         STW     .D2T1   A29,*+SP(88)      ; |53| 

           SET     .S1     A5,0x14,0x14,A5
||         STW     .D2T1   A27,*+SP(28)

           MV      .L1X    B4,A14            ; |171| 
||         STDW    .D2T1   A5:A4,*B4         ; |171| 
||         CALL    .S1     _exp2             ; |173| 

           LDDW    .D1T1   *A14,A5:A4        ; |173| 
           NOP             1
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
;          EXCLUSIVE CPU CYCLES: 3
           ADDKPC  .S2     $C$RL19,B3,2      ; |173| 
$C$RL19:   ; CALL OCCURS {_exp2} {0}         ; |173| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 30
           MVKL    .S2     _output,B4

           MVKH    .S2     _output,B4
||         LDW     .D2T2   *+SP(16),B5

           LDW     .D2T2   *B4,B4            ; |173| 
           NOP             4
           ADD     .L2     B5,B4,B4          ; |173| 
           STDW    .D2T1   A5:A4,*B4         ; |173| 

           CALLP   .S2     _exp2dp,B3
||         LDDW    .D1T1   *A14,A5:A4        ; |174| 

$C$RL20:   ; CALL OCCURS {_exp2dp} {0}       ; |174| 
           MVKL    .S2     _output,B4

           MVKH    .S2     _output,B4
||         LDW     .D2T2   *+SP(16),B5

           LDW     .D2T2   *+B4(4),B4        ; |174| 
           NOP             4
           ADD     .L2     B5,B4,B4          ; |174| 
           STDW    .D2T1   A5:A4,*B4         ; |174| 

           CALLP   .S2     _exp2dp_c,B3
||         LDDW    .D1T1   *A14,A5:A4        ; |175| 

$C$RL21:   ; CALL OCCURS {_exp2dp_c} {0}     ; |175| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 264

           MVKL    .S2     _output,B4
||         LDW     .D2T2   *+SP(16),B5

           MVKH    .S2     _output,B4
           LDW     .D2T2   *+B4(8),B4        ; |175| 
           LDW     .D2T2   *+SP(64),B17      ; |53| 
           LDW     .D2T2   *+SP(60),B16      ; |53| 
           MVK     .S1     0x400,A31
           LDW     .D2T2   *+SP(144),B31
           ADD     .L2     B5,B4,B4          ; |175| 
           STDW    .D2T1   A5:A4,*B4         ; |175| 
           LDDW    .D1T1   *A14,A7:A6        ; |176| 
           LDW     .D2T1   *+SP(36),A5
           LDW     .D2T1   *+SP(28),A4
           LDW     .D2T2   *+SP(16),B30      ; |96| 
           LDW     .D2T2   *+SP(16),B29
           NOP             2
           MPYDP   .M1     A5:A4,A7:A6,A9:A8 ; |53| 
           NOP             9
           MPYDP   .M1     A13:A12,A9:A8,A5:A4 ; |53| 
           ADD     .L2     8,B29,B28         ; |172| 
           NOP             8
           DPINT   .L1     A5:A4,A3          ; |53| 
           NOP             3
           INTDP   .L1     A3,A5:A4          ; |53| 
           ADD     .L1     A31,A3,A3         ; |92| 
           NOP             3
           MPYDP   .M1     A11:A10,A5:A4,A17:A16 ; |53| 
           MPYDP   .M2X    B13:B12,A5:A4,B5:B4 ; |53| 
           NOP             8
           SUBDP   .L1     A9:A8,A17:A16,A5:A4 ; |53| 
           NOP             7
           SUBDP   .L2X    A5:A4,B5:B4,B7:B6 ; |53| 
           LDW     .D2T1   *+SP(84),A5
           LDW     .D2T1   *+SP(80),A4
           NOP             4
           MPYDP   .M2     B7:B6,B7:B6,B5:B4 ; |53| 
           NOP             9
           MPYDP   .M2     B11:B10,B5:B4,B9:B8 ; |53| 
           MPYDP   .M1X    A5:A4,B5:B4,A9:A8 ; |53| 
           LDW     .D2T1   *+SP(76),A5
           LDW     .D2T1   *+SP(72),A4
           NOP             6
           ADDDP   .L2     B17:B16,B9:B8,B9:B8 ; |53| 
           ADDDP   .L1     A5:A4,A9:A8,A5:A4 ; |53| 
           LDW     .D2T1   *+SP(68),A9
           MV      .L1     A10,A8            ; |53| 
           NOP             3
           MPYDP   .M2     B5:B4,B9:B8,B9:B8 ; |53| 
           MPYDP   .M1X    B5:B4,A5:A4,A5:A4 ; |53| 
           LDW     .D2T2   *+SP(56),B5       ; |53| 
           NOP             6
           MV      .L2X    A10,B4            ; |53| 
           ADDDP   .L2     B5:B4,B9:B8,B5:B4 ; |53| 
           ADDDP   .L1     A9:A8,A5:A4,A5:A4 ; |53| 
           NOP             5
           MPYDP   .M2     B7:B6,B5:B4,B17:B16 ; |53| 
           LDW     .D2T2   *+SP(88),B5
           NOP             8
           SUBDP   .L2X    A5:A4,B17:B16,B7:B6 ; |53| 
           SHL     .S1     A3,20,A5          ; |92| 
           MV      .L2X    A10,B4            ; |53| 
           MV      .L1     A8,A4             ; |92| 
           NOP             3
           RCPDP   .S2     B7:B6,B9:B8       ; |53| 
           NOP             1
           MPYDP   .M2     B9:B8,B7:B6,B19:B18 ; |53| 
           NOP             9
           SUBDP   .L2     B5:B4,B19:B18,B5:B4 ; |53| 
           NOP             6
           MPYDP   .M2     B9:B8,B5:B4,B9:B8 ; |53| 
           LDW     .D2T2   *+SP(112),B5
           NOP             8
           MPYDP   .M2     B9:B8,B7:B6,B19:B18 ; |53| 
           MV      .L2X    A10,B4            ; |53| 
           NOP             8
           SUBDP   .L2     B5:B4,B19:B18,B5:B4 ; |53| 
           NOP             6
           MPYDP   .M2     B5:B4,B9:B8,B9:B8 ; |53| 
           LDW     .D2T2   *+SP(116),B5
           NOP             8
           MPYDP   .M2     B9:B8,B7:B6,B7:B6 ; |53| 
           MV      .L2X    A10,B4            ; |53| 
           NOP             8
           SUBDP   .L2     B5:B4,B7:B6,B5:B4 ; |53| 
           NOP             6
           MPYDP   .M2     B9:B8,B5:B4,B5:B4 ; |53| 
           NOP             9
           MPYDP   .M2     B17:B16,B5:B4,B7:B6 ; |53| 
           NOP             7
           MV      .L2X    A9,B5             ; |53| 
           MV      .L2X    A10,B4            ; |53| 
           ADDDP   .L2     B5:B4,B7:B6,B5:B4 ; |92| 
           LDW     .D2T1   *+SP(140),A9      ; |176| 
           LDW     .D2T2   *B31,B6           ; |176| 
           LDW     .D2T2   *+SP(12),B7
           NOP             4
           MPYDP   .M1X    A5:A4,B5:B4,A5:A4 ; |92| 
           LDW     .D2T2   *+SP(132),B5      ; |176| 
           CMPLTDP .S1     A7:A6,A9:A8,A0    ; |100| 
           MV      .L2X    A10,B4            ; |176| 
           SUB     .L2     B7,1,B27          ; |172| 
           SUB     .L1X    B7,1,A2           ; |172| 
           CMPGTDP .S2X    A7:A6,B5:B4,B0    ; |95| 
           LDW     .D2T2   *+SP(152),B5
           ADD     .L2     B30,B6,B4         ; |176| 
   [!A2]   MVKL    .S2     _output,B10

   [ B0]   MVKL    .S1     0x7fefffff,A5
|| [ B0]   MVK     .L1     0xffffffff,A4     ; |96| 

   [ B0]   MVKH    .S1     0x7fefffff,A5
   [ A0]   ZERO    .L1     A5:A4             ; |101| 
           STDW    .D2T1   A5:A4,*B4         ; |176| 

           LDDW    .D1T1   *A14,A5:A4        ; |177| 
||         LDW     .D2T2   *+SP(148),B4

   [!A2]   MVKH    .S2     _output,B10
           NOP             3
           MPYDP   .M2X    B5:B4,A5:A4,B5:B4 ; |177| 
           NOP             6
   [ A2]   BNOP    .S1     $C$L8,2           ; |172| 

   [ A2]   CALL    .S1     _exp2             ; |173| 
||         STDW    .D1T2   B5:B4,*++A14      ; |177| 

   [ A2]   LDDW    .D1T1   *A14,A5:A4        ; |173| 
||         STW     .D2T2   B28,*+SP(16)      ; |177| 

   [!A2]   CALL    .S1     _exp2dp_v         ; |179| 
||         STW     .D2T2   B27,*+SP(12)      ; |177| 

           ; BRANCHCC OCCURS {$C$L8}         ; |172| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           LDW     .D2T2   *+B10(16),B4      ; |179| 
           MVKL    .S1     _a_ext,A4
           MVKH    .S1     _a_ext,A4
           MVK     .S1     0x777,A6          ; |179| 
           ADDKPC  .S2     $C$RL22,B3,0      ; |179| 
$C$RL22:   ; CALL OCCURS {_exp2dp_v} {0}     ; |179| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 43
           MVKL    .S2     0x3ddb7cdf,B7
           MVKL    .S2     0xd9d7bdbb,B6
           MVKH    .S2     0x3ddb7cdf,B7

           LDW     .D2T1   *B10,A4           ; |66| 
||         MVKH    .S2     0xd9d7bdbb,B6

           CALLP   .S2     _isequal,B3
||         LDW     .D2T2   *+B10(4),B4       ; |66| 
||         MVK     .S1     0x777,A6          ; |66| 
||         MVK     .L1     0x1,A8            ; |66| 

$C$RL23:   ; CALL OCCURS {_isequal} {0}      ; |66| 
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
||         MVK     .L1     0x1,A8            ; |67| 

$C$RL24:   ; CALL OCCURS {_isequal} {0}      ; |67| 
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
||         MVK     .L1     0x1,A8            ; |68| 

$C$RL25:   ; CALL OCCURS {_isequal} {0}      ; |68| 
           LDW     .D2T1   *+SP(92),A3       ; |68| 
           MVKL    .S2     0x3ddb7cdf,B7
           MVKL    .S2     0xd9d7bdbb,B6
           MVKH    .S2     0x3ddb7cdf,B7

           MV      .L2     B10,B4            ; |68| 
||         STW     .D2T1   A4,*+B11(12)      ; |68| 
||         MVKH    .S2     0xd9d7bdbb,B6

           CALLP   .S2     _isequal,B3
||         LDW     .D2T1   *B4,A4            ; |69| 
||         LDW     .D1T2   *A3,B4            ; |69| 
||         MVK     .S1     0x777,A6          ; |69| 
||         MVK     .L1     0x1,A8            ; |69| 

$C$RL26:   ; CALL OCCURS {_isequal} {0}      ; |69| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 11

           LDW     .D1T1   *A15,A0           ; |72| 
||         LDW     .D2T2   *+SP(96),B4

           STW     .D2T1   A4,*+B11(16)      ; |69| 
           NOP             3

   [!A0]   B       .S1     $C$L9             ; |72| 
|| [ A0]   LDW     .D2T2   *B4,B0            ; |72| 

   [!A0]   CALL    .S1     _print_test_results ; |183| 
   [!A0]   MV      .L1     A10,A4
   [ A0]   ADD     .L2     4,B4,B4
   [!A0]   MVKL    .S1     _all_pass,A3
   [!A0]   MVKH    .S1     _all_pass,A3
           ; BRANCHCC OCCURS {$C$L9}         ; |72| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 10
   [ B0]   LDW     .D2T2   *B4,B4            ; |72| 
           CMPEQ   .L1     A4,0,A3           ; |72| 
           XOR     .L1     1,A3,A3           ; |72| 
   [!B0]   MV      .L1     A10,A0            ; |72| 
           MVK     .L1     0x1,A4            ; |72| 
   [ B0]   CMPEQ   .L2     B4,0,B4           ; |72| 
   [ B0]   XOR     .L2     1,B4,B4           ; |72| 
           NOP             1
   [ B0]   AND     .L1X    A3,B4,A0          ; |72| 
   [!A0]   MV      .L1     A10,A4
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           CALL    .S1     _print_test_results ; |183| 
           MVKL    .S1     _all_pass,A3
           MVKH    .S1     _all_pass,A3
           NOP             2
;** --------------------------------------------------------------------------*
$C$L9:    
;          EXCLUSIVE CPU CYCLES: 1

           STW     .D1T1   A4,*A3            ; |72| 
||         MVK     .L1     0x4,A4            ; |183| 
||         ADDKPC  .S2     $C$RL27,B3,0      ; |183| 

$C$RL27:   ; CALL OCCURS {_print_test_results} {0}  ; |183| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 15
           MV      .L2X    A10,B10           ; |114| 

           MV      .L2X    A10,B11           ; |114| 
||         MVKL    .S1     _cycle_counts+24,A3

           MVKH    .S1     _cycle_counts+24,A3
||         MV      .L2X    A10,B4            ; |114| 

           MVC     .S2     B4,TSCL           ; |115| 
||         STDW    .D1T2   B11:B10,*A3       ; |114| 

           MVC     .S2     TSCL,B6           ; |116| 
           MVC     .S2     TSCH,B4           ; |116| 
           MVKL    .S1     _t_start,A3

           MVKH    .S1     _t_start,A3
||         MV      .L2     B4,B7             ; |116| 

           MVC     .S2     TSCL,B4           ; |117| 
||         STDW    .D1T2   B7:B6,*A3         ; |116| 

           MVC     .S2     TSCH,B8           ; |117| 

           CALL    .S1     _gimme_random     ; |193| 
||         SUBU    .L2     B4,B6,B5:B4       ; |117| 

           EXT     .S2     B5,24,24,B6       ; |117| 
||         SUB     .L2     B8,B7,B31         ; |117| 
||         MVKL    .S1     _t_offset,A3

           ADD     .L2     B31,B6,B5         ; |117| 
||         MVKH    .S1     _t_offset,A3

           ZERO    .L2     B5
||         STDW    .D1T2   B5:B4,*A3         ; |117| 
||         MVK     .S1     0x80,A14
||         ZERO    .L1     A5

           MVKH    .S2     0xc0590000,B5
||         MV      .L2     B10,B4            ; |193| 
||         MVKH    .S1     0x40690000,A5
||         MV      .L1     A10,A4            ; |193| 
||         MV      .D1     A10,A13           ; |117| 

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L10:    
;          EXCLUSIVE CPU CYCLES: 1
           ADDKPC  .S2     $C$RL28,B3,0      ; |193| 
$C$RL28:   ; CALL OCCURS {_gimme_random} {0}  ; |193| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 268
           MVKL    .S1     _input,A12
           MVKH    .S1     _input,A12
           LDW     .D1T1   *A12,A3           ; |193| 
           NOP             4
           ADD     .L1     A13,A3,A3         ; |193| 

           STDW    .D1T1   A5:A4,*A3         ; |193| 
||         MVC     .S2     TSCL,B8           ; |122| 

           MVC     .S2     TSCH,B9           ; |122| 
           MVKL    .S1     0x3fe62e42,A7
           MVKL    .S1     0xfefa39ef,A6
           MVKH    .S1     0x3fe62e42,A7
           MVKH    .S1     0xfefa39ef,A6
           MPYDP   .M1     A7:A6,A5:A4,A7:A6 ; |84| 
           MVKL    .S2     0x3ff71547,B5
           MVKL    .S2     0x652b82fe,B4
           MVKH    .S2     0x3ff71547,B5
           MVKH    .S2     0x652b82fe,B4
           MV      .L1X    B12,A8            ; |84| 
           MVKL    .S1     0xbf2bd010,A9
           MVKH    .S1     0xbf2bd010,A9
           MVKL    .S1     0x6fb3f6e0,A18
           MVKL    .S1     0x3f7c70e4,A19
           MVKH    .S1     0x6fb3f6e0,A18
           MPYDP   .M2X    B5:B4,A7:A6,B5:B4 ; |84| 
           MVKH    .S1     0x3f7c70e4,A19
           MVKL    .S1     0x3f403f99,A17
           MVKL    .S1     0x6fde3809,A16
           MVKH    .S1     0x3f403f99,A17
           MVKH    .S1     0x6fde3809,A16
           MVKL    .S2     0x3fac718e,B19
           MVKL    .S2     0x714251b3,B18
           MVKH    .S2     0x3fac718e,B19
           MVKH    .S2     0x714251b3,B18
           DPINT   .L2     B5:B4,B16         ; |84| 
           MV      .L2     B10,B4            ; |84| 
           MVKL    .S2     0x3fe63000,B5
           MVKH    .S2     0x3fe63000,B5
           INTDP   .L2     B16,B7:B6         ; |84| 
           ZERO    .L1     A31
           ZERO    .L2     B31
           ZERO    .S2     B30
           ZERO    .S2     B17
           MPYDP   .M2     B5:B4,B7:B6,B5:B4 ; |84| 
           MPYDP   .M1X    A9:A8,B7:B6,A9:A8 ; |84| 
           ZERO    .L1     A11
           MVK     .S2     0x400,B29
           MVKH    .S2     0x40900000,B17
           SET     .S1     A11,0x15,0x1d,A11
           MVKL    .S2     _t_start,B28
           MVKL    .S1     _output+12,A3
           MVKH    .S1     _output+12,A3
           LDW     .D1T1   *A3,A3            ; |197| 
           MVKH    .S2     _t_start,B28
           SUBDP   .L1X    A7:A6,B5:B4,A7:A6 ; |84| 
           MVKL    .S2     0x3ef152a4,B5
           MVKL    .S2     0x6f58dc1c,B4
           MVKH    .S2     0x3ef152a4,B5
           MVKH    .S2     0x6f58dc1c,B4
           STDW    .D2T2   B9:B8,*B28
           ADD     .S1     A13,A3,A3         ; |197| 
           SUBDP   .L1     A7:A6,A9:A8,A9:A8 ; |84| 
           NOP             6
           MPYDP   .M1     A9:A8,A9:A8,A7:A6 ; |84| 
           NOP             9
           NOP             1
           MPYDP   .M2X    B5:B4,A7:A6,B5:B4 ; |53| 
           MPYDP   .M1     A17:A16,A7:A6,A17:A16 ; |53| 
           NOP             8
           ADDDP   .L2X    A19:A18,B5:B4,B5:B4 ; |53| 
           ADDDP   .L1X    B19:B18,A17:A16,A17:A16 ; |53| 
           SET     .S2     B30,0x1e,0x1e,B19
           MV      .L2     B10,B18           ; |53| 
           NOP             3
           MPYDP   .M2X    A7:A6,B5:B4,B7:B6 ; |53| 
           MPYDP   .M1     A7:A6,A17:A16,A7:A6 ; |53| 
           NOP             5
           MV      .L2     B10,B4            ; |53| 
           ZERO    .L2     B5
           MVKH    .S2     0x3fd00000,B5
           ADDDP   .L2     B5:B4,B7:B6,B5:B4 ; |53| 
           NOP             7
           MPYDP   .M1X    A9:A8,B5:B4,A17:A16 ; |53| 
           NOP             2

           MV      .L1     A10,A8            ; |53| 
||         SET     .S1     A31,0x15,0x1d,A9

           ADDDP   .L1     A9:A8,A7:A6,A7:A6 ; |53| 
           SET     .S2     B31,0x1e,0x1e,B5
           MV      .L2     B10,B4            ; |53| 
           NOP             4
           SUBDP   .L1     A7:A6,A17:A16,A9:A8 ; |53| 
           NOP             6
           RCPDP   .S1     A9:A8,A7:A6       ; |53| 
           NOP             1
           MPYDP   .M1     A7:A6,A9:A8,A19:A18 ; |53| 
           NOP             9
           NOP             1
           SUBDP   .L2X    B5:B4,A19:A18,B5:B4 ; |53| 
           NOP             6
           MPYDP   .M2X    A7:A6,B5:B4,B5:B4 ; |53| 
           NOP             9
           MPYDP   .M2X    B5:B4,A9:A8,B7:B6 ; |53| 
           NOP             9
           SUBDP   .L2     B19:B18,B7:B6,B7:B6 ; |53| 
           NOP             6
           MPYDP   .M2     B7:B6,B5:B4,B5:B4 ; |53| 
           NOP             9
           NOP             1
           MPYDP   .M1X    B5:B4,A9:A8,A7:A6 ; |53| 
           NOP             7
           MV      .L1     A10,A8            ; |53| 
           MV      .L1X    B19,A9            ; |53| 
           SUBDP   .L1     A9:A8,A7:A6,A7:A6 ; |53| 
           NOP             7
           MPYDP   .M2X    B5:B4,A7:A6,B5:B4 ; |53| 
           NOP             9
           NOP             1
           MPYDP   .M1X    A17:A16,B5:B4,A7:A6 ; |53| 
           NOP             9
           ADDDP   .L1     A11:A10,A7:A6,A7:A6 ; |92| 
           ADD     .L2     B29,B16,B4        ; |92| 
           SHL     .S2     B4,20,B5          ; |92| 
           MV      .L2     B18,B4            ; |92| 
           MV      .L2     B18,B16           ; |92| 
           NOP             3
           MPYDP   .M2X    B5:B4,A7:A6,B7:B6 ; |92| 
           CMPGTDP .S1X    A5:A4,B17:B16,A0  ; |95| 
           NOP             4
           MV      .L1     A8,A6             ; |197| 
           MVKL    .S1     0xc08ff000,A7
           MVKH    .S1     0xc08ff000,A7
           CMPLTDP .S1     A5:A4,A7:A6,A1    ; |100| 

   [ A0]   MVKL    .S2     0x7fefffff,B7
|| [ A0]   MVK     .L2     0xffffffff,B6     ; |96| 

   [ A0]   MVKH    .S2     0x7fefffff,B7
   [ A1]   ZERO    .L2     B7:B6             ; |101| 

           STDW    .D1T2   B7:B6,*A3         ; |197| 
||         MVC     .S2     TSCL,B6           ; |128| 

           MVC     .S2     TSCH,B7           ; |128| 

           MVKL    .S1     _t_offset,A15
||         SUB     .L1     A14,1,A0          ; |191| 
||         MVKL    .S2     _t_stop,B27
||         SUB     .D1     A14,1,A14         ; |191| 

           MVKH    .S1     _t_offset,A15
||         MVKH    .S2     _t_stop,B27
||         ADD     .L1     8,A13,A13         ; |191| 

           STDW    .D2T2   B7:B6,*B27        ; |128| 
||         LDDW    .D1T1   *A15,A7:A6        ; |130| 

           MVKL    .S1     _cycle_counts+24,A3
           MVKH    .S1     _cycle_counts+24,A3
           LDDW    .D1T1   *A3,A5:A4         ; |130| 
           MV      .L2X    A3,B13            ; |130| 
           ADDU    .L1X    A6,B8,A9:A8       ; |130| 
           ADD     .L1     A9,A7,A3          ; |130| 

   [ A0]   B       .S1     $C$L10            ; |191| 
||         SUBU    .L2X    B6,A8,B5:B4       ; |130| 

   [ A0]   CALL    .S1     _gimme_random     ; |193| 
||         ADD     .L2X    A3,B9,B8          ; |130| 
||         EXT     .S2     B5,24,24,B16      ; |130| 

           SUB     .S2     B7,B8,B9          ; |130| 
||         ADDU    .L2X    A4,B4,B5:B4       ; |130| 
|| [ A0]   MV      .L1     A10,A4            ; |193| 

           ADD     .L2     B9,B16,B9         ; |130| 
||         ADD     .S2X    B5,A5,B5          ; |130| 
||         MV      .D2     B4,B8             ; |130| 
|| [ A0]   ZERO    .L1     A5

           ADD     .L2     B5,B9,B9          ; |130| 
|| [ A0]   ZERO    .S2     B5
|| [ A0]   MVKH    .S1     0x40690000,A5
|| [ A0]   MV      .D2     B10,B4            ; |193| 

   [!A0]   CALL    .S1     __fltllif         ; |135| 
||         STDW    .D2T2   B9:B8,*B13        ; |130| 
|| [ A0]   MVKH    .S2     0xc0590000,B5

           ; BRANCHCC OCCURS {$C$L10}        ; |191| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           LDDW    .D2T1   *B13,A5:A4        ; |135| 
           ADDKPC  .S2     $C$RL29,B3,3      ; |135| 
$C$RL29:   ; CALL OCCURS {__fltllif} {0}     ; |135| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 15
           ZERO    .L1     A13
           SET     .S1     A13,0x1a,0x1d,A13
           MPYSP   .M1     A13,A4,A3         ; |135| 
           NOP             3
           SPDP    .S1     A3,A5:A4          ; |135| 
           NOP             1
           ADDDP   .L1     A11:A10,A5:A4,A5:A4 ; |135| 
           CALLP   .S2     __fixdlli,B3
$C$RL30:   ; CALL OCCURS {__fixdlli} {0}     ; |135| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 15
           STDW    .D2T1   A5:A4,*B13        ; |135| 

           SUBAW   .D2     B13,6,B12
||         MV      .L2     B10,B4            ; |114| 

           STDW    .D2T2   B11:B10,*B12      ; |114| 
||         MVC     .S2     B4,TSCL           ; |115| 

           MVC     .S2     TSCL,B6           ; |116| 
           MVC     .S2     TSCH,B4           ; |116| 
           MVKL    .S1     _t_start,A14

           MVKH    .S1     _t_start,A14
||         MV      .L2     B4,B7             ; |116| 

           STDW    .D1T2   B7:B6,*A14        ; |116| 
||         MVC     .S2     TSCL,B4           ; |117| 

           MVC     .S2     TSCH,B8           ; |117| 
           SUBU    .L2     B4,B6,B5:B4       ; |117| 

           EXT     .S2     B5,24,24,B6       ; |117| 
||         SUB     .L2     B8,B7,B31         ; |117| 

           ADD     .L2     B31,B6,B5         ; |117| 
||         MV      .S2X    A15,B13           ; |117| 

           STDW    .D2T2   B5:B4,*B13        ; |117| 
||         MVK     .S2     0x80,B4

           MV      .L1     A10,A15
           MV      .L1X    B4,A10            ; |117| 
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L11:    
;          EXCLUSIVE CPU CYCLES: 11
           LDW     .D1T1   *A12,A3           ; |205| 
           NOP             4

           ADD     .L1     A15,A3,A3         ; |205| 
||         CALL    .S1     _exp2             ; |205| 

           LDDW    .D1T1   *A3,A5:A4         ; |205| 
           ADDKPC  .S2     $C$RL31,B3,3      ; |205| 
$C$RL31:   ; CALL OCCURS {_exp2} {0}         ; |205| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 9

           MVKL    .S2     _output,B4
||         SUB     .L1     A10,1,A0          ; |204| 
||         SUB     .S1     A10,1,A10         ; |204| 

           MVKH    .S2     _output,B4
           LDW     .D2T2   *B4,B4            ; |205| 
   [ A0]   BNOP    .S1     $C$L11,3          ; |204| 

           ADD     .L1X    A15,B4,A3         ; |205| 
||         ADD     .S1     8,A15,A15         ; |204| 

           STDW    .D1T1   A5:A4,*A3         ; |205| 
           ; BRANCHCC OCCURS {$C$L11}        ; |204| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 18
           MVC     .S2     TSCL,B6           ; |128| 
           MVC     .S2     TSCH,B7           ; |128| 

           MV      .L2     B13,B4            ; |128| 
||         LDDW    .D1T1   *A14,A7:A6        ; |130| 

           LDDW    .D2T2   *B4,B5:B4         ; |130| 
           LDDW    .D2T2   *B12,B9:B8        ; |130| 
           MVKL    .S2     _t_stop,B31
           MVKH    .S2     _t_stop,B31
           STDW    .D2T2   B7:B6,*B31        ; |128| 
           ADDU    .L1X    B4,A6,A5:A4       ; |130| 
           NOP             1

           ADD     .L1X    A5,B5,A4          ; |130| 
||         SUBU    .L2X    B6,A4,B5:B4       ; |130| 

           ADD     .L1     A4,A7,A3          ; |130| 
||         EXT     .S2     B5,24,24,B16      ; |130| 
||         ADDU    .L2     B8,B4,B5:B4       ; |130| 

           CALL    .S1     __fltllif         ; |130| 
||         ADD     .L2     B5,B9,B5          ; |130| 

           SUB     .L2X    B7,A3,B8          ; |130| 
||         MV      .L1X    B4,A4             ; |130| 

           ADD     .L2     B8,B16,B8         ; |130| 
           ADD     .L2     B5,B8,B4          ; |130| 
           ADDKPC  .S2     $C$RL32,B3,0      ; |130| 
           MV      .L1X    B4,A5             ; |130| 
$C$RL32:   ; CALL OCCURS {__fltllif} {0}     ; |130| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 13
           MPYSP   .M1     A13,A4,A3         ; |130| 
           MV      .L1X    B11,A10           ; |130| 
           NOP             2
           SPDP    .S1     A3,A5:A4          ; |130| 
           NOP             1
           ADDDP   .L1     A11:A10,A5:A4,A5:A4 ; |130| 
           CALLP   .S2     __fixdlli,B3
$C$RL33:   ; CALL OCCURS {__fixdlli} {0}     ; |130| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 12

           MV      .L2     B10,B4            ; |114| 
||         STDW    .D2T2   B11:B10,*+B12(8)  ; |114| 

           MVC     .S2     B4,TSCL           ; |115| 
||         STDW    .D2T1   A5:A4,*B12        ; |130| 

           MVC     .S2     TSCL,B6           ; |116| 
           MVC     .S2     TSCH,B4           ; |116| 
           MV      .L2     B4,B7             ; |116| 

           MVC     .S2     TSCL,B4           ; |117| 
||         STDW    .D1T2   B7:B6,*A14        ; |116| 

           MVC     .S2     TSCH,B8           ; |117| 

           SUBU    .L2     B4,B6,B5:B4       ; |117| 
||         MVKL    .S2     _t_offset,B31

           EXT     .S2     B5,24,24,B7       ; |117| 
||         SUB     .L2     B8,B7,B5          ; |117| 

           MVK     .S2     0x80,B4
||         MV      .L2     B4,B6             ; |117| 

           ADD     .L2     B5,B7,B7          ; |117| 
||         MVKH    .S2     _t_offset,B31
||         LDW     .D2T2   *+SP(20),B13      ; |117| 

           STDW    .D2T2   B7:B6,*B31        ; |117| 
||         MV      .L1X    B4,A10            ; |117| 
||         MV      .S1     A10,A15

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L12:    
;          EXCLUSIVE CPU CYCLES: 11
           LDW     .D1T1   *A12,A3           ; |213| 
           NOP             4

           ADD     .L1     A15,A3,A3         ; |213| 
||         CALL    .S1     _exp2dp           ; |213| 

           LDDW    .D1T1   *A3,A5:A4         ; |213| 
           ADDKPC  .S2     $C$RL34,B3,3      ; |213| 
$C$RL34:   ; CALL OCCURS {_exp2dp} {0}       ; |213| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 7

           LDW     .D2T2   *B13,B4           ; |213| 
||         SUB     .L1     A10,1,A0          ; |212| 
||         SUB     .S1     A10,1,A10         ; |212| 

   [ A0]   BNOP    .S1     $C$L12,3          ; |212| 

           ADD     .L1X    A15,B4,A3         ; |213| 
||         ADD     .S1     8,A15,A15         ; |212| 

           STDW    .D1T1   A5:A4,*A3         ; |213| 
           ; BRANCHCC OCCURS {$C$L12}        ; |212| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 19
           MVC     .S2     TSCL,B6           ; |128| 
           MVC     .S2     TSCH,B5           ; |128| 

           MVKL    .S2     _t_offset,B4
||         LDDW    .D1T1   *A14,A7:A6        ; |130| 

           MVKH    .S2     _t_offset,B4
           LDDW    .D2T2   *B4,B9:B8         ; |130| 
           MV      .L2     B5,B7             ; |128| 
           LDDW    .D2T2   *+B12(8),B5:B4    ; |130| 
           MVKL    .S2     _t_stop,B31
           MVKH    .S2     _t_stop,B31
           ADDU    .L1X    B8,A6,A5:A4       ; |130| 
           STDW    .D2T2   B7:B6,*B31        ; |128| 

           ADD     .L1X    A5,B9,A4          ; |130| 
||         SUBU    .L2X    B6,A4,B9:B8       ; |130| 

           ADD     .L1     A4,A7,A3          ; |130| 
||         EXT     .S2     B9,24,24,B16      ; |130| 
||         ADDU    .L2     B4,B8,B9:B8       ; |130| 

           CALL    .S1     __fltllif         ; |130| 
||         ADD     .L2     B9,B5,B5          ; |130| 

           SUB     .L2X    B7,A3,B4          ; |130| 
||         MV      .L1X    B8,A4             ; |130| 

           ADD     .L2     B4,B16,B8         ; |130| 
           ADD     .L2     B5,B8,B4          ; |130| 
           ADDKPC  .S2     $C$RL35,B3,0      ; |130| 
           MV      .L1X    B4,A5             ; |130| 
$C$RL35:   ; CALL OCCURS {__fltllif} {0}     ; |130| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 13
           MPYSP   .M1     A13,A4,A3         ; |130| 
           MV      .L1X    B11,A10           ; |130| 
           NOP             2
           SPDP    .S1     A3,A5:A4          ; |130| 
           NOP             1
           ADDDP   .L1     A11:A10,A5:A4,A5:A4 ; |130| 
           CALLP   .S2     __fixdlli,B3
$C$RL36:   ; CALL OCCURS {__fixdlli} {0}     ; |130| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 15
           STDW    .D2T2   B11:B10,*+B12(16) ; |114| 

           ADDAD   .D2     B12,1,B13
||         MV      .L2     B10,B4            ; |114| 

           STDW    .D2T1   A5:A4,*B13        ; |130| 
||         MVC     .S2     B4,TSCL           ; |115| 

           MVC     .S2     TSCL,B6           ; |116| 
           MVC     .S2     TSCH,B4           ; |116| 
           MV      .L2     B4,B7             ; |116| 

           STDW    .D1T2   B7:B6,*A14        ; |116| 
||         MVC     .S2     TSCL,B4           ; |117| 

           MVC     .S2     TSCH,B8           ; |117| 
           LDW     .D2T1   *+SP(24),A3       ; |117| 
           SUBU    .L2     B4,B6,B5:B4       ; |117| 
           MVKL    .S2     _t_offset,B31

           EXT     .S2     B5,24,24,B7       ; |117| 
||         SUB     .L2     B8,B7,B5          ; |117| 

           MV      .L2     B4,B6             ; |117| 
||         MVK     .S2     0x80,B4

           ADD     .L2     B5,B7,B7          ; |117| 
||         MVKH    .S2     _t_offset,B31
||         STW     .D2T1   A3,*+SP(12)

           STDW    .D2T2   B7:B6,*B31        ; |117| 
||         MV      .L1     A10,A15
||         MV      .S1X    B4,A10            ; |117| 

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L13:    
;          EXCLUSIVE CPU CYCLES: 11
           LDW     .D1T1   *A12,A3           ; |221| 
           NOP             4

           ADD     .L1     A15,A3,A3         ; |221| 
||         CALL    .S1     _exp2dp_c         ; |221| 

           LDDW    .D1T1   *A3,A5:A4         ; |221| 
           ADDKPC  .S2     $C$RL37,B3,3      ; |221| 
$C$RL37:   ; CALL OCCURS {_exp2dp_c} {0}     ; |221| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 12
           LDW     .D2T2   *+SP(12),B4       ; |221| 
           SUB     .L1     A10,1,A0          ; |220| 
           SUB     .L1     A10,1,A10         ; |220| 
           NOP             2
           LDW     .D2T2   *B4,B4            ; |221| 
   [ A0]   BNOP    .S1     $C$L13,3          ; |220| 

           ADD     .L1X    A15,B4,A3         ; |221| 
||         ADD     .S1     8,A15,A15         ; |220| 

           STDW    .D1T1   A5:A4,*A3         ; |221| 
           ; BRANCHCC OCCURS {$C$L13}        ; |220| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 17
           MVC     .S2     TSCL,B6           ; |128| 
           MVC     .S2     TSCH,B4           ; |128| 

           MVKL    .S2     _t_offset,B5
||         LDDW    .D1T1   *A14,A5:A4        ; |130| 
||         MV      .L2     B4,B7             ; |128| 
||         MV      .D2     B12,B4            ; |130| 

           MVKH    .S2     _t_offset,B5
           LDDW    .D2T2   *B5,B17:B16       ; |130| 
           LDDW    .D2T2   *+B4(16),B9:B8    ; |130| 
           MVKL    .S2     _t_stop,B31
           MVKH    .S2     _t_stop,B31
           STDW    .D2T2   B7:B6,*B31        ; |128| 
           ADDU    .L2X    B16,A4,B5:B4      ; |130| 

           ADD     .S2     B5,B17,B16        ; |130| 
||         SUBU    .L2     B6,B4,B5:B4       ; |130| 

           ADD     .L2X    B16,A5,B16        ; |130| 
||         CALL    .S1     __fltllif         ; |130| 

           SUB     .D2     B7,B16,B8         ; |130| 
||         ADDU    .L2     B8,B4,B5:B4       ; |130| 
||         EXT     .S2     B5,24,24,B16      ; |130| 

           ADD     .L2     B5,B9,B5          ; |130| 
||         ADD     .S2     B8,B16,B8         ; |130| 

           MV      .L1X    B4,A4             ; |130| 
||         ADD     .L2     B5,B8,B4          ; |130| 

           MV      .L1X    B12,A15           ; |130| 

           MV      .L1X    B4,A5             ; |130| 
||         ADDKPC  .S2     $C$RL38,B3,0      ; |130| 

$C$RL38:   ; CALL OCCURS {__fltllif} {0}     ; |130| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 106
           MPYSP   .M1     A13,A4,A3         ; |130| 
           MV      .L1X    B11,A10           ; |130| 
           NOP             3
           SPDP    .S2X    A3,B5:B4          ; |130| 
           NOP             2
           ADDDP   .L1X    A11:A10,B5:B4,A5:A4 ; |130| 
           CALLP   .S2     __fixdlli,B3
$C$RL39:   ; CALL OCCURS {__fixdlli} {0}     ; |130| 

           ADDAD   .D2     B13,1,B12
||         MV      .L2X    A15,B4

           MV      .L2     B10,B31           ; |114| 
||         STDW    .D2T2   B11:B10,*+B4(32)  ; |114| 

           STDW    .D2T1   A5:A4,*B12        ; |130| 
||         MVC     .S2     B31,TSCL          ; |115| 

           MVC     .S2     TSCL,B4           ; |116| 
           MVC     .S2     TSCH,B5           ; |116| 

           STDW    .D1T2   B5:B4,*A14        ; |116| 
||         MVC     .S2     TSCL,B6           ; |117| 

           MVC     .S2     TSCH,B8           ; |117| 

           MVKL    .S1     _output,A15
||         SUBU    .L2     B6,B4,B7:B6       ; |117| 
||         MVKL    .S2     _t_offset,B10

           MVKH    .S1     _output,A15
||         MV      .L2X    A12,B9            ; |228| 
||         SUB     .D2     B8,B5,B4          ; |117| 
||         EXT     .S2     B7,24,24,B5       ; |117| 

           ADD     .L2     B4,B5,B7          ; |117| 
||         LDW     .D1T2   *+A15(16),B4      ; |228| 
||         LDW     .D2T1   *B9,A4            ; |228| 
||         MVKH    .S2     _t_offset,B10

           CALLP   .S2     _exp2dp_v,B3
||         STDW    .D2T2   B7:B6,*B10        ; |117| 
||         MVK     .S1     0x80,A6           ; |228| 

$C$RL40:   ; CALL OCCURS {_exp2dp_v} {0}     ; |228| 
           MVC     .S2     TSCL,B8           ; |128| 
           MVC     .S2     TSCH,B4           ; |128| 

           LDDW    .D1T1   *A14,A9:A8        ; |130| 
||         LDDW    .D2T2   *B10,B7:B6        ; |130| 

           MVK     .S1     16,A12
           ADD     .L1X    B12,A12,A12
           LDDW    .D1T1   *A12,A7:A6        ; |130| 
           MVKL    .S1     _t_stop,A3
           ADDU    .L1X    B6,A8,A5:A4       ; |130| 

           MVKH    .S1     _t_stop,A3
||         SUBU    .L1X    B8,A4,A17:A16     ; |130| 

           ADD     .L1X    A5,B7,A4          ; |130| 
||         MV      .L2     B4,B9             ; |128| 

           ADD     .L1     A4,A9,A4          ; |130| 
||         MV      .L2X    A3,B4             ; |128| 
||         MV      .D1     A16,A3            ; |130| 
||         EXT     .S1     A17,24,24,A8      ; |130| 

           SUB     .S1X    B9,A4,A3          ; |130| 
||         ADDU    .L1     A6,A3,A5:A4       ; |130| 

           ADD     .L1     A5,A7,A3          ; |130| 
||         ADD     .S1     A3,A8,A5          ; |130| 

           CALLP   .S2     __fltllif,B3
||         ADD     .L1     A3,A5,A5          ; |130| 
||         STDW    .D2T2   B9:B8,*B4         ; |128| 

$C$RL41:   ; CALL OCCURS {__fltllif} {0}     ; |130| 
           MPYSP   .M1     A13,A4,A3         ; |130| 
           NOP             3
           SPDP    .S1     A3,A5:A4          ; |130| 
           NOP             1
           ADDDP   .L1     A11:A10,A5:A4,A5:A4 ; |130| 
           CALLP   .S2     __fixdlli,B3
$C$RL42:   ; CALL OCCURS {__fixdlli} {0}     ; |130| 
           MVKL    .S2     0x3ddb7cdf,B7
           MVKL    .S2     0xd9d7bdbb,B6

           STDW    .D1T1   A5:A4,*A12        ; |130| 
||         MVKH    .S2     0x3ddb7cdf,B7

           LDW     .D1T2   *+A15(4),B4       ; |66| 
||         MVKH    .S2     0xd9d7bdbb,B6

           CALLP   .S2     _isequal,B3
||         LDW     .D1T1   *A15,A4           ; |66| 
||         MVK     .S1     0x80,A6           ; |66| 
||         MVK     .L1     0x1,A8            ; |66| 

$C$RL43:   ; CALL OCCURS {_isequal} {0}      ; |66| 
           MVKL    .S2     0x3ddb7cdf,B7
           MVKL    .S2     0xd9d7bdbb,B6
           MVKL    .S2     _fcn_pass,B10
           MVKH    .S2     0x3ddb7cdf,B7
           MVKH    .S2     0xd9d7bdbb,B6

           MV      .L1     A4,A3             ; |66| 
||         LDW     .D1T1   *A15,A4           ; |67| 
||         MVKH    .S2     _fcn_pass,B10

           CALLP   .S2     _isequal,B3
||         LDW     .D1T2   *+A15(8),B4       ; |67| 
||         STW     .D2T1   A3,*+B10(4)       ; |66| 
||         MVK     .S1     0x80,A6           ; |67| 
||         MVK     .L1     0x1,A8            ; |67| 

$C$RL44:   ; CALL OCCURS {_isequal} {0}      ; |67| 
           MVKL    .S2     0x3ddb7cdf,B7
           MVKL    .S2     0xd9d7bdbb,B6
           MVKH    .S2     0x3ddb7cdf,B7

           STW     .D2T1   A4,*+B10(8)       ; |67| 
||         LDW     .D1T2   *+A15(12),B4      ; |68| 
||         MVKH    .S2     0xd9d7bdbb,B6

           CALLP   .S2     _isequal,B3
||         LDW     .D1T1   *A15,A4           ; |68| 
||         MVK     .S1     0x80,A6           ; |68| 
||         MVK     .L1     0x1,A8            ; |68| 

$C$RL45:   ; CALL OCCURS {_isequal} {0}      ; |68| 
           LDW     .D2T1   *+SP(100),A3      ; |68| 
           MVKL    .S2     0xd9d7bdbb,B6
           MVKL    .S2     0x3ddb7cdf,B7

           STW     .D2T1   A4,*+B10(12)      ; |68| 
||         MVKH    .S2     0xd9d7bdbb,B6

           LDW     .D1T1   *A15,A4           ; |69| 
||         MVKH    .S2     0x3ddb7cdf,B7

           CALLP   .S2     _isequal,B3
||         LDW     .D1T2   *A3,B4            ; |69| 
||         MVK     .S1     0x80,A6           ; |69| 
||         MVK     .L1     0x1,A8            ; |69| 

$C$RL46:   ; CALL OCCURS {_isequal} {0}      ; |69| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 16
           LDW     .D2T2   *+SP(104),B5      ; |69| 
           MV      .L2X    A4,B4             ; |69| 
           STW     .D2T2   B4,*+B10(16)      ; |69| 
           NOP             2
           LDW     .D2T2   *B5,B0            ; |72| 
           LDW     .D2T2   *+SP(108),B5
           NOP             3

   [!B0]   B       .S1     $C$L14            ; |72| 
||         MV      .L2     B0,B1             ; guard predicate rewrite

   [ B0]   LDW     .D2T2   *B5,B0            ; |72| 
   [ B1]   ADD     .L2     4,B5,B5
           NOP             3
           ; BRANCHCC OCCURS {$C$L14}        ; |72| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 14
   [ B0]   LDW     .D2T2   *B5,B5            ; |72| 
           CMPEQ   .L2     B4,0,B4           ; |72| 
           MVK     .L1     0x1,A3            ; |72| 
           NOP             2
   [ B0]   CMPEQ   .L2     B5,0,B5           ; |72| 

   [ B0]   XOR     .L2     1,B5,B4           ; |72| 
||         XOR     .S2     1,B4,B5           ; |72| 

   [ B0]   AND     .L2     B5,B4,B0          ; |72| 
|| [!B0]   ZERO    .S2     B0                ; |72| 

   [ B0]   B       .S1     $C$L15            ; |72| 
   [ B0]   CALL    .S1     _print_test_results ; |234| 
   [ B0]   MVKL    .S1     _all_pass,A4
   [ B0]   MVKH    .S1     _all_pass,A4
           NOP             2
           ; BRANCHCC OCCURS {$C$L15}        ; |72| 
;** --------------------------------------------------------------------------*
$C$L14:    
;          EXCLUSIVE CPU CYCLES: 5
           CALL    .S1     _print_test_results ; |234| 
           MVKL    .S1     _all_pass,A4
           MVKH    .S1     _all_pass,A4
           MV      .L1     A10,A3
           NOP             1
;** --------------------------------------------------------------------------*
$C$L15:    
;          EXCLUSIVE CPU CYCLES: 1

           STW     .D1T1   A3,*A4            ; |72| 
||         MVK     .L1     0x2,A4            ; |234| 
||         ADDKPC  .S2     $C$RL47,B3,0      ; |234| 

$C$RL47:   ; CALL OCCURS {_print_test_results} {0}  ; |234| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 30
           MVKL    .S2     $C$SL2+0,B4
           MVKH    .S2     $C$SL2+0,B4

           CALLP   .S2     _printf,B3
||         STW     .D2T2   B4,*+SP(4)        ; |235| 

$C$RL48:   ; CALL OCCURS {_printf} {0}       ; |235| 
           MVKL    .S2     $C$SL3+0,B4
           MVKH    .S2     $C$SL3+0,B4

           CALLP   .S2     _printf,B3
||         STW     .D2T2   B4,*+SP(4)        ; |235| 

$C$RL49:   ; CALL OCCURS {_printf} {0}       ; |235| 
           MVKL    .S1     $C$SL1+0,A10
           MVKH    .S1     $C$SL1+0,A10

           CALLP   .S2     _print_profile_results,B3
||         MV      .L1     A10,A4            ; |242| 

$C$RL50:   ; CALL OCCURS {_print_profile_results} {0}  ; |242| 

           CALLP   .S2     _print_memory_results,B3
||         MV      .L1     A10,A4            ; |245| 

$C$RL51:   ; CALL OCCURS {_print_memory_results} {0}  ; |245| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 12
           ADDK    .S2     200,SP            ; |246| 
           LDW     .D2T2   *++SP(8),B3       ; |246| 
           LDDW    .D2T1   *++SP,A13:A12     ; |246| 
           LDDW    .D2T1   *++SP,A15:A14     ; |246| 
           LDDW    .D2T2   *++SP,B11:B10     ; |246| 
           LDDW    .D2T2   *++SP,B13:B12     ; |246| 

           LDW     .D2T1   *++SP(8),A10      ; |246| 
||         RET     .S2     B3                ; |246| 

           LDW     .D2T1   *++SP(8),A11      ; |246| 
           NOP             4
           ; BRANCH OCCURS {B3}              ; |246| 
;******************************************************************************
;* STRINGS                                                                    *
;******************************************************************************
	.sect	".const:.string"
$C$SL1:	.string	"exp2DP",0
$C$SL2:	.string	"----------------------------------------",0
$C$SL3:	.string	"----------------------------------------",10,0
;*****************************************************************************
;* UNDEFINED EXTERNAL REFERENCES                                             *
;*****************************************************************************
	.global	_printf
	.global	_exp2
	.global	_driver_init
	.global	_print_profile_results
	.global	_print_memory_results
	.global	_print_test_results
	.global	_gimme_random
	.global	_isequal
	.global	_exp2dp
	.global	_exp2dp_c
	.global	_exp2dp_v
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
