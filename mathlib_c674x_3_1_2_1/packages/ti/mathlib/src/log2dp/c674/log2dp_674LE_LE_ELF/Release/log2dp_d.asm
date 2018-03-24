;******************************************************************************
;* TMS320C6x C/C++ Codegen                                          PC v7.4.2 *
;* Date/Time created: Mon May 16 23:49:32 2016                                *
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
	.word	0aa9ea49bh,040a37287h		; a[0] @ 0
	.word	06600e5d9h,040c271a7h		; a[1] @ 64
	.word	089f33369h,040bb2b7fh		; a[2] @ 128
	.word	06bf1c0a2h,0409e340ah		; a[3] @ 192
	.word	0a1dd34fah,040a4936fh		; a[4] @ 256
	.word	0be5cc781h,040b25f34h		; a[5] @ 320
	.word	0bbbf5e4fh,040808b90h		; a[6] @ 384
	.word	0584032f6h,040a2ed38h		; a[7] @ 448
	.word	00f66a551h,040c34f04h		; a[8] @ 512
	.word	09eff3428h,04055e88eh		; a[9] @ 576
	.word	0836d076ah,040a21c78h		; a[10] @ 640
	.word	058d5842bh,040b983d6h		; a[11] @ 704
	.word	08fe5bbb1h,040b399b6h		; a[12] @ 768
	.word	04e1cc385h,040c06922h		; a[13] @ 832
	.word	0f20b4ab7h,040b33846h		; a[14] @ 896
	.word	04b0c6dcdh,040ad5151h		; a[15] @ 960
	.word	011c2a023h,040a10a00h		; a[16] @ 1024
	.word	08ae09932h,040b737deh		; a[17] @ 1088
	.word	08e523dbah,040b03afdh		; a[18] @ 1152
	.word	02f42e3aah,040bc1753h		; a[19] @ 1216
	.word	0be5bf0c2h,040c19f1bh		; a[20] @ 1280
	.word	0a3ef5df1h,040a39643h		; a[21] @ 1344
	.word	0859bb5d4h,040c2644fh		; a[22] @ 1408
	.word	0be751b35h,040a9b4b9h		; a[23] @ 1472
	.word	04628d93dh,040b97c1dh		; a[24] @ 1536
	.word	0dd68fc43h,0409287d3h		; a[25] @ 1600
	.word	03d79de12h,040ab73a7h		; a[26] @ 1664
	.word	04478d5d5h,0409ddd00h		; a[27] @ 1728
	.word	0b78f4de6h,040c22249h		; a[28] @ 1792
	.word	032144f42h,040c0e3cfh		; a[29] @ 1856
	.word	04d6c9a5dh,040a3fa80h		; a[30] @ 1920
	.word	0a86ff632h,040b8bb43h		; a[31] @ 1984
	.word	0d30270f4h,040b44e63h		; a[32] @ 2048
	.word	0e6695605h,040b31ee6h		; a[33] @ 2112
	.word	0f5c5ea5ah,040b87cbch		; a[34] @ 2176
	.word	045df0762h,040aa4095h		; a[35] @ 2240
	.word	0a8c30249h,040b61994h		; a[36] @ 2304
	.word	03efa10d3h,040ab18b5h		; a[37] @ 2368
	.word	0bed30f06h,040be42ddh		; a[38] @ 2432
	.word	0cb3298dah,040a984c5h		; a[39] @ 2496
	.word	0aaa8b596h,040b53635h		; a[40] @ 2560
	.word	08853f6f8h,04093755ch		; a[41] @ 2624
	.word	02353c21fh,040abb4c3h		; a[42] @ 2688
	.word	039fc7b10h,040c2c841h		; a[43] @ 2752
	.word	0d50f916dh,040a60597h		; a[44] @ 2816
	.word	0f1729e83h,040c0a4bdh		; a[45] @ 2880
	.word	058b7513bh,040ac2186h		; a[46] @ 2944
	.word	0091e8cb3h,040c292e3h		; a[47] @ 3008
	.word	00374ff86h,040c29038h		; a[48] @ 3072
	.word	0aca940d7h,040c20c39h		; a[49] @ 3136
	.word	0ef749782h,040944914h		; a[50] @ 3200
	.word	0a00e27e1h,040ab0e7bh		; a[51] @ 3264
	.word	0bc8f67e7h,040822e58h		; a[52] @ 3328
	.word	02ed1a4a3h,040808e20h		; a[53] @ 3392
	.word	0169f7eb6h,040ab85e4h		; a[54] @ 3456
	.word	02953b660h,040b4fd2ah		; a[55] @ 3520
	.word	07f1a9252h,040b2259bh		; a[56] @ 3584
	.word	0d9620685h,040a82990h		; a[57] @ 3648
	.word	01f4ccc61h,04080b820h		; a[58] @ 3712
	.word	04765f01fh,040a524a3h		; a[59] @ 3776
	.word	0eda081ebh,040ac9eb6h		; a[60] @ 3840
	.word	070db346fh,040905563h		; a[61] @ 3904
	.word	0c52f499ah,040b7a4bah		; a[62] @ 3968
	.word	09aa10096h,040b87e25h		; a[63] @ 4032
	.word	0a3486f05h,040a7ea4ah		; a[64] @ 4096
	.word	090f4af6ah,0409d6e97h		; a[65] @ 4160
	.word	02368bad4h,040bc2870h		; a[66] @ 4224
	.word	0befc29b2h,040745904h		; a[67] @ 4288
	.word	0b73b6b10h,0409b7c0ah		; a[68] @ 4352
	.word	0168801c2h,040ba3adah		; a[69] @ 4416
	.word	0d4bbae97h,040b216e1h		; a[70] @ 4480
	.word	05edd0529h,040a44066h		; a[71] @ 4544
	.word	00bfa0946h,040a00e0dh		; a[72] @ 4608
	.word	0637bd05bh,040c3324ch		; a[73] @ 4672
	.word	0d69b82a8h,040a27bcfh		; a[74] @ 4736
	.word	0360143cdh,040b04555h		; a[75] @ 4800
	.word	015a8deb1h,040c2e056h		; a[76] @ 4864
	.word	01fcaa0a3h,040c1d318h		; a[77] @ 4928
	.word	09e3e4408h,040be9d16h		; a[78] @ 4992
	.word	0eeee5fc5h,040c2d1eeh		; a[79] @ 5056
	.word	0ed0db4f4h,040adf3a5h		; a[80] @ 5120
	.word	02d8f8544h,040b72680h		; a[81] @ 5184
	.word	06ed5a0b1h,0409e0550h		; a[82] @ 5248
	.word	04f582ce8h,040bb88e0h		; a[83] @ 5312
	.word	0885aacf5h,040bbf08ah		; a[84] @ 5376
	.word	066ea19e5h,040b31711h		; a[85] @ 5440
	.word	0d8f6a6bbh,040c1b872h		; a[86] @ 5504
	.word	02b3969aeh,040be9615h		; a[87] @ 5568
	.word	077b395c4h,040b6450eh		; a[88] @ 5632
	.word	0897a67a5h,040b0dc63h		; a[89] @ 5696
	.word	0e36c4b83h,040bb59e6h		; a[90] @ 5760
	.word	0dd8805f3h,040baf1aeh		; a[91] @ 5824
	.word	05f3ca679h,040c17633h		; a[92] @ 5888
	.word	012896f80h,040b648e7h		; a[93] @ 5952
	.word	07996c4d3h,040bb04b0h		; a[94] @ 6016
	.word	07f47debch,040a39ae9h		; a[95] @ 6080
	.word	0a18372e7h,040c33031h		; a[96] @ 6144
	.word	046bfd7f2h,040b06229h		; a[97] @ 6208
	.word	096f4a3abh,040ab2f8ch		; a[98] @ 6272
	.word	0545d4f66h,040b98828h		; a[99] @ 6336
	.word	02058651ch,040b29affh		; a[100] @ 6400
	.word	008ede54bh,040bffb19h		; a[101] @ 6464
	.word	08c4e577ch,040b2f1e8h		; a[102] @ 6528
	.word	0a167c434h,040b00a61h		; a[103] @ 6592
	.word	07bf11226h,040ab64f8h		; a[104] @ 6656
	.word	00167df0ch,040c2b63fh		; a[105] @ 6720
	.word	0ef69afc7h,040a36695h		; a[106] @ 6784
	.word	0afc1fa0bh,040ae5af7h		; a[107] @ 6848
	.word	09096bb99h,040c23cfah		; a[108] @ 6912
	.word	0517a4617h,040ae0777h		; a[109] @ 6976
	.word	014636453h,04094d482h		; a[110] @ 7040
	.word	040ba0473h,040beeb3fh		; a[111] @ 7104
	.word	02c669058h,040c17de3h		; a[112] @ 7168
	.word	0442fdab9h,040c2f6c0h		; a[113] @ 7232
	.word	0970ea4deh,040c33bb1h		; a[114] @ 7296
	.word	0a44c7b03h,0409ba8dch		; a[115] @ 7360
	.word	05d3b447ah,040a35968h		; a[116] @ 7424
	.word	027d028a2h,040c25cdch		; a[117] @ 7488
	.word	042d63e66h,040c34fedh		; a[118] @ 7552
	.word	08dadd30dh,040b10e99h		; a[119] @ 7616
	.word	00ac3a861h,040ab24c3h		; a[120] @ 7680
	.word	07db02f07h,040c0cd02h		; a[121] @ 7744
	.word	0fba6d4ebh,040ba28f2h		; a[122] @ 7808
	.word	0678cd713h,040bfb0b1h		; a[123] @ 7872
	.word	002645e4eh,040c16116h		; a[124] @ 7936
	.word	02967d856h,040b92fd0h		; a[125] @ 8000
	.word	0871d9613h,040c19a17h		; a[126] @ 8064
	.word	0f61dfeefh,040c12db7h		; a[127] @ 8128
	.word	0dc39515ah,040c207adh		; a[128] @ 8192
	.word	05257bba9h,040b54df1h		; a[129] @ 8256
	.word	0643be9bbh,040c1793fh		; a[130] @ 8320
	.word	005da3494h,040b66778h		; a[131] @ 8384
	.word	06a400fbbh,040c047e6h		; a[132] @ 8448
	.word	0b34a44c8h,040997729h		; a[133] @ 8512
	.word	0ef284168h,040a0c813h		; a[134] @ 8576
	.word	0b03b9c8eh,04098e192h		; a[135] @ 8640
	.word	0424879ech,040ab915ch		; a[136] @ 8704
	.word	003f55806h,040b10beeh		; a[137] @ 8768
	.word	0702f3d04h,040bddc3eh		; a[138] @ 8832
	.word	06787ce96h,040a3b305h		; a[139] @ 8896
	.word	05ef62f9dh,040b5d05ah		; a[140] @ 8960
	.word	0629d840ah,040b962f3h		; a[141] @ 9024
	.word	04c8ca08dh,040bec3a5h		; a[142] @ 9088
	.word	005242c2fh,040bf9dc5h		; a[143] @ 9152
	.word	0ccc39291h,040c0d2feh		; a[144] @ 9216
	.word	03a0e18c7h,040b13b23h		; a[145] @ 9280
	.word	098e10cf6h,040c12663h		; a[146] @ 9344
	.word	0655e28aah,040957605h		; a[147] @ 9408
	.word	0ec09a8f6h,04072d49bh		; a[148] @ 9472
	.word	00e3c02e6h,040be3baeh		; a[149] @ 9536
	.word	0792c3bc8h,040c2e539h		; a[150] @ 9600
	.word	068d17ab1h,040c1202ah		; a[151] @ 9664
	.word	0752da986h,0409abab0h		; a[152] @ 9728
	.word	00e842742h,040c302a5h		; a[153] @ 9792
	.word	086594af5h,040a9fd94h		; a[154] @ 9856
	.word	0989df117h,04060e3b5h		; a[155] @ 9920
	.word	0cb252ce0h,040bc7237h		; a[156] @ 9984
	.word	0f5b44ca3h,040bb4441h		; a[157] @ 10048
	.word	0f8b9baa1h,040b7752bh		; a[158] @ 10112
	.word	0ecdc36cdh,040c1405ch		; a[159] @ 10176
	.word	070931013h,040b3ca85h		; a[160] @ 10240
	.word	0016c10cah,040c29ab8h		; a[161] @ 10304
	.word	0a1ac8d92h,040bc6a2bh		; a[162] @ 10368
	.word	0bfc57d4dh,0409ab074h		; a[163] @ 10432
	.word	088d0f47ah,040b89bf3h		; a[164] @ 10496
	.word	04346a6adh,04088aaa1h		; a[165] @ 10560
	.word	0cabdfed4h,04075d1b0h		; a[166] @ 10624
	.word	054f01c5dh,040c12e64h		; a[167] @ 10688
	.word	0100be6beh,040b71261h		; a[168] @ 10752
	.word	00efc1c46h,040be8069h		; a[169] @ 10816
	.word	08be2f7b1h,0409a17eeh		; a[170] @ 10880
	.word	032b55ef2h,040ae7231h		; a[171] @ 10944
	.word	039ffd60fh,040a02df0h		; a[172] @ 11008
	.word	017ec85d0h,0408a1777h		; a[173] @ 11072
	.word	055227144h,0409379a7h		; a[174] @ 11136
	.word	09ba435d5h,040aee5cah		; a[175] @ 11200
	.word	05517898ah,040b99990h		; a[176] @ 11264
	.word	0c8d419c8h,040ad3578h		; a[177] @ 11328
	.word	01a21ea36h,040a2f8e1h		; a[178] @ 11392
	.word	00718f8f5h,040c2d5d5h		; a[179] @ 11456
	.word	04f4186b3h,040b1133bh		; a[180] @ 11520
	.word	08ce55631h,040ad19deh		; a[181] @ 11584
	.word	04084548eh,040a10277h		; a[182] @ 11648
	.word	057173e0ah,040b28374h		; a[183] @ 11712
	.word	08428184dh,040b03ba1h		; a[184] @ 11776
	.word	002bef721h,04096bb9ah		; a[185] @ 11840
	.word	0ad4cd4c5h,04083e55dh		; a[186] @ 11904
	.word	0eabca1dch,040ba5ef4h		; a[187] @ 11968
	.word	03909360ah,040bec4b2h		; a[188] @ 12032
	.word	089e419f0h,04090f803h		; a[189] @ 12096
	.word	03a01838eh,0409909c2h		; a[190] @ 12160
	.word	099cf497fh,040b953c3h		; a[191] @ 12224
	.word	03def4ed8h,0408f2cc7h		; a[192] @ 12288
	.word	09d08b9e3h,0405c5ba1h		; a[193] @ 12352
	.word	04be5b1a0h,040a18deah		; a[194] @ 12416
	.word	0060857bdh,040bfe193h		; a[195] @ 12480
	.word	0a9790aaeh,040a2c1b1h		; a[196] @ 12544
	.word	0c2480e8dh,040c2889eh		; a[197] @ 12608
	.word	084612331h,040a8610dh		; a[198] @ 12672
	.word	0c892ab69h,040c28f15h		; a[199] @ 12736
	.word	0f554ab53h,040b0f8c1h		; a[200] @ 12800

