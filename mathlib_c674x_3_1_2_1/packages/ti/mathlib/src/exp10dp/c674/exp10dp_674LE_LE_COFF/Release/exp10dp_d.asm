;******************************************************************************
;* TMS320C6x C/C++ Codegen                                          PC v7.4.2 *
;* Date/Time created: Mon May 16 23:43:52 2016                                *
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
	.word	0715831f0h,0401d05aah		; _a[0] @ 0
	.word	0b02c8316h,040205f6ch		; _a[1] @ 64
	.word	0cf893fafh,0401f009dh		; _a[2] @ 128
	.word	0ee334ee2h,040138517h		; _a[3] @ 192
	.word	00509543dh,0c022cf5bh		; _a[4] @ 256
	.word	091cfa0bdh,0bffeeba6h		; _a[5] @ 320
	.word	093e87fb1h,03fe6ef26h		; _a[6] @ 384
	.word	0e9325e21h,0c005ff4ah		; _a[7] @ 448
	.word	051ed329eh,04011196eh		; _a[8] @ 512
	.word	03be8e45bh,0c009b609h		; _a[9] @ 576
	.word	06d762520h,0c010f76fh		; _a[10] @ 640
	.word	007a7942eh,0400b0e60h		; _a[11] @ 704
	.word	068dc626ch,04017785bh		; _a[12] @ 768
	.word	09b31494eh,0400d4c5bh		; _a[13] @ 832
	.word	036dc3520h,04021d942h		; _a[14] @ 896
	.word	034084549h,0c021777dh		; _a[15] @ 960
	.word	000523557h,0c023bcd6h		; _a[16] @ 1024
	.word	0502fc33ch,0c01421adh		; _a[17] @ 1088
	.word	0502d3efdh,0c01b259ch		; _a[18] @ 1152
	.word	0df0c6a72h,040162167h		; _a[19] @ 1216
	.word	0b7c92f89h,04020742dh		; _a[20] @ 1280
	.word	0b8ad5b17h,0400e20ddh		; _a[21] @ 1344
	.word	0e9043af8h,0bff6ccbdh		; _a[22] @ 1408
	.word	087ecc8ech,0401f0a33h		; _a[23] @ 1472
	.word	0c8dd5404h,0402150e1h		; _a[24] @ 1536
	.word	02060c898h,03fd3c963h		; _a[25] @ 1600
	.word	046de0ae3h,0c020ceb9h		; _a[26] @ 1664
	.word	0c29f4c61h,0c00c2ab6h		; _a[27] @ 1728
	.word	06f70d123h,0c00c1a23h		; _a[28] @ 1792
	.word	0d80aee71h,0c0217f69h		; _a[29] @ 1856
	.word	09766b972h,0c0101c14h		; _a[30] @ 1920
	.word	05a9a8049h,0401bbeb6h		; _a[31] @ 1984
	.word	01593e5fbh,0c018c5c3h		; _a[32] @ 2048
	.word	0c2dc8902h,03fe045a9h		; _a[33] @ 2112
	.word	04ab2abb9h,0c01f3b44h		; _a[34] @ 2176
	.word	0323bbc6fh,0c0217f56h		; _a[35] @ 2240
	.word	0d3d5d58ah,0bfdad2fdh		; _a[36] @ 2304
	.word	036460d2bh,040211ea1h		; _a[37] @ 2368
	.word	0bfa3189eh,0c0030fe1h		; _a[38] @ 2432
	.word	090c33143h,0bff319e6h		; _a[39] @ 2496
	.word	033f19f14h,04022fae4h		; _a[40] @ 2560
	.word	04fba5277h,0c01bbbe9h		; _a[41] @ 2624
	.word	02f2ec1b4h,04019ed65h		; _a[42] @ 2688
	.word	0ae7d566dh,0c01312b6h		; _a[43] @ 2752
	.word	0d70cc1afh,0c00e0cb4h		; _a[44] @ 2816
	.word	0cff1447bh,04020d0b1h		; _a[45] @ 2880
	.word	00153bd16h,04023a0f7h		; _a[46] @ 2944
	.word	03a2595bch,0400b5ccbh		; _a[47] @ 3008
	.word	04c2eacbch,04022d94bh		; _a[48] @ 3072
	.word	03d70a3d7h,04017070ah		; _a[49] @ 3136
	.word	0b61a02e1h,0c010ff77h		; _a[50] @ 3200
	.word	0782ee5c7h,040091a87h		; _a[51] @ 3264
	.word	08d4ad6beh,0c0125e75h		; _a[52] @ 3328
	.word	0bcf0b6b7h,0c01abc54h		; _a[53] @ 3392
	.word	00b559e98h,04021d091h		; _a[54] @ 3456
	.word	082b04909h,0c021f429h		; _a[55] @ 3520
	.word	090c40802h,0c0033341h		; _a[56] @ 3584
	.word	0cb394ed6h,0c00f58d1h		; _a[57] @ 3648
	.word	0ed1a4a2eh,0c0215b02h		; _a[58] @ 3712
	.word	0926196f4h,03fdb8780h		; _a[59] @ 3776
	.word	0e74caad3h,0c00fa679h		; _a[60] @ 3840
	.word	095604ef5h,0c00ffe66h		; _a[61] @ 3904
	.word	0e3d1cc10h,03ff5b6f7h		; _a[62] @ 3968
	.word	00275fc06h,03ffbe1f5h		; _a[63] @ 4032
	.word	0cecc814dh,0401f8fa2h		; _a[64] @ 4096
	.word	00521a7f0h,0c020aeaah		; _a[65] @ 4160
	.word	0cbc9978eh,0c01571f5h		; _a[66] @ 4224
	.word	055eff69eh,040007c86h		; _a[67] @ 4288
	.word	07b6bb129h,0401bb5bbh		; _a[68] @ 4352
	.word	0f5c0e1ddh,0bff04972h		; _a[69] @ 4416
	.word	084ec636bh,0400b7097h		; _a[70] @ 4480
	.word	000431bdfh,040165c70h		; _a[71] @ 4544
	.word	0728a6117h,040103469h		; _a[72] @ 4608
	.word	0d0e48982h,0c02365c7h		; _a[73] @ 4672
	.word	069a1844ah,0c007cee4h		; _a[74] @ 4736
	.word	0ff45c5ddh,0c01afb15h		; _a[75] @ 4800
	.word	06e993acfh,0401b7dc8h		; _a[76] @ 4864
	.word	0987ee767h,0c01468ceh		; _a[77] @ 4928
	.word	03d1e6e80h,03ff82234h		; _a[78] @ 4992
	.word	0d0884330h,040062cadh		; _a[79] @ 5056
	.word	00f8b8e3eh,0bfa6de58h		; _a[80] @ 5120
	.word	0e5a865e5h,0bfe86762h		; _a[81] @ 5184
	.word	07d970494h,0bfb4770dh		; _a[82] @ 5248
	.word	066f0cfe1h,04022160dh		; _a[83] @ 5312
	.word	0a1f3046fh,040133f55h		; _a[84] @ 5376
	.word	064e70a66h,04019b2f3h		; _a[85] @ 5440
	.word	05c68b6a3h,0c01ff193h		; _a[86] @ 5504
	.word	088ee50abh,0400b0254h		; _a[87] @ 5568
	.word	05dc5adf5h,0bfd4fd73h		; _a[88] @ 5632
	.word	0f6697e49h,0c00c81e5h		; _a[89] @ 5696
	.word	0cab67217h,0c015b55dh		; _a[90] @ 5760
	.word	036600e5eh,0c01604a6h		; _a[91] @ 5824
	.word	0c967bd7eh,0bfdc3088h		; _a[92] @ 5888
	.word	051cd522eh,04018cdech		; _a[93] @ 5952
	.word	04dbfa674h,03ff2c935h		; _a[94] @ 6016
	.word	0ca4609d0h,0401e1fbbh		; _a[95] @ 6080
	.word	0bb044d6dh,0c009e8abh		; _a[96] @ 6144
	.word	0c28f5c29h,04022e0f5h		; _a[97] @ 6208
	.word	0b92626dbh,04002c40dh		; _a[98] @ 6272
	.word	04608220dh,040133114h		; _a[99] @ 6336
	.word	0fb3d22a0h,03fbff680h		; _a[100] @ 6400
	.word	0a0abdc92h,0c00aa6b3h		; _a[101] @ 6464
	.word	001711948h,04015f468h		; _a[102] @ 6528
	.word	05d0eced0h,040154df5h		; _a[103] @ 6592
	.word	09fdafc3ah,0c0128530h		; _a[104] @ 6656
	.word	058cc49f0h,0c01153d9h		; _a[105] @ 6720
	.word	089da08f5h,0c014cf37h		; _a[106] @ 6784
	.word	05a3adef9h,040146430h		; _a[107] @ 6848
	.word	0e8bdc41bh,04014aae1h		; _a[108] @ 6912
	.word	022c1cbe8h,0c0229975h		; _a[109] @ 6976
	.word	00e7868c7h,0c02151c0h		; _a[110] @ 7040
	.word	061e77ba5h,0c008e2b2h		; _a[111] @ 7104
	.word	05ddc5429h,04022960ch		; _a[112] @ 7168
	.word	057eaa2a1h,04007cf3ah		; _a[113] @ 7232
	.word	03199d5ffh,0c01b75bbh		; _a[114] @ 7296
	.word	0f504fa3bh,0c02325d2h		; _a[115] @ 7360
	.word	0f534cae3h,0400e2f15h		; _a[116] @ 7424
	.word	06209e054h,0c022ae45h		; _a[117] @ 7488
	.word	04940bbb2h,0c0136581h		; _a[118] @ 7552
	.word	0b3fc1b6fh,0c01e73d5h		; _a[119] @ 7616
	.word	024180d3dh,04001aa7dh		; _a[120] @ 7680
	.word	045430030h,04021ba8bh		; _a[121] @ 7744
	.word	04dc9b76fh,040218579h		; _a[122] @ 7808
	.word	041729117h,0401858c7h		; _a[123] @ 7872
	.word	081c490beh,0c0154746h		; _a[124] @ 7936
	.word	03f309778h,04022d6dch		; _a[125] @ 8000
	.word	097e8bf72h,04007ee2dh		; _a[126] @ 8064
	.word	08f4de63dh,0c02042b7h		; _a[127] @ 8128
	.word	06ab14ec2h,040204a10h		; _a[128] @ 8192
	.word	05e61b527h,03fee6991h		; _a[129] @ 8256
	.word	00f9fb034h,040098ee0h		; _a[130] @ 8320
	.word	086013661h,0401bcfe5h		; _a[131] @ 8384
	.word	0f284ed3ah,0401af799h		; _a[132] @ 8448
	.word	01230842ch,04022b035h		; _a[133] @ 8512
	.word	0bfb663d5h,0c020f70eh		; _a[134] @ 8576
	.word	087df5cf2h,040156483h		; _a[135] @ 8640
	.word	0eaba1d9eh,0c021d04bh		; _a[136] @ 8704
	.word	02a8a1746h,0c008dcb2h		; _a[137] @ 8768
	.word	00da935efh,0401dcaf3h		; _a[138] @ 8832
	.word	088418281h,0bffbfb1ah		; _a[139] @ 8896
	.word	0bd09e12ah,0bff264feh		; _a[140] @ 8960
	.word	06d1e108ch,04009311ch		; _a[141] @ 9024
	.word	016a2d9b4h,0401bd394h		; _a[142] @ 9088
	.word	01036aee9h,0c01af2dch		; _a[143] @ 9152
	.word	07eb511c5h,040127544h		; _a[144] @ 9216
	.word	073548b73h,040113b14h		; _a[145] @ 9280
	.word	035b771f2h,040099433h		; _a[146] @ 9344
	.word	08891339ah,0c013f3dfh		; _a[147] @ 9408
	.word	000093a3bh,0bfc1f6e9h		; _a[148] @ 9472
	.word	03c68661bh,0c019a411h		; _a[149] @ 9536
	.word	064302b41h,040173b75h		; _a[150] @ 9600
	.word	0060857bdh,040158f6bh		; _a[151] @ 9664
	.word	0d14e3bcdh,0c01c9491h		; _a[152] @ 9728
	.word	02d0f2cc4h,03feb570dh		; _a[153] @ 9792
	.word	024bc77ebh,03ffb0429h		; _a[154] @ 9856
	.word	0487fcb92h,04004edbfh		; _a[155] @ 9920
	.word	0bac7e78bh,040217b13h		; _a[156] @ 9984
	.word	0d9846b34h,0c01bb95fh		; _a[157] @ 10048
	.word	0bc0427adh,0c016ce16h		; _a[158] @ 10112
	.word	0b701896dh,04000bd93h		; _a[159] @ 10176
	.word	0bdd68fc4h,0402337bah		; _a[160] @ 10240
	.word	0697437e0h,0c01805b2h		; _a[161] @ 10304
	.word	04cf14a5bh,0401123c3h		; _a[162] @ 10368
	.word	0c9bfd213h,0c0108edbh		; _a[163] @ 10432
	.word	055d7a2eah,0c016ed37h		; _a[164] @ 10496
	.word	0b9595282h,040115ebch		; _a[165] @ 10560
	.word	09399a558h,04021b3bch		; _a[166] @ 10624
	.word	04d495eefh,0c01aca16h		; _a[167] @ 10688
	.word	06ebc763dh,0bff71eb6h		; _a[168] @ 10752
	.word	0f4d2a554h,03ff8a87eh		; _a[169] @ 10816
	.word	0f31bebefh,040031b95h		; _a[170] @ 10880
	.word	08bd159fah,03fc0447fh		; _a[171] @ 10944
	.word	008f49b48h,0c012f87fh		; _a[172] @ 11008
	.word	0b61a02e1h,0bf9f5777h		; _a[173] @ 11072
	.word	0ffd10617h,0c0109c17h		; _a[174] @ 11136
	.word	013107dfdh,0bfe8be1eh		; _a[175] @ 11200
	.word	0cde19fc3h,0c018cc1ah		; _a[176] @ 11264
	.word	01c6088d7h,0c0223e5ch		; _a[177] @ 11328
	.word	0ab8122aah,0c005b7e1h		; _a[178] @ 11392
	.word	05a5abf69h,0c02343b2h		; _a[179] @ 11456
	.word	07d5df9b0h,03fe47ae1h		; _a[180] @ 11520
	.word	072268e09h,04004631ch		; _a[181] @ 11584
	.word	06191eb4fh,0c020bc70h		; _a[182] @ 11648
	.word	0f3b56ee2h,0c023efa2h		; _a[183] @ 11712
	.word	090a6abd1h,0bfecbbd0h		; _a[184] @ 11776
	.word	00187bf7dh,0bfba2101h		; _a[185] @ 11840
	.word	05a7a9fd9h,03fe11334h		; _a[186] @ 11904
	.word	003ab862bh,0c020b220h		; _a[187] @ 11968
	.word	0774aba38h,040229dd7h		; _a[188] @ 12032
	.word	0eb173aafh,040132ec0h		; _a[189] @ 12096
	.word	0bc423b0eh,04004b264h		; _a[190] @ 12160
	.word	0faa623ech,040171284h		; _a[191] @ 12224
	.word	0b57313f4h,04020d1bah		; _a[192] @ 12288
	.word	0aec65189h,0c01010a3h		; _a[193] @ 12352
	.word	006324928h,0c01aa331h		; _a[194] @ 12416
	.word	09cf7f2ebh,0bfe5ab05h		; _a[195] @ 12480
	.word	079d75c73h,0c023c465h		; _a[196] @ 12544
	.word	01e349e6dh,040224eb6h		; _a[197] @ 12608
	.word	0f955c1d3h,040143af9h		; _a[198] @ 12672
	.word	00d0d2ebdh,0c00bced5h		; _a[199] @ 12736
	.word	01acb5d61h,040159babh		; _a[200] @ 12800
