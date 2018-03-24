;******************************************************************************
;* TMS320C6x C/C++ Codegen                                          PC v7.4.2 *
;* Date/Time created: Mon May 16 23:46:52 2016                                *
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
	.word	0f4178da3h,0bcafffffh		; a[0] @ 0
	.word	0c27e9531h,0400c2dd9h		; a[1] @ 64
	.word	0c27e9531h,0c01c2dd9h		; a[2] @ 128
	.word	0cba732dfh,040252262h		; a[3] @ 192
	.word	07f62b6aeh,0c02c2dd9h		; a[4] @ 256
	.word	0198f1d3fh,040319ca8h		; a[5] @ 320
	.word	0736cdf26h,0c0352263h		; a[6] @ 384
	.word	0cd4aa10eh,04038a81eh		; a[7] @ 448
	.word	07f62b6aeh,0c03c2dd9h		; a[8] @ 512
	.word	0d9407896h,0403fb394h		; a[9] @ 576
	.word	0198f1d3fh,0c0419ca8h		; a[10] @ 640
	.word	0c67dfe33h,040435f85h		; a[11] @ 704
	.word	0736cdf26h,0c0452263h		; a[12] @ 768
	.word	0205bc01ah,04046e541h		; a[13] @ 832
	.word	07967caeah,0c048a81eh		; a[14] @ 896
	.word	02656abdeh,0404a6afch		; a[15] @ 960
	.word	0d3458cd2h,0c04c2dd9h		; a[16] @ 1024
	.word	080346dc6h,0404df0b7h		; a[17] @ 1088
	.word	0d9407896h,0c04fb394h		; a[18] @ 1152
	.word	06d0917d7h,04050bb39h		; a[19] @ 1216
	.word	0198f1d3fh,0c0519ca8h		; a[20] @ 1280
	.word	0f0068db9h,040527e16h		; a[21] @ 1344
	.word	0c67dfe33h,0c0535f85h		; a[22] @ 1408
	.word	07304039bh,0405440f4h		; a[23] @ 1472
	.word	0736cdf26h,0c0552263h		; a[24] @ 1536
	.word	01ff2e48fh,0405603d2h		; a[25] @ 1600
	.word	0f66a5508h,0c056e540h		; a[26] @ 1664
	.word	0cce1c582h,04057c6afh		; a[27] @ 1728
	.word	0a35935fch,0c058a81eh		; a[28] @ 1792
	.word	0219652bdh,04059898eh		; a[29] @ 1856
	.word	07e90ff97h,0c05a6afbh		; a[30] @ 1920
	.word	07ef9db23h,0405b4c6ah		; a[31] @ 1984
	.word	07f62b6aeh,0c05c2dd9h		; a[32] @ 2048
	.word	07fcb923ah,0405d0f48h		; a[33] @ 2112
	.word	080346dc6h,0c05df0b7h		; a[34] @ 2176
	.word	0809d4952h,0405ed226h		; a[35] @ 2240
	.word	0810624ddh,0c05fb395h		; a[36] @ 2304
	.word	040b78034h,040604a82h		; a[37] @ 2368
	.word	0c0ebedfah,0c060bb39h		; a[38] @ 2432
	.word	06f694467h,040612bf0h		; a[39] @ 2496
	.word	0ef9db22dh,0c0619ca7h		; a[40] @ 2560
	.word	06fd21ff3h,040620d5fh		; a[41] @ 2624
	.word	0f0068db9h,0c0627e16h		; a[42] @ 2688
	.word	0703afb7fh,04062eeceh		; a[43] @ 2752
	.word	0f06f6944h,0c0635f85h		; a[44] @ 2816
	.word	070a3d70ah,04063d03dh		; a[45] @ 2880
	.word	01f212d77h,0c06440f4h		; a[46] @ 2944
	.word	09f559b3dh,04064b1abh		; a[47] @ 3008
	.word	01f8a0903h,0c0652263h		; a[48] @ 3072
	.word	09fbe76c9h,04065931ah		; a[49] @ 3136
	.word	01ff2e48fh,0c06603d2h		; a[50] @ 3200
	.word	0a0275254h,040667489h		; a[51] @ 3264
	.word	0205bc01ah,0c066e541h		; a[52] @ 3328
	.word	0a0902de0h,0406755f8h		; a[53] @ 3392
	.word	020c49ba6h,0c067c6b0h		; a[54] @ 3456
	.word	0cf41f213h,040683766h		; a[55] @ 3520
	.word	04f765fd9h,0c068a81eh		; a[56] @ 3584
	.word	0cfaacd9fh,0406918d5h		; a[57] @ 3648
	.word	04fdf3b64h,0c069898dh		; a[58] @ 3712
	.word	0d013a92ah,04069fa44h		; a[59] @ 3776
	.word	0504816f0h,0c06a6afch		; a[60] @ 3840
	.word	0d07c84b6h,0406adbb3h		; a[61] @ 3904
	.word	050b0f27ch,0c06b4c6bh		; a[62] @ 3968
	.word	0ff2e48e9h,0406bbd21h		; a[63] @ 4032
	.word	07f62b6aeh,0c06c2dd9h		; a[64] @ 4096
	.word	0ff972474h,0406c9e90h		; a[65] @ 4160
	.word	07fcb923ah,0c06d0f48h		; a[66] @ 4224
	.word	0a36e2eb2h,0406d8001h		; a[67] @ 4288
	.word	080346dc6h,0c06df0b7h		; a[68] @ 4352
	.word	00068db8ch,0406e616fh		; a[69] @ 4416
	.word	0809d4952h,0c06ed226h		; a[70] @ 4480
	.word	000d1b717h,0406f42deh		; a[71] @ 4544
	.word	0af4f0d84h,0c06fb394h		; a[72] @ 4608
	.word	017c1bda5h,040701226h		; a[73] @ 4672
	.word	0d7dbf488h,0c0704a81h		; a[74] @ 4736
	.word	097f62b6bh,0407082ddh		; a[75] @ 4800
	.word	05810624eh,0c070bb39h		; a[76] @ 4864
	.word	0182a9931h,04070f395h		; a[77] @ 4928
	.word	0d844d014h,0c0712bf0h		; a[78] @ 4992
	.word	02f837b4ah,04071644ch		; a[79] @ 5056
	.word	0ef9db22dh,0c0719ca7h		; a[80] @ 5120
	.word	0afb7e910h,04071d503h		; a[81] @ 5184
	.word	06fd21ff3h,0c0720d5fh		; a[82] @ 5248
	.word	02fec56d6h,0407245bbh		; a[83] @ 5312
	.word	0f0068db9h,0c0727e16h		; a[84] @ 5376
	.word	0b020c49ch,04072b672h		; a[85] @ 5440
	.word	0703afb7fh,0c072eeceh		; a[86] @ 5504
	.word	030553261h,04073272ah		; a[87] @ 5568
	.word	0f06f6944h,0c0735f85h		; a[88] @ 5632
	.word	047ae147bh,0407397e1h		; a[89] @ 5696
	.word	007c84b5eh,0c073d03dh		; a[90] @ 5760
	.word	0c7e28241h,040740898h		; a[91] @ 5824
	.word	087fcb924h,0c07440f4h		; a[92] @ 5888
	.word	04816f007h,040747950h		; a[93] @ 5952
	.word	0083126e9h,0c074b1ach		; a[94] @ 6016
	.word	0c84b5dcch,04074ea07h		; a[95] @ 6080
	.word	0886594afh,0c0752263h		; a[96] @ 6144
	.word	0dfa43fe6h,040755abeh		; a[97] @ 6208
	.word	09fbe76c9h,0c075931ah		; a[98] @ 6272
	.word	05fd8adach,04075cb76h		; a[99] @ 6336
	.word	01ff2e48fh,0c07603d2h		; a[100] @ 6400
	.word	0e00d1b71h,040763c2dh		; a[101] @ 6464
	.word	0a0275254h,0c0767489h		; a[102] @ 6528
	.word	060418937h,04076ace5h		; a[103] @ 6592
	.word	0205bc01ah,0c076e541h		; a[104] @ 6656
	.word	0779a6b51h,040771d9ch		; a[105] @ 6720
	.word	037b4a234h,0c07755f8h		; a[106] @ 6784
	.word	0f7ced917h,040778e53h		; a[107] @ 6848
	.word	0b7e90ff9h,0c077c6afh		; a[108] @ 6912
	.word	0780346dch,04077ff0bh		; a[109] @ 6976
	.word	0381d7dbfh,0c0783767h		; a[110] @ 7040
	.word	0f837b4a2h,040786fc2h		; a[111] @ 7104
	.word	0b851eb85h,0c078a81eh		; a[112] @ 7168
	.word	00f9096bch,04078e07ah		; a[113] @ 7232
	.word	0cfaacd9fh,0c07918d5h		; a[114] @ 7296
	.word	08fc50481h,040795131h		; a[115] @ 7360
	.word	04fdf3b64h,0c079898dh		; a[116] @ 7424
	.word	00ff97247h,04079c1e9h		; a[117] @ 7488
	.word	0d013a92ah,0c079fa44h		; a[118] @ 7552
	.word	0902de00dh,0407a32a0h		; a[119] @ 7616
	.word	0504816f0h,0c07a6afch		; a[120] @ 7680
	.word	010624dd3h,0407aa358h		; a[121] @ 7744
	.word	0d07c84b6h,0c07adbb3h		; a[122] @ 7808
	.word	027bb2fech,0407b140fh		; a[123] @ 7872
	.word	0e7d566cfh,0c07b4c6ah		; a[124] @ 7936
	.word	0a7ef9db2h,0407b84c6h		; a[125] @ 8000
	.word	06809d495h,0c07bbd22h		; a[126] @ 8064
	.word	028240b78h,0407bf57eh		; a[127] @ 8128
	.word	0e83e425bh,0c07c2dd9h		; a[128] @ 8192
	.word	0a858793eh,0407c6635h		; a[129] @ 8256
	.word	06872b021h,0c07c9e91h		; a[130] @ 8320
	.word	0bfb15b57h,0407cd6ech		; a[131] @ 8384
	.word	07fcb923ah,0c07d0f48h		; a[132] @ 8448
	.word	03fe5c91dh,0407d47a4h		; a[133] @ 8512
	.word	014e3bcd3h,0c07d841dh		; a[134] @ 8576
	.word	0c01a36e3h,0407db85bh		; a[135] @ 8640
	.word	080346dc6h,0c07df0b7h		; a[136] @ 8704
	.word	0404ea4a9h,0407e2913h		; a[137] @ 8768
	.word	0978d4fdfh,0c07e616eh		; a[138] @ 8832
	.word	057a786c2h,0407e99cah		; a[139] @ 8896
	.word	017c1bda5h,0c07ed226h		; a[140] @ 8960
	.word	0d7dbf488h,0407f0a81h		; a[141] @ 9024
	.word	097f62b6bh,0c07f42ddh		; a[142] @ 9088
	.word	05810624eh,0407f7b39h		; a[143] @ 9152
	.word	0182a9931h,0c07fb395h		; a[144] @ 9216
	.word	0d844d014h,0407febf0h		; a[145] @ 9280
	.word	04c2f837bh,0c0801226h		; a[146] @ 9344
	.word	0f7ced917h,040802e53h		; a[147] @ 9408
	.word	0d7dbf488h,0c0804a81h		; a[148] @ 9472
	.word	0b7e90ff9h,0408066afh		; a[149] @ 9536
	.word	097f62b6bh,0c08082ddh		; a[150] @ 9600
	.word	0780346dch,040809f0bh		; a[151] @ 9664
	.word	05810624eh,0c080bb39h		; a[152] @ 9728
	.word	0381d7dbfh,04080d767h		; a[153] @ 9792
	.word	0182a9931h,0c080f395h		; a[154] @ 9856
	.word	0f837b4a2h,040810fc2h		; a[155] @ 9920
	.word	0d844d014h,0c0812bf0h		; a[156] @ 9984
	.word	0b851eb85h,04081481eh		; a[157] @ 10048
	.word	063f14120h,0c081644ch		; a[158] @ 10112
	.word	043fe5c92h,04081807ah		; a[159] @ 10176
	.word	0240b7803h,0c0819ca8h		; a[160] @ 10240
	.word	004189375h,04081b8d6h		; a[161] @ 10304
	.word	0e425aee6h,0c081d503h		; a[162] @ 10368
	.word	08fc50481h,04081f131h		; a[163] @ 10432
	.word	06fd21ff3h,0c0820d5fh		; a[164] @ 10496
	.word	04fdf3b64h,04082298dh		; a[165] @ 10560
	.word	02fec56d6h,0c08245bbh		; a[166] @ 10624
	.word	00ff97247h,0408261e9h		; a[167] @ 10688
	.word	0f0068db9h,0c0827e16h		; a[168] @ 10752
	.word	0d013a92ah,040829a44h		; a[169] @ 10816
	.word	0b020c49ch,0c082b672h		; a[170] @ 10880
	.word	0902de00dh,04082d2a0h		; a[171] @ 10944
	.word	0703afb7fh,0c082eeceh		; a[172] @ 11008
	.word	01bda511ah,040830afch		; a[173] @ 11072
	.word	0fbe76c8bh,0c0832729h		; a[174] @ 11136
	.word	0dbf487fdh,040834357h		; a[175] @ 11200
	.word	0bc01a36eh,0c0835f85h		; a[176] @ 11264
	.word	09c0ebee0h,040837bb3h		; a[177] @ 11328
	.word	047ae147bh,0c08397e1h		; a[178] @ 11392
	.word	027bb2fech,04083b40fh		; a[179] @ 11456
	.word	007c84b5eh,0c083d03dh		; a[180] @ 11520
	.word	0e7d566cfh,04083ec6ah		; a[181] @ 11584
	.word	0c7e28241h,0c0840898h		; a[182] @ 11648
	.word	0a7ef9db2h,0408424c6h		; a[183] @ 11712
	.word	087fcb924h,0c08440f4h		; a[184] @ 11776
	.word	06809d495h,040845d22h		; a[185] @ 11840
	.word	04816f007h,0c0847950h		; a[186] @ 11904
	.word	028240b78h,04084957eh		; a[187] @ 11968
	.word	0083126e9h,0c084b1ach		; a[188] @ 12032
	.word	0b3d07c85h,04084cdd9h		; a[189] @ 12096
	.word	093dd97f6h,0c084ea07h		; a[190] @ 12160
	.word	073eab368h,040850635h		; a[191] @ 12224
	.word	053f7ced9h,0c0852263h		; a[192] @ 12288
	.word	03404ea4bh,040853e91h		; a[193] @ 12352
	.word	0141205bch,0c0855abfh		; a[194] @ 12416
	.word	0f41f212dh,0408576ech		; a[195] @ 12480
	.word	0d42c3c9fh,0c085931ah		; a[196] @ 12544
	.word	0b4395810h,04085af48h		; a[197] @ 12608
	.word	094467382h,0c085cb76h		; a[198] @ 12672
	.word	03fe5c91dh,04085e7a4h		; a[199] @ 12736
	.word	01ff2e48fh,0c08603d2h		; a[200] @ 12800