;	C:\MATHLIB_Tools\CCSV5_5_0\ccsv5\tools\compiler\c6000_7.4.2\bin\opt6x.exe C:\\Users\\gtbldadm\\AppData\\Local\\Temp\\007203 C:\\Users\\gtbldadm\\AppData\\Local\\Temp\\007205 
;**	Parameter deleted: req_flags == 9;
;**	Parameter deleted: tol == 1e-08;
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
||         MVKL    .S2     0xe2308c3a,B6

           STDW    .D2T1   A13:A12,*SP--     ; |63| 
||         MVKL    .S1     output,A11
||         MVKL    .S2     0x3e45798e,B7

           STW     .D2T1   A10,*SP--(8)      ; |63| 
||         MVKH    .S1     output,A11
||         MVKH    .S2     0xe2308c3a,B6

           LDW     .D1T2   *+A11(4),B4       ; |66| 
||         MV      .L1     A4,A6             ; |63| 
||         MVKH    .S2     0x3e45798e,B7
||         MVK     .S1     0x9,A8            ; |66| 

           MV      .L1X    B3,A13            ; |63| 
||         CALLP   .S2     isequal,B3
||         MV      .S1     A4,A10            ; |63| 
||         LDW     .D1T1   *A11,A4           ; |66| 

$C$RL0:    ; CALL OCCURS {isequal} {0}       ; |66| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 30
           MVKL    .S2     0x3e45798e,B7
           MVKL    .S2     0xe2308c3a,B6

           LDW     .D1T2   *+A11(8),B4       ; |67| 
||         MVKL    .S1     fcn_pass,A12
||         MVKH    .S2     0x3e45798e,B7

           MV      .L1     A4,A3             ; |66| 
||         LDW     .D1T1   *A11,A4           ; |67| 
||         MVKH    .S1     fcn_pass,A12
||         MVKH    .S2     0xe2308c3a,B6

           CALLP   .S2     isequal,B3
||         STW     .D1T1   A3,*+A12(4)       ; |66| 
||         MV      .L1     A10,A6            ; |67| 
||         MVK     .S1     0x9,A8            ; |67| 

$C$RL1:    ; CALL OCCURS {isequal} {0}       ; |67| 
           MVKL    .S2     0xe2308c3a,B6
           MVKL    .S2     0x3e45798e,B7

           LDW     .D1T2   *+A11(12),B4      ; |68| 
||         MVKH    .S2     0xe2308c3a,B6

           MV      .L1     A4,A3             ; |67| 
||         LDW     .D1T1   *A11,A4           ; |68| 
||         MVKH    .S2     0x3e45798e,B7

           CALLP   .S2     isequal,B3
||         STW     .D1T1   A3,*+A12(8)       ; |67| 
||         MV      .L1     A10,A6            ; |68| 
||         MVK     .S1     0x9,A8            ; |68| 

$C$RL2:    ; CALL OCCURS {isequal} {0}       ; |68| 
           MVKL    .S2     0x3e45798e,B7
           MVKL    .S2     0xe2308c3a,B6

           STW     .D1T1   A4,*+A12(12)      ; |68| 
||         MVKH    .S2     0x3e45798e,B7

           MV      .L1     A11,A3            ; |66| 
||         LDW     .D1T2   *+A11(16),B4      ; |69| 
||         MVKH    .S2     0xe2308c3a,B6

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
;*   Local Frame Size  : 8 Args + 184 Auto + 56 Save = 248 byte               *
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
||         ADDK    .S2     -192,SP           ; |132| 

           CALLP   .S2     driver_init,B3
||         MVKH    .S1     $C$SL1+0,A4

$C$RL4:    ; CALL OCCURS {driver_init} {0}   ; |140| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 3

           MVK     .S2     0xc9,B4
||         MVKL    .S1     a,A10

           MVKH    .S1     a,A10

           CALL    .S1     log2              ; |149| 
||         MV      .L1     A10,A11
||         MV      .D1X    B4,A12
||         ZERO    .L2     B10

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L3:    
;          EXCLUSIVE CPU CYCLES: 5
           LDDW    .D1T1   *A11++,A5:A4      ; |149| 
           ADDKPC  .S2     $C$RL5,B3,3       ; |149| 
$C$RL5:    ; CALL OCCURS {log2} {0}          ; |149| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 9

           MVKL    .S2     output,B4
||         SUB     .L1     A12,1,A0          ; |148| 
||         SUB     .S1     A12,1,A12         ; |148| 

           MVKH    .S2     output,B4
           LDW     .D2T2   *B4,B4            ; |149| 
   [ A0]   BNOP    .S1     $C$L3,3           ; |148| 

           ADD     .L2     B10,B4,B4         ; |149| 
||         ADD     .S2     8,B10,B10         ; |148| 

   [ A0]   CALL    .S1     log2              ; |149| 
||         STDW    .D2T1   A5:A4,*B4         ; |149| 
|| [!A0]   MVKL    .S2     output,B4

           ; BRANCHCC OCCURS {$C$L3}         ; |148| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 4

           MVKH    .S2     output,B4
||         ZERO    .L2     B10

           ADD     .L2     4,B4,B5
||         MVK     .S2     0xc9,B4

           STW     .D2T2   B5,*+SP(20)

           MV      .L1X    B4,A11
||         CALL    .S1     log2dp            ; |152| 

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L4:    
;          EXCLUSIVE CPU CYCLES: 5
           LDDW    .D1T1   *A10++,A5:A4      ; |152| 
           ADDKPC  .S2     $C$RL6,B3,3       ; |152| 
$C$RL6:    ; CALL OCCURS {log2dp} {0}        ; |152| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 12
           LDW     .D2T2   *+SP(20),B4       ; |152| 
           SUB     .L1     A11,1,A0          ; |151| 
           SUB     .L1     A11,1,A11         ; |151| 
           NOP             2
           LDW     .D2T2   *B4,B4            ; |152| 
   [ A0]   BNOP    .S1     $C$L4,3           ; |151| 

           ADD     .L2     B10,B4,B4         ; |152| 
||         ADD     .S2     8,B10,B10         ; |151| 

   [ A0]   CALL    .S1     log2dp            ; |152| 
||         STDW    .D2T1   A5:A4,*B4         ; |152| 

           ; BRANCHCC OCCURS {$C$L4}         ; |151| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 7

           ZERO    .L2     B10
||         LDW     .D2T2   *+SP(20),B4

           MVKL    .S1     a,A11
           MVK     .S2     0xc9,B5
           MVKH    .S1     a,A11
           MV      .L1X    B5,A10
           ADD     .L2     4,B4,B4

           STW     .D2T2   B4,*+SP(24)
||         CALL    .S1     log2dp_c          ; |155| 

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L5:    
;          EXCLUSIVE CPU CYCLES: 5
           LDDW    .D1T1   *A11++,A5:A4      ; |155| 
           ADDKPC  .S2     $C$RL7,B3,3       ; |155| 
$C$RL7:    ; CALL OCCURS {log2dp_c} {0}      ; |155| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 12

           LDW     .D2T2   *+SP(24),B4       ; |155| 
||         SUB     .L1     A10,1,A0          ; |154| 

   [!A0]   LDW     .D2T1   *+SP(24),A3
           SUB     .L1     A10,1,A10         ; |154| 
   [!A0]   MVK     .S1     0xfffffc01,A18
   [!A0]   MVKL    .S2     a,B22
           LDW     .D2T2   *B4,B4            ; |155| 

   [ A0]   BNOP    .S1     $C$L5,3           ; |154| 
|| [!A0]   ADD     .L1     4,A3,A15

           ADD     .L2     B10,B4,B4         ; |155| 
||         ADD     .S2     8,B10,B10         ; |154| 

   [ A0]   CALL    .S1     log2dp_c          ; |155| 
||         STDW    .D2T1   A5:A4,*B4         ; |155| 

           ; BRANCHCC OCCURS {$C$L5}         ; |154| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 2

           ADD     .L1     1,A18,A4
||         MVK     .S2     0xc9,B1
||         ZERO    .L2     B30
||         MVK     .D2     0xffffffff,B10    ; |111| 
||         LDW     .D1T1   *A15,A3

           MVKH    .S2     a,B22
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains control code
;*----------------------------------------------------------------------------*
$C$L6:    
;          EXCLUSIVE CPU CYCLES: 34

           LDDW    .D2T2   *B22++,B21:B20    ; |81| 
||         MVKL    .S2     0x667f3bcd,B31

           MVKL    .S2     0x3fe6a09e,B4
||         ZERO    .L2     B5

           MVKH    .S2     0x3fe6a09e,B4

           SET     .S2     B5,0x15,0x1d,B5
||         STW     .D2T2   B4,*+SP(16)       ; |94| 

           MV      .L1X    B4,A9             ; |94| 
||         MVKH    .S2     0x667f3bcd,B31

           CLR     .S2     B21,20,31,B4      ; |88| 
||         MV      .L1X    B5,A6             ; |99| 
||         STW     .D2T2   B31,*+SP(12)      ; |94| 

           EXTU    .S2     B21,1,21,B0       ; |83| 
           OR      .L1X    A6,B4,A8          ; |88| 

   [ B0]   MV      .L1     A8,A7             ; |88| 
||         LDW     .D2T1   *+SP(12),A8       ; |94| 

           ZERO    .L1     A20               ; |99| 
           ZERO    .L2     B4                ; |99| 
   [!B0]   ZERO    .L1     A7:A6             ; |88| 
   [ B0]   MV      .L1X    B20,A6            ; |88| 
           CMPGTDP .S1     A7:A6,A9:A8,A0    ; |94| 
           ZERO    .L1     A8                ; |99| 

   [ A0]   MV      .L1     A20,A4            ; |96| 