$C$IR_1:	.set	1608

	.global	_a
_a:	.usect	".far",1608,8
;	C:\MATHLIB_Tools\CCSV5_5_0\ccsv5\tools\compiler\c6000_7.4.2\bin\opt6x.exe C:\\Users\\gtbldadm\\AppData\\Local\\Temp\\012727 C:\\Users\\gtbldadm\\AppData\\Local\\Temp\\012729 
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
;*   Local Frame Size  : 8 Args + 204 Auto + 56 Save = 268 byte               *
;******************************************************************************
_main:
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 14
           STW     .D2T1   A11,*SP--(8)      ; |111| 
           STW     .D2T1   A10,*SP--(8)      ; |111| 
           STDW    .D2T2   B13:B12,*SP--     ; |111| 
           STDW    .D2T2   B11:B10,*SP--     ; |111| 
           STDW    .D2T1   A15:A14,*SP--     ; |111| 
           STDW    .D2T1   A13:A12,*SP--     ; |111| 
           STW     .D2T2   B3,*SP--(8)       ; |111| 

           MVKL    .S1     $C$SL1+0,A4
||         ADDK    .S2     -216,SP           ; |111| 

           CALLP   .S2     _driver_init,B3
||         MVKH    .S1     $C$SL1+0,A4

$C$RL0:    ; CALL OCCURS {_driver_init} {0}  ; |119| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 3

           MVK     .S2     0xc9,B4
||         MVKL    .S1     _a,A14

           MVKH    .S1     _a,A14

           CALL    .S1     _exp10            ; |128| 
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
           LDDW    .D1T1   *A10++,A5:A4      ; |128| 
           ADDKPC  .S2     $C$RL1,B3,3       ; |128| 
$C$RL1:    ; CALL OCCURS {_exp10} {0}        ; |128| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 9

           MVKL    .S2     _output,B4
||         SUB     .L1     A11,1,A0          ; |127| 
||         SUB     .S1     A11,1,A11         ; |127| 

           MVKH    .S2     _output,B4
           LDW     .D2T2   *B4,B4            ; |128| 
   [ A0]   BNOP    .S1     $C$L1,3           ; |127| 

           ADD     .L2     B10,B4,B4         ; |128| 
||         ADD     .S2     8,B10,B10         ; |127| 

   [ A0]   CALL    .S1     _exp10            ; |128| 
||         STDW    .D2T1   A5:A4,*B4         ; |128| 
|| [!A0]   MVKL    .S2     _output,B4

           ; BRANCHCC OCCURS {$C$L1}         ; |127| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 4

           MVKH    .S2     _output,B4
||         ZERO    .L2     B10
||         MV      .L1     A14,A11

           ADD     .L2     4,B4,B5
||         MVK     .S2     0xc9,B4

           STW     .D2T2   B5,*+SP(20)

           MV      .L1X    B4,A10
||         CALL    .S1     _exp10dp          ; |131| 

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L2:    
;          EXCLUSIVE CPU CYCLES: 5
           LDDW    .D1T1   *A11++,A5:A4      ; |131| 
           ADDKPC  .S2     $C$RL2,B3,3       ; |131| 
$C$RL2:    ; CALL OCCURS {_exp10dp} {0}      ; |131| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 12
           LDW     .D2T2   *+SP(20),B4       ; |131| 
           SUB     .L1     A10,1,A0          ; |130| 
           SUB     .L1     A10,1,A10         ; |130| 
           NOP             2
           LDW     .D2T2   *B4,B4            ; |131| 
   [ A0]   BNOP    .S1     $C$L2,3           ; |130| 

           ADD     .L2     B10,B4,B4         ; |131| 
||         ADD     .S2     8,B10,B10         ; |130| 

   [ A0]   CALL    .S1     _exp10dp          ; |131| 
||         STDW    .D2T1   A5:A4,*B4         ; |131| 

           ; BRANCHCC OCCURS {$C$L2}         ; |130| 
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
||         CALL    .S1     _exp10dp_c        ; |134| 

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L3:    
;          EXCLUSIVE CPU CYCLES: 5
           LDDW    .D1T1   *A10++,A5:A4      ; |134| 
           ADDKPC  .S2     $C$RL3,B3,3       ; |134| 
$C$RL3:    ; CALL OCCURS {_exp10dp_c} {0}    ; |134| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 12

           LDW     .D2T2   *+SP(24),B4       ; |134| 
||         SUB     .L1     A11,1,A0          ; |133| 
||         SUB     .S1     A11,1,A11         ; |133| 

   [!A0]   LDW     .D2T2   *+SP(24),B23      ; |53| 
|| [!A0]   MVKL    .S1     0xc0733a71,A3
|| [!A0]   MVKL    .S2     0x5c610ca8,B24
|| [!A0]   ZERO    .L1     A30
|| [!A0]   ZERO    .L2     B11

   [!A0]   MVKH    .S1     0xc0733a71,A3
|| [!A0]   MVKL    .S2     0xbf2bd010,B25
|| [!A0]   ZERO    .L2     B30

   [!A0]   MVKL    .S1     0x652b82fe,A24
|| [!A0]   MVKL    .S2     0x6f58dc1c,B26

   [!A0]   MVKL    .S1     0x3ff71547,A25
|| [!A0]   MVKL    .S2     0x3ef152a4,B27

           LDW     .D2T2   *B4,B4            ; |134| 
|| [!A0]   MVKL    .S1     0x6fde3809,A26
|| [!A0]   MVKL    .S2     0x6fb3f6e0,B28

   [!A0]   MVKL    .S1     0x3f403f99,A27
|| [ A0]   B       .S2     $C$L3             ; |133| 

   [!A0]   MVKL    .S1     0x714251b3,A28
|| [!A0]   MVKL    .S2     0x3f7c70e4,B29

   [!A0]   MVKL    .S1     0x3fac718e,A29
|| [!A0]   MVKL    .S2     0x510ea7e7,B31

   [!A0]   MVKL    .S1     0x46f72a46,A31

           ADD     .L2     B10,B4,B4         ; |134| 
||         ADD     .S2     8,B10,B10         ; |133| 

           STDW    .D2T1   A5:A4,*B4         ; |134| 
|| [!A0]   MVKL    .S2     0x40734413,B4
|| [ A0]   CALL    .S1     _exp10dp_c        ; |134| 

           ; BRANCHCC OCCURS {$C$L3}         ; |133| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 20

           STW     .D2T1   A3,*+SP(96)       ; |53| 
||         SET     .S1     A30,0x15,0x1d,A3
||         MVKH    .S2     0x510ea7e7,B31
||         ADD     .L2     4,B23,B5
||         ZERO    .L1     A7                ; |53| 
||         ZERO    .D1     A10               ; |53| 

           MVKL    .S1     0x3fe63000,A11
||         MVKH    .S2     0x3fd00000,B30
||         STW     .D2T1   A3,*+SP(64)       ; |53| 
||         ZERO    .L2     B18               ; |53| 
||         ZERO    .L1     A17               ; |53| 
||         ZERO    .D1     A20               ; |53| 

           MVKL    .S1     0x40026bb1,A13
||         MVKH    .S2     0x3f7c70e4,B29
||         LDW     .D2T1   *B5,A3
||         ZERO    .L2     B12               ; |53| 
||         MV      .L1     A14,A6

           MVKL    .S1     0xbbb55516,A12
||         MVKH    .S2     0x6fb3f6e0,B28
||         STW     .D2T2   B31,*+SP(84)      ; |53| 
||         ZERO    .L2     B10               ; |53| 

           MVKH    .S1     0x46f72a46,A31
||         MVKH    .S2     0x3ef152a4,B27
||         STW     .D2T2   B30,*+SP(44)      ; |53| 

           MVKH    .S1     0x3fac718e,A29
||         MVKH    .S2     0x6f58dc1c,B26
||         STW     .D2T2   B29,*+SP(52)      ; |53| 

           MVKH    .S1     0x714251b3,A28
||         MVKH    .S2     0xbf2bd010,B25
||         STW     .D2T1   A31,*+SP(92)      ; |53| 

           MVKH    .S1     0x3f403f99,A27
||         MVKH    .S2     0x5c610ca8,B24
||         STW     .D2T2   B28,*+SP(48)      ; |53| 

           MVKH    .S1     0x6fde3809,A26