;	C:\MATHLIB_Tools\CCSV5_5_0\ccsv5\tools\compiler\c6000_7.4.2\bin\opt6x.exe C:\\Users\\gtbldadm\\AppData\\Local\\Temp\\023767 C:\\Users\\gtbldadm\\AppData\\Local\\Temp\\023769 
	.sect	".text"
	.clink
	.global	save_output

;******************************************************************************
;* FUNCTION NAME: save_output                                                 *
;*                                                                            *
;*   Regs Modified     : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,B0,B1,B2,B3,B4,*
;*                           B5,B6,B7,B8,B9,B10,B11,SP,A16,A17,A18,A19,A20,   *
;*                           A21,A22,A23,A24,A25,A26,A27,A28,A29,A30,A31,B16, *
;*                           B17,B18,B19,B20,B21,B22,B23,B24,B25,B26,B27,B28, *
;*                           B29,B30,B31                                      *
;*   Regs Used         : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,B0,B1,B2,B3,B4,*
;*                           B5,B6,B7,B8,B9,B10,B11,DP,SP,A16,A17,A18,A19,A20,*
;*                           A21,A22,A23,A24,A25,A26,A27,A28,A29,A30,A31,B16, *
;*                           B17,B18,B19,B20,B21,B22,B23,B24,B25,B26,B27,B28, *
;*                           B29,B30,B31                                      *
;*   Local Frame Size  : 16 Args + 0 Auto + 24 Save = 40 byte                 *
;******************************************************************************
save_output:
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 9
           STW     .D2T1   A11,*SP--(8)      ; |108| 

           STDW    .D2T2   B11:B10,*SP--     ; |108| 
||         MV      .L2     B4,B11            ; |108| 
||         MVKL    .S2     $C$SL1+0,B4

           STW     .D2T1   A10,*SP--(8)      ; |108| 
||         MV      .L2X    A4,B10            ; |108| 
||         MVKL    .S1     $C$SL2+0,A4
||         MVKH    .S2     $C$SL1+0,B4

           MV      .L1X    B3,A11            ; |108| 
||         CALLP   .S2     fopen,B3
||         SUB     .D2     SP,16,SP          ; |108| 
||         MVKH    .S1     $C$SL2+0,A4

$C$RL0:    ; CALL OCCURS {fopen} {0}         ; |110| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 7

           CMPGT   .L2     B11,0,B0          ; |112| 
||         MVKL    .S2     $C$SL3+0,B4
||         MV      .L1     A4,A10            ; |110| 

   [!B0]   BNOP    .S1     $C$L2,4           ; |112| 
||         MVKH    .S2     $C$SL3+0,B4

   [ B0]   STW     .D2T2   B4,*+SP(4)        ; |113| 
           ; BRANCHCC OCCURS {$C$L2}         ; |112| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 4

           LDDW    .D2T2   *B10++,B5:B4      ; |113| 
||         CALL    .S1     fprintf           ; |113| 

           MV      .L1     A10,A4            ; |113| 
           NOP             2
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L1:    
;          EXCLUSIVE CPU CYCLES: 2
           ADDKPC  .S2     $C$RL1,B3,0       ; |113| 
           STDW    .D2T2   B5:B4,*+SP(8)     ; |113| 
$C$RL1:    ; CALL OCCURS {fprintf} {0}       ; |113| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 7

           SUB     .L1X    B11,1,A0          ; |112| 
||         MVKL    .S2     $C$SL3+0,B4

   [ A0]   B       .S1     $C$L1             ; |112| 
||         MVKH    .S2     $C$SL3+0,B4

   [ A0]   STW     .D2T2   B4,*+SP(4)        ; |113| 

   [ A0]   CALL    .S1     fprintf           ; |113| 
|| [ A0]   LDDW    .D2T2   *B10++,B5:B4      ; |113| 

   [ A0]   MV      .L1     A10,A4            ; |113| 
           SUB     .L2     B11,1,B11         ; |112| 
           NOP             1
           ; BRANCHCC OCCURS {$C$L1}         ; |112| 
;** --------------------------------------------------------------------------*
$C$L2:    
;          EXCLUSIVE CPU CYCLES: 6

           CALLP   .S2     fclose,B3
||         MV      .L1     A10,A4            ; |115| 

$C$RL2:    ; CALL OCCURS {fclose} {0}        ; |115| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 8
           ADDK    .S2     16,SP             ; |116| 

           LDW     .D2T1   *++SP(8),A10      ; |116| 
||         MV      .L2X    A11,B3            ; |116| 

           LDDW    .D2T2   *++SP,B11:B10     ; |116| 
||         RET     .S2     B3                ; |116| 

           LDW     .D2T1   *++SP(8),A11      ; |116| 
           NOP             4
           ; BRANCH OCCURS {B3}              ; |116| 
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
;*   Local Frame Size  : 8 Args + 180 Auto + 56 Save = 244 byte               *
;******************************************************************************
main:
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 14
           STW     .D2T1   A11,*SP--(8)      ; |124| 
           STW     .D2T1   A10,*SP--(8)      ; |124| 
           STDW    .D2T2   B13:B12,*SP--     ; |124| 
           STDW    .D2T2   B11:B10,*SP--     ; |124| 
           STDW    .D2T1   A15:A14,*SP--     ; |124| 
           STDW    .D2T1   A13:A12,*SP--     ; |124| 
           STW     .D2T2   B3,*SP--(8)       ; |124| 

           MVKL    .S1     $C$SL4+0,A4
||         ADDK    .S2     -192,SP           ; |124| 

           CALLP   .S2     driver_init,B3
||         MVKH    .S1     $C$SL4+0,A4

$C$RL3:    ; CALL OCCURS {driver_init} {0}   ; |132| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 7

           MVKL    .S1     a,A14
||         MVKL    .S2     output,B4

           MVKH    .S1     a,A14
||         MVKH    .S2     output,B4

           MV      .L1     A14,A12
||         CALL    .S1     exp               ; |141| 
||         LDW     .D2T1   *B4,A11

           LDDW    .D1T1   *A12++,A5:A4      ; |141| 
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
           ADDKPC  .S2     $C$RL4,B3,0       ; |141| 
$C$RL4:    ; CALL OCCURS {exp} {0}           ; |141| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 7

           SUB     .L1     A10,1,A0          ; |140| 
||         STDW    .D1T1   A5:A4,*A11++      ; |141| 
||         SUB     .S1     A10,1,A10         ; |140| 

   [!A0]   ZERO    .L2     B10
|| [ A0]   B       .S1     $C$L3             ; |140| 
|| [!A0]   MVKL    .S2     output,B4
|| [ A0]   LDDW    .D1T1   *A12++,A5:A4      ; |141| 

   [ A0]   CALL    .S1     exp               ; |141| 
|| [!A0]   MVKH    .S2     output,B4

   [!A0]   ADD     .L2     4,B4,B11
   [!A0]   MVK     .S2     0xc9,B4
   [!A0]   MV      .L1     A14,A10
   [!A0]   MV      .L1X    B4,A11
           ; BRANCHCC OCCURS {$C$L3}         ; |140| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 1
           CALL    .S1     expdp             ; |144| 
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L4:    
;          EXCLUSIVE CPU CYCLES: 5
           LDDW    .D1T1   *A10++,A5:A4      ; |144| 
           ADDKPC  .S2     $C$RL5,B3,3       ; |144| 
$C$RL5:    ; CALL OCCURS {expdp} {0}         ; |144| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 7

           LDW     .D2T2   *B11,B4           ; |144| 
||         SUB     .L1     A11,1,A0          ; |143| 
||         SUB     .S1     A11,1,A11         ; |143| 

   [ A0]   BNOP    .S1     $C$L4,3           ; |143| 

           ADD     .L2     B10,B4,B4         ; |144| 
||         ADD     .S2     8,B10,B10         ; |143| 

   [ A0]   CALL    .S1     expdp             ; |144| 
||         STDW    .D2T1   A5:A4,*B4         ; |144| 
|| [!A0]   MVK     .S2     0xc9,B4

           ; BRANCHCC OCCURS {$C$L4}         ; |143| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 2

           ZERO    .L2     B10
||         MV      .L1     A14,A11
||         ADD     .S2     4,B11,B12

           MV      .L1X    B4,A10
||         CALL    .S1     expdp_c           ; |147| 

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L5:    
;          EXCLUSIVE CPU CYCLES: 5
           LDDW    .D1T1   *A11++,A5:A4      ; |147| 
           ADDKPC  .S2     $C$RL6,B3,3       ; |147| 
$C$RL6:    ; CALL OCCURS {expdp_c} {0}       ; |147| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 7

           LDW     .D2T2   *B12,B4           ; |147| 
||         SUB     .L1     A10,1,A0          ; |146| 
||         SUB     .S1     A10,1,A10         ; |146| 

   [!A0]   MVKL    .S1     0xc086232b,A3
|| [ A0]   B       .S2     $C$L5             ; |146| 

   [!A0]   MVKH    .S1     0xc086232b,A3
|| [!A0]   MVKL    .S2     0x6f58dc1c,B26

   [!A0]   MVKL    .S1     0x652b82fe,A24
|| [!A0]   MVKL    .S2     0x3ef152a4,B27

   [!A0]   MVKL    .S1     0x3ff71547,A25
|| [!A0]   MVKL    .S2     0x6fb3f6e0,B28

           ADD     .L2     B10,B4,B4         ; |147| 
||         ADD     .S2     8,B10,B10         ; |146| 
|| [!A0]   MVKL    .S1     0x6fde3809,A26

           STDW    .D2T1   A5:A4,*B4         ; |147| 
|| [!A0]   MVKL    .S2     0x40862e42,B4
|| [ A0]   CALL    .S1     expdp_c           ; |147| 

           ; BRANCHCC OCCURS {$C$L5}         ; |146| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 19

           MVKL    .S1     0xdd7abcd2,A31
||         MVKL    .S2     0xff7a39eb,B31
||         ZERO    .L2     B30
||         ZERO    .L1     A13
||         ZERO    .D1     A30
||         STW     .D2T1   A3,*+SP(76)       ; |53| 

           MVKL    .S1     0x3fac718e,A29
||         MVKL    .S2     0x3f7c70e4,B29
||         ADD     .L2     4,B12,B13
||         ZERO    .L1     A10               ; |85| 
||         ZERO    .D1     A20               ; |85| 
||         ZERO    .D2     B18               ; |85| 

           MVKL    .S1     0x714251b3,A28
||         MVKH    .S2     0xff7a39eb,B31
||         LDW     .D2T2   *B13,B20
||         ZERO    .L1     A23               ; |85| 
||         ZERO    .D1     A12               ; |85| 

           MVKL    .S1     0x3f403f99,A27
||         MVKH    .S2     0x3fd00000,B30
||         STW     .D2T2   B31,*+SP(64)      ; |53| 
||         MV      .L1     A14,A22

           MVKH    .S1     0xdd7abcd2,A31
||         MVKH    .S2     0x3f7c70e4,B29
||         STW     .D2T2   B30,*+SP(20)      ; |85| 

           MVKH    .S1     0x3fac718e,A29
||         MVKL    .S2     0xbf2bd010,B11
||         STW     .D2T1   A31,*+SP(72)      ; |53| 

           MVKH    .S1     0x714251b3,A28
||         MVKH    .S2     0x6fb3f6e0,B28
||         STW     .D2T1   A29,*+SP(48)      ; |86| 

           SET     .S1     A13,0x1e,0x1e,A13
||         MVKH    .S2     0x3ef152a4,B27
||         STW     .D2T1   A28,*+SP(44)      ; |86| 

           MVKH    .S1     0x3f403f99,A27
||         MVKH    .S2     0x6f58dc1c,B26
||         STW     .D2T1   A13,*+SP(60)      ; |53| 

           MVKL    .S1     0x3fe63000,A11
||         MVKL    .S2     0x5c610ca8,B10
||         STW     .D2T2   B29,*+SP(28)      ; |85| 

           MVKH    .S1     0x6fde3809,A26