|| [!A0]   SUBDP   .L2X    A7:A6,B5:B4,B7:B6 ; |99| 

   [ A0]   MV      .L1     A20,A8
   [ A0]   MV      .L1X    B5,A9
   [ A0]   MPYDP   .M1     A9:A8,A7:A6,A9:A8 ; |96| 
   [ A0]   MV      .L1X    B5,A5
   [ A0]   SUBDP   .L1     A7:A6,A5:A4,A5:A4 ; |95| 
   [!A0]   MV      .S1X    B5,A9             ; |99| 
           ADD     .L1     1,A18,A19
   [!A0]   MPYDP   .M1X    A9:A8,B7:B6,A9:A8 ; |100| 
           STW     .D2T2   B5,*+SP(28)       ; |99| 
   [ A0]   MV      .L2     B4,B6             ; |95| 
   [ A0]   MV      .L2     B5,B7             ; |95| 
           MV      .L1X    B5,A21            ; |100| 
   [ A0]   SUBDP   .L2X    A5:A4,B7:B6,B7:B6 ; |95| 
           ADD     .L1X    A19,B0,A19        ; |83| 
   [!A0]   ADD     .L1X    A18,B0,A19        ; |101| 
   [ A0]   ADDDP   .L1X    B5:B4,A9:A8,A5:A4 ; |96| 
           NOP             1
   [!A0]   ADDDP   .L1     A21:A20,A9:A8,A5:A4 ; |100| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 206
           MV      .S2     B4,B12            ; |105| 
           ZERO    .L2     B13
           MV      .L2     B4,B8             ; |105| 
           SET     .S2     B13,0x1e,0x1e,B13
           MV      .L2     B13,B9            ; |105| 
           MVKL    .S2     0xc041d580,B31
           RCPDP   .S1     A5:A4,A7:A6       ; |105| 
           MVKH    .S2     0xc041d580,B31
           MPYDP   .M1     A5:A4,A7:A6,A9:A8 ; |105| 
           MVKL    .S1     0x40738083,A11
           MVKL    .S1     0xfa15267e,A10
           MVKH    .S1     0x40738083,A11
           MVKH    .S1     0xfa15267e,A10
           MVKL    .S1     0xc0880bfe,A13
           MVKL    .S1     0x9c0d9077,A12
           MVKH    .S1     0xc0880bfe,A13
           MVKH    .S1     0x9c0d9077,A12
           STW     .D2T2   B31,*+SP(36)      ; |53| 
           NOP             1
           SUBDP   .L2X    B13:B12,A9:A8,B5:B4 ; |105| 
           MV      .L1     A20,A8            ; |105| 
           MV      .L1X    B13,A9            ; |105| 
           NOP             4
           MPYDP   .M2X    A7:A6,B5:B4,B5:B4 ; |105| 
           NOP             9
           NOP             1
           MPYDP   .M1X    A5:A4,B5:B4,A7:A6 ; |105| 
           NOP             9
           SUBDP   .L1     A9:A8,A7:A6,A7:A6 ; |105| 
           NOP             7
           MPYDP   .M2X    B5:B4,A7:A6,B5:B4 ; |105| 
           NOP             9
           NOP             1
           MPYDP   .M1X    A5:A4,B5:B4,A7:A6 ; |105| 
           NOP             9
           NOP             1
           SUBDP   .L2X    B9:B8,A7:A6,B9:B8 ; |105| 
           NOP             6
           MPYDP   .M2     B5:B4,B9:B8,B5:B4 ; |105| 
           NOP             9
           MPYDP   .M2     B7:B6,B5:B4,B17:B16 ; |105| 
           NOP             9
           MPYDP   .M2     B17:B16,B17:B16,B9:B8 ; |105| 
           MV      .L2     B31,B5
           MVKL    .S2     0x4b67ce0f,B4
           MVKH    .S2     0x4b67ce0f,B4
           STW     .D2T2   B4,*+SP(32)       ; |53| 
           NOP             5
           ADDDP   .L2     B5:B4,B9:B8,B5:B4 ; |53| 
           NOP             6
           MPYDP   .M2     B9:B8,B5:B4,B5:B4 ; |53| 
           NOP             9
           NOP             1
           ADDDP   .L1X    A11:A10,B5:B4,A7:A6 ; |53| 
           MV      .L2     B12,B4            ; |53| 
           MV      .L2     B13,B5            ; |53| 
           SET     .S2     B30,0x14,0x14,B12
           NOP             3
           MPYDP   .M1X    B9:B8,A7:A6,A7:A6 ; |53| 
           NOP             9
           ADDDP   .L1     A13:A12,A7:A6,A7:A6 ; |53| 
           NOP             6
           RCPDP   .S1     A7:A6,A9:A8       ; |53| 
           NOP             1
           MPYDP   .M1     A9:A8,A7:A6,A21:A20 ; |53| 
           NOP             9
           SUBDP   .L1X    B5:B4,A21:A20,A21:A20 ; |53| 
           NOP             6
           MPYDP   .M1     A9:A8,A21:A20,A9:A8 ; |53| 
           NOP             9
           MPYDP   .M1     A9:A8,A7:A6,A21:A20 ; |53| 
           NOP             9
           NOP             1
           SUBDP   .L2X    B5:B4,A21:A20,B19:B18 ; |53| 
           MV      .S2     B12,B5            ; |111| 
           CMPLTDP .S2     B21:B20,B5:B4,B0  ; |111| 
           NOP             1

   [ B0]   B       .S2     $C$L7             ; |111| 
||         MV      .L2     B0,B2             ; guard predicate rewrite
|| [ B0]   MVKL    .S1     0xffefffff,A17
|| [ B0]   MVK     .L1     0xffffffff,A16    ; |111| 

   [ B0]   MVKL    .S2     0x7fefffff,B11
   [ B2]   SUB     .S2     B1,1,B1           ; |157| 
           MPYDP   .M2X    A9:A8,B19:B18,B5:B4 ; |53| 
           INTDP   .L1     A19,A9:A8         ; |111| 
   [ B0]   MVKH    .S1     0xffefffff,A17
           ; BRANCHCC OCCURS {$C$L7}         ; |111| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 97
           MVKL    .S2     0xb356bd29,B18
           MVKL    .S2     0xbfe94415,B19
           MVKH    .S2     0xb356bd29,B18
           MVKH    .S2     0xbfe94415,B19
           MPYDP   .M2     B19:B18,B9:B8,B19:B18 ; |111| 
           MVKL    .S1     0x2016afed,A16
           MVKL    .S1     0x4030624a,A17
           MPYDP   .M1X    B5:B4,A7:A6,A7:A6 ; |111| 
           MVKH    .S1     0x2016afed,A16
           MVKH    .S1     0x4030624a,A17
           MVKL    .S2     0x12b3b59a,B24
           MVKL    .S2     0xc05007ff,B25
           MVKH    .S2     0x12b3b59a,B24
           MVKH    .S2     0xc05007ff,B25
           ADDDP   .L2X    A17:A16,B19:B18,B19:B18 ; |111| 
           MV      .L1X    B13,A17           ; |111| 
           ZERO    .L1     A16               ; |111| 
           SUBDP   .L1     A17:A16,A7:A6,A7:A6 ; |111| 
           SUB     .L2     B1,1,B1           ; |157| 
           MVKL    .S2     0x7fefffff,B11
           NOP             1
           MPYDP   .M2     B9:B8,B19:B18,B19:B18 ; |111| 
           NOP             6
           MPYDP   .M2X    B5:B4,A7:A6,B5:B4 ; |111| 
           NOP             2
           ADDDP   .L2     B25:B24,B19:B18,B19:B18 ; |111| 
           MVKL    .S1     0x5c610ca8,A6
           MVKL    .S1     0xbf2bd010,A7
           MVKH    .S1     0x5c610ca8,A6
           MVKH    .S1     0xbf2bd010,A7
           MPYDP   .M1     A7:A6,A9:A8,A7:A6 ; |111| 
           NOP             1
           MPYDP   .M2     B19:B18,B5:B4,B5:B4 ; |111| 
           NOP             9
           MPYDP   .M2     B9:B8,B5:B4,B5:B4 ; |111| 
           NOP             9
           MPYDP   .M2     B17:B16,B5:B4,B5:B4 ; |111| 
           MV      .L2X    A16,B8            ; |111| 
           MVKL    .S2     0x3fe63000,B9
           MVKH    .S2     0x3fe63000,B9
           MPYDP   .M2X    B9:B8,A9:A8,B9:B8 ; |111| 
           NOP             5
           ADDDP   .L2     B5:B4,B17:B16,B5:B4 ; |111| 
           MVKL    .S1     0x652b82fe,A8
           MVKL    .S1     0x3ff71547,A9
           MVKH    .S1     0x652b82fe,A8
           MVKH    .S1     0x3ff71547,A9
           NOP             3
           ADDDP   .L1X    B5:B4,A7:A6,A7:A6 ; |111| 
           NOP             6
           ADDDP   .L1X    B9:B8,A7:A6,A7:A6 ; |111| 
           NOP             6
           MPYDP   .M1     A9:A8,A7:A6,A17:A16 ; |111| 
           NOP             6
;** --------------------------------------------------------------------------*
$C$L7:    
;          EXCLUSIVE CPU CYCLES: 6

   [ B1]   B       .S1     $C$L6             ; |157| 
||         MVKH    .S2     0x7fefffff,B11

           CMPGTDP .S2     B21:B20,B11:B10,B0 ; |111| 
   [!B1]   ADD     .S1     4,A15,A14

   [ B0]   ZERO    .L1     A7
|| [!B0]   MV      .S1     A17,A7            ; |111| 
|| [!B0]   MV      .D1     A16,A6            ; |111| 

   [ B0]   MVKH    .S1     0x40900000,A7
|| [ B0]   ZERO    .L1     A6                ; |111| 

   [!B1]   CALL    .S1     log2dp_v          ; |160| 
||         STDW    .D1T1   A7:A6,*A3++       ; |111| 

           ; BRANCHCC OCCURS {$C$L6}         ; |157| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           LDW     .D1T2   *A14,B4           ; |160| 
           MVKL    .S1     a,A4
           MVKH    .S1     a,A4
           MVK     .S1     0xc9,A6           ; |160| 
           ADDKPC  .S2     $C$RL8,B3,0       ; |160| 
$C$RL8:    ; CALL OCCURS {log2dp_v} {0}      ; |160| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 12

           CALLP   .S2     allequal,B3
||         MVK     .S1     0xc9,A4           ; |163| 

$C$RL9:    ; CALL OCCURS {allequal} {0}      ; |163| 

           CALLP   .S2     print_test_results,B3
||         MVK     .L1     0x1,A4            ; |164| 

$C$RL10:   ; CALL OCCURS {print_test_results} {0}  ; |164| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 47
           LDW     .D2T1   *+SP(16),A23      ; |99| 
           LDW     .D2T1   *+SP(12),A22
           LDW     .D2T1   *+SP(36),A26      ; |105| 
           LDW     .D2T1   *+SP(32),A25      ; |105| 

           LDW     .D2T1   *+SP(28),A24      ; |105| 
||         ZERO    .L2     B29               ; |105| 

           STW     .D2T2   B29,*+SP(64)      ; |174| 
           STW     .D2T2   B11,*+SP(180)     ; |117| 
           STW     .D2T1   A10,*+SP(88)      ; |105| 
           STW     .D2T1   A12,*+SP(80)      ; |105| 
           STW     .D2T1   A15,*+SP(184)     ; |117| 
           STW     .D2T2   B12,*+SP(172)     ; |114| 
           STW     .D2T1   A11,*+SP(92)      ; |105| 
           STW     .D2T1   A13,*+SP(84)      ; |105| 
           STW     .D2T2   B13,*+SP(60)      ; |105| 
           STW     .D2T2   B13,*+SP(148)     ; |105| 
           STW     .D2T2   B13,*+SP(116)     ; |105| 

           STW     .D2T2   B13,*+SP(108)     ; |105| 
||         MVK     .L1     0x6,A8

           STW     .D2T2   B13,*+SP(76)      ; |105| 

           STW     .D2T2   B13,*+SP(68)      ; |105| 
||         ADD     .L2X    -7,A8,B25
||         MVKL    .S2     0x3fe63000,B4

           STW     .D2T2   B25,*+SP(176)     ; |172| 
||         MVKH    .S2     0x3fe63000,B4
||         MVKL    .S1     0x12b3b59a,A31

           STW     .D2T2   B4,*+SP(156)      ; |111| 
||         MVKH    .S1     0x12b3b59a,A31

           STW     .D2T1   A31,*+SP(120)     ; |53| 
||         ZERO    .L2     B24               ; |105| 

           STW     .D2T2   B24,*+SP(72)      ; |172| 
||         ZERO    .L1     A2                ; |53| 

           STW     .D2T1   A2,*+SP(144)      ; |174| 
||         ZERO    .L1     A1                ; |53| 

           STW     .D2T1   A1,*+SP(112)      ; |174| 
||         ZERO    .L2     B27               ; |105| 

           STW     .D2T2   B27,*+SP(56)      ; |174| 
||         ZERO    .L2     B26               ; |96| 

           STW     .D2T2   B26,*+SP(52)      ; |174| 
||         ZERO    .L1     A16               ; |53| 

           STW     .D2T1   A16,*+SP(104)     ; |175| 
||         ZERO    .L1     A18               ; |95| 

           STW     .D2T1   A18,*+SP(48)      ; |176| 
||         MVKL    .S1     0xb356bd29,A27
||         ZERO    .L2     B28

           STW     .D2T2   B28,*+SP(16)      ; |175| 
||         MVKL    .S1     0xbfe94415,A28
||         MVKL    .S2     0x5c610ca8,B30

           STW     .D2T1   A8,*+SP(12)       ; |171| 
||         MVKL    .S1     0x2016afed,A29
||         MVKL    .S2     0xbf2bd010,B31
||         ZERO    .L1     A20               ; |99| 

           STW     .D2T1   A20,*+SP(36)      ; |171| 
||         MVKH    .S2     0x5c610ca8,B30
||         MVKL    .S1     0x4030624a,A30

           STW     .D2T2   B30,*+SP(160)     ; |111| 
||         MVKH    .S2     0xbf2bd010,B31
||         MVKL    .S1     0xc05007ff,A3

           STW     .D2T2   B31,*+SP(164)     ; |111| 
||         MVKH    .S1     0xb356bd29,A27

           STW     .D2T1   A27,*+SP(136)     ; |53| 
||         MVKH    .S1     0xbfe94415,A28

           STW     .D2T1   A28,*+SP(140)     ; |53| 
||         MVKH    .S1     0x2016afed,A29

           STW     .D2T1   A29,*+SP(128)     ; |53| 
||         MVKH    .S1     0x4030624a,A30

           STW     .D2T1   A30,*+SP(132)     ; |53| 
||         MVKH    .S1     0xc05007ff,A3
||         MVKL    .S2     a_sc,B16

           STW     .D2T1   A3,*+SP(124)      ; |53| 
||         MVKH    .S2     a_sc,B16

           STW     .D2T1   A25,*+SP(96)      ; |105| 
||         ZERO    .L1     A5
||         ZERO    .L2     B8                ; |173| 
||         ADD     .S2     1,B11,B9

           STW     .D2T1   A26,*+SP(100)     ; |105| 
||         MV      .L1X    B16,A21
||         ZERO    .S1     A7
||         ZERO    .L2     B6                ; |175| 
||         ZERO    .S2     B7
||         ZERO    .D1     A4                ; |174| 

           STDW    .D1T2   B9:B8,*+A21(16)   ; |173| 
||         STW     .D2T1   A24,*+SP(40)      ; |99| 
||         ZERO    .L2     B29               ; |100| 
||         MV      .L1X    B16,A9            ; |175| 
||         MVKH    .S1     0xfff00000,A5
||         MVKL    .S2     0x652b82fe,B10

           STDW    .D1T1   A5:A4,*+A9(24)    ; |174| 
||         STW     .D2T2   B29,*+SP(44)      ; |175| 
||         MV      .L1X    B16,A17           ; |176| 
||         SET     .S2     B7,0x14,0x1d,B7
||         ZERO    .S1     A6                ; |176| 
||         ZERO    .L2     B5

           STDW    .D1T2   B7:B6,*+A17(32)   ; |175| 