||         SET     .S2     B11,0x1e,0x1e,B11
||         STW     .D2T1   A29,*+SP(72)      ; |53| 

           MVKH    .S1     0x3ff71547,A25
||         MVKH    .S2     0x40734413,B4
||         STW     .D2T2   B27,*+SP(60)      ; |53| 
||         MV      .L2     B11,B13           ; |53| 

           MVKH    .S1     0x652b82fe,A24
||         STW     .D2T1   A28,*+SP(68)      ; |53| 
||         MVK     .S2     0xc9,B1

           MVKH    .S1     0x3fe63000,A11
||         STW     .D2T2   B26,*+SP(56)      ; |53| 

           MVKH    .S1     0x40026bb1,A13
||         STW     .D2T1   A27,*+SP(80)      ; |53| 

           MVKH    .S1     0xbbb55516,A12
||         STW     .D2T2   B25,*+SP(40)      ; |53| 

           STW     .D2T1   A26,*+SP(76)      ; |53| 
           STW     .D2T2   B24,*+SP(36)      ; |53| 
           STW     .D2T1   A25,*+SP(32)      ; |53| 

           STW     .D2T1   A24,*+SP(28)      ; |53| 
||         ZERO    .L1     A24               ; |53| 

           STW     .D2T2   B5,*+SP(16)
           STW     .D2T2   B4,*+SP(88)       ; |53| 
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*
;*      Disqualified loop: Did not find partition
;*----------------------------------------------------------------------------*
$C$L4:    
;          EXCLUSIVE CPU CYCLES: 5
           LDDW    .D1T1   *A6++,A5:A4       ; |53| 
           NOP             4
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 228
           MPYDP   .M1     A13:A12,A5:A4,A19:A18 ; |53| 
           LDW     .D2T1   *+SP(28),A8
           LDW     .D2T1   *+SP(32),A9
           LDW     .D2T2   *+SP(36),B4
           LDW     .D2T2   *+SP(40),B5
           MV      .L2     B13,B19           ; |53| 
           SUB     .L2     B1,1,B1           ; |136| 
           NOP             3
           MPYDP   .M1     A9:A8,A19:A18,A9:A8 ; |53| 
           NOP             9
           DPINT   .L1     A9:A8,A16         ; |53| 
           NOP             3
           INTDP   .L1     A16,A9:A8         ; |53| 
           NOP             4
           MPYDP   .M1     A11:A10,A9:A8,A23:A22 ; |53| 
           MPYDP   .M2X    B5:B4,A9:A8,B5:B4 ; |53| 
           NOP             8
           SUBDP   .L1     A19:A18,A23:A22,A9:A8 ; |53| 
           LDW     .D2T1   *+SP(72),A19
           LDW     .D2T1   *+SP(68),A18
           NOP             5
           SUBDP   .L2X    A9:A8,B5:B4,B9:B8 ; |53| 
           LDW     .D2T2   *+SP(60),B5
           LDW     .D2T2   *+SP(56),B4
           LDW     .D2T1   *+SP(80),A9
           LDW     .D2T1   *+SP(76),A8
           NOP             2
           MPYDP   .M2     B9:B8,B9:B8,B7:B6 ; |53| 
           NOP             9
           MPYDP   .M2     B5:B4,B7:B6,B17:B16 ; |53| 
           LDW     .D2T2   *+SP(52),B5       ; |53| 
           MPYDP   .M1X    A9:A8,B7:B6,A9:A8 ; |53| 
           LDW     .D2T2   *+SP(48),B4       ; |53| 
           NOP             6
           ADDDP   .L2     B5:B4,B17:B16,B5:B4 ; |53| 
           NOP             3
           ADDDP   .L1     A19:A18,A9:A8,A9:A8 ; |53| 
           LDW     .D2T1   *+SP(64),A19
           MV      .L1     A17,A18
           MPYDP   .M2     B7:B6,B5:B4,B5:B4 ; |53| 
           NOP             3
           MPYDP   .M1X    B7:B6,A9:A8,A9:A8 ; |53| 
           LDW     .D2T2   *+SP(44),B7       ; |53| 
           MV      .L1     A19,A21           ; |53| 
           MV      .L2X    A24,B6            ; |53| 
           NOP             2
           ADDDP   .L2     B7:B6,B5:B4,B5:B4 ; |53| 
           NOP             6
           MPYDP   .M2     B9:B8,B5:B4,B17:B16 ; |53| 
           ADDDP   .L1     A19:A18,A9:A8,A9:A8 ; |53| 
           NOP             8
           SUBDP   .L2X    A9:A8,B17:B16,B7:B6 ; |53| 
           MV      .L1     A7,A8             ; |53| 
           MVK     .S1     0x400,A9
           NOP             4
           RCPDP   .S2     B7:B6,B5:B4       ; |53| 
           NOP             1
           MPYDP   .M2     B5:B4,B7:B6,B9:B8 ; |53| 
           NOP             9
           SUBDP   .L2     B11:B10,B9:B8,B9:B8 ; |53| 
   [!B1]   MVKL    .S2     _output,B10
   [!B1]   MVKH    .S2     _output,B10
           NOP             4
           MPYDP   .M2     B5:B4,B9:B8,B9:B8 ; |53| 
           NOP             9
           MPYDP   .M2     B9:B8,B7:B6,B5:B4 ; |53| 
           NOP             9
           SUBDP   .L2     B13:B12,B5:B4,B5:B4 ; |53| 
           NOP             6
           MPYDP   .M2     B9:B8,B5:B4,B9:B8 ; |53| 
           LDW     .D2T2   *+SP(88),B5
           LDW     .D2T2   *+SP(84),B4
           NOP             5
           CMPGTDP .S2X    A5:A4,B5:B4,B0    ; |53| 
           NOP             1
   [!B0]   MPYDP   .M2     B9:B8,B7:B6,B5:B4 ; |53| 
   [!B0]   ADD     .L1     A9,A16,A9         ; |53| 
   [!B0]   SHL     .S1     A9,20,A9          ; |53| 
   [ B0]   MVK     .L1     0xffffffff,A8     ; |53| 
   [ B0]   MVKL    .S1     0x7fefffff,A9
   [ B0]   MVKH    .S1     0x7fefffff,A9
           NOP             4
   [!B0]   SUBDP   .L2     B19:B18,B5:B4,B5:B4 ; |53| 
           NOP             6
   [!B0]   MPYDP   .M2     B9:B8,B5:B4,B5:B4 ; |53| 
           NOP             9
   [!B0]   MPYDP   .M2     B17:B16,B5:B4,B5:B4 ; |53| 
           NOP             9
           NOP             1
   [!B0]   ADDDP   .L1X    A21:A20,B5:B4,A19:A18 ; |53| 
           NOP             6

   [!B0]   MPYDP   .M1     A9:A8,A19:A18,A9:A8 ; |53| 
||         LDW     .D2T1   *+SP(96),A19

           LDW     .D2T1   *+SP(92),A18
           NOP             4

   [ B1]   BNOP    .S2     $C$L4,2           ; |136| 
||         CMPLTDP .S1     A5:A4,A19:A18,A0  ; |53| 

   [ A0]   ZERO    .L1     A5:A4             ; |53| 

   [!A0]   MV      .L1     A9,A5             ; |53| 
|| [!A0]   MV      .S1     A8,A4             ; |53| 

   [!B1]   CALL    .S1     _exp10dp_v        ; |139| 
||         STDW    .D1T1   A5:A4,*A3++       ; |53| 

           ; BRANCHCC OCCURS {$C$L4}         ; |136| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           LDW     .D2T2   *+B10(16),B4      ; |139| 
           MV      .L1     A14,A4            ; |139| 
           MVK     .S1     0xc9,A6           ; |139| 
           ADDKPC  .S2     $C$RL4,B3,1       ; |139| 
$C$RL4:    ; CALL OCCURS {_exp10dp_v} {0}    ; |139| 
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
||         MVK     .L1     0x1,A8            ; |66| 

$C$RL5:    ; CALL OCCURS {_isequal} {0}      ; |66| 
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
||         MVK     .L1     0x1,A8            ; |67| 

$C$RL6:    ; CALL OCCURS {_isequal} {0}      ; |67| 
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
||         MVK     .L1     0x1,A8            ; |68| 

$C$RL7:    ; CALL OCCURS {_isequal} {0}      ; |68| 

           LDW     .D2T1   *+SP(16),A3       ; |68| 
||         MVKL    .S2     _fcn_pass,B4

           MVKL    .S2     0xd9d7bdbb,B6
           MVKL    .S2     0x3ddb7cdf,B7
           MVKH    .S2     _fcn_pass,B4

           MV      .L2     B10,B31           ; |69| 
||         STW     .D2T1   A4,*+B4(12)       ; |68| 
||         MVKH    .S2     0xd9d7bdbb,B6

           ADD     .L1     4,A3,A5
||         LDW     .D2T1   *B31,A4           ; |69| 
||         MVKH    .S2     0x3ddb7cdf,B7

           CALLP   .S2     _isequal,B3
||         LDW     .D1T2   *A5,B4            ; |69| 
||         STW     .D2T1   A5,*+SP(100)
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
           STW     .D2T2   B4,*+SP(104)      ; |69| 

   [!A0]   B       .S1     $C$L5             ; |72| 
|| [ A0]   LDW     .D2T2   *B4,B0            ; |72| 

   [!A0]   CALL    .S1     _print_test_results ; |143| 
   [ A0]   ADD     .L2     4,B4,B4
   [!A0]   MVKL    .S1     _all_pass,A3
   [!A0]   MV      .L2     B12,B4
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

   [!A0]   MV      .L2     B12,B4
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           CALL    .S1     _print_test_results ; |143| 
           MVKL    .S1     _all_pass,A3
           MVKH    .S1     _all_pass,A3
           NOP             2
;** --------------------------------------------------------------------------*
$C$L5:    
;          EXCLUSIVE CPU CYCLES: 1

           MVK     .L1     0x1,A4            ; |143| 
||         STW     .D1T2   B4,*A3            ; |72| 
||         ADDKPC  .S2     $C$RL9,B3,0       ; |143| 

$C$RL9:    ; CALL OCCURS {_print_test_results} {0}  ; |143| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 57
           LDW     .D2T1   *+SP(32),A9
           LDW     .D2T1   *+SP(28),A2
           LDW     .D2T1   *+SP(56),A18      ; |53| 
           LDW     .D2T1   *+SP(60),A19      ; |53| 
           LDW     .D2T1   *+SP(48),A20      ; |53| 
           LDW     .D2T1   *+SP(52),A21      ; |53| 
           LDW     .D2T1   *+SP(44),A22      ; |53| 
           LDW     .D2T1   *+SP(76),A23      ; |53| 
           LDW     .D2T1   *+SP(80),A24      ; |53| 
           LDW     .D2T1   *+SP(68),A25      ; |53| 
           LDW     .D2T1   *+SP(72),A26      ; |53| 
           LDW     .D2T1   *+SP(64),A27      ; |53| 
           LDW     .D2T1   *+SP(84),A28      ; |92| 
           LDW     .D2T1   *+SP(88),A29      ; |92| 
           LDW     .D2T1   *+SP(92),A30      ; |92| 
           LDW     .D2T1   *+SP(96),A31      ; |92| 

           LDW     .D2T1   *+SP(16),A3       ; |151| 
||         ZERO    .L2     B26               ; |53| 

           ZERO    .L2     B28               ; |53| 
||         STW     .D2T2   B26,*+SP(180)     ; |151| 

           STW     .D2T2   B28,*+SP(164)     ; |152| 
           STW     .D2T2   B11,*+SP(184)     ; |53| 
           STW     .D2T2   B11,*+SP(176)     ; |53| 

           ZERO    .L1     A1                ; |53| 
||         STW     .D2T2   B11,*+SP(168)     ; |53| 

           ZERO    .L2     B30               ; |53| 
||         STW     .D2T1   A1,*+SP(140)      ; |151| 

           MVK     .L2     0x7,B31
||         STW     .D2T2   B30,*+SP(116)     ; |153| 

           MVKL    .S2     _a_sc,B4