||         MVKH    .S2     0x40862e42,B4
||         STW     .D2T1   A27,*+SP(56)      ; |86| 

           MVKH    .S1     0x3ff71547,A25
||         MVKH    .S2     0xbf2bd010,B11
||         STW     .D2T1   A26,*+SP(52)      ; |86| 
||         ZERO    .L1     A26               ; |85| 

           MVKH    .S1     0x652b82fe,A24
||         STW     .D2T2   B28,*+SP(24)      ; |85| 
||         MVKH    .S2     0x5c610ca8,B10

           SET     .S1     A30,0x15,0x1d,A3
||         STW     .D2T1   A25,*+SP(16)      ; |85| 
||         ZERO    .L1     A25               ; |85| 
||         MVK     .S2     0xc9,B1

           STW     .D2T1   A3,*+SP(40)       ; |86| 
||         ZERO    .L1     A3                ; |85| 
||         MVKH    .S1     0x3fe63000,A11

           STW     .D2T2   B27,*+SP(36)      ; |85| 
           STW     .D2T1   A24,*+SP(12)      ; |85| 
           STW     .D2T2   B26,*+SP(32)      ; |85| 
           STW     .D2T2   B4,*+SP(68)       ; |53| 
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*
;*      Disqualified loop: Did not find partition
;*----------------------------------------------------------------------------*
$C$L6:    
;          EXCLUSIVE CPU CYCLES: 7
           LDW     .D2T1   *+SP(12),A4
           LDW     .D2T1   *+SP(16),A5
           LDDW    .D1T1   *A22++,A17:A16    ; |85| 
           NOP             4
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 219
           MPYDP   .M1     A5:A4,A17:A16,A5:A4 ; |85| 
           LDW     .D2T2   *+SP(24),B6
           LDW     .D2T2   *+SP(28),B7
           LDW     .D2T1   *+SP(40),A27
           MV      .L1     A13,A21           ; |53| 
           SUB     .L2     B1,1,B1           ; |149| 
           NOP             4
           DPINT   .L1     A5:A4,A24         ; |85| 
           MV      .L2X    A27,B19           ; |53| 
           NOP             2
           INTDP   .L1     A24,A7:A6         ; |85| 
           NOP             4
           MPYDP   .M1     A11:A10,A7:A6,A5:A4 ; |85| 
           MPYDP   .M2X    B11:B10,A7:A6,B5:B4 ; |85| 
           LDW     .D2T1   *+SP(48),A7
           LDW     .D2T1   *+SP(44),A6
   [!B1]   MVKL    .S1     output,A10
   [!B1]   MVKH    .S1     output,A10
           NOP             4
           SUBDP   .L1     A17:A16,A5:A4,A5:A4 ; |85| 
           NOP             7
           SUBDP   .L2X    A5:A4,B5:B4,B17:B16 ; |85| 
           LDW     .D2T2   *+SP(36),B5
           LDW     .D2T2   *+SP(32),B4
           LDW     .D2T1   *+SP(56),A5       ; |85| 
           LDW     .D2T1   *+SP(52),A4       ; |85| 
           NOP             2
           MPYDP   .M2     B17:B16,B17:B16,B9:B8 ; |85| 
           NOP             9
           MPYDP   .M2     B5:B4,B9:B8,B5:B4 ; |85| 
           MPYDP   .M1X    A5:A4,B9:B8,A5:A4 ; |86| 
           NOP             8
           ADDDP   .L2     B7:B6,B5:B4,B5:B4 ; |85| 
           ADDDP   .L1     A7:A6,A5:A4,A5:A4 ; |86| 
           LDW     .D2T2   *+SP(20),B7
           MV      .L2X    A25,B6
           NOP             3
           MPYDP   .M2     B9:B8,B5:B4,B5:B4 ; |85| 
           MPYDP   .M1X    B9:B8,A5:A4,A5:A4 ; |86| 
           NOP             8
           ADDDP   .L2     B7:B6,B5:B4,B5:B4 ; |85| 
           ADDDP   .L1     A27:A26,A5:A4,A5:A4 ; |86| 
           NOP             5
           MPYDP   .M2     B17:B16,B5:B4,B7:B6 ; |85| 
           LDW     .D2T2   *+SP(68),B5
           LDW     .D2T2   *+SP(64),B4
           NOP             8
           SUBDP   .L1X    A5:A4,B7:B6,A19:A18 ; |86| 
           CMPGTDP .S2X    A17:A16,B5:B4,B0  ; |53| 
           NOP             5
           RCPDP   .S1     A19:A18,A5:A4     ; |53| 
   [ B0]   MVK     .L2     0xffffffff,B6     ; |53| 
           MPYDP   .M1     A19:A18,A5:A4,A7:A6 ; |53| 
   [ B0]   MVKL    .S2     0x7fefffff,B7
   [ B0]   MVKH    .S2     0x7fefffff,B7
           NOP             7
           SUBDP   .L1     A13:A12,A7:A6,A7:A6 ; |53| 
           NOP             6
           MPYDP   .M1     A5:A4,A7:A6,A7:A6 ; |53| 
           NOP             9
           MPYDP   .M1     A19:A18,A7:A6,A9:A8 ; |53| 
           MV      .L1     A3,A4
           MV      .L1     A13,A5
           NOP             7
           SUBDP   .L1     A5:A4,A9:A8,A5:A4 ; |53| 
           NOP             6
           MPYDP   .M1     A7:A6,A5:A4,A5:A4 ; |53| 
           NOP             9
   [!B0]   MPYDP   .M1     A19:A18,A5:A4,A7:A6 ; |53| 
           NOP             9
   [!B0]   SUBDP   .L1     A21:A20,A7:A6,A7:A6 ; |53| 
           NOP             6
   [!B0]   MPYDP   .M1     A5:A4,A7:A6,A5:A4 ; |53| 
           NOP             9
           NOP             1
   [!B0]   MPYDP   .M2X    B7:B6,A5:A4,B5:B4 ; |53| 
           NOP             9
   [!B0]   ADDDP   .L2     B19:B18,B5:B4,B5:B4 ; |53| 
           MV      .L1     A23,A4            ; |53| 
           MVK     .S1     0x400,A5
   [!B0]   ADD     .L1     A5,A24,A5         ; |53| 
   [!B0]   SHL     .S1     A5,20,A5          ; |53| 
           NOP             2

   [!B0]   MPYDP   .M2X    A5:A4,B5:B4,B7:B6 ; |53| 
||         LDW     .D2T1   *+SP(76),A5

           LDW     .D2T1   *+SP(72),A4
           NOP             4

   [ B1]   BNOP    .S2     $C$L6,2           ; |149| 
||         CMPLTDP .S1     A17:A16,A5:A4,A0  ; |53| 

   [ A0]   ZERO    .L2     B5:B4             ; |53| 

   [!A0]   MV      .L2     B7,B5             ; |53| 
|| [!A0]   MV      .S2     B6,B4             ; |53| 

   [!B1]   CALL    .S1     expdp_v           ; |152| 
||         STDW    .D2T2   B5:B4,*B20++      ; |53| 

           ; BRANCHCC OCCURS {$C$L6}         ; |149| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           LDW     .D1T2   *+A10(16),B4      ; |152| 
           MV      .L1     A14,A4            ; |152| 
           MVK     .S1     0xc9,A6           ; |152| 
           ADDKPC  .S2     $C$RL7,B3,1       ; |152| 
$C$RL7:    ; CALL OCCURS {expdp_v} {0}       ; |152| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 53
           MVK     .S2     0xc9,B4           ; |154| 

           CALLP   .S2     save_output,B3
||         LDW     .D1T1   *+A10(12),A4      ; |154| 

$C$RL8:    ; CALL OCCURS {save_output} {0}   ; |154| 
           MVKL    .S2     0xe1796495,B6
           MVKL    .S2     0x3da5fd7f,B7
           MVKH    .S2     0xe1796495,B6

           LDW     .D1T1   *A10,A4           ; |66| 
||         MVKH    .S2     0x3da5fd7f,B7

           CALLP   .S2     isequal,B3
||         LDW     .D1T2   *+A10(4),B4       ; |66| 
||         MVK     .S1     0xc9,A6           ; |66| 
||         MVK     .L1     0x9,A8            ; |66| 

$C$RL9:    ; CALL OCCURS {isequal} {0}       ; |66| 
           MVKL    .S2     fcn_pass,B4
           MVKL    .S2     0x3da5fd7f,B7
           MVKL    .S2     0xe1796495,B6
           MVKH    .S2     fcn_pass,B4
           MVKH    .S2     0x3da5fd7f,B7

           MV      .L2X    A10,B5            ; |66| 
||         STW     .D2T1   A4,*+B4(4)        ; |66| 
||         MVKH    .S2     0xe1796495,B6

           CALLP   .S2     isequal,B3
||         LDW     .D1T2   *+A10(8),B4       ; |67| 
||         LDW     .D2T1   *B5,A4            ; |67| 
||         MVK     .S1     0xc9,A6           ; |67| 
||         MVK     .L1     0x9,A8            ; |67| 

$C$RL10:   ; CALL OCCURS {isequal} {0}       ; |67| 
           MVKL    .S2     fcn_pass,B6
           MVKL    .S2     0x3da5fd7f,B7
           MVKH    .S2     fcn_pass,B6

           MVKH    .S2     0x3da5fd7f,B7
||         STW     .D2T2   B13,*+SP(80)      ; |67| 

           MV      .L2     B13,B4
||         STW     .D2T1   A4,*+B6(8)        ; |67| 
||         MVKL    .S2     0xe1796495,B6

           MV      .L2X    A10,B5
||         LDW     .D2T2   *B4,B4            ; |68| 
||         MVKH    .S2     0xe1796495,B6

           CALLP   .S2     isequal,B3
||         LDW     .D2T1   *B5,A4            ; |68| 
||         MVK     .S1     0xc9,A6           ; |68| 
||         MVK     .L1     0x9,A8            ; |68| 

$C$RL11:   ; CALL OCCURS {isequal} {0}       ; |68| 
           MVKL    .S2     fcn_pass,B4
           MVKL    .S2     0xe1796495,B6
           MVKL    .S2     0x3da5fd7f,B7
           MVKH    .S2     fcn_pass,B4

           ADD     .L1X    4,B13,A3
||         STW     .D2T1   A4,*+B4(12)       ; |68| 
||         MVKH    .S2     0xe1796495,B6

           MV      .L2X    A10,B31           ; |69| 
||         STW     .D2T1   A3,*+SP(84)
||         MVKH    .S2     0x3da5fd7f,B7

           CALLP   .S2     isequal,B3
||         LDW     .D1T2   *A3,B4            ; |69| 
||         LDW     .D2T1   *B31,A4           ; |69| 
||         MVK     .S1     0xc9,A6           ; |69| 
||         MVK     .L1     0x9,A8            ; |69| 

$C$RL12:   ; CALL OCCURS {isequal} {0}       ; |69| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 14
           MVKL    .S1     fcn_pass,A3
           MVKH    .S1     fcn_pass,A3
           ADD     .L1     4,A3,A14
           LDW     .D1T1   *A14,A0           ; |72| 
           MV      .L2X    A3,B4             ; |72| 
           STW     .D2T1   A4,*+B4(16)       ; |69| 
           ADD     .L2X    8,A3,B4
           STW     .D2T2   B4,*+SP(88)       ; |69| 

   [!A0]   B       .S1     $C$L7             ; |72| 
|| [ A0]   LDW     .D2T2   *B4,B0            ; |72| 

   [!A0]   CALL    .S1     print_test_results ; |158| 
   [ A0]   ADD     .L2     4,B4,B4
   [!A0]   MVKL    .S2     all_pass,B5
   [!A0]   MV      .L2X    A12,B4
   [!A0]   MVKH    .S2     all_pass,B5
           ; BRANCHCC OCCURS {$C$L7}         ; |72| 
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
           CALL    .S1     print_test_results ; |158| 
           MVKL    .S2     all_pass,B5
           MVKH    .S2     all_pass,B5
           NOP             2
;** --------------------------------------------------------------------------*
$C$L7:    
;          EXCLUSIVE CPU CYCLES: 1

           MVK     .L1     0x1,A4            ; |158| 
||         STW     .D2T2   B4,*B5            ; |72| 
||         ADDKPC  .S2     $C$RL13,B3,0      ; |158| 

$C$RL13:   ; CALL OCCURS {print_test_results} {0}  ; |158| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 49
           LDW     .D2T1   *+SP(72),A31      ; |91| 
           LDW     .D2T1   *+SP(12),A2
           LDW     .D2T1   *+SP(16),A18
           LDW     .D2T1   *+SP(32),A19      ; |85| 
           LDW     .D2T1   *+SP(36),A20      ; |85| 
           LDW     .D2T1   *+SP(24),A21      ; |85| 
           LDW     .D2T1   *+SP(28),A22      ; |85| 
           LDW     .D2T1   *+SP(20),A23      ; |85| 
           LDW     .D2T1   *+SP(52),A24      ; |85| 
           LDW     .D2T1   *+SP(56),A25      ; |85| 
           LDW     .D2T1   *+SP(44),A26      ; |85| 
           LDW     .D2T1   *+SP(48),A27      ; |86| 
           LDW     .D2T1   *+SP(40),A28      ; |91| 
           LDW     .D2T1   *+SP(64),A29      ; |91| 
           LDW     .D2T1   *+SP(68),A30      ; |91| 

           LDW     .D2T1   *+SP(76),A3       ; |91| 
||         ZERO    .L1     A0                ; |91| 

           STW     .D2T1   A0,*+SP(152)      ; |166| 