||         ZERO    .L2     B25               ; |111| 
||         STW     .D2T1   A23,*+SP(32)
||         MV      .L1X    B16,A19           ; |171| 
||         MVKH    .S2     0x80000000,B5
||         MVKH    .S1     0xbff00000,A7

           STDW    .D1T1   A7:A6,*+A19(40)   ; |176| 
||         STW     .D2T2   B25,*+SP(152)     ; |172| 
||         ZERO    .L2     B4                ; |172| 
||         MV      .L1X    B16,A0            ; |174| 
||         MVKL    .S2     0x3ff71547,B11
||         ZERO    .S1     A10               ; |96| 

           ZERO    .L2     B9:B8             ; |171| 
||         STDW    .D1T2   B5:B4,*+A0(8)     ; |172| 
||         STW     .D2T1   A22,*+SP(28)
||         ZERO    .L1     A31               ; |114| 
||         MVKH    .S2     0x652b82fe,B10
||         ZERO    .S1     A12               ; |100| 

           CALL    .S1     log2              ; |178| 
||         STDW    .D1T2   B9:B8,*A21        ; |171| 
||         STW     .D2T1   A31,*+SP(168)     ; |172| 
||         SUB     .L1X    B16,8,A15
||         MVKH    .S2     0x3ff71547,B11
||         ZERO    .L2     B12               ; |95| 

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
$C$RL11:   ; CALL OCCURS {log2} {0}          ; |178| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 30
           MVKL    .S2     output,B6

           MVKH    .S2     output,B6
||         LDW     .D2T2   *+SP(16),B7

           LDW     .D2T2   *B6,B6            ; |178| 
           MV      .L2X    A4,B4             ; |178| 
           MV      .L2X    A5,B5             ; |178| 
           NOP             2
           ADD     .L2     B7,B6,B6          ; |178| 
           STDW    .D2T2   B5:B4,*B6         ; |178| 

           CALLP   .S2     log2dp,B3
||         LDDW    .D1T1   *A15,A5:A4        ; |179| 

$C$RL12:   ; CALL OCCURS {log2dp} {0}        ; |179| 
           MVKL    .S2     output,B4

           MVKH    .S2     output,B4
||         LDW     .D2T2   *+SP(16),B5

           LDW     .D2T2   *+B4(4),B4        ; |179| 
           NOP             4
           ADD     .L2     B5,B4,B4          ; |179| 
           STDW    .D2T1   A5:A4,*B4         ; |179| 

           CALLP   .S2     log2dp_c,B3
||         LDDW    .D1T1   *A15,A5:A4        ; |180| 

$C$RL13:   ; CALL OCCURS {log2dp_c} {0}      ; |180| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 349

           MVKL    .S2     output,B4
||         LDW     .D2T2   *+SP(16),B5

           MVKH    .S2     output,B4
           LDW     .D2T2   *+B4(8),B4        ; |180| 
           ZERO    .L1     A31
           MVK     .S1     0xfffffc02,A30
           LDW     .D2T1   *+SP(12),A29      ; |118| 
           LDW     .D2T2   *+SP(184),B31     ; |117| 
           ADD     .L2     B5,B4,B4          ; |180| 
           STDW    .D2T1   A5:A4,*B4         ; |180| 
           LDDW    .D1T1   *A15,A19:A18      ; |81| 
           LDW     .D2T2   *+SP(32),B5
           SET     .S1     A31,0x15,0x1d,A5
           LDW     .D2T2   *+SP(28),B4
           LDW     .D2T2   *+SP(16),B30      ; |115| 

           CLR     .S1     A19,20,31,A3      ; |88| 
||         MV      .L1     A18,A4            ; |88| 

           OR      .L1     A5,A3,A5          ; |88| 
||         EXTU    .S1     A19,1,21,A0       ; |83| 

   [!A0]   ZERO    .L1     A5:A4             ; |91| 
           SUB     .L1     A29,1,A28         ; |177| 
           CMPGTDP .S2X    A5:A4,B5:B4,B0    ; |94| 
           SUB     .L1     A29,1,A2          ; |177| 
   [!B0]   LDW     .D2T1   *+SP(40),A7
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
   [ B0]   ZERO    .L1     A3
   [ B0]   SET     .S1     A3,0x15,0x1d,A3
   [ B0]   MV      .L1     A3,A7
   [ B0]   MV      .L1     A12,A6            ; |95| 
   [ B0]   SUBDP   .L1     A5:A4,A7:A6,A5:A4 ; |95| 
   [!B0]   ADDDP   .L2X    B5:B4,A7:A6,B7:B6 ; |100| 
           LDW     .D2T2   *+SP(60),B5
           MV      .L2     B12,B4            ; |105| 
   [ B0]   ZERO    .L2     B13
   [ B0]   SET     .S2     B13,0x15,0x1d,B13
           ADD     .S1     A30,A0,A3         ; |83| 
   [ B0]   SUBDP   .L1X    A5:A4,B13:B12,A5:A4 ; |95| 
           RCPDP   .S2     B7:B6,B9:B8       ; |105| 
   [!B0]   SUB     .L1     A3,1,A3           ; |101| 
           MPYDP   .M2     B7:B6,B9:B8,B17:B16 ; |105| 
           ADD     .L2     8,B30,B29         ; |177| 
           STW     .D2T2   B29,*+SP(16)      ; |181| 
           STW     .D2T1   A28,*+SP(12)      ; |181| 
           NOP             6
           SUBDP   .L2     B5:B4,B17:B16,B5:B4 ; |105| 
           NOP             6
           MPYDP   .M2     B9:B8,B5:B4,B9:B8 ; |105| 
           LDW     .D2T2   *+SP(68),B5
           NOP             8
           MPYDP   .M2     B7:B6,B9:B8,B17:B16 ; |105| 
           MV      .L2     B12,B4            ; |105| 
           NOP             8
           SUBDP   .L2     B5:B4,B17:B16,B5:B4 ; |105| 
           NOP             6
           MPYDP   .M2     B9:B8,B5:B4,B5:B4 ; |105| 
           NOP             9
           MPYDP   .M2     B7:B6,B5:B4,B9:B8 ; |105| 
           LDW     .D2T2   *+SP(76),B7
           NOP             7
           MV      .L2     B12,B6            ; |105| 
           SUBDP   .L2     B7:B6,B9:B8,B7:B6 ; |105| 
           LDW     .D2T2   *+SP(156),B9
           MV      .L2     B12,B8            ; |111| 
           NOP             4
           MPYDP   .M2     B5:B4,B7:B6,B5:B4 ; |105| 
           LDW     .D2T2   *+SP(164),B7
           LDW     .D2T2   *+SP(160),B6
           NOP             8
           MPYDP   .M1X    A5:A4,B5:B4,A9:A8 ; |105| 
           LDW     .D2T1   *+SP(100),A5
           LDW     .D2T1   *+SP(96),A4
           INTDP   .L2X    A3,B5:B4          ; |111| 
           NOP             6
           MPYDP   .M1     A9:A8,A9:A8,A7:A6 ; |105| 
           MPYDP   .M2     B7:B6,B5:B4,B7:B6 ; |111| 
           NOP             8
           ADDDP   .L1     A5:A4,A7:A6,A5:A4 ; |53| 
           MPYDP   .M2     B9:B8,B5:B4,B5:B4 ; |111| 
           NOP             5
           MPYDP   .M1     A7:A6,A5:A4,A17:A16 ; |53| 
           LDW     .D2T1   *+SP(92),A5
           LDW     .D2T1   *+SP(88),A4
           NOP             7
           ADDDP   .L1     A5:A4,A17:A16,A5:A4 ; |53| 
           NOP             6
           MPYDP   .M1     A7:A6,A5:A4,A17:A16 ; |53| 
           LDW     .D2T1   *+SP(84),A5
           LDW     .D2T1   *+SP(80),A4
           NOP             7
           ADDDP   .L1     A5:A4,A17:A16,A23:A22 ; |53| 
           LDW     .D2T1   *+SP(108),A5
           MV      .L1     A12,A4            ; |53| 
           NOP             4
           RCPDP   .S1     A23:A22,A17:A16   ; |53| 
           NOP             1
           MPYDP   .M1     A17:A16,A23:A22,A21:A20 ; |53| 
           NOP             9
           SUBDP   .L1     A5:A4,A21:A20,A5:A4 ; |53| 
           NOP             6
           MPYDP   .M1     A17:A16,A5:A4,A17:A16 ; |53| 
           LDW     .D2T1   *+SP(116),A5
           NOP             8
           MPYDP   .M1     A17:A16,A23:A22,A21:A20 ; |53| 
           MV      .L1     A12,A4            ; |53| 
           NOP             8
           SUBDP   .L1     A5:A4,A21:A20,A5:A4 ; |53| 
           NOP             6

           MPYDP   .M1     A17:A16,A5:A4,A17:A16 ; |53| 
||         LDW     .D2T1   *+SP(140),A5

           LDW     .D2T1   *+SP(136),A4
           NOP             4
           MPYDP   .M1     A5:A4,A7:A6,A21:A20 ; |53| 
           LDW     .D2T1   *+SP(132),A5
           LDW     .D2T1   *+SP(128),A4
           NOP             2
           MPYDP   .M1     A17:A16,A23:A22,A23:A22 ; |53| 
           NOP             4

           ADDDP   .L1     A5:A4,A21:A20,A21:A20 ; |53| 
||         LDW     .D2T1   *+SP(148),A5

           MV      .S1     A12,A4            ; |53| 
           NOP             3
           SUBDP   .L1     A5:A4,A23:A22,A5:A4 ; |53| 
           NOP             2
           MPYDP   .M1     A7:A6,A21:A20,A21:A20 ; |53| 
           NOP             3

           MPYDP   .M1     A17:A16,A5:A4,A17:A16 ; |53| 
||         LDW     .D2T1   *+SP(124),A5

           LDW     .D2T1   *+SP(120),A4
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
           LDW     .D2T1   *+SP(172),A5
           MV      .L1     A12,A4
           NOP             4
           ADDDP   .L2     B5:B4,B7:B6,B5:B4 ; |111| 
           CMPLTDP .S1     A19:A18,A5:A4,A0  ; |114| 
           NOP             5

           MPYDP   .M2     B11:B10,B5:B4,B7:B6 ; |111| 
||         LDW     .D2T2   *+SP(180),B5

           LDW     .D2T2   *+SP(176),B4
           NOP             4

           CMPGTDP .S2X    A19:A18,B5:B4,B0  ; |117| 
||         LDW     .D2T2   *B31,B4           ; |181| 

           NOP             2
   [ A2]   B       .S1     $C$L8             ; |177| 

   [ A0]   MVKL    .S2     0xffefffff,B7
|| [ A0]   MVK     .L2     0xffffffff,B6     ; |115| 

   [ A0]   MVKH    .S2     0xffefffff,B7
|| [ B0]   MV      .L2     B8,B6             ; |115| 
||         ADD     .D2     B30,B4,B4         ; |181| 

   [ B0]   ZERO    .L2     B7
   [ B0]   MVKH    .S2     0x40900000,B7

   [ A2]   CALL    .S1     log2              ; |178| 
||         STDW    .D2T2   B7:B6,*B4         ; |181| 

           ; BRANCHCC OCCURS {$C$L8}         ; |177| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 6
           CALL    .S1     log2dp_v          ; |183| 
           LDW     .D1T2   *A14,B4           ; |183| 
           MVKL    .S1     a_sc,A4
           MVKH    .S1     a_sc,A4
           ADDKPC  .S2     $C$RL14,B3,0      ; |183| 
           MVK     .L1     0x6,A6            ; |183| 
$C$RL14:   ; CALL OCCURS {log2dp_v} {0}      ; |183| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 12

           CALLP   .S2     allequal,B3
||         MVK     .L1     0x6,A4            ; |186| 

$C$RL15:   ; CALL OCCURS {allequal} {0}      ; |186| 

           CALLP   .S2     print_test_results,B3
||         MVK     .L1     0x3,A4            ; |187| 

$C$RL16:   ; CALL OCCURS {print_test_results} {0}  ; |187| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 39
           LDW     .D2T1   *+SP(148),A26     ; |105| 
           LDW     .D2T2   *+SP(160),B12     ; |53| 
           LDW     .D2T2   *+SP(172),B5      ; |196| 
           LDW     .D2T1   *+SP(180),A3      ; |117| 
           LDW     .D2T1   *+SP(156),A31     ; |111| 
           LDW     .D2T1   *+SP(124),A30     ; |53| 
           LDW     .D2T1   *+SP(84),A28      ; |53| 
           LDW     .D2T1   *+SP(120),A29     ; |53| 

           LDW     .D2T1   *+SP(80),A27      ; |105| 
||         MVKL    .S2     0xc000cccc,B4

           MVKH    .S2     0xc000cccc,B4
||         LDW     .D2T2   *+SP(164),B13     ; |111| 

           STW     .D2T2   B4,*+SP(192)      ; |196| 
||         MV      .L1     A12,A5

           MV      .L1     A12,A4
||         STW     .D2T1   A5,*+SP(108)

           MV      .L2X    A10,B7            ; |105| 
||         STW     .D2T1   A4,*+SP(116)

           MV      .L2X    A10,B8            ; |105| 
||         STW     .D2T2   B7,*+SP(68)

           STW     .D2T2   B8,*+SP(60)

           MVK     .S1     0x777,A25
||         STW     .D2T2   B7,*+SP(16)

           MV      .L2X    A10,B30           ; |105| 
||         STW     .D2T1   A25,*+SP(12)

           STW     .D2T2   B30,*+SP(76)      ; |190| 
           STW     .D2T1   A5,*+SP(148)      ; |190| 

           MVKL    .S2     0xcccccccd,B31