||         MVK     .L2     0xffffffff,B7     ; |156| 
||         STW     .D2T2   B31,*+SP(12)      ; |154| 

           MVKH    .S2     _a_sc,B4
||         STW     .D2T1   A9,*+SP(112)
||         MV      .L2     B7,B6             ; |156| 

           ZERO    .L1     A5
||         STDW    .D2T2   B7:B6,*+B4(48)    ; |156| 

           ZERO    .L2     B9
||         MVKH    .S1     0xbff00000,A5
||         ZERO    .L1     A4                ; |155| 
||         LDW     .D2T2   *+SP(36),B10

           SET     .S2     B9,0x14,0x1d,B9
||         ZERO    .L2     B8                ; |154| 
||         STDW    .D2T1   A5:A4,*+B4(40)    ; |155| 

           STDW    .D2T2   B9:B8,*+B4(32)    ; |154| 
           STW     .D2T1   A2,*+SP(108)
           STW     .D2T1   A18,*+SP(132)     ; |53| 
           STW     .D2T1   A19,*+SP(136)     ; |53| 
           STW     .D2T1   A20,*+SP(124)     ; |53| 
           STW     .D2T1   A21,*+SP(128)     ; |53| 
           STW     .D2T1   A22,*+SP(120)     ; |53| 
           STW     .D2T1   A23,*+SP(156)     ; |53| 
           STW     .D2T1   A24,*+SP(160)     ; |53| 
           STW     .D2T1   A25,*+SP(148)     ; |53| 
           STW     .D2T1   A26,*+SP(152)     ; |53| 
           STW     .D2T1   A27,*+SP(144)     ; |53| 
           STW     .D2T1   A27,*+SP(192)     ; |53| 
           STW     .D2T1   A28,*+SP(196)     ; |92| 
           STW     .D2T1   A29,*+SP(200)     ; |92| 
           STW     .D2T1   A30,*+SP(204)     ; |92| 
           STW     .D2T1   A31,*+SP(208)     ; |92| 

           ZERO    .L2     B26               ; |92| 
||         STW     .D2T1   A3,*+SP(212)      ; |92| 

           MV      .L1X    B4,A14            ; |150| 
||         ZERO    .L2     B28               ; |53| 
||         STW     .D2T2   B26,*+SP(188)     ; |151| 

           ZERO    .L1     A17:A16           ; |150| 
||         ZERO    .L2     B5
||         ZERO    .S1     A7
||         STW     .D2T2   B28,*+SP(172)     ; |152| 

           STDW    .D2T1   A17:A16,*B4       ; |150| 
||         MV      .L2X    A14,B6            ; |154| 
||         SET     .S2     B5,0x14,0x1e,B5
||         MVKH    .S1     0xfff00000,A7
||         ZERO    .L1     A6                ; |153| 

           MV      .L2X    A14,B29           ; |153| 
||         ZERO    .L1     A9
||         ZERO    .S2     B4                ; |152| 
||         STDW    .D2T1   A7:A6,*+B6(24)    ; |153| 

           MV      .L2     B29,B27           ; |152| 
||         MVKH    .S1     0x80000000,A9
||         ZERO    .L1     A8                ; |151| 
||         STDW    .D2T2   B5:B4,*+B29(16)   ; |152| 

           STDW    .D2T1   A9:A8,*+B27(8)    ; |151| 
||         CALL    .S1     _exp10            ; |158| 

           LDDW    .D1T1   *A14,A5:A4        ; |158| 
||         LDW     .D2T2   *+SP(40),B11      ; |53| 

           ZERO    .L2     B12
           ZERO    .L1     A10               ; |53| 
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
$C$L6:    
;          EXCLUSIVE CPU CYCLES: 1
           ADDKPC  .S2     $C$RL10,B3,0      ; |158| 
$C$RL10:   ; CALL OCCURS {_exp10} {0}        ; |158| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 30
           MVKL    .S2     _output,B4
           MVKH    .S2     _output,B4
           LDW     .D2T2   *B4,B4            ; |158| 
           NOP             4
           ADD     .L2     B12,B4,B4         ; |158| 
           STDW    .D2T1   A5:A4,*B4         ; |158| 

           CALLP   .S2     _exp10dp,B3
||         LDDW    .D1T1   *A14,A5:A4        ; |159| 

$C$RL11:   ; CALL OCCURS {_exp10dp} {0}      ; |159| 
           MVKL    .S2     _output,B4
           MVKH    .S2     _output,B4
           LDW     .D2T2   *+B4(4),B4        ; |159| 
           NOP             4
           ADD     .L2     B12,B4,B4         ; |159| 
           STDW    .D2T1   A5:A4,*B4         ; |159| 

           CALLP   .S2     _exp10dp_c,B3
||         LDDW    .D1T1   *A14,A5:A4        ; |160| 

$C$RL12:   ; CALL OCCURS {_exp10dp_c} {0}    ; |160| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 249
           MVKL    .S2     _output,B4
           MVKH    .S2     _output,B4
           LDW     .D2T2   *+B4(8),B4        ; |160| 
           LDW     .D2T2   *+SP(132),B8
           LDW     .D2T2   *+SP(136),B9
           LDW     .D2T2   *+SP(128),B17     ; |53| 
           LDW     .D2T2   *+SP(124),B16     ; |53| 
           ADD     .L2     B12,B4,B4         ; |160| 
           STDW    .D2T1   A5:A4,*B4         ; |160| 
           LDDW    .D1T1   *A14++,A7:A6      ; |161| 
           LDW     .D2T1   *+SP(112),A5
           LDW     .D2T1   *+SP(108),A4
           MVK     .S1     0x400,A31
           LDW     .D2T2   *+SP(212),B31
           MPYDP   .M1     A13:A12,A7:A6,A9:A8 ; |53| 
           NOP             9
           MPYDP   .M1     A5:A4,A9:A8,A5:A4 ; |53| 
           NOP             9
           DPINT   .L1     A5:A4,A3          ; |53| 
           NOP             3
           INTDP   .L1     A3,A5:A4          ; |53| 
           ADD     .L1     A31,A3,A3         ; |92| 
           NOP             3
           MPYDP   .M1     A11:A10,A5:A4,A17:A16 ; |53| 
           MPYDP   .M2X    B11:B10,A5:A4,B5:B4 ; |53| 
           NOP             8
           SUBDP   .L1     A9:A8,A17:A16,A5:A4 ; |53| 
           NOP             7
           SUBDP   .L2X    A5:A4,B5:B4,B7:B6 ; |53| 
           LDW     .D2T1   *+SP(160),A5
           LDW     .D2T1   *+SP(156),A4
           NOP             4
           MPYDP   .M2     B7:B6,B7:B6,B5:B4 ; |53| 
           NOP             9
           MPYDP   .M2     B9:B8,B5:B4,B9:B8 ; |53| 
           MPYDP   .M1X    A5:A4,B5:B4,A9:A8 ; |53| 
           LDW     .D2T1   *+SP(152),A5
           LDW     .D2T1   *+SP(148),A4
           NOP             6
           ADDDP   .L2     B17:B16,B9:B8,B9:B8 ; |53| 
           ADDDP   .L1     A5:A4,A9:A8,A5:A4 ; |53| 
           LDW     .D2T1   *+SP(144),A9
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
           NOP             9
           SUBDP   .L2X    A5:A4,B9:B8,B7:B6 ; |53| 
           MV      .S2     B13,B5            ; |53| 
           MV      .L2X    A10,B4            ; |53| 
           SHL     .S1     A3,20,A5          ; |92| 
           MV      .L1     A8,A4             ; |92| 
           LDW     .D2T1   *+SP(204),A8      ; |161| 
           NOP             1
           RCPDP   .S2     B7:B6,B17:B16     ; |53| 
           NOP             1
           MPYDP   .M2     B17:B16,B7:B6,B19:B18 ; |53| 
           NOP             9
           SUBDP   .L2     B5:B4,B19:B18,B5:B4 ; |53| 
           NOP             6
           MPYDP   .M2     B17:B16,B5:B4,B17:B16 ; |53| 
           NOP             9
           MPYDP   .M2     B17:B16,B7:B6,B19:B18 ; |53| 
           MV      .L2X    A10,B4            ; |53| 
           MV      .L2     B13,B5            ; |53| 
           NOP             7
           SUBDP   .L2     B5:B4,B19:B18,B5:B4 ; |53| 
           NOP             6
           MPYDP   .M2     B5:B4,B17:B16,B17:B16 ; |53| 
           NOP             9
           MPYDP   .M2     B17:B16,B7:B6,B7:B6 ; |53| 
           MV      .L2X    A10,B4            ; |53| 
           MV      .L2     B13,B5            ; |53| 
           NOP             7
           SUBDP   .L2     B5:B4,B7:B6,B5:B4 ; |53| 
           NOP             6
           MPYDP   .M2     B17:B16,B5:B4,B5:B4 ; |53| 
           NOP             9
           MPYDP   .M2     B9:B8,B5:B4,B7:B6 ; |53| 
           NOP             7
           MV      .L2X    A9,B5             ; |53| 
           MV      .L2X    A10,B4            ; |53| 
           ADDDP   .L2     B5:B4,B7:B6,B5:B4 ; |92| 
           LDW     .D2T1   *+SP(208),A9      ; |161| 
           LDW     .D2T2   *B31,B6           ; |161| 
           NOP             5

           MPYDP   .M1X    A5:A4,B5:B4,A5:A4 ; |92| 
||         LDW     .D2T2   *+SP(200),B5      ; |161| 

           LDW     .D2T2   *+SP(196),B4      ; |161| 
           CMPLTDP .S1     A7:A6,A9:A8,A0    ; |100| 
           ADD     .L2     B12,B6,B30        ; |161| 
           ADD     .L2     8,B12,B12         ; |157| 
           NOP             1

           CMPGTDP .S2X    A7:A6,B5:B4,B0    ; |95| 
||         LDW     .D2T2   *+SP(12),B5       ; |101| 

           NOP             3

   [ B0]   MVKL    .S1     0x7fefffff,A5
|| [ B0]   MVK     .L1     0xffffffff,A4     ; |96| 

   [ B0]   MVKH    .S1     0x7fefffff,A5
||         SUB     .L2     B5,1,B4           ; |157| 

   [ A0]   ZERO    .L1     A5:A4             ; |101| 
||         SUB     .S1X    B5,1,A0           ; |157| 
||         STW     .D2T2   B4,*+SP(12)       ; |161| 

   [ A0]   B       .S1     $C$L6             ; |157| 
|| [!A0]   MVKL    .S2     _output,B10
||         STDW    .D2T1   A5:A4,*B30        ; |161| 

   [ A0]   CALL    .S1     _exp10            ; |158| 
|| [!A0]   MVKH    .S2     _output,B10
|| [ A0]   LDDW    .D1T1   *A14,A5:A4        ; |158| 

   [!A0]   CALL    .S1     _exp10dp_v        ; |163| 
   [!A0]   LDW     .D2T2   *+B10(16),B4      ; |163| 
   [!A0]   MVKL    .S1     _a_sc,A4
           NOP             1
           ; BRANCHCC OCCURS {$C$L6}         ; |157| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 2
           MVKH    .S1     _a_sc,A4

           MVK     .L1     0x7,A6            ; |163| 
||         ADDKPC  .S2     $C$RL13,B3,0      ; |163| 

$C$RL13:   ; CALL OCCURS {_exp10dp_v} {0}    ; |163| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 46
           MVKL    .S2     0x3ddb7cdf,B7
           MVKL    .S2     0xd9d7bdbb,B6
           MVKH    .S2     0x3ddb7cdf,B7

           LDW     .D2T1   *B10,A4           ; |66| 
||         MVKH    .S2     0xd9d7bdbb,B6

           CALLP   .S2     _isequal,B3
||         LDW     .D2T2   *+B10(4),B4       ; |66| 
||         MVK     .L1     0x7,A6            ; |66| 
||         MVK     .S1     0x1,A8            ; |66| 

$C$RL14:   ; CALL OCCURS {_isequal} {0}      ; |66| 
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
||         MVK     .L1     0x7,A6            ; |67| 
||         MVK     .S1     0x1,A8            ; |67| 