||         ZERO    .L2     B30               ; |85| 

           STW     .D2T2   B30,*+SP(100)     ; |166| 
           STW     .D2T1   A13,*+SP(172)     ; |91| 
           STW     .D2T1   A13,*+SP(156)     ; |91| 

           STW     .D2T1   A31,*+SP(184)     ; |91| 
||         MVK     .L2     0xffffffff,B5     ; |172| 
||         MVKL    .S2     a_sc,B6
||         ZERO    .L1     A1                ; |86| 

           STW     .D2T1   A1,*+SP(124)      ; |167| 
||         MVKH    .S2     a_sc,B6
||         MV      .L2     B5,B4             ; |172| 

           STDW    .D2T2   B5:B4,*+B6(56)    ; |172| 
           STW     .D2T1   A2,*+SP(92)
           STW     .D2T1   A18,*+SP(96)
           STW     .D2T1   A19,*+SP(116)     ; |85| 
           STW     .D2T1   A20,*+SP(120)     ; |85| 
           STW     .D2T1   A21,*+SP(108)     ; |85| 
           STW     .D2T1   A22,*+SP(112)     ; |85| 
           STW     .D2T1   A23,*+SP(104)     ; |85| 
           STW     .D2T1   A24,*+SP(140)     ; |85| 
           STW     .D2T1   A25,*+SP(144)     ; |85| 
           STW     .D2T1   A26,*+SP(132)     ; |85| 
           STW     .D2T1   A27,*+SP(136)     ; |85| 
           STW     .D2T1   A28,*+SP(128)     ; |86| 
           STW     .D2T1   A28,*+SP(164)     ; |86| 
           STW     .D2T1   A29,*+SP(176)     ; |91| 
           STW     .D2T1   A30,*+SP(180)     ; |91| 

           STW     .D2T1   A3,*+SP(188)      ; |91| 
||         ZERO    .L1     A0                ; |91| 
||         ZERO    .L2     B9

           STW     .D2T1   A0,*+SP(148)      ; |167| 
||         ZERO    .L2     B30               ; |91| 
||         ZERO    .S2     B8                ; |168| 

           STW     .D2T2   B30,*+SP(160)     ; |166| 
||         MV      .L2     B6,B31            ; |165| 
||         MVKH    .S2     0xfff00000,B9
||         ZERO    .L1     A9

           STDW    .D2T2   B9:B8,*+B31(24)   ; |168| 
||         SET     .S1     A9,0x14,0x1d,A9
||         ZERO    .L1     A5
||         ZERO    .D1     A8                ; |169| 

           STDW    .D2T1   A9:A8,*+B31(32)   ; |169| 
||         MVKH    .S1     0x80000000,A5
||         ZERO    .L1     A7
||         ZERO    .D1     A4                ; |166| 

           STDW    .D2T1   A5:A4,*+B31(8)    ; |166| 
||         SET     .S1     A7,0x14,0x1e,A7
||         ZERO    .L1     A6                ; |167| 

           STDW    .D2T1   A7:A6,*+B31(16)   ; |167| 
||         ZERO    .L1     A31               ; |91| 

           STW     .D2T1   A31,*+SP(168)     ; |166| 
||         MV      .L2     B6,B4
||         ADD     .L1     -1,A5,A17
||         MV      .S1X    B5,A16

           ZERO    .L2     B5:B4             ; |165| 
||         STDW    .D2T1   A17:A16,*+B4(48)  ; |171| 
||         ZERO    .S2     B7

           ZERO    .L2     B6                ; |170| 
||         STDW    .D2T2   B5:B4,*B6         ; |165| 
||         MV      .L1X    B6,A15            ; |165| 
||         MVKH    .S2     0xbff00000,B7

           CALL    .S1     exp               ; |175| 
||         STDW    .D2T2   B7:B6,*+B31(40)   ; |170| 
||         MVK     .L1     0x8,A12
||         ZERO    .D1     A10               ; |85| 
||         ZERO    .L2     B12

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
           LDDW    .D1T1   *A15,A5:A4        ; |175| 
           ADDKPC  .S2     $C$RL14,B3,3      ; |175| 
$C$RL14:   ; CALL OCCURS {exp} {0}           ; |175| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 30
           MVKL    .S2     output,B4
           MVKH    .S2     output,B4
           LDW     .D2T2   *B4,B4            ; |175| 
           NOP             4
           ADD     .L2     B12,B4,B4         ; |175| 
           STDW    .D2T1   A5:A4,*B4         ; |175| 

           CALLP   .S2     expdp,B3
||         LDDW    .D1T1   *A15,A5:A4        ; |176| 

$C$RL15:   ; CALL OCCURS {expdp} {0}         ; |176| 
           MVKL    .S2     output,B4
           MVKH    .S2     output,B4
           LDW     .D2T2   *+B4(4),B4        ; |176| 
           NOP             4
           ADD     .L2     B12,B4,B4         ; |176| 
           STDW    .D2T1   A5:A4,*B4         ; |176| 

           CALLP   .S2     expdp_c,B3
||         LDDW    .D1T1   *A15,A5:A4        ; |177| 

$C$RL16:   ; CALL OCCURS {expdp_c} {0}       ; |177| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 237
           MVKL    .S2     output,B4
           MVKH    .S2     output,B4
           LDW     .D2T2   *+B4(8),B4        ; |177| 
           SUB     .L1     A12,1,A2          ; |174| 
           LDW     .D2T2   *B13,B31          ; |178| 
           SUB     .L1     A12,1,A12         ; |174| 
           MVK     .S1     0x400,A31
           ADD     .L2     B12,B4,B4         ; |177| 
           STDW    .D2T1   A5:A4,*B4         ; |177| 
           LDDW    .D1T1   *A15++,A19:A18    ; |178| 
           LDW     .D2T1   *+SP(96),A5
           LDW     .D2T1   *+SP(92),A4
           ADD     .L2     B12,B31,B30       ; |178| 
           ADD     .L2     8,B12,B12         ; |174| 
   [!A2]   MVKL    .S2     output,B12
   [!A2]   MVKH    .S2     output,B12
           MPYDP   .M1     A5:A4,A19:A18,A5:A4 ; |85| 
           NOP             9
           DPINT   .L1     A5:A4,A3          ; |85| 
           NOP             3
           INTDP   .L1     A3,A5:A4          ; |85| 
           ADD     .L1     A31,A3,A3         ; |91| 
           NOP             3
           MPYDP   .M1     A11:A10,A5:A4,A7:A6 ; |85| 
           MPYDP   .M2X    B11:B10,A5:A4,B5:B4 ; |85| 
           NOP             8
           SUBDP   .L1     A19:A18,A7:A6,A5:A4 ; |85| 
           NOP             7
           SUBDP   .L2X    A5:A4,B5:B4,B9:B8 ; |85| 
           LDW     .D2T2   *+SP(120),B5
           LDW     .D2T2   *+SP(116),B4
           LDW     .D2T1   *+SP(144),A5      ; |85| 
           LDW     .D2T1   *+SP(140),A4      ; |85| 
           NOP             2
           MPYDP   .M2     B9:B8,B9:B8,B7:B6 ; |85| 
           NOP             9
           MPYDP   .M2     B5:B4,B7:B6,B17:B16 ; |85| 
           LDW     .D2T2   *+SP(112),B5
           LDW     .D2T2   *+SP(108),B4
           MPYDP   .M1X    A5:A4,B7:B6,A7:A6 ; |86| 
           LDW     .D2T1   *+SP(136),A5
           LDW     .D2T1   *+SP(132),A4
           NOP             4
           ADDDP   .L2     B5:B4,B17:B16,B5:B4 ; |85| 
           NOP             6
           MPYDP   .M2     B7:B6,B5:B4,B17:B16 ; |85| 
           ADDDP   .L1     A5:A4,A7:A6,A5:A4 ; |86| 
           LDW     .D2T2   *+SP(104),B5
           MV      .L2X    A10,B4            ; |86| 
           LDW     .D2T1   *+SP(128),A7
           MV      .L1     A10,A6            ; |85| 
           NOP             4
           ADDDP   .L2     B5:B4,B17:B16,B5:B4 ; |85| 
           MPYDP   .M1X    B7:B6,A5:A4,A5:A4 ; |86| 
           NOP             5
           MPYDP   .M2     B9:B8,B5:B4,B5:B4 ; |85| 
           NOP             3
           ADDDP   .L1     A7:A6,A5:A4,A5:A4 ; |86| 
           NOP             6
           SUBDP   .L1X    A5:A4,B5:B4,A17:A16 ; |86| 
           MV      .S1     A10,A4            ; |91| 
           MV      .L1     A13,A5
           NOP             4
           RCPDP   .S1     A17:A16,A7:A6     ; |91| 
           NOP             1
           MPYDP   .M1     A17:A16,A7:A6,A9:A8 ; |91| 
           NOP             9
           SUBDP   .L1     A5:A4,A9:A8,A5:A4 ; |91| 
           NOP             6
           MPYDP   .M1     A7:A6,A5:A4,A7:A6 ; |91| 
           NOP             9
           MPYDP   .M1     A17:A16,A7:A6,A9:A8 ; |91| 
           MV      .L1     A10,A4            ; |91| 
           MV      .L1     A13,A5            ; |91| 
           NOP             7
           SUBDP   .L1     A5:A4,A9:A8,A5:A4 ; |91| 
           NOP             6
           MPYDP   .M1     A7:A6,A5:A4,A7:A6 ; |91| 
           NOP             9
           MPYDP   .M1     A17:A16,A7:A6,A9:A8 ; |91| 
           MV      .L1     A10,A4            ; |91| 
           MV      .L1     A13,A5            ; |91| 
           NOP             7
           SUBDP   .L1     A5:A4,A9:A8,A5:A4 ; |91| 
           NOP             6
           MPYDP   .M1     A7:A6,A5:A4,A5:A4 ; |91| 
           NOP             9
           NOP             1
           MPYDP   .M2X    B5:B4,A5:A4,B7:B6 ; |91| 
           LDW     .D2T2   *+SP(164),B5
           NOP             7
           MV      .L2X    A10,B4            ; |91| 
           ADDDP   .L2     B5:B4,B7:B6,B5:B4 ; |91| 
           MV      .L1     A10,A4            ; |91| 
           SHL     .S1     A3,20,A5          ; |91| 
           LDW     .D2T2   *+SP(180),B7      ; |178| 
           LDW     .D2T2   *+SP(176),B6      ; |178| 
           NOP             2
           MPYDP   .M2X    A5:A4,B5:B4,B5:B4 ; |91| 
           LDW     .D2T1   *+SP(188),A5      ; |94| 
           LDW     .D2T1   *+SP(184),A4      ; |94| 
           NOP             3
           CMPGTDP .S2X    A19:A18,B7:B6,B0  ; |94| 
           CMPLTDP .S1     A19:A18,A5:A4,A0  ; |99| 
   [ A2]   BNOP    .S2     $C$L8,1           ; |174| 

   [ B0]   MVKL    .S2     0x7fefffff,B5
|| [ B0]   MVK     .L2     0xffffffff,B4     ; |95| 

   [ B0]   MVKH    .S2     0x7fefffff,B5
   [ A0]   ZERO    .L2     B5:B4             ; |100| 

   [ A2]   CALL    .S1     exp               ; |175| 
||         STDW    .D2T2   B5:B4,*B30        ; |178| 

           ; BRANCHCC OCCURS {$C$L8}         ; |174| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 6
           CALL    .S1     expdp_v           ; |180| 
           LDW     .D2T2   *+B12(16),B4      ; |180| 
           MVKL    .S1     a_sc,A4
           MVKH    .S1     a_sc,A4
           ADDKPC  .S2     $C$RL17,B3,0      ; |180| 
           MVK     .L1     0x8,A6            ; |180| 
$C$RL17:   ; CALL OCCURS {expdp_v} {0}       ; |180| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 43
           MVKL    .S2     0x3da5fd7f,B7
           MVKL    .S2     0xe1796495,B6
           MVKH    .S2     0x3da5fd7f,B7

           LDW     .D2T1   *B12,A4           ; |66| 
||         MVKH    .S2     0xe1796495,B6

           CALLP   .S2     isequal,B3
||         LDW     .D2T2   *+B12(4),B4       ; |66| 
||         MVK     .L1     0x8,A6            ; |66| 
||         MVK     .S1     0x9,A8            ; |66| 

$C$RL18:   ; CALL OCCURS {isequal} {0}       ; |66| 
           MVKL    .S2     0x3da5fd7f,B7

           MVKL    .S1     fcn_pass,A3
||         MVKL    .S2     0xe1796495,B6

           MVKH    .S1     fcn_pass,A3
||         MVKH    .S2     0x3da5fd7f,B7

           STW     .D1T1   A4,*+A3(4)        ; |66| 
||         LDW     .D2T2   *+B12(8),B4       ; |67| 
||         MVKH    .S2     0xe1796495,B6

           CALLP   .S2     isequal,B3
||         LDW     .D2T1   *B12,A4           ; |67| 
||         MVK     .L1     0x8,A6            ; |67| 
||         MVK     .S1     0x9,A8            ; |67| 

$C$RL19:   ; CALL OCCURS {isequal} {0}       ; |67| 
           MVKL    .S2     0x3da5fd7f,B7

           MVKL    .S1     fcn_pass,A5
||         MVKL    .S2     0xe1796495,B6

           MVKH    .S1     fcn_pass,A5
||         MVKH    .S2     0x3da5fd7f,B7

           MV      .L1X    B12,A3            ; |67| 