||         MVK     .L1     0xffffffff,A23    ; |117| 
||         STW     .D2T1   A4,*+SP(160)      ; |190| 

           MVKH    .S2     0xcccccccd,B31
||         STW     .D2T1   A23,*+SP(172)     ; |190| 

           STW     .D2T2   B31,*+SP(188)     ; |196| 
           STW     .D2T1   A3,*+SP(176)      ; |117| 
           STW     .D2T1   A31,*+SP(168)     ; |111| 
           STW     .D2T1   A30,*+SP(144)     ; |53| 
           STW     .D2T1   A28,*+SP(104)     ; |105| 
           STW     .D2T1   A26,*+SP(152)     ; |105| 
           STW     .D2T1   A26,*+SP(112)     ; |105| 
           STW     .D2T1   A26,*+SP(72)      ; |105| 
           STW     .D2T1   A26,*+SP(64)      ; |105| 
           STW     .D2T1   A29,*+SP(124)     ; |53| 
           STW     .D2T1   A27,*+SP(84)      ; |105| 
           STW     .D2T1   A26,*+SP(80)      ; |105| 

           MVKL    .S2     a_ext,B6
||         MV      .L1X    B5,A24
||         STW     .D2T1   A26,*+SP(120)     ; |105| 

           MVKH    .S2     a_ext,B6
||         MV      .L2X    A10,B4            ; |105| 
||         STW     .D2T1   A24,*+SP(164)     ; |190| 

           STW     .D2T2   B4,*+SP(156)      ; |190| 

           STDW    .D2T2   B5:B4,*B6         ; |190| 
||         MV      .L1X    B6,A15            ; |190| 
||         CALL    .S1     log2              ; |192| 

           LDDW    .D1T1   *A15,A5:A4        ; |192| 
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
$C$L9:    
;          EXCLUSIVE CPU CYCLES: 3
           ADDKPC  .S2     $C$RL17,B3,2      ; |192| 
$C$RL17:   ; CALL OCCURS {log2} {0}          ; |192| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 30
           MVKL    .S2     output,B4

           MVKH    .S2     output,B4
||         LDW     .D2T2   *+SP(16),B5

           LDW     .D2T2   *B4,B4            ; |192| 
           NOP             4
           ADD     .L2     B5,B4,B4          ; |192| 
           STDW    .D2T1   A5:A4,*B4         ; |192| 

           CALLP   .S2     log2dp,B3
||         LDDW    .D1T1   *A15,A5:A4        ; |193| 

$C$RL18:   ; CALL OCCURS {log2dp} {0}        ; |193| 
           MVKL    .S2     output,B4

           MVKH    .S2     output,B4
||         LDW     .D2T2   *+SP(16),B5

           LDW     .D2T2   *+B4(4),B4        ; |193| 
           NOP             4
           ADD     .L2     B5,B4,B4          ; |193| 
           STDW    .D2T1   A5:A4,*B4         ; |193| 

           CALLP   .S2     log2dp_c,B3
||         LDDW    .D1T1   *A15,A5:A4        ; |194| 

$C$RL19:   ; CALL OCCURS {log2dp_c} {0}      ; |194| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 371

           MVKL    .S2     output,B4
||         LDW     .D2T2   *+SP(16),B5

           MVKH    .S2     output,B4
           LDW     .D2T2   *+B4(8),B4        ; |194| 
           ZERO    .L1     A31
           MVK     .S1     0xfffffc02,A30
           LDW     .D2T2   *+SP(184),B31
           LDW     .D2T2   *+SP(16),B30      ; |115| 
           ADD     .L2     B5,B4,B4          ; |194| 
           STDW    .D2T1   A5:A4,*B4         ; |194| 
           LDDW    .D1T1   *A15,A19:A18      ; |81| 
           LDW     .D2T2   *+SP(32),B5
           SET     .S1     A31,0x15,0x1d,A5
           LDW     .D2T2   *+SP(28),B4
           LDW     .D2T1   *+SP(12),A29

           CLR     .S1     A19,20,31,A3      ; |88| 
||         MV      .L1     A18,A4            ; |88| 

           OR      .L1     A5,A3,A5          ; |88| 
||         EXTU    .S1     A19,1,21,A0       ; |83| 

   [!A0]   ZERO    .L1     A5:A4             ; |91| 
           ADD     .L1     A30,A0,A3         ; |83| 
           CMPGTDP .S2X    A5:A4,B5:B4,B0    ; |94| 
           ADD     .L2     8,B30,B29         ; |191| 
   [!B0]   LDW     .D2T1   *+SP(40),A7
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
   [ B0]   MV      .L2X    A10,B4            ; |100| 
   [!B0]   SET     .S2     B4,0x15,0x1d,B4
   [ B0]   ADDDP   .S2X    B5:B4,A7:A6,B7:B6 ; |96| 
   [!B0]   MV      .L2     B4,B5             ; |100| 
   [!B0]   MV      .L2X    A10,B4            ; |96| 
   [ B0]   MV      .L1     A12,A6            ; |95| 
   [!B0]   SUB     .L1     A3,1,A3           ; |101| 
           SUB     .L1     A29,1,A28         ; |191| 
           SUB     .L1     A29,1,A2          ; |191| 
           NOP             1
   [!B0]   ADDDP   .L2X    B5:B4,A7:A6,B7:B6 ; |100| 
           LDW     .D2T2   *+SP(64),B5
           MV      .L2X    A10,B4            ; |105| 
           NOP             4
           RCPDP   .S2     B7:B6,B9:B8       ; |105| 
           NOP             1
           MPYDP   .M2     B7:B6,B9:B8,B17:B16 ; |105| 
           NOP             9
           SUBDP   .L2     B5:B4,B17:B16,B5:B4 ; |105| 
           NOP             6
           MPYDP   .M2     B9:B8,B5:B4,B9:B8 ; |105| 
           LDW     .D2T2   *+SP(72),B5
           NOP             8
           MPYDP   .M2     B7:B6,B9:B8,B17:B16 ; |105| 
           MV      .L2X    A10,B4            ; |105| 
           NOP             8
           SUBDP   .L2     B5:B4,B17:B16,B5:B4 ; |105| 
           NOP             6
           MPYDP   .M2     B9:B8,B5:B4,B5:B4 ; |105| 
           NOP             9
           MPYDP   .M2     B7:B6,B5:B4,B9:B8 ; |105| 
           LDW     .D2T2   *+SP(80),B7
           NOP             7
           MV      .L2X    A10,B6            ; |105| 
           SUBDP   .L2     B7:B6,B9:B8,B7:B6 ; |105| 
   [ B0]   ZERO    .S2     B8
   [ B0]   SET     .S2     B8,0x15,0x1d,B8
           LDW     .D2T2   *+SP(168),B9
   [ B0]   MV      .L1X    B8,A7
   [ B0]   SUBDP   .L1     A5:A4,A7:A6,A5:A4 ; |95| 
   [ B0]   MV      .S1     A12,A6            ; |95| 
           MPYDP   .M2     B5:B4,B7:B6,B5:B4 ; |105| 
           MV      .L2X    A10,B8            ; |111| 
           NOP             1
   [ B0]   ZERO    .L2     B6
   [ B0]   SET     .S2     B6,0x15,0x1d,B6
           NOP             1
   [ B0]   MV      .L1X    B6,A7
   [ B0]   SUBDP   .L1     A5:A4,A7:A6,A5:A4 ; |95| 
           NOP             6
           MPYDP   .M1X    A5:A4,B5:B4,A9:A8 ; |105| 
           LDW     .D2T1   *+SP(100),A5
           LDW     .D2T1   *+SP(96),A4
           INTDP   .L2X    A3,B5:B4          ; |111| 
           NOP             6
           MPYDP   .M1     A9:A8,A9:A8,A7:A6 ; |105| 
           MPYDP   .M2     B13:B12,B5:B4,B7:B6 ; |111| 
           NOP             8
           ADDDP   .L1     A5:A4,A7:A6,A5:A4 ; |53| 
           MPYDP   .M2     B9:B8,B5:B4,B5:B4 ; |111| 
           NOP             5
           MPYDP   .M1     A7:A6,A5:A4,A17:A16 ; |53| 
           LDW     .D2T1   *+SP(92),A5
           LDW     .D2T1   *+SP(88),A4
           NOP             7
           ADDDP   .L1     A5:A4,A17:A16,A5:A4 ; |53| 
           NOP             6
           MPYDP   .M1     A7:A6,A5:A4,A17:A16 ; |53| 
           LDW     .D2T1   *+SP(104),A5
           LDW     .D2T1   *+SP(84),A4
           NOP             7
           ADDDP   .L1     A5:A4,A17:A16,A23:A22 ; |53| 
           LDW     .D2T1   *+SP(112),A5
           MV      .L1     A12,A4            ; |53| 
           NOP             4
           RCPDP   .S1     A23:A22,A17:A16   ; |53| 
           NOP             1
           MPYDP   .M1     A17:A16,A23:A22,A21:A20 ; |53| 
           NOP             9
           SUBDP   .L1     A5:A4,A21:A20,A5:A4 ; |53| 
           NOP             6
           MPYDP   .M1     A17:A16,A5:A4,A17:A16 ; |53| 
           LDW     .D2T1   *+SP(120),A5
           NOP             8
           MPYDP   .M1     A17:A16,A23:A22,A21:A20 ; |53| 
           MV      .L1     A12,A4            ; |53| 
           NOP             8
           SUBDP   .L1     A5:A4,A21:A20,A5:A4 ; |53| 
           NOP             6

           MPYDP   .M1     A17:A16,A5:A4,A17:A16 ; |53| 
||         LDW     .D2T1   *+SP(140),A5

           LDW     .D2T1   *+SP(136),A4
           NOP             4
           MPYDP   .M1     A5:A4,A7:A6,A21:A20 ; |53| 
           LDW     .D2T1   *+SP(132),A5
           LDW     .D2T1   *+SP(128),A4
           NOP             2
           MPYDP   .M1     A17:A16,A23:A22,A23:A22 ; |53| 
           NOP             4

           ADDDP   .L1     A5:A4,A21:A20,A21:A20 ; |53| 
||         LDW     .D2T1   *+SP(152),A5

           MV      .S1     A12,A4            ; |53| 
           NOP             3
           SUBDP   .L1     A5:A4,A23:A22,A5:A4 ; |53| 
           NOP             2
           MPYDP   .M1     A7:A6,A21:A20,A21:A20 ; |53| 
           NOP             3

           MPYDP   .M1     A17:A16,A5:A4,A17:A16 ; |53| 
||         LDW     .D2T1   *+SP(144),A5

           LDW     .D2T1   *+SP(124),A4
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
           LDW     .D2T1   *+SP(164),A5
           MV      .L1     A12,A4            ; |111| 
           NOP             4
           ADDDP   .L2     B5:B4,B7:B6,B5:B4 ; |111| 
           CMPLTDP .S1     A19:A18,A5:A4,A1  ; |114| 
           LDW     .D2T1   *+SP(176),A5
           LDW     .D2T1   *+SP(172),A4
           LDW     .D2T2   *B31,B6           ; |195| 
           NOP             2
           MPYDP   .M2     B11:B10,B5:B4,B5:B4 ; |111| 
           CMPGTDP .S1     A19:A18,A5:A4,A0  ; |117| 
           ADD     .L2     B30,B6,B6         ; |195| 
   [!A2]   MVKL    .S2     output,B11
   [!A2]   MVKH    .S2     output,B11
           NOP             5

   [ A1]   MVKL    .S2     0xffefffff,B5
|| [ A1]   MV      .L2X    A4,B4             ; |118| 

   [ A1]   MVKH    .S2     0xffefffff,B5
|| [ A0]   MV      .L2     B8,B4             ; |115| 

   [ A0]   ZERO    .L2     B5
   [ A0]   MVKH    .S2     0x40900000,B5
           STDW    .D2T2   B5:B4,*B6         ; |195| 

           LDDW    .D1T1   *A15,A5:A4        ; |196| 
||         LDW     .D2T2   *+SP(192),B5

           LDW     .D2T2   *+SP(188),B4
           NOP             4
           MPYDP   .M2X    B5:B4,A5:A4,B5:B4 ; |196| 
           NOP             6
   [ A2]   BNOP    .S1     $C$L9,2           ; |191| 

   [ A2]   CALL    .S1     log2              ; |192| 
||         STDW    .D1T2   B5:B4,*++A15      ; |196| 

   [ A2]   LDDW    .D1T1   *A15,A5:A4        ; |192| 
||         STW     .D2T2   B29,*+SP(16)      ; |196| 

   [!A2]   CALL    .S1     log2dp_v          ; |198| 
||         STW     .D2T1   A28,*+SP(12)      ; |196| 

           ; BRANCHCC OCCURS {$C$L9}         ; |191| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           LDW     .D2T2   *+B11(16),B4      ; |198| 
           MVKL    .S1     a_ext,A4
           MVKH    .S1     a_ext,A4
           MVK     .S1     0x777,A6          ; |198| 
           ADDKPC  .S2     $C$RL20,B3,0      ; |198| 
$C$RL20:   ; CALL OCCURS {log2dp_v} {0}      ; |198| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 42
           MVKL    .S2     0x3e45798e,B7
           MVKL    .S2     0xe2308c3a,B6
           MVKH    .S2     0x3e45798e,B7

           LDW     .D2T1   *B11,A4           ; |66| 
||         MVKH    .S2     0xe2308c3a,B6

           CALLP   .S2     isequal,B3
||         LDW     .D2T2   *+B11(4),B4       ; |66| 
||         MVK     .S1     0x777,A6          ; |66| 
||         MVK     .L1     0x9,A8            ; |66| 