$C$RL15:   ; CALL OCCURS {_isequal} {0}      ; |67| 
           MVKL    .S2     _fcn_pass,B5
           MVKL    .S2     0x3ddb7cdf,B7
           MVKL    .S2     0xd9d7bdbb,B6
           MVKH    .S2     _fcn_pass,B5
           MVKH    .S2     0x3ddb7cdf,B7

           MV      .L1X    B10,A3            ; |67| 
||         STW     .D2T1   A4,*+B5(8)        ; |67| 
||         MVKH    .S2     0xd9d7bdbb,B6

           CALLP   .S2     _isequal,B3
||         LDW     .D1T1   *A3,A4            ; |68| 
||         LDW     .D2T2   *+B10(12),B4      ; |68| 
||         MVK     .L1     0x7,A6            ; |68| 
||         MVK     .S1     0x1,A8            ; |68| 

$C$RL16:   ; CALL OCCURS {_isequal} {0}      ; |68| 

           LDW     .D2T1   *+SP(100),A3      ; |68| 
||         MVKL    .S2     _fcn_pass,B4

           MVKL    .S2     0xd9d7bdbb,B6
           MVKL    .S2     0x3ddb7cdf,B7
           MVKH    .S2     _fcn_pass,B4

           STW     .D2T1   A4,*+B4(12)       ; |68| 
||         MVKH    .S2     0xd9d7bdbb,B6

           MV      .L2     B10,B31           ; |69| 
||         STW     .D2T1   A3,*+SP(108)      ; |68| 
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
||         LDW     .D2T1   *+SP(104),A3

           LDW     .D2T2   *B4,B0            ; |72| 
           MVKL    .S2     _fcn_pass,B31
           MVKH    .S2     _fcn_pass,B31
           STW     .D2T1   A4,*+B31(16)      ; |69| 
           STW     .D2T1   A3,*+SP(116)      ; |72| 

   [ B0]   MV      .L2X    A3,B4
|| [!B0]   MVKL    .S1     _all_pass,A4
|| [!B0]   B       .S2     $C$L7             ; |72| 
||         MV      .D2     B0,B1             ; guard predicate rewrite
|| [!B0]   MV      .L1     A10,A3

   [!B0]   CALL    .S2     _print_test_results ; |167| 
|| [!B0]   MVKH    .S1     _all_pass,A4
|| [ B0]   LDW     .D2T2   *B4,B0            ; |72| 

           STW     .D2T1   A15,*+SP(112)     ; |69| 
   [ B1]   ADD     .L2     4,B4,B4
           NOP             2
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
||         MVK     .S1     0x1,A3            ; |72| 

   [!A0]   MV      .L1     A10,A3
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           CALL    .S1     _print_test_results ; |167| 
           MVKL    .S1     _all_pass,A4
           MVKH    .S1     _all_pass,A4
           NOP             2
;** --------------------------------------------------------------------------*
$C$L7:    
;          EXCLUSIVE CPU CYCLES: 1

           STW     .D1T1   A3,*A4            ; |72| 
||         MVK     .L1     0x3,A4            ; |167| 
||         ADDKPC  .S2     $C$RL18,B3,0      ; |167| 

$C$RL18:   ; CALL OCCURS {_print_test_results} {0}  ; |167| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 29
           LDW     .D2T1   *+SP(92),A31      ; |92| 
           LDW     .D2T1   *+SP(84),A29      ; |92| 
           STW     .D2T2   B13,*+SP(120)     ; |53| 
           STW     .D2T2   B13,*+SP(92)      ; |53| 
           STW     .D2T2   B13,*+SP(84)      ; |53| 
           LDW     .D2T2   *+SP(56),B12      ; |53| 
           LDW     .D2T1   *+SP(88),A30      ; |92| 
           LDW     .D2T1   *+SP(96),A3       ; |92| 
           LDW     .D2T1   *+SP(64),A28      ; |53| 
           LDW     .D2T2   *+SP(16),B11      ; |176| 

           LDW     .D2T1   *+SP(28),A27
||         MV      .L2X    A10,B7

           LDW     .D2T2   *+SP(60),B13      ; |53| 
||         MV      .L2     B7,B30            ; |170| 

           STW     .D2T2   B30,*+SP(124)     ; |170| 
||         MVK     .S2     0x777,B29

           STW     .D2T2   B29,*+SP(12)
||         MVKL    .S2     0xcccccccd,B31
||         MV      .L1     A10,A26

           STW     .D2T1   A26,*+SP(56)      ; |170| 
||         MVKL    .S2     0xc000cccc,B5
||         MV      .L2X    A10,B6

           STW     .D2T2   B6,*+SP(88)
||         MVKH    .S2     0xcccccccd,B31

           STW     .D2T2   B31,*+SP(148)     ; |176| 
||         MVKH    .S2     0xc000cccc,B5

           STW     .D2T2   B5,*+SP(152)      ; |176| 
||         MV      .L2     B7,B28            ; |170| 

           STW     .D2T2   B28,*+SP(96)      ; |170| 
           STW     .D2T1   A28,*+SP(128)     ; |53| 
           STW     .D2T1   A29,*+SP(132)     ; |92| 
           STW     .D2T1   A30,*+SP(136)     ; |92| 
           STW     .D2T1   A31,*+SP(140)     ; |92| 
           STW     .D2T1   A3,*+SP(144)      ; |92| 

           STW     .D2T1   A27,*+SP(16)
||         MVKL    .S2     _a_ext,B4
||         ZERO    .L1     A5

           STW     .D2T2   B7,*+SP(60)
||         SET     .S1     A5,0x14,0x14,A5
||         MVKH    .S2     _a_ext,B4
||         MV      .L1     A10,A4

           STDW    .D2T1   A5:A4,*B4         ; |170| 
||         MV      .L2X    A10,B30

           CALL    .S1     _exp10            ; |172| 
||         STW     .D2T2   B30,*+SP(28)
||         MV      .L1X    B4,A14            ; |170| 

           LDDW    .D1T1   *A14,A5:A4        ; |172| 
||         MV      .L2X    A10,B10

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
;          EXCLUSIVE CPU CYCLES: 4
           ADDKPC  .S2     $C$RL19,B3,3      ; |172| 
$C$RL19:   ; CALL OCCURS {_exp10} {0}        ; |172| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 30
           MVKL    .S2     _output,B4
           MVKH    .S2     _output,B4
           LDW     .D2T2   *B4,B4            ; |172| 
           NOP             4
           ADD     .L2     B10,B4,B4         ; |172| 
           STDW    .D2T1   A5:A4,*B4         ; |172| 

           CALLP   .S2     _exp10dp,B3
||         LDDW    .D1T1   *A14,A5:A4        ; |173| 

$C$RL20:   ; CALL OCCURS {_exp10dp} {0}      ; |173| 
           MVKL    .S2     _output,B4
           MVKH    .S2     _output,B4
           LDW     .D2T2   *+B4(4),B4        ; |173| 
           NOP             4
           ADD     .L2     B10,B4,B4         ; |173| 
           STDW    .D2T1   A5:A4,*B4         ; |173| 

           CALLP   .S2     _exp10dp_c,B3
||         LDDW    .D1T1   *A14,A5:A4        ; |174| 

$C$RL21:   ; CALL OCCURS {_exp10dp_c} {0}    ; |174| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 261
           MVKL    .S2     _output,B4
           MVKH    .S2     _output,B4
           LDW     .D2T2   *+B4(8),B4        ; |174| 
           LDW     .D2T1   *+SP(32),A7
           LDW     .D2T1   *+SP(16),A6
           LDW     .D2T2   *+SP(40),B5
           LDW     .D2T2   *+SP(52),B17      ; |53| 
           ADD     .L2     B10,B4,B4         ; |174| 
           STDW    .D2T1   A5:A4,*B4         ; |174| 
           LDDW    .D1T1   *A14,A5:A4        ; |175| 
           LDW     .D2T2   *+SP(36),B4
           LDW     .D2T2   *+SP(48),B16      ; |53| 
           MVK     .S1     0x400,A31
           LDW     .D2T2   *B11,B31          ; |175| 
           MPYDP   .M1     A13:A12,A5:A4,A9:A8 ; |53| 
           NOP             9
           MPYDP   .M1     A7:A6,A9:A8,A7:A6 ; |53| 
           ADD     .L2     B10,B31,B30       ; |175| 
           ADD     .L2     8,B10,B10         ; |171| 
           NOP             7
           DPINT   .L1     A7:A6,A3          ; |53| 
           NOP             3
           INTDP   .L1     A3,A7:A6          ; |53| 
           ADD     .L1     A31,A3,A3         ; |92| 
           NOP             3
           MPYDP   .M1     A11:A10,A7:A6,A17:A16 ; |53| 
           MPYDP   .M2X    B5:B4,A7:A6,B5:B4 ; |53| 
           NOP             8
           SUBDP   .L1     A9:A8,A17:A16,A7:A6 ; |53| 
           NOP             7
           SUBDP   .L2X    A7:A6,B5:B4,B7:B6 ; |53| 
           LDW     .D2T1   *+SP(80),A7
           LDW     .D2T1   *+SP(76),A6
           NOP             4
           MPYDP   .M2     B7:B6,B7:B6,B5:B4 ; |53| 
           NOP             9
           MPYDP   .M2     B13:B12,B5:B4,B9:B8 ; |53| 
           MPYDP   .M1X    A7:A6,B5:B4,A9:A8 ; |53| 
           LDW     .D2T1   *+SP(72),A7
           LDW     .D2T1   *+SP(68),A6
           NOP             6
           ADDDP   .L2     B17:B16,B9:B8,B9:B8 ; |53| 
           ADDDP   .L1     A7:A6,A9:A8,A7:A6 ; |53| 
           LDW     .D2T1   *+SP(64),A9
           MV      .L1     A10,A8            ; |53| 
           NOP             3
           MPYDP   .M2     B5:B4,B9:B8,B9:B8 ; |53| 
           MPYDP   .M1X    B5:B4,A7:A6,A7:A6 ; |53| 
           LDW     .D2T2   *+SP(44),B5       ; |53| 
           NOP             6
           MV      .L2X    A10,B4            ; |53| 
           ADDDP   .L2     B5:B4,B9:B8,B5:B4 ; |53| 
           ADDDP   .L1     A9:A8,A7:A6,A7:A6 ; |53| 
           NOP             5
           MPYDP   .M2     B7:B6,B5:B4,B19:B18 ; |53| 
           LDW     .D2T2   *+SP(84),B5
           NOP             8
           SUBDP   .L2X    A7:A6,B19:B18,B17:B16 ; |53| 
           MV      .L1     A8,A6             ; |92| 
           MV      .L2X    A10,B4            ; |53| 
           LDW     .D2T1   *+SP(140),A8      ; |175| 
           SHL     .S1     A3,20,A7          ; |92| 
           NOP             2
           RCPDP   .S2     B17:B16,B7:B6     ; |53| 
           NOP             1
           MPYDP   .M2     B7:B6,B17:B16,B9:B8 ; |53| 
           NOP             9
           SUBDP   .L2     B5:B4,B9:B8,B5:B4 ; |53| 
           NOP             6
           MPYDP   .M2     B7:B6,B5:B4,B7:B6 ; |53| 
           LDW     .D2T2   *+SP(92),B5
           NOP             8
           MPYDP   .M2     B7:B6,B17:B16,B9:B8 ; |53| 
           MV      .L2X    A10,B4            ; |53| 
           NOP             8
           SUBDP   .L2     B5:B4,B9:B8,B5:B4 ; |53| 
           NOP             6
           MPYDP   .M2     B5:B4,B7:B6,B7:B6 ; |53| 
           LDW     .D2T2   *+SP(120),B5
           NOP             8
           MPYDP   .M2     B7:B6,B17:B16,B9:B8 ; |53| 
           MV      .L2X    A10,B4            ; |53| 
           NOP             8
           SUBDP   .L2     B5:B4,B9:B8,B5:B4 ; |53| 
           NOP             6
           MPYDP   .M2     B7:B6,B5:B4,B5:B4 ; |53| 
           NOP             9
           MPYDP   .M2     B19:B18,B5:B4,B7:B6 ; |53| 
           NOP             7
           MV      .L2X    A9,B5             ; |53| 
           MV      .L2X    A10,B4            ; |53| 
           ADDDP   .L2     B5:B4,B7:B6,B5:B4 ; |92| 
           LDW     .D2T1   *+SP(144),A9      ; |175| 
           LDW     .D2T2   *+SP(12),B6
           NOP             5
           MPYDP   .M1X    A7:A6,B5:B4,A7:A6 ; |92| 
           LDW     .D2T2   *+SP(136),B5      ; |175| 
           LDW     .D2T2   *+SP(132),B4      ; |175| 
           CMPLTDP .S1     A5:A4,A9:A8,A0    ; |100| 
           SUB     .L2     B6,1,B29          ; |171| 
           SUB     .L1X    B6,1,A2           ; |171| 
   [!A2]   MVKL    .S2     _output,B10
           CMPGTDP .S2X    A5:A4,B5:B4,B0    ; |95| 
           LDW     .D2T2   *+SP(152),B5
           LDW     .D2T2   *+SP(148),B4

   [ B0]   MVKL    .S1     0x7fefffff,A7