||         STW     .D1T1   A4,*+A5(8)        ; |67| 
||         MVKH    .S2     0xe1796495,B6

           CALLP   .S2     isequal,B3
||         LDW     .D1T1   *A3,A4            ; |68| 
||         LDW     .D2T2   *+B12(12),B4      ; |68| 
||         MVK     .L1     0x8,A6            ; |68| 
||         MVK     .S1     0x9,A8            ; |68| 

$C$RL20:   ; CALL OCCURS {isequal} {0}       ; |68| 
           LDW     .D2T1   *+SP(84),A3       ; |68| 
           MVKL    .S2     0xe1796495,B6
           MVKL    .S1     fcn_pass,A31
           MVKL    .S2     0x3da5fd7f,B7
           MVKH    .S1     fcn_pass,A31

           MVKH    .S2     0xe1796495,B6
||         STW     .D2T1   A3,*+SP(92)       ; |68| 

           MV      .L2X    A3,B4             ; |66| 
||         MV      .L1X    B12,A3            ; |69| 
||         STW     .D1T1   A4,*+A31(12)      ; |68| 
||         MVKH    .S2     0x3da5fd7f,B7

           CALLP   .S2     isequal,B3
||         LDW     .D2T2   *B4,B4            ; |69| 
||         LDW     .D1T1   *A3,A4            ; |69| 
||         MVK     .L1     0x8,A6            ; |69| 
||         MVK     .S1     0x9,A8            ; |69| 

$C$RL21:   ; CALL OCCURS {isequal} {0}       ; |69| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 12

           LDW     .D2T1   *+SP(88),A3
||         MV      .L2X    A14,B4            ; |69| 
||         MVKL    .S1     fcn_pass,A31

           LDW     .D2T2   *B4,B0            ; |72| 
           MVKH    .S1     fcn_pass,A31
           STW     .D1T1   A4,*+A31(16)      ; |69| 
           STW     .D2T1   A14,*+SP(96)      ; |69| 
           STW     .D2T1   A3,*+SP(100)      ; |72| 

   [!B0]   MV      .L1     A10,A4
|| [!B0]   B       .S1     $C$L9             ; |72| 
|| [ B0]   LDW     .D2T2   *+SP(100),B4

   [!B0]   CALL    .S1     print_test_results ; |184| 
   [!B0]   MVKL    .S1     all_pass,A3
           MV      .L2     B0,B1             ; guard predicate rewrite
   [!B0]   MVKH    .S1     all_pass,A3

   [ B0]   LDW     .D2T2   *B4,B0            ; |72| 
|| [ B1]   ADD     .L2     4,B4,B4

           ; BRANCHCC OCCURS {$C$L9}         ; |72| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 14
           CMPEQ   .L1     A4,0,A3           ; |72| 
           XOR     .L1     1,A3,A3           ; |72| 
           MVK     .L1     0x1,A4            ; |72| 
           NOP             1
   [ B0]   LDW     .D2T2   *B4,B4            ; |72| 
   [!B0]   MV      .L1     A10,A0            ; |72| 
           NOP             3
   [ B0]   CMPEQ   .L2     B4,0,B4           ; |72| 
   [ B0]   XOR     .L2     1,B4,B4           ; |72| 
           NOP             1
   [ B0]   AND     .L1X    A3,B4,A0          ; |72| 
   [!A0]   MV      .L1     A10,A4
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           CALL    .S1     print_test_results ; |184| 
           MVKL    .S1     all_pass,A3
           MVKH    .S1     all_pass,A3
           NOP             2
;** --------------------------------------------------------------------------*
$C$L9:    
;          EXCLUSIVE CPU CYCLES: 1

           STW     .D1T1   A4,*A3            ; |72| 
||         MVK     .L1     0x3,A4            ; |184| 
||         ADDKPC  .S2     $C$RL22,B3,0      ; |184| 

$C$RL22:   ; CALL OCCURS {print_test_results} {0}  ; |184| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 28
           LDW     .D2T1   *+SP(68),A30      ; |91| 
           LDW     .D2T1   *+SP(44),A25      ; |85| 
           LDW     .D2T1   *+SP(76),A3       ; |91| 
           LDW     .D2T1   *+SP(72),A31      ; |91| 
           LDW     .D2T1   *+SP(40),A27      ; |91| 
           LDW     .D2T1   *+SP(64),A29      ; |91| 
           LDW     .D2T1   *+SP(20),A24      ; |85| 

           LDW     .D2T1   *+SP(48),A26      ; |86| 
||         MV      .L2X    A10,B30

           STW     .D2T2   B30,*+SP(104)     ; |187| 
||         MV      .L1     A10,A23           ; |85| 

           STW     .D2T1   A23,*+SP(112)     ; |187| 
||         MV      .L1     A13,A28           ; |91| 

           STW     .D2T1   A28,*+SP(80)      ; |91| 

           STW     .D2T1   A23,*+SP(68)
||         MV      .L1     A10,A6            ; |85| 

           STW     .D2T1   A6,*+SP(44)
||         MVKL    .S2     0xcccccccd,B31
||         MV      .L1     A10,A4            ; |85| 

           STW     .D2T1   A4,*+SP(76)       ; |187| 
||         MVKL    .S2     0xc000cccc,B5

           STW     .D2T1   A28,*+SP(72)      ; |91| 
||         MVKH    .S2     0xcccccccd,B31

           STW     .D2T2   B31,*+SP(132)     ; |193| 
||         MVKH    .S2     0xc000cccc,B5

           STW     .D2T2   B5,*+SP(136)      ; |193| 
           STW     .D2T1   A27,*+SP(60)      ; |86| 
           STW     .D2T1   A27,*+SP(108)     ; |86| 
           STW     .D2T1   A29,*+SP(116)     ; |91| 
           STW     .D2T1   A30,*+SP(120)     ; |91| 
           STW     .D2T1   A31,*+SP(124)     ; |91| 
           STW     .D2T1   A3,*+SP(128)      ; |91| 
           STW     .D2T1   A24,*+SP(40)      ; |85| 

           STW     .D2T1   A25,*+SP(48)      ; |85| 
||         MVKL    .S2     a_ext,B4
||         ZERO    .L1     A5

           STW     .D2T1   A26,*+SP(64)      ; |85| 
||         SET     .S1     A5,0x14,0x14,A5
||         MVKH    .S2     a_ext,B4

           STDW    .D2T1   A5:A4,*B4         ; |187| 
||         MV      .L2X    A10,B30
||         MV      .S2     B13,B12           ; |193| 

           CALL    .S2     exp               ; |189| 
||         STW     .D2T2   B30,*+SP(20)      ; |187| 
||         MV      .L1X    B4,A13            ; |187| 
||         MV      .L2X    A10,B13
||         MVK     .S1     0x777,A15
||         MV      .D1     A13,A12           ; |91| 

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L10:    
;          EXCLUSIVE CPU CYCLES: 5
           LDDW    .D1T1   *A13,A5:A4        ; |189| 
           ADDKPC  .S2     $C$RL23,B3,3      ; |189| 
$C$RL23:   ; CALL OCCURS {exp} {0}           ; |189| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 30
           MVKL    .S2     output,B4
           MVKH    .S2     output,B4
           LDW     .D2T2   *B4,B4            ; |189| 
           NOP             4
           ADD     .L2     B13,B4,B4         ; |189| 
           STDW    .D2T1   A5:A4,*B4         ; |189| 

           CALLP   .S2     expdp,B3
||         LDDW    .D1T1   *A13,A5:A4        ; |190| 

$C$RL24:   ; CALL OCCURS {expdp} {0}         ; |190| 
           MVKL    .S2     output,B4
           MVKH    .S2     output,B4
           LDW     .D2T2   *+B4(4),B4        ; |190| 
           NOP             4
           ADD     .L2     B13,B4,B4         ; |190| 
           STDW    .D2T1   A5:A4,*B4         ; |190| 

           CALLP   .S2     expdp_c,B3
||         LDDW    .D1T1   *A13,A5:A4        ; |191| 

$C$RL25:   ; CALL OCCURS {expdp_c} {0}       ; |191| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 256
           MVKL    .S2     output,B4
           MVKH    .S2     output,B4
           LDW     .D2T2   *+B4(8),B4        ; |191| 
           MVK     .S1     0x400,A31
           LDW     .D2T2   *B12,B31          ; |192| 
           SUB     .L1     A15,1,A2          ; |188| 
           SUB     .L1     A15,1,A15         ; |188| 
           ADD     .L2     B13,B4,B4         ; |191| 
           STDW    .D2T1   A5:A4,*B4         ; |191| 
           LDDW    .D1T1   *A13,A19:A18      ; |192| 
           LDW     .D2T1   *+SP(16),A5
           LDW     .D2T1   *+SP(12),A4
           NOP             4
           MPYDP   .M1     A5:A4,A19:A18,A5:A4 ; |85| 
           NOP             9
           DPINT   .L1     A5:A4,A3          ; |85| 
           NOP             3
           INTDP   .L1     A3,A5:A4          ; |85| 
           ADD     .L1     A31,A3,A3         ; |91| 
           NOP             3
           MPYDP   .M1     A11:A10,A5:A4,A7:A6 ; |85| 
           MPYDP   .M2X    B11:B10,A5:A4,B5:B4 ; |85| 
           NOP             8
           SUBDP   .L1     A19:A18,A7:A6,A5:A4 ; |85| 
   [!A2]   MVKL    .S2     output,B10
   [!A2]   MVKH    .S2     output,B10
           NOP             5
           SUBDP   .L2X    A5:A4,B5:B4,B9:B8 ; |85| 
           LDW     .D2T2   *+SP(36),B5
           LDW     .D2T2   *+SP(32),B4
           LDW     .D2T1   *+SP(56),A5       ; |85| 
           LDW     .D2T1   *+SP(52),A4       ; |85| 
           NOP             2
           MPYDP   .M2     B9:B8,B9:B8,B7:B6 ; |85| 
           NOP             9
           MPYDP   .M2     B5:B4,B7:B6,B17:B16 ; |85| 
           LDW     .D2T2   *+SP(28),B5
           LDW     .D2T2   *+SP(24),B4
           MPYDP   .M1X    A5:A4,B7:B6,A7:A6 ; |86| 
           LDW     .D2T1   *+SP(64),A5
           LDW     .D2T1   *+SP(48),A4
           NOP             4
           ADDDP   .L2     B5:B4,B17:B16,B5:B4 ; |85| 
           NOP             6
           MPYDP   .M2     B7:B6,B5:B4,B17:B16 ; |85| 
           ADDDP   .L1     A5:A4,A7:A6,A5:A4 ; |86| 
           LDW     .D2T2   *+SP(40),B5
           MV      .L2X    A10,B4            ; |86| 
           LDW     .D2T1   *+SP(60),A7
           MV      .L1     A10,A6            ; |85| 
           NOP             4
           ADDDP   .L2     B5:B4,B17:B16,B5:B4 ; |85| 
           MPYDP   .M1X    B7:B6,A5:A4,A5:A4 ; |86| 
           NOP             5
           MPYDP   .M2     B9:B8,B5:B4,B5:B4 ; |85| 
           NOP             3
           ADDDP   .L1     A7:A6,A5:A4,A5:A4 ; |86| 
           NOP             6
           SUBDP   .L1X    A5:A4,B5:B4,A17:A16 ; |86| 
           MV      .S1     A10,A4            ; |91| 
           MV      .L1     A12,A5            ; |91| 
           NOP             4
           RCPDP   .S1     A17:A16,A7:A6     ; |91| 
           NOP             1
           MPYDP   .M1     A17:A16,A7:A6,A9:A8 ; |91| 
           NOP             9
           SUBDP   .L1     A5:A4,A9:A8,A5:A4 ; |91| 
           NOP             6
           MPYDP   .M1     A7:A6,A5:A4,A7:A6 ; |91| 
           NOP             9
           MPYDP   .M1     A17:A16,A7:A6,A9:A8 ; |91| 
           MV      .L1     A10,A4            ; |91| 
           MV      .L1     A12,A5            ; |91| 
           NOP             7
           SUBDP   .L1     A5:A4,A9:A8,A5:A4 ; |91| 
           NOP             6
           MPYDP   .M1     A7:A6,A5:A4,A7:A6 ; |91| 
           NOP             9
           MPYDP   .M1     A17:A16,A7:A6,A9:A8 ; |91| 
           MV      .L1     A10,A4            ; |91| 
           MV      .L1     A12,A5
           NOP             7
           SUBDP   .L1     A5:A4,A9:A8,A5:A4 ; |91| 
           NOP             6
           MPYDP   .M1     A7:A6,A5:A4,A5:A4 ; |91| 
           NOP             9
           NOP             1
           MPYDP   .M2X    B5:B4,A5:A4,B7:B6 ; |91| 
           LDW     .D2T2   *+SP(108),B5
           NOP             7
           MV      .L2X    A10,B4            ; |91| 
           ADDDP   .L2     B5:B4,B7:B6,B5:B4 ; |91| 
           MV      .L1     A10,A4            ; |91| 
           SHL     .S1     A3,20,A5          ; |91| 
           ADD     .L2     B13,B31,B6        ; |192| 
           ADD     .L2     8,B13,B13         ; |188| 
           NOP             2

           MPYDP   .M2X    A5:A4,B5:B4,B5:B4 ; |91| 
||         LDW     .D2T1   *+SP(120),A5

           LDW     .D2T1   *+SP(116),A4
           NOP             4

           CMPGTDP .S1     A19:A18,A5:A4,A0  ; |94| 