$C$RL21:   ; CALL OCCURS {isequal} {0}       ; |66| 
           MVKL    .S2     fcn_pass,B10
           MVKL    .S2     0x3e45798e,B7
           MVKH    .S2     fcn_pass,B10
           MVKL    .S2     0xe2308c3a,B6

           LDW     .D2T2   *+B11(8),B4       ; |67| 
||         MVKH    .S2     0x3e45798e,B7

           STW     .D2T1   A4,*+B10(4)       ; |66| 
||         MVKH    .S2     0xe2308c3a,B6

           CALLP   .S2     isequal,B3
||         LDW     .D2T1   *B11,A4           ; |67| 
||         MVK     .S1     0x777,A6          ; |67| 
||         MVK     .L1     0x9,A8            ; |67| 

$C$RL22:   ; CALL OCCURS {isequal} {0}       ; |67| 
           MVKL    .S2     0x3e45798e,B7
           MVKL    .S2     0xe2308c3a,B6

           STW     .D2T1   A4,*+B10(8)       ; |67| 
||         MVKH    .S2     0x3e45798e,B7

           MV      .L2     B11,B5            ; |67| 
||         LDW     .D2T2   *+B11(12),B4      ; |68| 
||         MVKH    .S2     0xe2308c3a,B6

           CALLP   .S2     isequal,B3
||         LDW     .D2T1   *B5,A4            ; |68| 
||         MVK     .S1     0x777,A6          ; |68| 
||         MVK     .L1     0x9,A8            ; |68| 

$C$RL23:   ; CALL OCCURS {isequal} {0}       ; |68| 
           MVKL    .S2     0x3e45798e,B7
           MVKL    .S2     0xe2308c3a,B6
           MVKH    .S2     0x3e45798e,B7

           MV      .L1     A14,A5            ; |68| 
||         MV      .L2     B11,B4            ; |68| 
||         STW     .D2T1   A4,*+B10(12)      ; |68| 
||         MVKH    .S2     0xe2308c3a,B6

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
           STW     .D2T2   B4,*+SP(16)
           ADD     .L2     8,B10,B4
           STW     .D2T2   B4,*+SP(28)       ; |69| 

   [!B0]   MVKL    .S1     all_pass,A3
|| [!B0]   B       .S2     $C$L10            ; |72| 
|| [!B0]   MV      .L1     A12,A4
||         MV      .L2     B0,B1             ; guard predicate rewrite

   [!B0]   CALL    .S2     print_test_results ; |202| 
|| [!B0]   MVKH    .S1     all_pass,A3
|| [ B0]   LDW     .D2T2   *B4,B0            ; |72| 

   [ B1]   ADD     .L2     4,B4,B4
           NOP             3
           ; BRANCHCC OCCURS {$C$L10}        ; |72| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 10
   [ B0]   LDW     .D2T2   *B4,B4            ; |72| 
           CMPEQ   .L1     A4,0,A3           ; |72| 
           XOR     .L1     1,A3,A3           ; |72| 
           MVK     .L1     0x1,A4            ; |72| 
   [!B0]   MV      .L1     A12,A0            ; |72| 
   [ B0]   CMPEQ   .L2     B4,0,B4           ; |72| 
   [ B0]   XOR     .L2     1,B4,B4           ; |72| 
           NOP             1
   [ B0]   AND     .L1X    A3,B4,A0          ; |72| 
   [!A0]   MV      .L1     A12,A4
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
;          EXCLUSIVE CPU CYCLES: 16
           MV      .L2X    A12,B12           ; |114| 

           MV      .L2X    A12,B13           ; |114| 
||         MVKL    .S1     cycle_counts+24,A3

           MVKH    .S1     cycle_counts+24,A3
||         MV      .L2X    A12,B4            ; |114| 

           MVC     .S2     B4,TSCL           ; |115| 
||         STDW    .D1T2   B13:B12,*A3       ; |114| 

           MVC     .S2     TSCL,B6           ; |116| 
           MVC     .S2     TSCH,B7           ; |116| 
           MVKL    .S1     t_start,A3
           MVKH    .S1     t_start,A3

           MVC     .S2     TSCL,B4           ; |117| 
||         STDW    .D1T2   B7:B6,*A3         ; |116| 

           MVC     .S2     TSCH,B8           ; |117| 

           MVKL    .S1     t_offset,A3
||         SUBU    .L2     B4,B6,B5:B4       ; |117| 

           CALL    .S1     gimme_random      ; |212| 
||         EXT     .S2     B5,24,24,B6       ; |117| 
||         SUB     .L2     B8,B7,B31         ; |117| 

           ADD     .L2     B31,B6,B5         ; |117| 
||         MVKH    .S1     t_offset,A3

           MVK     .S2     0x80,B4
||         STDW    .D1T2   B5:B4,*A3         ; |117| 

           ZERO    .L2     B5
||         MVKL    .S1     0x40c38880,A5

           MV      .L2     B12,B4            ; |212| 
||         MV      .L1X    B4,A15            ; |117| 
||         MVKH    .S2     0xbff00000,B5
||         MVKH    .S1     0x40c38880,A5
||         MV      .D2     B12,B10
||         MV      .D1     A10,A4            ; |212| 

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
;          EXCLUSIVE CPU CYCLES: 1
           ADDKPC  .S2     $C$RL26,B3,0      ; |212| 
$C$RL26:   ; CALL OCCURS {gimme_random} {0}  ; |212| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 364
           MVKL    .S2     input,B4
           MVKH    .S2     input,B4
           LDW     .D2T2   *B4,B4            ; |212| 
           NOP             4
           ADD     .L2     B10,B4,B4         ; |212| 

           STDW    .D2T1   A5:A4,*B4         ; |212| 
||         MVC     .S2     TSCL,B6           ; |122| 

           MVC     .S2     TSCH,B7           ; |122| 

           ZERO    .L1     A11
||         CLR     .S1     A5,20,31,A9       ; |88| 
||         MV      .D1     A4,A8             ; |81| 
||         MV      .L2     B12,B4            ; |99| 
||         ZERO    .S2     B19
||         MV      .D2     B12,B18           ; |105| 

           SET     .S1     A11,0x15,0x1d,A11
||         SET     .S2     B19,0x1e,0x1e,B19
||         MV      .L1     A10,A18           ; |105| 
||         MV      .D1     A10,A20           ; |53| 

           MV      .L1     A11,A3            ; |88| 
||         EXTU    .S1     A5,1,21,A1        ; |83| 
||         MVKL    .S2     output+12,B31
||         ZERO    .D1     A30

           MVKL    .S1     0x3fe6a09e,A7
||         OR      .L1     A3,A9,A9          ; |88| 
||         MV      .D1X    B19,A19           ; |105| 
||         MVKH    .S2     output+12,B31

           MVKL    .S1     0x667f3bcd,A6
|| [!A1]   ZERO    .L1     A9:A8             ; |91| 
||         MV      .D1X    B19,A21           ; |53| 

           MVKH    .S1     0x3fe6a09e,A7
           MVKH    .S1     0x667f3bcd,A6
           CMPGTDP .S1     A9:A8,A7:A6,A0    ; |94| 
           MV      .L1     A10,A6            ; |100| 

   [!A0]   MV      .L2X    A11,B5            ; |96| 
|| [ A0]   MV      .D1     A3,A7             ; |100| 
||         MVKL    .S1     0x12b3b59a,A22
|| [!A0]   SUBDP   .L1     A9:A8,A11:A10,A9:A8 ; |99| 

   [ A0]   MV      .L2X    A11,B5            ; |99| 
||         MVKL    .S1     0xc05007ff,A23

   [ A0]   MPYDP   .M2X    B5:B4,A9:A8,B9:B8 ; |96| 
||         MVKH    .S1     0x12b3b59a,A22

           MVKH    .S1     0xc05007ff,A23
           MVK     .S1     0xfffffc02,A31
           MVKL    .S1     t_start,A13
           MVKH    .S1     t_start,A13
           STDW    .D1T2   B7:B6,*A13
   [!A0]   MPYDP   .M2X    B5:B4,A9:A8,B9:B8 ; |100| 
           NOP             3
   [!A0]   MV      .L2X    A11,B5            ; |100| 
   [ A0]   ADDDP   .L2X    A7:A6,B9:B8,B5:B4 ; |96| 
           MV      .L1X    B19,A7            ; |105| 
           NOP             3
   [!A0]   ADDDP   .L2     B5:B4,B9:B8,B5:B4 ; |100| 
           NOP             6
           RCPDP   .S2     B5:B4,B9:B8       ; |105| 
           NOP             1
           MPYDP   .M2     B5:B4,B9:B8,B17:B16 ; |105| 
           NOP             9
           SUBDP   .L2     B19:B18,B17:B16,B17:B16 ; |105| 
           NOP             6
           MPYDP   .M2     B9:B8,B17:B16,B9:B8 ; |105| 
           NOP             9
           MPYDP   .M2     B5:B4,B9:B8,B17:B16 ; |105| 
           NOP             9
           NOP             1
           SUBDP   .L1X    A7:A6,B17:B16,A7:A6 ; |105| 
           NOP             6
           MPYDP   .M1X    B9:B8,A7:A6,A7:A6 ; |105| 
           NOP             9
           MPYDP   .M1X    B5:B4,A7:A6,A17:A16 ; |105| 
           NOP             2

   [ A0]   MV      .L2X    A11,B5            ; |105| 
||         MV      .S2     B18,B4            ; |105| 

           NOP             1
   [ A0]   SUBDP   .L1X    A9:A8,B5:B4,A9:A8 ; |95| 
           MVKL    .S2     0xc041d580,B5
           MVKL    .S2     0x4b67ce0f,B4
           MVKH    .S2     0xc041d580,B5
           MVKH    .S2     0x4b67ce0f,B4
           SUBDP   .L1     A19:A18,A17:A16,A17:A16 ; |105| 
           NOP             6
           MPYDP   .M1     A7:A6,A17:A16,A17:A16 ; |105| 
           NOP             2

           MV      .L1     A18,A6            ; |105| 
|| [ A0]   MV      .S1     A3,A7             ; |105| 
||         ADD     .D1     A31,A1,A3         ; |83| 

   [ A0]   SUBDP   .L1     A9:A8,A7:A6,A9:A8 ; |95| 
|| [!A0]   SUB     .S1     A3,1,A3           ; |101| 

           NOP             6
           MPYDP   .M1     A9:A8,A17:A16,A7:A6 ; |105| 
           NOP             2
           MVKL    .S1     0xfa15267e,A16
           MVKL    .S1     0x40738083,A17
           MVKH    .S1     0xfa15267e,A16
           MVKH    .S1     0x40738083,A17
           NOP             3
           MPYDP   .M1     A7:A6,A7:A6,A9:A8 ; |105| 
           NOP             9
           NOP             1
           ADDDP   .L2X    B5:B4,A9:A8,B5:B4 ; |53| 
           NOP             6
           MPYDP   .M2X    A9:A8,B5:B4,B5:B4 ; |53| 
           NOP             9
           NOP             1
           ADDDP   .L1X    A17:A16,B5:B4,A17:A16 ; |53| 
           MVKL    .S2     0x9c0d9077,B4
           MVKL    .S2     0xc0880bfe,B5
           MVKH    .S2     0x9c0d9077,B4
           MVKH    .S2     0xc0880bfe,B5
           NOP             2
           MPYDP   .M1     A9:A8,A17:A16,A17:A16 ; |53| 
           NOP             9
           NOP             1
           ADDDP   .L2X    B5:B4,A17:A16,B5:B4 ; |53| 

           MV      .L1     A19,A17           ; |53| 
||         MV      .D1     A18,A16           ; |53| 
||         MVKL    .S1     0xb356bd29,A18

           MVKL    .S1     0xbfe94415,A19
           MVKH    .S1     0xb356bd29,A18
           MVKH    .S1     0xbfe94415,A19
           MPYDP   .M1     A19:A18,A9:A8,A19:A18 ; |53| 
           NOP             1
           RCPDP   .S2     B5:B4,B9:B8       ; |53| 
           NOP             1
           MPYDP   .M2     B9:B8,B5:B4,B17:B16 ; |53| 
           NOP             9
           NOP             1
           SUBDP   .L1X    A17:A16,B17:B16,A17:A16 ; |53| 

           MV      .L2     B19,B17           ; |53| 
||         MV      .S2     B18,B16           ; |53| 

           NOP             5
           MPYDP   .M1X    B9:B8,A17:A16,A17:A16 ; |53| 
           NOP             9
           NOP             1
           MPYDP   .M2X    A17:A16,B5:B4,B9:B8 ; |53| 
           NOP             9
           SUBDP   .L2     B17:B16,B9:B8,B9:B8 ; |53| 
           NOP             7
           MPYDP   .M1X    A17:A16,B9:B8,A17:A16 ; |53| 
           NOP             2
           MVKL    .S2     0x2016afed,B8
           MVKL    .S2     0x4030624a,B9
           MVKH    .S2     0x2016afed,B8
           MVKH    .S2     0x4030624a,B9
           NOP             1

           ADDDP   .L1X    B9:B8,A19:A18,A19:A18 ; |53| 
||         LDW     .D2T2   *B31,B8           ; |216| 

           NOP             2
           MPYDP   .M2X    A17:A16,B5:B4,B5:B4 ; |53| 
           NOP             1
           ADD     .L2     B10,B8,B8         ; |216| 
           NOP             8

           SUBDP   .L1X    A21:A20,B5:B4,A19:A18 ; |53| 