|| [ B0]   MVK     .L1     0xffffffff,A6     ; |96| 

   [ B0]   MVKH    .S1     0x7fefffff,A7
   [ A0]   ZERO    .L1     A7:A6             ; |101| 
           STDW    .D2T1   A7:A6,*B30        ; |175| 
           LDDW    .D1T1   *A14,A5:A4        ; |176| 
   [!A2]   MVKH    .S2     _output,B10
           NOP             3
           MPYDP   .M2X    B5:B4,A5:A4,B5:B4 ; |176| 
           NOP             5
   [ A2]   BNOP    .S1     $C$L8,3           ; |171| 

   [ A2]   CALL    .S1     _exp10            ; |172| 
||         STDW    .D1T2   B5:B4,*++A14      ; |176| 

   [!A2]   CALL    .S1     _exp10dp_v        ; |178| 
|| [ A2]   LDDW    .D1T1   *A14,A5:A4        ; |172| 
||         STW     .D2T2   B29,*+SP(12)      ; |176| 

           ; BRANCHCC OCCURS {$C$L8}         ; |171| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           LDW     .D2T2   *+B10(16),B4      ; |178| 
           MVKL    .S1     _a_ext,A4
           MVKH    .S1     _a_ext,A4
           MVK     .S1     0x777,A6          ; |178| 
           ADDKPC  .S2     $C$RL22,B3,0      ; |178| 
$C$RL22:   ; CALL OCCURS {_exp10dp_v} {0}    ; |178| 
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
           LDW     .D2T1   *+SP(100),A3      ; |68| 
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
||         LDW     .D2T2   *+SP(104),B4

           STW     .D2T1   A4,*+B11(16)      ; |69| 
           NOP             3

   [!A0]   B       .S1     $C$L9             ; |72| 
|| [ A0]   LDW     .D2T2   *B4,B0            ; |72| 

   [!A0]   CALL    .S1     _print_test_results ; |182| 
   [ A0]   ADD     .L2     4,B4,B4
   [!A0]   MV      .L1     A10,A3
   [!A0]   MVKL    .S1     _all_pass,A4
   [!A0]   MVKH    .S1     _all_pass,A4
           ; BRANCHCC OCCURS {$C$L9}         ; |72| 
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

   [!A0]   MV      .L1     A10,A3
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           CALL    .S1     _print_test_results ; |182| 
           MVKL    .S1     _all_pass,A4
           MVKH    .S1     _all_pass,A4
           NOP             2
;** --------------------------------------------------------------------------*
$C$L9:    
;          EXCLUSIVE CPU CYCLES: 1

           STW     .D1T1   A3,*A4            ; |72| 
||         MVK     .L1     0x4,A4            ; |182| 
||         ADDKPC  .S2     $C$RL27,B3,0      ; |182| 

$C$RL27:   ; CALL OCCURS {_print_test_results} {0}  ; |182| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 14
           MV      .L2X    A10,B4            ; |114| 

           STW     .D2T2   B4,*+SP(12)       ; |114| 
||         MV      .L2X    A10,B5            ; |114| 
||         MVKL    .S1     _cycle_counts+24,A3

           MVKH    .S1     _cycle_counts+24,A3
||         STW     .D2T2   B5,*+SP(16)       ; |114| 
||         MV      .L2X    A10,B6            ; |114| 

           MVC     .S2     B6,TSCL           ; |115| 
||         STDW    .D1T2   B5:B4,*A3         ; |114| 

           MVC     .S2     TSCL,B4           ; |116| 
           MVC     .S2     TSCH,B5           ; |116| 
           MVKL    .S1     _t_start,A3
           MVKH    .S1     _t_start,A3

           MVC     .S2     TSCL,B6           ; |117| 
||         STDW    .D1T2   B5:B4,*A3         ; |116| 

           MVC     .S2     TSCH,B7           ; |117| 

           CALL    .S2     _gimme_random     ; |192| 
||         SUBU    .L2     B6,B4,B9:B8       ; |117| 
||         MVK     .S1     0x80,A14

           EXT     .S2     B9,24,24,B6       ; |117| 
||         SUB     .L2     B7,B5,B5          ; |117| 
||         MVKL    .S1     _t_offset,A3

           ADD     .L2     B5,B6,B5          ; |117| 
||         MV      .S2     B8,B4             ; |117| 
||         MVKH    .S1     _t_offset,A3
||         MV      .L1     A10,A13           ; |117| 
||         ZERO    .D1     A5

           ZERO    .L2     B5
||         MV      .S2X    A10,B4            ; |192| 
||         STDW    .D1T2   B5:B4,*A3         ; |117| 
||         MVKH    .S1     0x40340000,A5
||         MV      .L1     A10,A4            ; |192| 

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
;          EXCLUSIVE CPU CYCLES: 2
           MVKH    .S2     0xc0240000,B5
           ADDKPC  .S2     $C$RL28,B3,0      ; |192| 
$C$RL28:   ; CALL OCCURS {_gimme_random} {0}  ; |192| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 267
           MVKL    .S1     _input,A12
           MVKH    .S1     _input,A12
           LDW     .D1T1   *A12,A3           ; |192| 
           NOP             4
           ADD     .L1     A13,A3,A3         ; |192| 

           STDW    .D1T1   A5:A4,*A3         ; |192| 
||         MVC     .S2     TSCL,B6           ; |122| 

           MVC     .S2     TSCH,B7           ; |122| 
           MVKL    .S1     0x40026bb1,A7
           MVKL    .S1     0xbbb55516,A6
           MVKH    .S1     0x40026bb1,A7
           MVKH    .S1     0xbbb55516,A6
           MPYDP   .M1     A7:A6,A5:A4,A7:A6 ; |84| 
           MVKL    .S2     0x3ff71547,B5
           MVKL    .S2     0x652b82fe,B4
           MVKH    .S2     0x3ff71547,B5
           MVKH    .S2     0x652b82fe,B4
           MV      .L2X    A10,B8            ; |84| 
           MVKL    .S2     0x3fe63000,B9
           MVKH    .S2     0x3fe63000,B9
           MVKL    .S1     0xbf2bd010,A9
           MVKL    .S1     0x5c610ca8,A8
           MVKH    .S1     0xbf2bd010,A9
           MPYDP   .M2X    B5:B4,A7:A6,B5:B4 ; |84| 
           MVKH    .S1     0x5c610ca8,A8
           MVKL    .S1     0x6fb3f6e0,A18
           MVKL    .S1     0x3f7c70e4,A19
           MVKH    .S1     0x6fb3f6e0,A18
           MVKH    .S1     0x3f7c70e4,A19
           MVKL    .S1     0x6fde3809,A16
           MVKL    .S1     0x3f403f99,A17
           MVKH    .S1     0x6fde3809,A16
           MVKH    .S1     0x3f403f99,A17
           DPINT   .L2     B5:B4,B16         ; |84| 
           ZERO    .L1     A31
           ZERO    .L2     B31
           MV      .S2X    A10,B18           ; |53| 
           INTDP   .L2     B16,B5:B4         ; |84| 
           ZERO    .L2     B19
           SET     .S2     B19,0x1e,0x1e,B19
           ZERO    .L1     A11
           MVK     .S2     0x400,B30
           MPYDP   .M2     B9:B8,B5:B4,B9:B8 ; |84| 
           MPYDP   .M1X    A9:A8,B5:B4,A9:A8 ; |84| 
           MVKL    .S2     _t_start,B11
           MVKH    .S2     _t_start,B11
           MV      .L2     B13,B5            ; |84| 
           MVKL    .S2     0x6f58dc1c,B4
           MVKH    .S2     0x6f58dc1c,B4
           SET     .S1     A11,0x15,0x1d,A11
           MVKL    .S1     _output+12,A3
           MVKH    .S1     _output+12,A3
           LDW     .D1T1   *A3,A3            ; |196| 
           SUBDP   .L1X    A7:A6,B9:B8,A7:A6 ; |84| 
           MVKL    .S2     0x3fac718e,B9
           MVKL    .S2     0x714251b3,B8
           MVKH    .S2     0x3fac718e,B9
           MVKH    .S2     0x714251b3,B8
           STDW    .D2T2   B7:B6,*B11
           ADD     .S1     A13,A3,A3         ; |196| 
           SUBDP   .L1     A7:A6,A9:A8,A9:A8 ; |84| 
           NOP             6
           MPYDP   .M1     A9:A8,A9:A8,A7:A6 ; |84| 
           NOP             9
           NOP             1
           MPYDP   .M2X    B5:B4,A7:A6,B5:B4 ; |53| 
           MPYDP   .M1     A17:A16,A7:A6,A17:A16 ; |53| 
           NOP             8
           ADDDP   .L2X    A19:A18,B5:B4,B5:B4 ; |53| 
           ADDDP   .L1X    B9:B8,A17:A16,A17:A16 ; |53| 
           ZERO    .L2     B9
           MVKH    .S2     0x3fd00000,B9
           MV      .L2X    A10,B8            ; |53| 
           NOP             2
           MPYDP   .M2X    A7:A6,B5:B4,B5:B4 ; |53| 
           MPYDP   .M1     A7:A6,A17:A16,A7:A6 ; |53| 
           NOP             8
           ADDDP   .L2     B9:B8,B5:B4,B5:B4 ; |53| 
           SET     .S1     A31,0x15,0x1d,A17
           MV      .L1     A10,A16           ; |53| 
           ADDDP   .L1     A17:A16,A7:A6,A7:A6 ; |53| 
           NOP             4
           MPYDP   .M1X    A9:A8,B5:B4,A9:A8 ; |53| 
           NOP             9
           SUBDP   .L1     A7:A6,A9:A8,A7:A6 ; |53| 
           SET     .S2     B31,0x1e,0x1e,B5
           MV      .L2     B8,B4             ; |53| 
           NOP             4
           RCPDP   .S1     A7:A6,A17:A16     ; |53| 
           NOP             1
           MPYDP   .M1     A17:A16,A7:A6,A19:A18 ; |53| 
           NOP             9
           NOP             1
           SUBDP   .L2X    B5:B4,A19:A18,B5:B4 ; |53| 
           NOP             6
           MPYDP   .M2X    A17:A16,B5:B4,B9:B8 ; |53| 
           NOP             9
           MPYDP   .M2X    B9:B8,A7:A6,B5:B4 ; |53| 
           MV      .L1X    B19,A17           ; |53| 
           MV      .L1     A10,A16           ; |53| 
           NOP             7
           SUBDP   .L2     B19:B18,B5:B4,B5:B4 ; |53| 
           NOP             6
           MPYDP   .M2     B5:B4,B9:B8,B5:B4 ; |53| 
           NOP             9
           NOP             1
           MPYDP   .M1X    B5:B4,A7:A6,A7:A6 ; |53| 
           MVKL    .S2     0x510ea7e7,B8
           MVKL    .S2     0x40734413,B9
           MVKH    .S2     0x510ea7e7,B8
           MVKH    .S2     0x40734413,B9
           NOP             5
           SUBDP   .L1     A17:A16,A7:A6,A7:A6 ; |53| 
           CMPGTDP .S1X    A5:A4,B9:B8,A0    ; |95| 
           NOP             6
           MPYDP   .M2X    B5:B4,A7:A6,B5:B4 ; |53| 
           NOP             9
           NOP             1
           MPYDP   .M1X    A9:A8,B5:B4,A7:A6 ; |53| 
           NOP             9
           ADDDP   .L1     A11:A10,A7:A6,A7:A6 ; |92| 
           ADD     .L2     B30,B16,B4        ; |92| 
           SHL     .S2     B4,20,B5          ; |92| 
           MV      .L2     B18,B4            ; |92| 
           NOP             4
           MPYDP   .M2X    B5:B4,A7:A6,B5:B4 ; |92| 
           NOP             4
           MVKL    .S1     0x46f72a46,A6
           MVKL    .S1     0xc0733a71,A7
           MVKH    .S1     0x46f72a46,A6
           MVKH    .S1     0xc0733a71,A7
           CMPLTDP .S1     A5:A4,A7:A6,A1    ; |100| 

   [ A0]   MVKL    .S2     0x7fefffff,B5