||         LDW     .D2T1   *+SP(128),A5

           LDW     .D2T1   *+SP(124),A4
           NOP             2
   [ A0]   MVK     .L2     0xffffffff,B4     ; |95| 
   [ A0]   MVKL    .S2     0x7fefffff,B5
           CMPLTDP .S1     A19:A18,A5:A4,A1  ; |99| 
   [ A0]   MVKH    .S2     0x7fefffff,B5
   [ A1]   ZERO    .L2     B5:B4             ; |100| 
           STDW    .D2T2   B5:B4,*B6         ; |192| 

           LDDW    .D1T1   *A13,A5:A4        ; |193| 
||         LDW     .D2T2   *+SP(136),B5

           LDW     .D2T2   *+SP(132),B4
           NOP             4
           MPYDP   .M2X    B5:B4,A5:A4,B5:B4 ; |193| 
           NOP             4
   [ A2]   BNOP    .S1     $C$L10,4          ; |188| 

   [ A2]   CALL    .S1     exp               ; |189| 
||         STDW    .D1T2   B5:B4,*++A13      ; |193| 

           ; BRANCHCC OCCURS {$C$L10}        ; |188| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 6
           CALL    .S1     expdp_v           ; |195| 
           LDW     .D2T2   *+B10(16),B4      ; |195| 
           MVKL    .S1     a_ext,A4
           MVKH    .S1     a_ext,A4
           ADDKPC  .S2     $C$RL26,B3,0      ; |195| 
           MVK     .S1     0x777,A6          ; |195| 
$C$RL26:   ; CALL OCCURS {expdp_v} {0}       ; |195| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 43
           MVKL    .S2     0x3da5fd7f,B7
           MVKL    .S2     0xe1796495,B6
           MVKH    .S2     0x3da5fd7f,B7

           LDW     .D2T1   *B10,A4           ; |66| 
||         MVKH    .S2     0xe1796495,B6

           CALLP   .S2     isequal,B3
||         LDW     .D2T2   *+B10(4),B4       ; |66| 
||         MVK     .S1     0x777,A6          ; |66| 
||         MVK     .L1     0x9,A8            ; |66| 

$C$RL27:   ; CALL OCCURS {isequal} {0}       ; |66| 
           MVKL    .S2     fcn_pass,B11
           MVKL    .S2     0x3da5fd7f,B7
           MVKH    .S2     fcn_pass,B11
           MVKL    .S2     0xe1796495,B6

           LDW     .D2T2   *+B10(8),B4       ; |67| 
||         MVKH    .S2     0x3da5fd7f,B7

           STW     .D2T1   A4,*+B11(4)       ; |66| 
||         MVKH    .S2     0xe1796495,B6

           CALLP   .S2     isequal,B3
||         LDW     .D2T1   *B10,A4           ; |67| 
||         MVK     .S1     0x777,A6          ; |67| 
||         MVK     .L1     0x9,A8            ; |67| 

$C$RL28:   ; CALL OCCURS {isequal} {0}       ; |67| 
           MVKL    .S2     0x3da5fd7f,B7
           MVKL    .S2     0xe1796495,B6
           MVKH    .S2     0x3da5fd7f,B7

           MV      .L1X    B10,A3            ; |67| 
||         STW     .D2T1   A4,*+B11(8)       ; |67| 
||         MVKH    .S2     0xe1796495,B6

           CALLP   .S2     isequal,B3
||         LDW     .D1T1   *A3,A4            ; |68| 
||         LDW     .D2T2   *+B10(12),B4      ; |68| 
||         MVK     .S1     0x777,A6          ; |68| 
||         MVK     .L1     0x9,A8            ; |68| 

$C$RL29:   ; CALL OCCURS {isequal} {0}       ; |68| 
           LDW     .D2T1   *+SP(84),A3       ; |68| 
           MVKL    .S2     0x3da5fd7f,B7
           MVKL    .S2     0xe1796495,B6
           MVKH    .S2     0x3da5fd7f,B7

           MV      .L2     B10,B4            ; |68| 
||         STW     .D2T1   A4,*+B11(12)      ; |68| 
||         MVKH    .S2     0xe1796495,B6

           CALLP   .S2     isequal,B3
||         LDW     .D2T1   *B4,A4            ; |69| 
||         LDW     .D1T2   *A3,B4            ; |69| 
||         MVK     .S1     0x777,A6          ; |69| 
||         MVK     .L1     0x9,A8            ; |69| 

$C$RL30:   ; CALL OCCURS {isequal} {0}       ; |69| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 11

           LDW     .D1T1   *A14,A0           ; |72| 
||         LDW     .D2T2   *+SP(88),B4

           STW     .D2T1   A4,*+B11(16)      ; |69| 
           NOP             3

   [ A0]   ADD     .L2     4,B4,B4
|| [!A0]   B       .S1     $C$L11            ; |72| 
|| [ A0]   LDW     .D2T2   *B4,B0            ; |72| 

   [!A0]   CALL    .S1     print_test_results ; |199| 
   [!A0]   MVKL    .S1     all_pass,A3
   [!A0]   MVKH    .S1     all_pass,A3
   [!A0]   MV      .L2X    A10,B4
   [!A0]   MV      .L2X    A3,B5
           ; BRANCHCC OCCURS {$C$L11}        ; |72| 
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
           CALL    .S1     print_test_results ; |199| 
           MVKL    .S1     all_pass,A3
           MVKH    .S1     all_pass,A3
           NOP             1
           MV      .L2X    A3,B5
;** --------------------------------------------------------------------------*
$C$L11:    
;          EXCLUSIVE CPU CYCLES: 1

           MVK     .L1     0x4,A4            ; |199| 
||         STW     .D2T2   B4,*B5            ; |72| 
||         ADDKPC  .S2     $C$RL31,B3,0      ; |199| 

$C$RL31:   ; CALL OCCURS {print_test_results} {0}  ; |199| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 16
           MVKL    .S1     cycle_counts+24,A3

           MVKH    .S1     cycle_counts+24,A3
||         MV      .L2X    A10,B4            ; |114| 
||         MV      .L1     A10,A11           ; |114| 

           MVC     .S2     B4,TSCL           ; |115| 
||         STDW    .D1T1   A11:A10,*A3       ; |114| 

           MVC     .S2     TSCL,B6           ; |116| 
           MVC     .S2     TSCH,B7           ; |116| 
           MVKL    .S1     t_start,A3
           MVKH    .S1     t_start,A3

           MVC     .S2     TSCL,B4           ; |117| 
||         STDW    .D1T2   B7:B6,*A3         ; |116| 

           MVC     .S2     TSCH,B8           ; |117| 
           SUBU    .L2     B4,B6,B5:B4       ; |117| 

           EXT     .S2     B5,24,24,B6       ; |117| 
||         SUB     .L2     B8,B7,B31         ; |117| 
||         MVKL    .S1     t_offset,A3

           ADD     .L2     B31,B6,B5         ; |117| 
||         MVKH    .S1     t_offset,A3

           MVK     .S2     0x80,B4
||         STDW    .D1T2   B5:B4,*A3         ; |117| 

           MVKL    .S1     0x40963000,A5

           MVKL    .S2     input,B4
||         MV      .L1X    B4,A12            ; |117| 
||         MVKH    .S1     0x40963000,A5

           CALL    .S1     gimme_random      ; |208| 
||         MVKH    .S2     input,B4
||         MV      .L1     A11,A13
||         MV      .D1     A10,A4            ; |208| 

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L12:    
;          EXCLUSIVE CPU CYCLES: 5
           LDW     .D2T2   *B4,B12           ; |208| 
           MVKL    .S2     0xc0863000,B5
           MVKH    .S2     0xc0863000,B5
           ADDKPC  .S2     $C$RL32,B3,0      ; |208| 
           MV      .L2X    A11,B4            ; |208| 
$C$RL32:   ; CALL OCCURS {gimme_random} {0}  ; |208| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 248
           ADD     .L2X    B12,A13,B4        ; |208| 

           STDW    .D2T1   A5:A4,*B4         ; |208| 
||         MVC     .S2     TSCL,B8           ; |122| 

           MVC     .S2     TSCH,B9           ; |122| 
           MVKL    .S1     0x3ff71547,A7
           MVKL    .S1     0x652b82fe,A6
           MVKH    .S1     0x3ff71547,A7
           MVKH    .S1     0x652b82fe,A6
           MPYDP   .M1     A7:A6,A5:A4,A7:A6 ; |53| 
           MV      .L2X    A11,B4            ; |53| 
           MVKL    .S2     0x3fe63000,B5
           MVKH    .S2     0x3fe63000,B5
           MVKL    .S2     0xbf2bd010,B7
           MVKL    .S2     0x5c610ca8,B6
           MVKH    .S2     0xbf2bd010,B7
           MVKH    .S2     0x5c610ca8,B6
           MVKL    .S2     0x3f7c70e4,B19
           MVKL    .S2     0x6fb3f6e0,B18
           DPINT   .L1     A7:A6,A16         ; |53| 
           MVKH    .S2     0x3f7c70e4,B19
           MVKH    .S2     0x6fb3f6e0,B18
           ZERO    .S1     A31
           INTDP   .L1     A16,A7:A6         ; |53| 
           ZERO    .L2     B31
           ZERO    .L2     B30
           MV      .L2X    A11,B10           ; |53| 
           ADD     .S1X    B12,A13,A29       ; |94| 
           ZERO    .L2     B11
           MPYDP   .M2X    B5:B4,A7:A6,B5:B4 ; |53| 
           MPYDP   .M1X    B7:B6,A7:A6,A7:A6 ; |53| 
           MVK     .S1     0x400,A3
           MVKL    .S1     output+12,A30
           MVKH    .S1     output+12,A30
           MVKL    .S1     t_start,A28
           LDW     .D1T1   *A30,A27          ; |212| 
           MVKH    .S1     t_start,A28
           SET     .S2     B11,0x15,0x1d,B11
           STDW    .D1T2   B9:B8,*A28
           SUBDP   .L2X    A5:A4,B5:B4,B5:B4 ; |53| 
           ADD     .L1     A3,A16,A3         ; |91| 
           ADD     .L1     A13,A27,A26       ; |212| 
           NOP             4
           SUBDP   .L2X    B5:B4,A7:A6,B5:B4 ; |53| 
           MVKL    .S1     0x3ef152a4,A7
           MVKL    .S1     0x6f58dc1c,A6
           MVKH    .S1     0x3ef152a4,A7
           MVKH    .S1     0x6f58dc1c,A6
           NOP             2
           MPYDP   .M2     B5:B4,B5:B4,B7:B6 ; |53| 
           NOP             9
           MPYDP   .M2X    A7:A6,B7:B6,B17:B16 ; |53| 
           NOP             2
           MVKL    .S1     0x6fde3809,A6
           MVKL    .S1     0x3f403f99,A7
           MVKH    .S1     0x6fde3809,A6
           MVKH    .S1     0x3f403f99,A7
           MPYDP   .M1X    A7:A6,B7:B6,A7:A6 ; |53| 
           NOP             3
           ADDDP   .L2     B19:B18,B17:B16,B17:B16 ; |53| 
           MVKL    .S2     0x3fac718e,B19
           MVKL    .S2     0x714251b3,B18
           MVKH    .S2     0x3fac718e,B19
           MVKH    .S2     0x714251b3,B18
           NOP             1
           ADDDP   .L1X    B19:B18,A7:A6,A7:A6 ; |53| 
           MPYDP   .M2     B7:B6,B17:B16,B17:B16 ; |53| 
           NOP             5
           MPYDP   .M1X    B7:B6,A7:A6,A19:A18 ; |53| 
           NOP             2

           ZERO    .L1     A7
||         MV      .S1     A10,A6            ; |53| 

           MVKH    .S1     0x3fd00000,A7
           ADDDP   .L1X    A7:A6,B17:B16,A7:A6 ; |53| 
           SET     .S2     B30,0x1e,0x1e,B17
           MV      .L2X    A11,B16           ; |53| 
           NOP             4
           MPYDP   .M1X    B5:B4,A7:A6,A9:A8 ; |53| 
           NOP             2

           MV      .L1     A10,A6            ; |53| 
||         SET     .S1     A31,0x15,0x1d,A7

           ADDDP   .L1     A7:A6,A19:A18,A7:A6 ; |53| 
           SET     .S2     B31,0x1e,0x1e,B5
           MV      .L2X    A11,B4            ; |53| 
           NOP             4
           SUBDP   .L1     A7:A6,A9:A8,A19:A18 ; |53| 
           NOP             6
           RCPDP   .S1     A19:A18,A7:A6     ; |53| 
           NOP             1
           MPYDP   .M1     A7:A6,A19:A18,A21:A20 ; |53| 
           NOP             9
           NOP             1
           SUBDP   .L2X    B5:B4,A21:A20,B5:B4 ; |53| 
           MVKL    .S1     0x40862e42,A21
           MVKL    .S1     0xff7a39eb,A20
           MVKH    .S1     0x40862e42,A21
           MVKH    .S1     0xff7a39eb,A20
           NOP             2
           MPYDP   .M2X    A7:A6,B5:B4,B5:B4 ; |53| 
           NOP             9
           MPYDP   .M2X    B5:B4,A19:A18,B7:B6 ; |53| 
           NOP             9
           SUBDP   .L2     B17:B16,B7:B6,B7:B6 ; |53| 
           NOP             6
           MPYDP   .M2     B7:B6,B5:B4,B5:B4 ; |53| 
           NOP             9
           NOP             1
           MPYDP   .M1X    B5:B4,A19:A18,A7:A6 ; |53| 
           NOP             7
           MV      .L1     A10,A18           ; |53| 
           MV      .L1X    B17,A19           ; |53| 
           SUBDP   .L1     A19:A18,A7:A6,A7:A6 ; |53| 
           MVKL    .S1     0xc086232b,A19
           MVKL    .S1     0xdd7abcd2,A18
           MVKH    .S1     0xc086232b,A19
           MVKH    .S1     0xdd7abcd2,A18
           CMPLTDP .S1     A5:A4,A19:A18,A1  ; |99| 
           NOP             2
           MPYDP   .M2X    B5:B4,A7:A6,B5:B4 ; |53| 
           NOP             9
           MPYDP   .M2X    A9:A8,B5:B4,B5:B4 ; |53| 
           SHL     .S1     A3,20,A7          ; |91| 
           MV      .L1     A10,A6            ; |91| 
           LDDW    .D1T1   *A29,A9:A8        ; |94| 
           NOP             6
           ADDDP   .L2     B11:B10,B5:B4,B5:B4 ; |91| 
           CMPGTDP .S1     A9:A8,A21:A20,A0  ; |94| 
           NOP             6
           MPYDP   .M1X    A7:A6,B5:B4,A7:A6 ; |91| 
           NOP             9

   [ A0]   MVKL    .S1     0x7fefffff,A7