||         MPYDP   .M1     A9:A8,A19:A18,A21:A20 ; |53| 

           MVKL    .S2     0x5c610ca8,B4
           MVKL    .S2     0xbf2bd010,B5
           MVKH    .S2     0x5c610ca8,B4
           MVKH    .S2     0xbf2bd010,B5
           NOP             2
           MPYDP   .M1     A17:A16,A19:A18,A17:A16 ; |53| 
           NOP             2
           ADDDP   .L1     A23:A22,A21:A20,A19:A18 ; |53| 
           NOP             6
           MPYDP   .M1     A19:A18,A17:A16,A17:A16 ; |53| 
           NOP             9
           MPYDP   .M1     A9:A8,A17:A16,A9:A8 ; |111| 
           NOP             9

           MPYDP   .M1     A7:A6,A9:A8,A17:A16 ; |111| 
||         INTDP   .L1     A3,A9:A8          ; |111| 

           NOP             4
           MPYDP   .M1X    B5:B4,A9:A8,A19:A18 ; |111| 
           NOP             2

           MVKL    .S2     0x3fe63000,B5
||         MV      .L2     B16,B4            ; |111| 

           MVKH    .S2     0x3fe63000,B5

           ADDDP   .L1     A17:A16,A7:A6,A7:A6 ; |111| 
||         MPYDP   .M2X    B5:B4,A9:A8,B5:B4 ; |111| 

           NOP             2

           MV      .L1     A10,A8            ; |111| 
||         SET     .S1     A30,0x14,0x14,A9

           CMPLTDP .S1     A5:A4,A9:A8,A0    ; |114| 
           NOP             2
           ADDDP   .L1     A7:A6,A19:A18,A7:A6 ; |111| 
           NOP             7
           ADDDP   .L2X    B5:B4,A7:A6,B5:B4 ; |111| 
           MVKL    .S1     0x652b82fe,A6
           MVKL    .S1     0x3ff71547,A7
           MVKH    .S1     0x652b82fe,A6
           MVKH    .S1     0x3ff71547,A7
           NOP             2
           MPYDP   .M2X    A7:A6,B5:B4,B5:B4 ; |111| 
           NOP             2

           MVKL    .S1     0x7fefffff,A7
||         MVK     .L1     0xffffffff,A6     ; |117| 

           MVKH    .S1     0x7fefffff,A7
           CMPGTDP .S1     A5:A4,A7:A6,A1    ; |117| 
           NOP             4

   [ A0]   MVKL    .S2     0xffefffff,B5
|| [ A0]   MV      .L2X    A6,B4             ; |118| 

   [ A0]   MVKH    .S2     0xffefffff,B5
|| [ A1]   MV      .L2     B16,B4            ; |118| 

   [ A1]   ZERO    .L2     B5
   [ A1]   MVKH    .S2     0x40900000,B5

           STDW    .D2T2   B5:B4,*B8         ; |216| 
||         MVC     .S2     TSCL,B8           ; |128| 

           MVC     .S2     TSCH,B9           ; |128| 

           MVKL    .S2     t_offset,B11
||         SUB     .L1     A15,1,A0          ; |210| 
||         MVKL    .S1     cycle_counts+24,A12

           MVKH    .S2     t_offset,B11
||         MVKH    .S1     cycle_counts+24,A12
|| [ A0]   MV      .L1     A10,A4            ; |212| 

           LDDW    .D2T2   *B11,B19:B18      ; |130| 
||         MVKL    .S2     cycle_counts+24,B4
|| [ A0]   MVKL    .S1     0x40c38880,A5

           MVKH    .S2     cycle_counts+24,B4
|| [ A0]   MVKH    .S1     0x40c38880,A5

           LDDW    .D2T2   *B4,B17:B16       ; |130| 
||         MVKL    .S2     t_stop,B30

           MVKH    .S2     t_stop,B30
           STDW    .D2T2   B9:B8,*B30        ; |128| 
           ADDU    .L2     B18,B6,B5:B4      ; |130| 
           MV      .L2     B4,B6             ; |130| 

           ADD     .S2     B5,B19,B6         ; |130| 
||         SUBU    .L2     B8,B6,B5:B4       ; |130| 
|| [ A0]   B       .S1     $C$L11            ; |210| 

           ADD     .D2     B6,B7,B6          ; |130| 
|| [ A0]   CALL    .S1     gimme_random      ; |212| 
||         ADDU    .L2     B16,B4,B5:B4      ; |130| 
||         EXT     .S2     B5,24,24,B16      ; |130| 

           SUB     .L2     B9,B6,B7          ; |130| 
||         ADD     .S2     B5,B17,B5         ; |130| 
||         MV      .D2     B4,B6             ; |130| 

           ADD     .L2     B7,B16,B7         ; |130| 
|| [ A0]   MV      .S2     B12,B4            ; |212| 

           ADD     .L2     B5,B7,B7          ; |130| 
|| [ A0]   ZERO    .S2     B5

           STDW    .D1T2   B7:B6,*A12        ; |130| 
||         ADD     .L2     8,B10,B10         ; |210| 
||         SUB     .L1     A15,1,A15         ; |210| 
|| [ A0]   MVKH    .S2     0xbff00000,B5

           ; BRANCHCC OCCURS {$C$L11}        ; |210| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 6

           CALLP   .S2     __c6xabi_fltllif,B3
||         LDDW    .D1T1   *A12,A5:A4        ; |135| 

$C$RL27:   ; CALL OCCURS {__c6xabi_fltllif} {0}  ; |135| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 15
           ZERO    .L1     A15
           SET     .S1     A15,0x1a,0x1d,A15
           MPYSP   .M1     A15,A4,A3         ; |135| 
           NOP             3
           SPDP    .S1     A3,A5:A4          ; |135| 
           NOP             1
           ADDDP   .L1     A11:A10,A5:A4,A5:A4 ; |135| 
           CALLP   .S2     __c6xabi_fixdlli,B3
$C$RL28:   ; CALL OCCURS {__c6xabi_fixdlli} {0}  ; |135| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 18

           MVK     .S2     24,B10
||         MV      .L2X    A12,B4

           SUB     .L2X    A12,B10,B10
||         MV      .S2     B12,B5            ; |114| 
||         STDW    .D2T1   A5:A4,*B4         ; |135| 

           STDW    .D2T2   B13:B12,*B10      ; |114| 
||         MVC     .S2     B5,TSCL           ; |115| 

           MVC     .S2     TSCL,B8           ; |116| 
           MVC     .S2     TSCH,B4           ; |116| 
           MV      .L2     B4,B9             ; |116| 

           STDW    .D1T2   B9:B8,*A13        ; |116| 
||         MVC     .S2     TSCL,B4           ; |117| 

           MVC     .S2     TSCH,B6           ; |117| 
           SUBU    .L2     B4,B8,B5:B4       ; |117| 

           EXT     .S2     B5,24,24,B6       ; |117| 
||         SUB     .L2     B6,B9,B5          ; |117| 

           ADD     .L2     B5,B6,B5          ; |117| 
||         MVKL    .S1     input,A12

           STDW    .D2T2   B5:B4,*B11        ; |117| 
||         MVKH    .S1     input,A12

           LDW     .D1T1   *A12,A3           ; |224| 
           MVK     .S2     0x80,B31
           STW     .D2T2   B31,*+SP(12)      ; |117| 
           NOP             2

           CALL    .S1     log2              ; |224| 
||         ADD     .L1     A10,A3,A3         ; |224| 

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L12:    
;          EXCLUSIVE CPU CYCLES: 5
           LDDW    .D1T1   *A3,A5:A4         ; |224| 
           ADDKPC  .S2     $C$RL29,B3,3      ; |224| 
$C$RL29:   ; CALL OCCURS {log2} {0}          ; |224| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 19
           MVKL    .S2     output,B4
           MVKH    .S2     output,B4
           LDW     .D2T2   *B4,B4            ; |224| 
           NOP             4

           ADD     .L1X    A10,B4,A3         ; |224| 
||         LDW     .D2T2   *+SP(12),B4       ; |224| 

           ADD     .L1     8,A10,A10         ; |223| 
           STDW    .D1T1   A5:A4,*A3         ; |224| 
           NOP             2

           SUB     .L1X    B4,1,A0           ; |223| 
||         SUB     .L2     B4,1,B4           ; |223| 

   [ A0]   BNOP    .S1     $C$L12,4          ; |223| 
|| [ A0]   LDW     .D1T1   *A12,A3           ; |224| 
||         STW     .D2T2   B4,*+SP(12)       ; |224| 

   [ A0]   CALL    .S1     log2              ; |224| 
||         ADD     .L1     A10,A3,A3         ; |224| 

           ; BRANCHCC OCCURS {$C$L12}        ; |223| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 20
           MVC     .S2     TSCL,B6           ; |128| 
           MVC     .S2     TSCH,B7           ; |128| 

           MV      .L1     A13,A3            ; |128| 
||         MV      .L2     B11,B4            ; |128| 

           LDDW    .D1T1   *A3,A5:A4         ; |130| 
||         LDDW    .D2T2   *B4,B5:B4         ; |130| 

           MVKL    .S2     t_stop,B30
           MVKH    .S2     t_stop,B30
           NOP             2
           ADDU    .L1X    B4,A4,A7:A6       ; |130| 

           ADD     .L1X    A7,B5,A4          ; |130| 
||         LDDW    .D2T2   *B10,B5:B4        ; |130| 

           ADD     .L1     A4,A5,A3          ; |130| 
           SUBU    .L2X    B6,A6,B9:B8       ; |130| 
           EXT     .S2     B9,24,24,B16      ; |130| 
           SUB     .L2X    B7,A3,B31         ; |130| 

           ADDU    .L2     B4,B8,B9:B8       ; |130| 
||         CALL    .S1     __c6xabi_fltllif  ; |130| 

           ADD     .L2     B9,B5,B5          ; |130| 

           MV      .L1X    B8,A4             ; |130| 
||         ADD     .L2     B31,B16,B8        ; |130| 

           ADD     .L2     B5,B8,B4          ; |130| 
           STDW    .D2T2   B7:B6,*B30        ; |128| 

           MV      .L1X    B4,A5             ; |130| 
||         ADDKPC  .S2     $C$RL30,B3,0      ; |130| 

$C$RL30:   ; CALL OCCURS {__c6xabi_fltllif} {0}  ; |130| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 13
           MPYSP   .M1     A15,A4,A3         ; |130| 
           MV      .L1X    B13,A10           ; |130| 
           NOP             2
           SPDP    .S1     A3,A5:A4          ; |130| 
           NOP             1
           ADDDP   .L1     A11:A10,A5:A4,A5:A4 ; |130| 
           CALLP   .S2     __c6xabi_fixdlli,B3
$C$RL31:   ; CALL OCCURS {__c6xabi_fixdlli} {0}  ; |130| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 17

           MV      .L2     B12,B4            ; |114| 
||         STDW    .D2T2   B13:B12,*+B10(8)  ; |114| 

           STDW    .D2T1   A5:A4,*B10        ; |130| 
||         MVC     .S2     B4,TSCL           ; |115| 

           MVC     .S2     TSCL,B6           ; |116| 
           MVC     .S2     TSCH,B4           ; |116| 
           MV      .L2     B4,B7             ; |116| 

           STDW    .D1T2   B7:B6,*A13        ; |116| 
||         MVC     .S2     TSCL,B4           ; |117| 

           MVC     .S2     TSCH,B8           ; |117| 

           SUBU    .L2     B4,B6,B5:B4       ; |117| 
||         MVKL    .S2     t_offset,B31

           EXT     .S2     B5,24,24,B7       ; |117| 
||         SUB     .L2     B8,B7,B5          ; |117| 

           ADD     .L2     B5,B7,B7          ; |117| 
||         MV      .D2     B4,B6             ; |117| 
||         MVKH    .S2     t_offset,B31

           STDW    .D2T2   B7:B6,*B31        ; |117| 
           LDW     .D1T1   *A12,A3           ; |232| 
           MVK     .S2     0x80,B30
           LDW     .D2T2   *+SP(20),B11      ; |117| 
           STW     .D2T2   B30,*+SP(12)      ; |117| 
           NOP             1

           CALL    .S1     log2dp            ; |232| 
||         ADD     .L1     A10,A3,A3         ; |232| 

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L13:    
;          EXCLUSIVE CPU CYCLES: 5
           LDDW    .D1T1   *A3,A5:A4         ; |232| 
           ADDKPC  .S2     $C$RL32,B3,3      ; |232| 
$C$RL32:   ; CALL OCCURS {log2dp} {0}        ; |232| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 17
           LDW     .D2T2   *B11,B4           ; |232| 
           NOP             4

           ADD     .L1X    A10,B4,A3         ; |232| 
||         LDW     .D2T2   *+SP(12),B4       ; |232| 

           ADD     .L1     8,A10,A10         ; |231| 
           STDW    .D1T1   A5:A4,*A3         ; |232| 
           NOP             2

           SUB     .L1X    B4,1,A0           ; |231| 
||         SUB     .L2     B4,1,B4           ; |231| 

   [ A0]   BNOP    .S1     $C$L13,4          ; |231| 
|| [ A0]   LDW     .D1T1   *A12,A3           ; |232| 
||         STW     .D2T2   B4,*+SP(12)       ; |232| 

   [ A0]   CALL    .S1     log2dp            ; |232| 
||         ADD     .L1     A10,A3,A3         ; |232| 

           ; BRANCHCC OCCURS {$C$L13}        ; |231| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 19
           MVC     .S2     TSCL,B6           ; |128| 
           MVC     .S2     TSCH,B5           ; |128| 

           MVKL    .S2     t_offset,B4
||         LDDW    .D1T1   *A13,A7:A6        ; |130| 

           MVKH    .S2     t_offset,B4
           LDDW    .D2T2   *B4,B9:B8         ; |130| 
           MV      .L2     B5,B7             ; |128| 
           LDDW    .D2T2   *+B10(8),B5:B4    ; |130| 
           MVKL    .S2     t_stop,B31
           MVKH    .S2     t_stop,B31
           ADDU    .L1X    B8,A6,A5:A4       ; |130| 
           STDW    .D2T2   B7:B6,*B31        ; |128| 

           ADD     .L1X    A5,B9,A4          ; |130| 