|| [ A0]   MVK     .L2     0xffffffff,B4     ; |96| 

   [ A0]   MVKH    .S2     0x7fefffff,B5
   [ A1]   ZERO    .L2     B5:B4             ; |101| 

           STDW    .D1T2   B5:B4,*A3         ; |196| 
||         MVC     .S2     TSCL,B8           ; |128| 

           MVC     .S2     TSCH,B9           ; |128| 

           MVKL    .S1     _t_offset,A15
||         SUB     .L1     A14,1,A0          ; |190| 
||         MVKL    .S2     _t_stop,B12
||         SUB     .D1     A14,1,A14         ; |190| 

           MVKH    .S1     _t_offset,A15
||         MVKH    .S2     _t_stop,B12
||         ADD     .L1     8,A13,A13         ; |190| 

           STDW    .D2T2   B9:B8,*B12        ; |128| 
||         LDDW    .D1T1   *A15,A9:A8        ; |130| 

           MVKL    .S1     _cycle_counts+24,A3
           MVKH    .S1     _cycle_counts+24,A3
           LDDW    .D1T1   *A3,A7:A6         ; |130| 
           MV      .L2X    A3,B10            ; |128| 
           ADDU    .L1X    A8,B6,A5:A4       ; |130| 

           ADD     .L1     A5,A9,A3          ; |130| 
|| [ A0]   ZERO    .S1     A5

   [ A0]   B       .S2     $C$L10            ; |190| 
||         SUBU    .L2X    B8,A4,B5:B4       ; |130| 
|| [ A0]   MVKH    .S1     0x40340000,A5
|| [ A0]   MV      .L1     A10,A4            ; |192| 

           ADD     .L2X    A3,B7,B6          ; |130| 
||         EXT     .S2     B5,24,24,B7       ; |130| 

   [ A0]   CALL    .S1     _gimme_random     ; |192| 
||         SUB     .S2     B9,B6,B6          ; |130| 
||         ADDU    .L2X    A6,B4,B5:B4       ; |130| 

           ADD     .L2     B6,B7,B6          ; |130| 
||         ADD     .S2X    B5,A7,B5          ; |130| 

           ADD     .L2     B5,B6,B5          ; |130| 

   [!A0]   CALL    .S1     __fltllif         ; |135| 
||         STDW    .D2T2   B5:B4,*B10        ; |130| 
|| [ A0]   ZERO    .L2     B5
|| [ A0]   MV      .S2X    A10,B4            ; |192| 

           ; BRANCHCC OCCURS {$C$L10}        ; |190| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           LDDW    .D2T1   *B10,A5:A4        ; |135| 
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
;          EXCLUSIVE CPU CYCLES: 14

           MV      .L2X    A10,B5
||         STDW    .D2T1   A5:A4,*B10        ; |135| 

           SUBAW   .D2     B10,6,B13
||         MV      .L2X    A10,B4

           STDW    .D2T2   B5:B4,*B13        ; |114| 
||         MVC     .S2     B4,TSCL           ; |115| 

           MVC     .S2     TSCL,B6           ; |116| 
           MVC     .S2     TSCH,B7           ; |116| 
           MV      .L1X    B11,A14           ; |116| 

           STDW    .D1T2   B7:B6,*A14        ; |116| 
||         MVC     .S2     TSCL,B4           ; |117| 

           MVC     .S2     TSCH,B8           ; |117| 
           SUBU    .L2     B4,B6,B5:B4       ; |117| 

           EXT     .S2     B5,24,24,B6       ; |117| 
||         SUB     .L2     B8,B7,B31         ; |117| 

           ADD     .L2     B31,B6,B5         ; |117| 
||         MV      .S2X    A15,B11           ; |117| 

           STDW    .D2T2   B5:B4,*B11        ; |117| 
||         MVK     .S2     0x80,B4

           NOP             1
           MV      .L1X    B4,A15            ; |117| 
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L11:    
;          EXCLUSIVE CPU CYCLES: 11
           LDW     .D1T1   *A12,A3           ; |204| 
           NOP             4

           ADD     .L1     A10,A3,A3         ; |204| 
||         CALL    .S1     _exp10            ; |204| 

           LDDW    .D1T1   *A3,A5:A4         ; |204| 
           ADDKPC  .S2     $C$RL31,B3,3      ; |204| 
$C$RL31:   ; CALL OCCURS {_exp10} {0}        ; |204| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 9

           MVKL    .S2     _output,B4
||         SUB     .L1     A15,1,A0          ; |203| 
||         SUB     .S1     A15,1,A15         ; |203| 

           MVKH    .S2     _output,B4
           LDW     .D2T2   *B4,B4            ; |204| 
   [ A0]   BNOP    .S1     $C$L11,3          ; |203| 

           ADD     .L1X    A10,B4,A3         ; |204| 
||         ADD     .S1     8,A10,A10         ; |203| 

           STDW    .D1T1   A5:A4,*A3         ; |204| 
           ; BRANCHCC OCCURS {$C$L11}        ; |203| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 18
           MVC     .S2     TSCL,B6           ; |128| 
           MVC     .S2     TSCH,B4           ; |128| 

           LDDW    .D2T2   *B11,B9:B8        ; |130| 
||         LDDW    .D1T1   *A14,A7:A6        ; |130| 

           MV      .L2     B4,B7             ; |128| 
           MV      .L2     B13,B10           ; |128| 
           NOP             2
           ADDU    .L1X    B8,A6,A5:A4       ; |130| 

           ADD     .L1X    A5,B9,A3          ; |130| 
||         LDDW    .D2T2   *B10,B9:B8        ; |130| 

           SUBU    .L2X    B6,A4,B5:B4       ; |130| 
           ADD     .L1     A3,A7,A3          ; |130| 
           EXT     .S2     B5,24,24,B16      ; |130| 
           CALL    .S1     __fltllif         ; |130| 

           ADDU    .L2     B8,B4,B5:B4       ; |130| 
||         SUB     .S2X    B7,A3,B8          ; |130| 

           ADD     .L2     B5,B9,B31         ; |130| 
||         ADD     .S2     B8,B16,B5         ; |130| 

           MV      .L1X    B4,A4             ; |130| 
||         ADD     .L2     B31,B5,B4         ; |130| 

           STDW    .D2T2   B7:B6,*B12        ; |128| 

           MV      .L1X    B4,A5             ; |130| 
||         ADDKPC  .S2     $C$RL32,B3,0      ; |130| 

$C$RL32:   ; CALL OCCURS {__fltllif} {0}     ; |130| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 13
           MPYSP   .M1     A13,A4,A3         ; |130| 
           ZERO    .L1     A10               ; |130| 
           NOP             2
           SPDP    .S1     A3,A5:A4          ; |130| 
           NOP             1
           ADDDP   .L1     A11:A10,A5:A4,A5:A4 ; |130| 
           CALLP   .S2     __fixdlli,B3
$C$RL33:   ; CALL OCCURS {__fixdlli} {0}     ; |130| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 13
           MV      .L2X    A10,B4            ; |130| 

           MV      .L2X    A10,B5            ; |130| 
||         STDW    .D2T1   A5:A4,*B10        ; |130| 

           STDW    .D2T2   B5:B4,*+B10(8)    ; |114| 
||         MVC     .S2     B4,TSCL           ; |115| 

           MVC     .S2     TSCL,B4           ; |116| 
           MVC     .S2     TSCH,B5           ; |116| 

           STDW    .D1T2   B5:B4,*A14        ; |116| 
||         MVC     .S2     TSCL,B6           ; |117| 

           MVC     .S2     TSCH,B8           ; |117| 
           SUBU    .L2     B6,B4,B7:B6       ; |117| 

           EXT     .S2     B7,24,24,B7       ; |117| 
||         SUB     .L2     B8,B5,B5          ; |117| 

           ADD     .L2     B5,B7,B5          ; |117| 
||         MV      .S2     B6,B4             ; |117| 

           STDW    .D2T2   B5:B4,*B11        ; |117| 
||         MVK     .S2     0x80,B4

           MV      .L1     A10,A15

           MV      .L1X    B4,A10            ; |117| 
||         LDW     .D2T2   *+SP(20),B13      ; |117| 

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L12:    
;          EXCLUSIVE CPU CYCLES: 11
           LDW     .D1T1   *A12,A3           ; |212| 
           NOP             4

           ADD     .L1     A15,A3,A3         ; |212| 
||         CALL    .S1     _exp10dp          ; |212| 

           LDDW    .D1T1   *A3,A5:A4         ; |212| 
           ADDKPC  .S2     $C$RL34,B3,3      ; |212| 
$C$RL34:   ; CALL OCCURS {_exp10dp} {0}      ; |212| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 7

           LDW     .D2T2   *B13,B4           ; |212| 
||         SUB     .L1     A10,1,A0          ; |211| 
||         SUB     .S1     A10,1,A10         ; |211| 

   [ A0]   BNOP    .S1     $C$L12,3          ; |211| 

           ADD     .L1X    A15,B4,A3         ; |212| 
||         ADD     .S1     8,A15,A15         ; |211| 

           STDW    .D1T1   A5:A4,*A3         ; |212| 
           ; BRANCHCC OCCURS {$C$L12}        ; |211| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 18
           MVC     .S2     TSCL,B6           ; |128| 
           MVC     .S2     TSCH,B4           ; |128| 

           LDDW    .D1T1   *A14,A7:A6        ; |130| 
||         LDDW    .D2T2   *B11,B9:B8        ; |130| 

           MV      .L2     B4,B7             ; |128| 
           MV      .L2     B12,B30           ; |130| 
           NOP             2
           ADDU    .L1X    B8,A6,A5:A4       ; |130| 

           ADD     .L1X    A5,B9,A3          ; |130| 
||         LDDW    .D2T2   *+B10(8),B9:B8    ; |130| 

           ADD     .L1     A3,A7,A3          ; |130| 
||         SUBU    .L2X    B6,A4,B5:B4       ; |130| 

           EXT     .S2     B5,24,24,B16      ; |130| 
           SUB     .L2X    B7,A3,B31         ; |130| 
           CALL    .S1     __fltllif         ; |130| 

           ADDU    .L2     B8,B4,B5:B4       ; |130| 
||         ADD     .S2     B31,B16,B8        ; |130| 

           ADD     .L2     B5,B9,B5          ; |130| 

           MV      .L1X    B4,A4             ; |130| 
||         ADD     .L2     B5,B8,B4          ; |130| 

           STDW    .D2T2   B7:B6,*B30        ; |128| 

           ADDKPC  .S2     $C$RL35,B3,0      ; |130| 
||         MV      .L1X    B4,A5             ; |130| 

$C$RL35:   ; CALL OCCURS {__fltllif} {0}     ; |130| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 13
           MPYSP   .M1     A13,A4,A3         ; |130| 
           ZERO    .L1     A10               ; |130| 
           NOP             2
           SPDP    .S1     A3,A5:A4          ; |130| 
           NOP             1
           ADDDP   .L1     A11:A10,A5:A4,A5:A4 ; |130| 
           CALLP   .S2     __fixdlli,B3