|| [ A0]   MVK     .L1     0xffffffff,A6     ; |95| 

   [ A0]   MVKH    .S1     0x7fefffff,A7
   [ A1]   ZERO    .L1     A7:A6             ; |100| 

           STDW    .D1T1   A7:A6,*A26        ; |212| 
||         MVC     .S2     TSCL,B16          ; |128| 

           MVC     .S2     TSCH,B6           ; |128| 

           MVKL    .S2     t_offset,B10
||         SUB     .L1     A12,1,A0          ; |206| 
||         MV      .L2     B6,B17            ; |128| 
||         MVKL    .S1     cycle_counts+24,A15
||         ADD     .D1     8,A13,A13         ; |206| 

           MVKH    .S2     t_offset,B10
|| [ A0]   MVKL    .S1     0x40963000,A5
|| [ A0]   MV      .L1     A10,A4            ; |208| 
||         SUB     .D1     A12,1,A12         ; |206| 

           LDDW    .D2T2   *B10,B21:B20      ; |130| 
||         MVKL    .S2     cycle_counts+24,B4
||         MVKH    .S1     cycle_counts+24,A15

           MVKH    .S2     cycle_counts+24,B4
|| [ A0]   MVKH    .S1     0x40963000,A5

           LDDW    .D2T2   *B4,B19:B18       ; |130| 
||         MVKL    .S2     t_stop,B6

           MVKH    .S2     t_stop,B6
           STDW    .D2T2   B17:B16,*B6       ; |128| 
           ADDU    .L2     B20,B8,B5:B4      ; |130| 

           ADD     .S2     B5,B21,B7         ; |130| 
|| [ A0]   B       .S1     $C$L12            ; |206| 
||         SUBU    .L2     B16,B4,B5:B4      ; |130| 

           ADD     .D2     B7,B9,B7          ; |130| 
||         EXT     .S2     B5,24,24,B9       ; |130| 
||         ADDU    .L2     B18,B4,B5:B4      ; |130| 

           SUB     .L2     B17,B7,B7         ; |130| 
||         MV      .S2     B4,B8             ; |130| 
||         ADD     .D2     B5,B19,B4         ; |130| 

           ADD     .L2     B7,B9,B5          ; |130| 

           ADD     .L2     B4,B5,B9          ; |130| 
|| [ A0]   MVKL    .S2     input,B4

   [ A0]   CALL    .S1     gimme_random      ; |208| 
|| [ A0]   MVKH    .S2     input,B4
||         STDW    .D1T2   B9:B8,*A15        ; |130| 

           ; BRANCHCC OCCURS {$C$L12}        ; |206| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 6
           CALL    .S1     __c6xabi_fltllif  ; |135| 
           LDDW    .D1T1   *A15,A5:A4        ; |135| 
           ADDKPC  .S2     $C$RL33,B3,3      ; |135| 
$C$RL33:   ; CALL OCCURS {__c6xabi_fltllif} {0}  ; |135| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 15
           ZERO    .L1     A14
           SET     .S1     A14,0x1a,0x1d,A14
           MPYSP   .M1     A14,A4,A3         ; |135| 
           MV      .L1X    B11,A13           ; |135| 
           MV      .L1     A10,A12           ; |135| 
           NOP             1
           SPDP    .S1     A3,A5:A4          ; |135| 
           NOP             1
           ADDDP   .L1     A13:A12,A5:A4,A5:A4 ; |135| 
           CALLP   .S2     __c6xabi_fixdlli,B3
$C$RL34:   ; CALL OCCURS {__c6xabi_fixdlli} {0}  ; |135| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 12

           MV      .L2X    A15,B4
||         SUBAW   .D1     A15,6,A3

           STDW    .D1T1   A11:A10,*A3       ; |114| 
||         MV      .L2X    A11,B5            ; |114| 

           MVC     .S2     B5,TSCL           ; |115| 
||         STDW    .D2T1   A5:A4,*B4         ; |135| 

           MVC     .S2     TSCL,B5           ; |116| 
           MVC     .S2     TSCH,B4           ; |116| 
           MVC     .S2     TSCL,B6           ; |117| 
           MVC     .S2     TSCH,B8           ; |117| 
           MVKL    .S1     output,A3

           MVKH    .S1     output,A3
||         SUBU    .L2     B6,B5,B7:B6       ; |117| 

           MVK     .S1     0x80,A3
||         EXT     .S2     B7,24,24,B5       ; |117| 
||         LDW     .D1T1   *A3,A12
||         SUB     .L2     B8,B4,B4          ; |117| 

           ADD     .L2     B4,B5,B7          ; |117| 

           MV      .L2X    A3,B10            ; |117| 
||         STDW    .D2T2   B7:B6,*B10        ; |117| 
||         MV      .L1X    B12,A15

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
;          EXCLUSIVE CPU CYCLES: 8
           MVC     .S2     TSCL,B4           ; |122| 
           MVC     .S2     TSCH,B5           ; |122| 
           CALL    .S1     exp               ; |221| 
           LDDW    .D1T1   *A15++,A5:A4      ; |221| 
           MVKL    .S2     t_start,B6
           MVKH    .S2     t_start,B6
           STDW    .D2T2   B5:B4,*B6         ; |122| 
           ADDKPC  .S2     $C$RL35,B3,0      ; |221| 
$C$RL35:   ; CALL OCCURS {exp} {0}           ; |221| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 20

           STDW    .D1T1   A5:A4,*A12++      ; |221| 
||         MVC     .S2     TSCL,B8           ; |128| 

           MVC     .S2     TSCH,B4           ; |128| 

           MVKL    .S2     t_offset,B11
||         MVKL    .S1     t_start,A3
||         SUB     .L1X    B10,1,A0          ; |219| 
||         MV      .L2     B4,B9             ; |128| 
||         SUB     .D2     B10,1,B10         ; |219| 

           MVKH    .S2     t_offset,B11
||         MVKH    .S1     t_start,A3

           LDDW    .D1T1   *A3,A5:A4         ; |130| 
||         LDDW    .D2T2   *B11,B7:B6        ; |130| 
||         MVKL    .S1     cycle_counts,A31
||         MVKL    .S2     cycle_counts,B4

           MVKH    .S1     cycle_counts,A31
||         MVKH    .S2     cycle_counts,B4

           MVKL    .S1     t_stop,A30

           MVKH    .S1     t_stop,A30
|| [!A0]   MV      .L1X    B4,A15

           STDW    .D1T2   B9:B8,*A30        ; |128| 
           ADDU    .L1X    B6,A4,A7:A6       ; |130| 
           ADD     .L1X    A7,B7,A4          ; |130| 

           SUBU    .L2X    B8,A6,B7:B6       ; |130| 
||         LDDW    .D1T1   *A31,A7:A6        ; |130| 
||         ADD     .L1     A4,A5,A4          ; |130| 

           EXT     .S2     B7,24,24,B31      ; |130| 
           SUB     .L2X    B9,A4,B5          ; |130| 
   [ A0]   BNOP    .S1     $C$L13,1          ; |219| 

           ADDU    .L2X    A6,B6,B17:B16     ; |130| 
||         ADD     .S2     B5,B31,B6         ; |130| 

           ADD     .L2X    B17,A7,B5         ; |130| 
           ADD     .L2     B5,B6,B17         ; |130| 

   [!A0]   CALL    .S1     __c6xabi_fltllif  ; |135| 
||         STDW    .D2T2   B17:B16,*B4       ; |130| 

           ; BRANCHCC OCCURS {$C$L13}        ; |219| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           LDDW    .D1T1   *A15,A5:A4        ; |135| 
           ADDKPC  .S2     $C$RL36,B3,3      ; |135| 
$C$RL36:   ; CALL OCCURS {__c6xabi_fltllif} {0}  ; |135| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 13
           MPYSP   .M1     A14,A4,A3         ; |135| 
           MV      .L1     A10,A12           ; |135| 
           NOP             2
           SPDP    .S1     A3,A5:A4          ; |135| 
           NOP             1
           ADDDP   .L1     A13:A12,A5:A4,A5:A4 ; |135| 
           CALLP   .S2     __c6xabi_fixdlli,B3
$C$RL37:   ; CALL OCCURS {__c6xabi_fixdlli} {0}  ; |135| 
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
$C$L14:    
;          EXCLUSIVE CPU CYCLES: 15
           MVC     .S2     TSCL,B4           ; |122| 
           MVC     .S2     TSCH,B5           ; |122| 
           MVKL    .S1     input,A3
           MVKH    .S1     input,A3
           LDW     .D1T1   *A3,A3            ; |230| 
           MVKL    .S2     t_start,B6
           MVKH    .S2     t_start,B6
           STDW    .D2T2   B5:B4,*B6         ; |122| 
           NOP             1

           ADD     .L1     A12,A3,A3         ; |230| 
||         CALL    .S1     expdp             ; |230| 

           LDDW    .D1T1   *A3,A5:A4         ; |230| 
           ADDKPC  .S2     $C$RL38,B3,3      ; |230| 
$C$RL38:   ; CALL OCCURS {expdp} {0}         ; |230| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 24
           MVKL    .S2     output+4,B4
           MVKH    .S2     output+4,B4
           LDW     .D2T2   *B4,B4            ; |230| 
           NOP             4
           ADD     .L1X    A12,B4,A3         ; |230| 

           STDW    .D1T1   A5:A4,*A3         ; |230| 
||         MVC     .S2     TSCL,B16          ; |128| 

           MVC     .S2     TSCH,B8           ; |128| 

           MVKL    .S1     t_offset,A14
||         MVKL    .S2     t_start,B4
||         ADDAD   .D1     A15,1,A3
||         SUB     .L1X    B10,1,A0          ; |228| 
||         MV      .L2     B8,B17            ; |128| 
||         SUB     .D2     B10,1,B10         ; |228| 

           MVKH    .S1     t_offset,A14
||         MVKH    .S2     t_start,B4
||         LDDW    .D1T1   *A3,A7:A6         ; |130| 
||         ADD     .L1     8,A12,A12         ; |228| 

           MVK     .S2     8,B11
||         LDDW    .D1T1   *A14,A5:A4        ; |130| 
||         LDDW    .D2T2   *B4,B7:B6         ; |130| 

           MVKL    .S1     t_stop,A31
           MVKH    .S1     t_stop,A31
           ADD     .L2X    A15,B11,B11
           STDW    .D1T2   B17:B16,*A31      ; |128| 
           ADDU    .L2X    A4,B6,B5:B4       ; |130| 

           ADD     .S2X    B5,A5,B6          ; |130| 
|| [ A0]   B       .S1     $C$L14            ; |228| 
||         SUBU    .L2     B16,B4,B5:B4      ; |130| 

           ADD     .D2     B6,B7,B6          ; |130| 
||         EXT     .S2     B5,24,24,B7       ; |130| 
||         ADDU    .L2X    A6,B4,B5:B4       ; |130| 

           SUB     .L2     B8,B6,B6          ; |130| 
||         ADD     .S2X    B5,A7,B5          ; |130| 

           ADD     .L2     B6,B7,B6          ; |130| 
           ADD     .L2     B5,B6,B5          ; |130| 

   [!A0]   CALL    .S1     __c6xabi_fltllif  ; |135| 
||         STDW    .D2T2   B5:B4,*B11        ; |130| 

           ; BRANCHCC OCCURS {$C$L14}        ; |228| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           LDDW    .D1T1   *+A15(8),A5:A4    ; |135| 
           ADDKPC  .S2     $C$RL39,B3,3      ; |135| 
$C$RL39:   ; CALL OCCURS {__c6xabi_fltllif} {0}  ; |135| 
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
$C$RL40:   ; CALL OCCURS {__c6xabi_fixdlli} {0}  ; |135| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 10

           STDW    .D1T1   A11:A10,*+A15(16) ; |114| 
||         MV      .L2X    A11,B4            ; |114| 

           MVC     .S2     B4,TSCL           ; |115| 
||         STDW    .D2T1   A5:A4,*B11        ; |135| 

           MVC     .S2     TSCL,B5           ; |116| 
           MVC     .S2     TSCH,B4           ; |116| 
           MVC     .S2     TSCL,B6           ; |117| 
           MVC     .S2     TSCH,B8           ; |117| 
           SUBU    .L2     B6,B5,B7:B6       ; |117| 

           EXT     .S2     B7,24,24,B5       ; |117| 