||         SUBU    .L2X    B6,A4,B9:B8       ; |130| 

           ADD     .L1     A4,A7,A3          ; |130| 
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
;          EXCLUSIVE CPU CYCLES: 13
           MPYSP   .M1     A15,A4,A3         ; |130| 
           MV      .L1X    B13,A10           ; |130| 
           NOP             2
           SPDP    .S1     A3,A5:A4          ; |130| 
           NOP             1
           ADDDP   .L1     A11:A10,A5:A4,A5:A4 ; |130| 
           CALLP   .S2     __c6xabi_fixdlli,B3
$C$RL34:   ; CALL OCCURS {__c6xabi_fixdlli} {0}  ; |130| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 21
           STDW    .D2T2   B13:B12,*+B10(16) ; |114| 

           ADDAD   .D2     B10,1,B11
||         MV      .L2     B12,B4            ; |114| 

           STDW    .D2T1   A5:A4,*B11        ; |130| 
||         MVC     .S2     B4,TSCL           ; |115| 

           MVC     .S2     TSCL,B6           ; |116| 
           MVC     .S2     TSCH,B4           ; |116| 
           MV      .L2     B4,B7             ; |116| 

           STDW    .D1T2   B7:B6,*A13        ; |116| 
||         MVC     .S2     TSCL,B4           ; |117| 

           MVC     .S2     TSCH,B5           ; |117| 
           LDW     .D2T1   *+SP(24),A3       ; |117| 
           MVKL    .S2     t_offset,B31
           SUBU    .L2     B4,B6,B9:B8       ; |117| 
           MVKH    .S2     t_offset,B31

           SUB     .L2     B5,B7,B4          ; |117| 
||         EXT     .S2     B9,24,24,B5       ; |117| 

           ADD     .L2     B4,B5,B7          ; |117| 
||         MV      .S2     B8,B6             ; |117| 
||         STW     .D2T1   A3,*+SP(20)

           STDW    .D2T2   B7:B6,*B31        ; |117| 
           LDW     .D1T1   *A12,A3           ; |240| 
           MVK     .S2     0x80,B30
           STW     .D2T2   B30,*+SP(12)      ; |117| 
           NOP             2

           CALL    .S1     log2dp_c          ; |240| 
||         ADD     .L1     A10,A3,A3         ; |240| 

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L14:    
;          EXCLUSIVE CPU CYCLES: 5
           LDDW    .D1T1   *A3,A5:A4         ; |240| 
           ADDKPC  .S2     $C$RL35,B3,3      ; |240| 
$C$RL35:   ; CALL OCCURS {log2dp_c} {0}      ; |240| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 22
           LDW     .D2T2   *+SP(20),B4       ; |240| 
           NOP             4
           LDW     .D2T2   *B4,B4            ; |240| 
           NOP             4

           ADD     .L1X    A10,B4,A3         ; |240| 
||         LDW     .D2T2   *+SP(12),B4       ; |240| 

           ADD     .L1     8,A10,A10         ; |239| 
           STDW    .D1T1   A5:A4,*A3         ; |240| 
           NOP             2

           SUB     .L1X    B4,1,A0           ; |239| 
||         SUB     .L2     B4,1,B4           ; |239| 

   [ A0]   BNOP    .S1     $C$L14,4          ; |239| 
|| [ A0]   LDW     .D1T1   *A12,A3           ; |240| 
||         STW     .D2T2   B4,*+SP(12)       ; |240| 

   [ A0]   CALL    .S1     log2dp_c          ; |240| 
||         ADD     .L1     A10,A3,A3         ; |240| 

           ; BRANCHCC OCCURS {$C$L14}        ; |239| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 17
           MVC     .S2     TSCL,B6           ; |128| 
           MVC     .S2     TSCH,B4           ; |128| 

           MVKL    .S2     t_offset,B5
||         LDDW    .D1T1   *A13,A5:A4        ; |130| 
||         MV      .L2     B4,B7             ; |128| 

           MVKH    .S2     t_offset,B5
           LDDW    .D2T2   *B5,B9:B8         ; |130| 
           MV      .L2     B10,B4            ; |128| 
           LDDW    .D2T2   *+B4(16),B17:B16  ; |130| 
           MVKL    .S2     t_stop,B31
           MVKH    .S2     t_stop,B31
           ADDU    .L2X    B8,A4,B5:B4       ; |130| 

           ADD     .S2     B5,B9,B8          ; |130| 
||         SUBU    .L2     B6,B4,B5:B4       ; |130| 

           ADD     .D2X    B8,A5,B8          ; |130| 
||         CALL    .S1     __c6xabi_fltllif  ; |130| 
||         EXT     .S2     B5,24,24,B9       ; |130| 
||         ADDU    .L2     B16,B4,B5:B4      ; |130| 

           SUB     .L2     B7,B8,B8          ; |130| 
||         ADD     .S2     B5,B17,B5         ; |130| 

           ADD     .L2     B8,B9,B8          ; |130| 
||         MV      .L1X    B4,A4             ; |130| 

           ADD     .L2     B5,B8,B4          ; |130| 
           STDW    .D2T2   B7:B6,*B31        ; |128| 

           MV      .L1X    B4,A5             ; |130| 
||         STW     .D2T2   B10,*+SP(12)      ; |130| 
||         ADDKPC  .S2     $C$RL36,B3,0      ; |130| 

$C$RL36:   ; CALL OCCURS {__c6xabi_fltllif} {0}  ; |130| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 109
           MPYSP   .M1     A15,A4,A3         ; |130| 
           MV      .L1X    B13,A10           ; |130| 
           NOP             3
           SPDP    .S2X    A3,B5:B4          ; |130| 
           NOP             2
           ADDDP   .L1X    A11:A10,B5:B4,A5:A4 ; |130| 
           CALLP   .S2     __c6xabi_fixdlli,B3
$C$RL37:   ; CALL OCCURS {__c6xabi_fixdlli} {0}  ; |130| 
           LDW     .D2T2   *+SP(12),B4
           ADDAD   .D2     B11,1,B10
           MV      .L2     B12,B31           ; |114| 
           STDW    .D2T1   A5:A4,*B10        ; |130| 
           NOP             1

           STDW    .D2T2   B13:B12,*+B4(32)  ; |114| 
||         MVC     .S2     B31,TSCL          ; |115| 

           MVC     .S2     TSCL,B4           ; |116| 
           MVC     .S2     TSCH,B5           ; |116| 

           STDW    .D1T2   B5:B4,*A13        ; |116| 
||         MVC     .S2     TSCL,B6           ; |117| 

           MVC     .S2     TSCH,B8           ; |117| 
           MVKL    .S1     t_offset,A3
           MVKL    .S1     output,A10

           SUBU    .L2     B6,B4,B7:B6       ; |117| 
||         MVKH    .S1     t_offset,A3

           MVKH    .S1     output,A10
||         MV      .L2X    A12,B9            ; |247| 
||         SUB     .D2     B8,B5,B4          ; |117| 
||         EXT     .S2     B7,24,24,B5       ; |117| 

           ADD     .L2     B4,B5,B7          ; |117| 
||         LDW     .D1T2   *+A10(16),B4      ; |247| 
||         LDW     .D2T1   *B9,A4            ; |247| 
||         MV      .S2X    A3,B11            ; |117| 

           CALLP   .S2     log2dp_v,B3
||         STDW    .D2T2   B7:B6,*B11        ; |117| 
||         MVK     .S1     0x80,A6           ; |247| 

$C$RL38:   ; CALL OCCURS {log2dp_v} {0}      ; |247| 
           MVC     .S2     TSCL,B6           ; |128| 
           MVC     .S2     TSCH,B4           ; |128| 

           LDDW    .D1T1   *A13,A17:A16      ; |130| 
||         LDDW    .D2T2   *B11,B9:B8        ; |130| 

           MVK     .S1     16,A12
           ADD     .L1X    B10,A12,A12
           MVKL    .S1     t_stop,A3

           LDDW    .D1T1   *A12,A9:A8        ; |130| 
||         MVKH    .S1     t_stop,A3

           ADDU    .L1X    B8,A16,A7:A6      ; |130| 

           MV      .L2     B4,B7             ; |128| 
||         MV      .S2X    A3,B4             ; |128| 
||         ADD     .L1X    A7,B9,A3          ; |130| 

           SUBU    .L1X    B6,A6,A5:A4       ; |130| 

           ADD     .L1     A3,A17,A5         ; |130| 
||         EXT     .S1     A5,24,24,A3       ; |130| 

           SUB     .S1X    B7,A5,A6          ; |130| 
||         ADDU    .L1     A8,A4,A5:A4       ; |130| 

           ADD     .L1     A5,A9,A3          ; |130| 
||         ADD     .S1     A6,A3,A5          ; |130| 

           CALLP   .S2     __c6xabi_fltllif,B3
||         ADD     .L1     A3,A5,A5          ; |130| 
||         STDW    .D2T2   B7:B6,*B4         ; |128| 

$C$RL39:   ; CALL OCCURS {__c6xabi_fltllif} {0}  ; |130| 
           MPYSP   .M1     A15,A4,A3         ; |130| 
           MV      .L1     A11,A5            ; |130| 
           MV      .L1X    B13,A4            ; |130| 
           NOP             2
           SPDP    .S1     A3,A7:A6          ; |130| 
           NOP             1
           ADDDP   .L1     A5:A4,A7:A6,A5:A4 ; |130| 
           CALLP   .S2     __c6xabi_fixdlli,B3
$C$RL40:   ; CALL OCCURS {__c6xabi_fixdlli} {0}  ; |130| 
           MVKL    .S2     0x3e45798e,B7
           MVKL    .S2     0xe2308c3a,B6

           STDW    .D1T1   A5:A4,*A12        ; |130| 
||         MVKH    .S2     0x3e45798e,B7

           LDW     .D1T2   *+A10(4),B4       ; |66| 
||         MVKH    .S2     0xe2308c3a,B6

           CALLP   .S2     isequal,B3
||         LDW     .D1T1   *A10,A4           ; |66| 
||         MVK     .S1     0x80,A6           ; |66| 
||         MVK     .L1     0x9,A8            ; |66| 

$C$RL41:   ; CALL OCCURS {isequal} {0}       ; |66| 

           MVKL    .S1     fcn_pass,A3
||         MVKL    .S2     0xe2308c3a,B6

           MVKH    .S1     fcn_pass,A3
||         MVKL    .S2     0x3e45798e,B7

           MVKH    .S2     0xe2308c3a,B6

           MV      .L1     A4,A5             ; |66| 
||         LDW     .D1T1   *A10,A4           ; |67| 
||         MV      .L2X    A3,B10            ; |66| 
||         MVKH    .S2     0x3e45798e,B7

           CALLP   .S2     isequal,B3
||         LDW     .D1T2   *+A10(8),B4       ; |67| 
||         STW     .D2T1   A5,*+B10(4)       ; |66| 
||         MVK     .S1     0x80,A6           ; |67| 
||         MVK     .L1     0x9,A8            ; |67| 

$C$RL42:   ; CALL OCCURS {isequal} {0}       ; |67| 
           MVKL    .S2     0x3e45798e,B7
           MVKL    .S2     0xe2308c3a,B6
           MVKH    .S2     0x3e45798e,B7

           STW     .D2T1   A4,*+B10(8)       ; |67| 
||         LDW     .D1T2   *+A10(12),B4      ; |68| 
||         MVKH    .S2     0xe2308c3a,B6

           CALLP   .S2     isequal,B3
||         LDW     .D1T1   *A10,A4           ; |68| 
||         MVK     .S1     0x80,A6           ; |68| 
||         MVK     .L1     0x9,A8            ; |68| 

$C$RL43:   ; CALL OCCURS {isequal} {0}       ; |68| 
           MVKL    .S2     0x3e45798e,B7
           MVKL    .S2     0xe2308c3a,B6
           MVKH    .S2     0x3e45798e,B7

           STW     .D2T1   A4,*+B10(12)      ; |68| 
||         LDW     .D1T2   *A14,B4           ; |69| 
||         MVKH    .S2     0xe2308c3a,B6

           CALLP   .S2     isequal,B3
||         LDW     .D1T1   *A10,A4           ; |69| 
||         MVK     .S1     0x80,A6           ; |69| 
||         MVK     .L1     0x9,A8            ; |69| 

$C$RL44:   ; CALL OCCURS {isequal} {0}       ; |69| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 16
           LDW     .D2T2   *+SP(16),B5       ; |69| 
           MV      .L2X    A4,B4             ; |69| 
           STW     .D2T2   B4,*+B10(16)      ; |69| 
           NOP             2
           LDW     .D2T2   *B5,B0            ; |72| 
           LDW     .D2T2   *+SP(28),B5
           NOP             3

   [!B0]   B       .S1     $C$L15            ; |72| 
||         MV      .L2     B0,B1             ; guard predicate rewrite

   [ B0]   LDW     .D2T2   *B5,B0            ; |72| 
   [ B1]   ADD     .L2     4,B5,B5
           NOP             3
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
           MV      .L1X    B12,A4
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
           ADDK    .S2     192,SP            ; |265| 
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
$C$SL1:	.string	"log2DP",0
$C$SL2:	.string	"----------------------------------------",0
$C$SL3:	.string	"----------------------------------------",10,0
;*****************************************************************************
;* UNDEFINED EXTERNAL REFERENCES                                             *
;*****************************************************************************
	.global	printf
	.global	log2
	.global	driver_init
	.global	print_profile_results
	.global	print_memory_results
	.global	print_test_results
	.global	gimme_random
	.global	isequal
	.global	log2dp
	.global	log2dp_c
	.global	log2dp_v
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