$C$RL36:   ; CALL OCCURS {__fixdlli} {0}     ; |130| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 14

           ADDAD   .D2     B10,1,B12
||         MV      .L2X    A10,B5

           MV      .L2X    A10,B4
||         STDW    .D2T1   A5:A4,*B12        ; |130| 

           STDW    .D2T2   B5:B4,*+B10(16)   ; |114| 
||         MVC     .S2     B4,TSCL           ; |115| 

           MVC     .S2     TSCL,B6           ; |116| 
           MVC     .S2     TSCH,B4           ; |116| 
           MV      .L2     B4,B7             ; |116| 

           STDW    .D1T2   B7:B6,*A14        ; |116| 
||         MVC     .S2     TSCL,B4           ; |117| 

           MVC     .S2     TSCH,B8           ; |117| 
           SUBU    .L2     B4,B6,B5:B4       ; |117| 

           EXT     .S2     B5,24,24,B6       ; |117| 
||         SUB     .L2     B8,B7,B31         ; |117| 

           ADD     .L2     B31,B6,B5         ; |117| 

           STDW    .D2T2   B5:B4,*B11        ; |117| 
||         MVK     .S2     0x80,B4

           MV      .L1     A10,A15

           MV      .L1X    B4,A10            ; |117| 
||         LDW     .D2T2   *+SP(24),B13      ; |117| 

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L13:    
;          EXCLUSIVE CPU CYCLES: 11
           LDW     .D1T1   *A12,A3           ; |220| 
           NOP             4

           ADD     .L1     A15,A3,A3         ; |220| 
||         CALL    .S1     _exp10dp_c        ; |220| 

           LDDW    .D1T1   *A3,A5:A4         ; |220| 
           ADDKPC  .S2     $C$RL37,B3,3      ; |220| 
$C$RL37:   ; CALL OCCURS {_exp10dp_c} {0}    ; |220| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 7

           LDW     .D2T2   *B13,B4           ; |220| 
||         SUB     .L1     A10,1,A0          ; |219| 
||         SUB     .S1     A10,1,A10         ; |219| 

   [ A0]   BNOP    .S1     $C$L13,3          ; |219| 

           ADD     .L1X    A15,B4,A3         ; |220| 
||         ADD     .S1     8,A15,A15         ; |219| 

           STDW    .D1T1   A5:A4,*A3         ; |220| 
           ; BRANCHCC OCCURS {$C$L13}        ; |219| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 15
           MVC     .S2     TSCL,B6           ; |128| 
           MVC     .S2     TSCH,B4           ; |128| 

           LDDW    .D1T1   *A14,A5:A4        ; |130| 
||         LDDW    .D2T2   *B11,B9:B8        ; |130| 

           LDDW    .D2T2   *+B10(16),B17:B16 ; |130| 
           MV      .L2     B4,B7             ; |128| 
           NOP             2
           ADDU    .L2X    B8,A4,B5:B4       ; |130| 

           ADD     .S2     B5,B9,B8          ; |130| 
||         SUBU    .L2     B6,B4,B5:B4       ; |130| 

           ADD     .D2X    B8,A5,B8          ; |130| 
||         CALL    .S1     __fltllif         ; |130| 
||         EXT     .S2     B5,24,24,B9       ; |130| 
||         ADDU    .L2     B16,B4,B5:B4      ; |130| 

           SUB     .L2     B7,B8,B8          ; |130| 
||         ADD     .S2     B5,B17,B31        ; |130| 

           ADD     .L2     B8,B9,B5          ; |130| 
||         MV      .L1X    B4,A4             ; |130| 
||         MVKL    .S2     _t_stop,B8

           ADD     .L2     B31,B5,B4         ; |130| 
||         MVKH    .S2     _t_stop,B8

           STDW    .D2T2   B7:B6,*B8         ; |128| 

           MV      .L1X    B4,A5             ; |130| 
||         ADDKPC  .S2     $C$RL38,B3,0      ; |130| 

$C$RL38:   ; CALL OCCURS {__fltllif} {0}     ; |130| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 107
           MPYSP   .M1     A13,A4,A3         ; |130| 
           ZERO    .L1     A10               ; |130| 
           NOP             3
           SPDP    .S2X    A3,B5:B4          ; |130| 
           NOP             2
           ADDDP   .L1X    A11:A10,B5:B4,A5:A4 ; |130| 
           CALLP   .S2     __fixdlli,B3
$C$RL39:   ; CALL OCCURS {__fixdlli} {0}     ; |130| 

           ADDAD   .D2     B12,1,B13
||         MV      .L2X    A10,B5

           MV      .L2X    A10,B4
||         STDW    .D2T1   A5:A4,*B13        ; |130| 

           STDW    .D2T2   B5:B4,*+B10(32)   ; |114| 
||         MVC     .S2     B4,TSCL           ; |115| 

           MVC     .S2     TSCL,B4           ; |116| 
           MVC     .S2     TSCH,B5           ; |116| 

           STDW    .D1T2   B5:B4,*A14        ; |116| 
||         MVC     .S2     TSCL,B6           ; |117| 

           MVC     .S2     TSCH,B8           ; |117| 
           SUBU    .L2     B6,B4,B7:B6       ; |117| 

           EXT     .S2     B7,24,24,B7       ; |117| 
||         SUB     .L2     B8,B5,B5          ; |117| 

           MVKL    .S1     _output,A15
||         ADD     .L2     B5,B7,B5          ; |117| 
||         MV      .S2     B6,B4             ; |117| 

           MVKH    .S1     _output,A15
||         MV      .L2X    A12,B9            ; |227| 
||         STDW    .D2T2   B5:B4,*B11        ; |117| 

           CALLP   .S2     _exp10dp_v,B3
||         LDW     .D1T2   *+A15(16),B4      ; |227| 
||         LDW     .D2T1   *B9,A4            ; |227| 
||         MVK     .S1     0x80,A6           ; |227| 

$C$RL40:   ; CALL OCCURS {_exp10dp_v} {0}    ; |227| 
           MVC     .S2     TSCL,B8           ; |128| 
           MVC     .S2     TSCH,B4           ; |128| 

           LDDW    .D1T1   *A14,A9:A8        ; |130| 
||         LDDW    .D2T2   *B11,B7:B6        ; |130| 

           MVK     .S1     16,A12
           ADD     .L1X    B13,A12,A12
           LDDW    .D1T1   *A12,A7:A6        ; |130| 
           MV      .L2     B4,B9             ; |128| 
           ADDU    .L1X    B6,A8,A5:A4       ; |130| 
           SUBU    .L1X    B8,A4,A17:A16     ; |130| 
           ADD     .L1X    A5,B7,A4          ; |130| 

           MV      .L1     A16,A3            ; |130| 
||         ADD     .D1     A4,A9,A4          ; |130| 
||         EXT     .S1     A17,24,24,A8      ; |130| 

           SUB     .S1X    B9,A4,A3          ; |130| 
||         ADDU    .L1     A6,A3,A5:A4       ; |130| 
||         MVKL    .S2     _t_stop,B4

           ADD     .L1     A5,A7,A3          ; |130| 
||         ADD     .S1     A3,A8,A5          ; |130| 
||         MVKH    .S2     _t_stop,B4

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
           LDW     .D2T1   *+SP(108),A3      ; |68| 
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
           LDW     .D2T2   *+SP(112),B5      ; |69| 
           MV      .L2X    A4,B4             ; |69| 
           STW     .D2T2   B4,*+B10(16)      ; |69| 
           NOP             2
           LDW     .D2T2   *B5,B0            ; |72| 
           LDW     .D2T2   *+SP(116),B5
           NOP             3

   [!B0]   B       .S1     $C$L14            ; |72| 
||         MV      .L2     B0,B1             ; guard predicate rewrite

   [ B0]   LDW     .D2T2   *B5,B0            ; |72| 
   [ B1]   ADD     .L2     4,B5,B5
           NOP             3
           ; BRANCHCC OCCURS {$C$L14}        ; |72| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 14
   [ B0]   LDW     .D2T2   *B5,B6            ; |72| 
           CMPEQ   .L2     B4,0,B31          ; |72| 
           XOR     .L2     1,B31,B5          ; |72| 
           MVK     .L1     0x1,A3            ; |72| 
           NOP             1
   [ B0]   CMPEQ   .L2     B6,0,B4           ; |72| 
   [ B0]   XOR     .L2     1,B4,B4           ; |72| 

   [ B0]   AND     .L2     B5,B4,B0          ; |72| 
|| [!B0]   ZERO    .S2     B0                ; |72| 

   [ B0]   B       .S1     $C$L15            ; |72| 
   [ B0]   CALL    .S1     _print_test_results ; |233| 
   [ B0]   MVKL    .S1     _all_pass,A4
   [ B0]   MVKH    .S1     _all_pass,A4
           NOP             2
           ; BRANCHCC OCCURS {$C$L15}        ; |72| 
;** --------------------------------------------------------------------------*
$C$L14:    
;          EXCLUSIVE CPU CYCLES: 5
           CALL    .S1     _print_test_results ; |233| 
           MVKL    .S1     _all_pass,A4
           MVKH    .S1     _all_pass,A4
           MV      .L1     A10,A3
           NOP             1
;** --------------------------------------------------------------------------*
$C$L15:    
;          EXCLUSIVE CPU CYCLES: 1

           STW     .D1T1   A3,*A4            ; |72| 
||         MVK     .L1     0x2,A4            ; |233| 
||         ADDKPC  .S2     $C$RL47,B3,0      ; |233| 

$C$RL47:   ; CALL OCCURS {_print_test_results} {0}  ; |233| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 30
           MVKL    .S2     $C$SL2+0,B4
           MVKH    .S2     $C$SL2+0,B4

           CALLP   .S2     _printf,B3
||         STW     .D2T2   B4,*+SP(4)        ; |234| 

$C$RL48:   ; CALL OCCURS {_printf} {0}       ; |234| 
           MVKL    .S2     $C$SL3+0,B4
           MVKH    .S2     $C$SL3+0,B4

           CALLP   .S2     _printf,B3
||         STW     .D2T2   B4,*+SP(4)        ; |234| 

$C$RL49:   ; CALL OCCURS {_printf} {0}       ; |234| 
           MVKL    .S1     $C$SL1+0,A10
           MVKH    .S1     $C$SL1+0,A10

           CALLP   .S2     _print_profile_results,B3
||         MV      .L1     A10,A4            ; |241| 

$C$RL50:   ; CALL OCCURS {_print_profile_results} {0}  ; |241| 

           CALLP   .S2     _print_memory_results,B3
||         MV      .L1     A10,A4            ; |244| 

$C$RL51:   ; CALL OCCURS {_print_memory_results} {0}  ; |244| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 12
           ADDK    .S2     216,SP            ; |245| 
           LDW     .D2T2   *++SP(8),B3       ; |245| 
           LDDW    .D2T1   *++SP,A13:A12     ; |245| 
           LDDW    .D2T1   *++SP,A15:A14     ; |245| 
           LDDW    .D2T2   *++SP,B11:B10     ; |245| 
           LDDW    .D2T2   *++SP,B13:B12     ; |245| 

           LDW     .D2T1   *++SP(8),A10      ; |245| 
||         RET     .S2     B3                ; |245| 

           LDW     .D2T1   *++SP(8),A11      ; |245| 
           NOP             4
           ; BRANCH OCCURS {B3}              ; |245| 
;******************************************************************************
;* STRINGS                                                                    *
;******************************************************************************
	.sect	".const:.string"
$C$SL1:	.string	"exp10DP",0
$C$SL2:	.string	"----------------------------------------",0
$C$SL3:	.string	"----------------------------------------",10,0
;*****************************************************************************
;* UNDEFINED EXTERNAL REFERENCES                                             *
;*****************************************************************************
	.global	_printf
	.global	_exp10
	.global	_driver_init
	.global	_print_profile_results
	.global	_print_memory_results
	.global	_print_test_results
	.global	_gimme_random
	.global	_isequal
	.global	_exp10dp
	.global	_exp10dp_c
	.global	_exp10dp_v
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