||         SUB     .L2     B8,B4,B4          ; |117| 
||         MVK     .S1     0x80,A3

           ADD     .L2     B4,B5,B7          ; |117| 

           STDW    .D1T2   B7:B6,*A14        ; |117| 
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
;          EXCLUSIVE CPU CYCLES: 15
           MVC     .S2     TSCL,B4           ; |122| 
           MVC     .S2     TSCH,B5           ; |122| 
           MVKL    .S1     input,A3
           MVKH    .S1     input,A3
           LDW     .D1T1   *A3,A3            ; |239| 
           MVKL    .S2     t_start,B6
           MVKH    .S2     t_start,B6
           STDW    .D2T2   B5:B4,*B6         ; |122| 
           NOP             1

           ADD     .L1     A12,A3,A3         ; |239| 
||         CALL    .S1     expdp_c           ; |239| 

           LDDW    .D1T1   *A3,A5:A4         ; |239| 
           ADDKPC  .S2     $C$RL41,B3,3      ; |239| 
$C$RL41:   ; CALL OCCURS {expdp_c} {0}       ; |239| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 24
           MVKL    .S2     output+8,B4
           MVKH    .S2     output+8,B4
           LDW     .D2T2   *B4,B4            ; |239| 
           NOP             4
           ADD     .L1X    A12,B4,A3         ; |239| 

           STDW    .D1T1   A5:A4,*A3         ; |239| 
||         MVC     .S2     TSCL,B8           ; |128| 

           MVC     .S2     TSCH,B4           ; |128| 

           MVKL    .S2     t_start,B11
||         LDDW    .D1T1   *A14,A5:A4        ; |130| 
||         SUB     .L1X    B10,1,A0          ; |237| 
||         MV      .L2     B4,B9             ; |128| 
||         MVKL    .S1     t_stop,A31
||         SUB     .D2     B10,1,B10         ; |237| 

           MVKH    .S1     t_stop,A31
||         ADD     .L1     8,A12,A12         ; |237| 
||         MVKH    .S2     t_start,B11

           LDDW    .D2T2   *B11,B7:B6        ; |130| 
           ADDAD   .D1     A15,2,A3
           LDDW    .D1T1   *A3,A7:A6         ; |130| 
           STDW    .D1T2   B9:B8,*A31        ; |128| 
           MV      .L2X    A3,B12            ; |128| 
           ADDU    .L2X    A4,B6,B17:B16     ; |130| 

           ADD     .L2X    B17,A5,B6         ; |130| 
|| [ A0]   B       .S1     $C$L15            ; |237| 
||         MV      .S2     B16,B4            ; |130| 

           SUBU    .L2     B8,B4,B5:B4       ; |130| 
||         ADD     .S2     B6,B7,B6          ; |130| 

           EXT     .S2     B5,24,24,B7       ; |130| 
||         ADDU    .L2X    A6,B4,B5:B4       ; |130| 
||         SUB     .D2     B9,B6,B6          ; |130| 

           ADD     .L2     B6,B7,B6          ; |130| 
||         ADD     .S2X    B5,A7,B5          ; |130| 

           ADD     .L2     B5,B6,B5          ; |130| 

   [!A0]   CALL    .S1     __c6xabi_fltllif  ; |135| 
||         STDW    .D2T2   B5:B4,*B12        ; |130| 

           ; BRANCHCC OCCURS {$C$L15}        ; |237| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           LDDW    .D1T1   *+A15(16),A5:A4   ; |135| 
           ADDKPC  .S2     $C$RL42,B3,3      ; |135| 
$C$RL42:   ; CALL OCCURS {__c6xabi_fltllif} {0}  ; |135| 
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
$C$RL43:   ; CALL OCCURS {__c6xabi_fixdlli} {0}  ; |135| 

           MV      .L2X    A11,B4            ; |114| 
||         MV      .L1X    B12,A12           ; |135| 
||         STDW    .D1T1   A11:A10,*+A15(32) ; |114| 

           STDW    .D1T1   A5:A4,*A12        ; |135| 
||         MVC     .S2     B4,TSCL           ; |115| 

           MVC     .S2     TSCL,B6           ; |116| 
           MVC     .S2     TSCH,B7           ; |116| 

           STDW    .D2T2   B7:B6,*B11        ; |116| 
||         MVC     .S2     TSCL,B4           ; |117| 

           MVC     .S2     TSCH,B8           ; |117| 

           MVKL    .S1     input,A3
||         SUBU    .L2     B4,B6,B5:B4       ; |117| 

           MVKH    .S1     input,A3
||         EXT     .S2     B5,24,24,B6       ; |117| 
||         SUB     .L2     B8,B7,B31         ; |117| 

           MVKL    .S1     output,A10
||         ADD     .L2     B31,B6,B5         ; |117| 

           MV      .L2X    A3,B9             ; |246| 
||         MVKH    .S1     output,A10
||         STDW    .D1T2   B5:B4,*A14        ; |117| 

           CALLP   .S2     expdp_v,B3
||         LDW     .D2T1   *B9,A4            ; |246| 
||         LDW     .D1T2   *+A10(16),B4      ; |246| 
||         MVK     .S1     0x80,A6           ; |246| 

$C$RL44:   ; CALL OCCURS {expdp_v} {0}       ; |246| 
           MVC     .S2     TSCL,B16          ; |128| 
           MVC     .S2     TSCH,B4           ; |128| 

           LDDW    .D1T1   *A14,A5:A4        ; |130| 
||         LDDW    .D2T2   *B11,B9:B8        ; |130| 

           MVK     .S2     16,B10
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

$C$RL45:   ; CALL OCCURS {__c6xabi_fltllif} {0}  ; |130| 
           ZERO    .L1     A3
           SET     .S1     A3,0x1a,0x1d,A3
           MPYSP   .M1     A3,A4,A3          ; |130| 
           MV      .L1     A11,A12           ; |130| 
           NOP             2
           SPDP    .S1     A3,A5:A4          ; |130| 
           NOP             1
           ADDDP   .L1     A13:A12,A5:A4,A5:A4 ; |130| 
           CALLP   .S2     __c6xabi_fixdlli,B3
$C$RL46:   ; CALL OCCURS {__c6xabi_fixdlli} {0}  ; |130| 
           MVKL    .S2     0x3da5fd7f,B7
           MVKL    .S2     0xe1796495,B6
           MVKH    .S2     0x3da5fd7f,B7

           STDW    .D2T1   A5:A4,*B10        ; |130| 
||         LDW     .D1T2   *+A10(4),B4       ; |66| 
||         MVKH    .S2     0xe1796495,B6

           CALLP   .S2     isequal,B3
||         LDW     .D1T1   *A10,A4           ; |66| 
||         MVK     .L1     0x9,A8            ; |66| 
||         MVK     .S1     0x80,A6           ; |66| 

$C$RL47:   ; CALL OCCURS {isequal} {0}       ; |66| 
           MVKL    .S2     0xe1796495,B6
           MVKL    .S2     0x3da5fd7f,B7

           LDW     .D1T2   *+A10(8),B4       ; |67| 
||         MVKL    .S1     fcn_pass,A11
||         MVKH    .S2     0xe1796495,B6

           MV      .L1     A4,A3             ; |66| 
||         LDW     .D1T1   *A10,A4           ; |67| 
||         MVKH    .S1     fcn_pass,A11
||         MVKH    .S2     0x3da5fd7f,B7

           CALLP   .S2     isequal,B3
||         STW     .D1T1   A3,*+A11(4)       ; |66| 
||         MVK     .S1     0x80,A6           ; |67| 
||         MVK     .L1     0x9,A8            ; |67| 

$C$RL48:   ; CALL OCCURS {isequal} {0}       ; |67| 
           MVKL    .S2     0x3da5fd7f,B7
           MVKL    .S2     0xe1796495,B6

           STW     .D1T1   A4,*+A11(8)       ; |67| 
||         MVKH    .S2     0x3da5fd7f,B7

           LDW     .D1T2   *+A10(12),B4      ; |68| 
||         MVKH    .S2     0xe1796495,B6

           CALLP   .S2     isequal,B3
||         LDW     .D1T1   *A10,A4           ; |68| 
||         MVK     .S1     0x80,A6           ; |68| 
||         MVK     .L1     0x9,A8            ; |68| 

$C$RL49:   ; CALL OCCURS {isequal} {0}       ; |68| 
           LDW     .D2T2   *+SP(92),B4       ; |68| 
           MVKL    .S2     0x3da5fd7f,B7
           MVKL    .S2     0xe1796495,B6
           MVKH    .S2     0x3da5fd7f,B7

           STW     .D1T1   A4,*+A11(12)      ; |68| 
||         MVKH    .S2     0xe1796495,B6

           CALLP   .S2     isequal,B3
||         LDW     .D2T2   *B4,B4            ; |69| 
||         LDW     .D1T1   *A10,A4           ; |69| 
||         MVK     .S1     0x80,A6           ; |69| 
||         MVK     .L1     0x9,A8            ; |69| 

$C$RL50:   ; CALL OCCURS {isequal} {0}       ; |69| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 16
           LDW     .D2T2   *+SP(96),B4       ; |69| 
           STW     .D1T1   A4,*+A11(16)      ; |69| 
           NOP             3
           LDW     .D2T2   *B4,B0            ; |72| 
           LDW     .D2T2   *+SP(100),B4
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
   [!B0]   MV      .L1     A12,A0            ; |72| 
           CMPEQ   .L1     A4,0,A3           ; |72| 
           XOR     .L1     1,A3,A3           ; |72| 
           NOP             1
   [ B0]   CMPEQ   .L2     B4,0,B4           ; |72| 
   [ B0]   XOR     .L2     1,B4,B4           ; |72| 
           NOP             1
   [ B0]   AND     .L1X    A3,B4,A0          ; |72| 
   [ A0]   B       .S1     $C$L17            ; |72| 
   [ A0]   CALL    .S1     print_test_results ; |252| 
           MVK     .L1     0x1,A3            ; |72| 
   [ A0]   MVKL    .S1     all_pass,A4
   [ A0]   MVKH    .S1     all_pass,A4
           NOP             1
           ; BRANCHCC OCCURS {$C$L17}        ; |72| 
;** --------------------------------------------------------------------------*
$C$L16:    
;          EXCLUSIVE CPU CYCLES: 5
           CALL    .S1     print_test_results ; |252| 
           MVKL    .S1     all_pass,A4
           MVKH    .S1     all_pass,A4
           MV      .L1     A12,A3
           NOP             1
;** --------------------------------------------------------------------------*
$C$L17:    
;          EXCLUSIVE CPU CYCLES: 1

           STW     .D1T1   A3,*A4            ; |72| 
||         MVK     .L1     0x2,A4            ; |252| 
||         ADDKPC  .S2     $C$RL51,B3,0      ; |252| 

$C$RL51:   ; CALL OCCURS {print_test_results} {0}  ; |252| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 30
           MVKL    .S2     $C$SL5+0,B4
           MVKH    .S2     $C$SL5+0,B4

           CALLP   .S2     printf,B3
||         STW     .D2T2   B4,*+SP(4)        ; |253| 

$C$RL52:   ; CALL OCCURS {printf} {0}        ; |253| 
           MVKL    .S2     $C$SL6+0,B4
           MVKH    .S2     $C$SL6+0,B4

           CALLP   .S2     printf,B3
||         STW     .D2T2   B4,*+SP(4)        ; |253| 

$C$RL53:   ; CALL OCCURS {printf} {0}        ; |253| 
           MVKL    .S1     $C$SL4+0,A10
           MVKH    .S1     $C$SL4+0,A10

           CALLP   .S2     print_profile_results,B3
||         MV      .L1     A10,A4            ; |260| 

$C$RL54:   ; CALL OCCURS {print_profile_results} {0}  ; |260| 

           CALLP   .S2     print_memory_results,B3
||         MV      .L1     A10,A4            ; |263| 

$C$RL55:   ; CALL OCCURS {print_memory_results} {0}  ; |263| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 12
           ADDK    .S2     192,SP            ; |264| 
           LDW     .D2T2   *++SP(8),B3       ; |264| 
           LDDW    .D2T1   *++SP,A13:A12     ; |264| 
           LDDW    .D2T1   *++SP,A15:A14     ; |264| 
           LDDW    .D2T2   *++SP,B11:B10     ; |264| 
           LDDW    .D2T2   *++SP,B13:B12     ; |264| 

           LDW     .D2T1   *++SP(8),A10      ; |264| 
||         RET     .S2     B3                ; |264| 

           LDW     .D2T1   *++SP(8),A11      ; |264| 
           NOP             4
           ; BRANCH OCCURS {B3}              ; |264| 
;******************************************************************************
;* STRINGS                                                                    *
;******************************************************************************
	.sect	".const:.string"
$C$SL1:	.string	"w",0
$C$SL2:	.string	"../expdp_output.dat",0
$C$SL3:	.string	"%.15e",10,0
$C$SL4:	.string	"expDP",0
$C$SL5:	.string	"----------------------------------------",0
$C$SL6:	.string	"----------------------------------------",10,0
;*****************************************************************************
;* UNDEFINED EXTERNAL REFERENCES                                             *
;*****************************************************************************
	.global	fclose
	.global	fopen
	.global	fprintf
	.global	printf
	.global	exp
	.global	driver_init
	.global	print_profile_results
	.global	print_memory_results
	.global	print_test_results
	.global	gimme_random
	.global	isequal
	.global	expdp
	.global	expdp_c
	.global	expdp_v
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
