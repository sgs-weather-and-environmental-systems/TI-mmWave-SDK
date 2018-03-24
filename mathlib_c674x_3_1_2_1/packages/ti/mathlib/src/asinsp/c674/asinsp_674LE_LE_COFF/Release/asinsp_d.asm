;******************************************************************************
;* TMS320C6x C/C++ Codegen                                          PC v7.4.2 *
;* Date/Time created: Mon May 16 23:35:18 2016                                *
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
	.word	03b55a20dh		; _a[0] @ 0
	.word	03ba3065dh		; _a[1] @ 32
	.word	0bc23065fh		; _a[2] @ 64
	.word	03c74898ah		; _a[3] @ 96
	.word	0bca30660h		; _a[4] @ 128
	.word	03ccbc7f5h		; _a[5] @ 160
	.word	0bcf4898fh		; _a[6] @ 192
	.word	03d0ea592h		; _a[7] @ 224
	.word	0bd23065dh		; _a[8] @ 256
	.word	03d37672ah		; _a[9] @ 288
	.word	0bd4bc7f5h		; _a[10] @ 320
	.word	03d6028c2h		; _a[11] @ 352
	.word	0bd74898dh		; _a[12] @ 384
	.word	03d84752dh		; _a[13] @ 416
	.word	0bd8ea592h		; _a[14] @ 448
	.word	03d98d5f8h		; _a[15] @ 480
	.word	0bda3065eh		; _a[16] @ 512
	.word	03dad36c4h		; _a[17] @ 544
	.word	0bdb7672ah		; _a[18] @ 576
	.word	03dc1978fh		; _a[19] @ 608
	.word	0bdcbc7f6h		; _a[20] @ 640
	.word	03dd5f85ah		; _a[21] @ 672
	.word	0bde028bdh		; _a[22] @ 704
	.word	03dea592dh		; _a[23] @ 736
	.word	0bdf4898fh		; _a[24] @ 768
	.word	03dfeb9f2h		; _a[25] @ 800
	.word	0be04752ah		; _a[26] @ 832
	.word	03e098d62h		; _a[27] @ 864
	.word	0be0ea594h		; _a[28] @ 896
	.word	03e13bdc5h		; _a[29] @ 928
	.word	0be18d5f6h		; _a[30] @ 960
	.word	03e1dee2eh		; _a[31] @ 992
	.word	0be230660h		; _a[32] @ 1024
	.word	03e281e91h		; _a[33] @ 1056
	.word	0be2d36c2h		; _a[34] @ 1088
	.word	03e324efah		; _a[35] @ 1120
	.word	0be37672ch		; _a[36] @ 1152
	.word	03e3c7f5dh		; _a[37] @ 1184
	.word	0be41978eh		; _a[38] @ 1216
	.word	03e46afc6h		; _a[39] @ 1248
	.word	0be4bc7f7h		; _a[40] @ 1280
	.word	03e50e029h		; _a[41] @ 1312
	.word	0be55f85ah		; _a[42] @ 1344
	.word	03e5b1092h		; _a[43] @ 1376
	.word	0be6028c3h		; _a[44] @ 1408
	.word	03e6540f5h		; _a[45] @ 1440
	.word	0be6a5926h		; _a[46] @ 1472
	.word	03e6f7157h		; _a[47] @ 1504
	.word	0be74898fh		; _a[48] @ 1536
	.word	03e79a1c1h		; _a[49] @ 1568
	.word	0be7eb9f2h		; _a[50] @ 1600
	.word	03e81e912h		; _a[51] @ 1632
	.word	0be84752eh		; _a[52] @ 1664
	.word	03e870146h		; _a[53] @ 1696
	.word	0be898d5fh		; _a[54] @ 1728
	.word	03e8c1978h		; _a[55] @ 1760
	.word	0be8ea594h		; _a[56] @ 1792
	.word	03e9131ach		; _a[57] @ 1824
	.word	0be93bdc5h		; _a[58] @ 1856
	.word	03e9649deh		; _a[59] @ 1888
	.word	0be98d5fah		; _a[60] @ 1920
	.word	03e9b6212h		; _a[61] @ 1952
	.word	0be9dee2bh		; _a[62] @ 1984
	.word	03ea07a44h		; _a[63] @ 2016
	.word	0bea30660h		; _a[64] @ 2048
	.word	03ea59278h		; _a[65] @ 2080
	.word	0bea81e91h		; _a[66] @ 2112
	.word	03eaaaaaah		; _a[67] @ 2144
	.word	0bead36c6h		; _a[68] @ 2176
	.word	03eafc2deh		; _a[69] @ 2208
	.word	0beb24ef7h		; _a[70] @ 2240
	.word	03eb4db10h		; _a[71] @ 2272
	.word	0beb7672ch		; _a[72] @ 2304
	.word	03eb9f344h		; _a[73] @ 2336
	.word	0bebc7f5dh		; _a[74] @ 2368
	.word	03ebf0b75h		; _a[75] @ 2400
	.word	0bec19792h		; _a[76] @ 2432
	.word	03ec423aah		; _a[77] @ 2464
	.word	0bec6afc3h		; _a[78] @ 2496
	.word	03ec93bdbh		; _a[79] @ 2528
	.word	0becbc7f7h		; _a[80] @ 2560
	.word	03ece5410h		; _a[81] @ 2592
	.word	0bed0e029h		; _a[82] @ 2624
	.word	03ed36c41h		; _a[83] @ 2656
	.word	0bed5f85dh		; _a[84] @ 2688
	.word	03ed88476h		; _a[85] @ 2720
	.word	0bedb108fh		; _a[86] @ 2752
	.word	03edd9ca7h		; _a[87] @ 2784
	.word	0bee028c3h		; _a[88] @ 2816
	.word	03ee2b4dch		; _a[89] @ 2848
	.word	0bee540f5h		; _a[90] @ 2880
	.word	03ee7cd0dh		; _a[91] @ 2912
	.word	0beea5926h		; _a[92] @ 2944
	.word	03eece542h		; _a[93] @ 2976
	.word	0beef715bh		; _a[94] @ 3008
	.word	03ef1fd73h		; _a[95] @ 3040
	.word	0bef4898ch		; _a[96] @ 3072
	.word	03ef715a8h		; _a[97] @ 3104
	.word	0bef9a1c1h		; _a[98] @ 3136
	.word	03efc2dd9h		; _a[99] @ 3168
	.word	0befeb9f2h		; _a[100] @ 3200
	.word	03f00a305h		; _a[101] @ 3232
	.word	0bf01e913h		; _a[102] @ 3264
	.word	03f032f20h		; _a[103] @ 3296
	.word	0bf04752eh		; _a[104] @ 3328
	.word	03f05bb38h		; _a[105] @ 3360
	.word	0bf070146h		; _a[106] @ 3392
	.word	03f084753h		; _a[107] @ 3424
	.word	0bf098d61h		; _a[108] @ 3456
	.word	03f0ad36bh		; _a[109] @ 3488
	.word	0bf0c1979h		; _a[110] @ 3520
	.word	03f0d5f86h		; _a[111] @ 3552
	.word	0bf0ea592h		; _a[112] @ 3584
	.word	03f0feb9eh		; _a[113] @ 3616
	.word	0bf1131ach		; _a[114] @ 3648
	.word	03f1277b9h		; _a[115] @ 3680
	.word	0bf13bdc5h		; _a[116] @ 3712
	.word	03f1503d1h		; _a[117] @ 3744
	.word	0bf1649dfh		; _a[118] @ 3776
	.word	03f178fech		; _a[119] @ 3808
	.word	0bf18d5f8h		; _a[120] @ 3840
	.word	03f1a1c04h		; _a[121] @ 3872
	.word	0bf1b6212h		; _a[122] @ 3904
	.word	03f1ca81fh		; _a[123] @ 3936
	.word	0bf1dee2bh		; _a[124] @ 3968
	.word	03f1f3437h		; _a[125] @ 4000
	.word	0bf207a45h		; _a[126] @ 4032
	.word	03f21c052h		; _a[127] @ 4064
	.word	0bf23065eh		; _a[128] @ 4096
	.word	03f244c6ah		; _a[129] @ 4128
	.word	0bf259278h		; _a[130] @ 4160
	.word	03f26d885h		; _a[131] @ 4192
	.word	0bf281e91h		; _a[132] @ 4224
	.word	03f29649dh		; _a[133] @ 4256
	.word	0bf2aaaabh		; _a[134] @ 4288
	.word	03f2bf0b8h		; _a[135] @ 4320
	.word	0bf2d36c4h		; _a[136] @ 4352
	.word	03f2e7cd0h		; _a[137] @ 4384
	.word	0bf2fc2deh		; _a[138] @ 4416
	.word	03f3108ebh		; _a[139] @ 4448
	.word	0bf324ef7h		; _a[140] @ 4480
	.word	03f339503h		; _a[141] @ 4512
	.word	0bf34db11h		; _a[142] @ 4544
	.word	03f36211eh		; _a[143] @ 4576
	.word	0bf37672ah		; _a[144] @ 4608
	.word	03f38ad36h		; _a[145] @ 4640
	.word	0bf39f344h		; _a[146] @ 4672
	.word	03f3b3951h		; _a[147] @ 4704
	.word	0bf3c7f5dh		; _a[148] @ 4736
	.word	03f3dc569h		; _a[149] @ 4768
	.word	0bf3f0b75h		; _a[150] @ 4800
	.word	03f405184h		; _a[151] @ 4832
	.word	0bf419790h		; _a[152] @ 4864
	.word	03f42dd9eh		; _a[153] @ 4896
	.word	0bf4423a8h		; _a[154] @ 4928
	.word	03f4569b6h		; _a[155] @ 4960
	.word	0bf46afc3h		; _a[156] @ 4992
	.word	03f47f5d1h		; _a[157] @ 5024
	.word	0bf493bdbh		; _a[158] @ 5056
	.word	03f4a81e9h		; _a[159] @ 5088
	.word	0bf4bc7f6h		; _a[160] @ 5120
	.word	03f4d0e04h		; _a[161] @ 5152
	.word	0bf4e540eh		; _a[162] @ 5184
	.word	03f4f9a1ch		; _a[163] @ 5216
	.word	0bf50e029h		; _a[164] @ 5248
	.word	03f522635h		; _a[165] @ 5280
	.word	0bf536c41h		; _a[166] @ 5312
	.word	03f54b24fh		; _a[167] @ 5344
	.word	0bf55f85ch		; _a[168] @ 5376
	.word	03f573e68h		; _a[169] @ 5408
	.word	0bf588474h		; _a[170] @ 5440
	.word	03f59ca82h		; _a[171] @ 5472
	.word	0bf5b108fh		; _a[172] @ 5504
	.word	03f5c569bh		; _a[173] @ 5536
	.word	0bf5d9ca7h		; _a[174] @ 5568
	.word	03f5ee2b5h		; _a[175] @ 5600
	.word	0bf6028c2h		; _a[176] @ 5632
	.word	03f616eceh		; _a[177] @ 5664
	.word	0bf62b4dah		; _a[178] @ 5696
	.word	03f63fae8h		; _a[179] @ 5728
	.word	0bf6540f5h		; _a[180] @ 5760
	.word	03f668701h		; _a[181] @ 5792
	.word	0bf67cd0dh		; _a[182] @ 5824
	.word	03f69131bh		; _a[183] @ 5856
	.word	0bf6a5928h		; _a[184] @ 5888
	.word	03f6b9f34h		; _a[185] @ 5920
	.word	0bf6ce540h		; _a[186] @ 5952
	.word	03f6e2b4eh		; _a[187] @ 5984
	.word	0bf6f715bh		; _a[188] @ 6016
	.word	03f70b767h		; _a[189] @ 6048
	.word	0bf71fd73h		; _a[190] @ 6080
	.word	03f734381h		; _a[191] @ 6112
	.word	0bf74898eh		; _a[192] @ 6144
	.word	03f75cf9ah		; _a[193] @ 6176
	.word	0bf7715a6h		; _a[194] @ 6208
	.word	03f785bb4h		; _a[195] @ 6240
	.word	0bf79a1c1h		; _a[196] @ 6272
	.word	03f7ae7cdh		; _a[197] @ 6304
	.word	0bf7c2dd9h		; _a[198] @ 6336
	.word	03f7d73e7h		; _a[199] @ 6368
	.word	0bf7eb9f4h		; _a[200] @ 6400
$C$IR_1:	.set	804

	.global	_a
_a:	.usect	".far",804,8
;	C:\MATHLIB_Tools\CCSV5_5_0\ccsv5\tools\compiler\c6000_7.4.2\bin\opt6x.exe C:\\Users\\gtbldadm\\AppData\\Local\\Temp\\012446 C:\\Users\\gtbldadm\\AppData\\Local\\Temp\\012448 
;**	Parameter deleted: req_flags == 1;
;**	Parameter deleted: tol == 1e-06;
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
_allequal:
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 10

           STW     .D2T1   A11,*SP--(8)      ; |63| 
||         MVKL    .S2     0xa0b5ed8d,B6

           STDW    .D2T1   A13:A12,*SP--     ; |63| 
||         MVKL    .S1     _output,A11
||         MVKL    .S2     0x3eb0c6f7,B7

           STW     .D2T1   A10,*SP--(8)      ; |63| 
||         MVKH    .S1     _output,A11
||         MVKH    .S2     0xa0b5ed8d,B6

           LDW     .D1T2   *+A11(4),B4       ; |66| 
||         MV      .L1     A4,A6             ; |63| 
||         MVKH    .S2     0x3eb0c6f7,B7
||         MVK     .S1     0x1,A8            ; |66| 

           MV      .L1X    B3,A13            ; |63| 
||         CALLP   .S2     _isequal,B3
||         MV      .S1     A4,A10            ; |63| 
||         LDW     .D1T1   *A11,A4           ; |66| 

$C$RL0:    ; CALL OCCURS {_isequal} {0}      ; |66| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 30
           MVKL    .S2     0x3eb0c6f7,B7
           MVKL    .S2     0xa0b5ed8d,B6

           LDW     .D1T2   *+A11(8),B4       ; |67| 
||         MVKL    .S1     _fcn_pass,A12
||         MVKH    .S2     0x3eb0c6f7,B7

           MV      .L1     A4,A3             ; |66| 
||         LDW     .D1T1   *A11,A4           ; |67| 
||         MVKH    .S1     _fcn_pass,A12
||         MVKH    .S2     0xa0b5ed8d,B6

           CALLP   .S2     _isequal,B3
||         STW     .D1T1   A3,*+A12(4)       ; |66| 
||         MV      .L1     A10,A6            ; |67| 
||         MVK     .S1     0x1,A8            ; |67| 

$C$RL1:    ; CALL OCCURS {_isequal} {0}      ; |67| 
           MVKL    .S2     0xa0b5ed8d,B6
           MVKL    .S2     0x3eb0c6f7,B7

           LDW     .D1T2   *+A11(12),B4      ; |68| 
||         MVKH    .S2     0xa0b5ed8d,B6

           MV      .L1     A4,A3             ; |67| 
||         LDW     .D1T1   *A11,A4           ; |68| 
||         MVKH    .S2     0x3eb0c6f7,B7

           CALLP   .S2     _isequal,B3
||         STW     .D1T1   A3,*+A12(8)       ; |67| 
||         MV      .L1     A10,A6            ; |68| 
||         MVK     .S1     0x1,A8            ; |68| 

$C$RL2:    ; CALL OCCURS {_isequal} {0}      ; |68| 
           MVKL    .S2     0x3eb0c6f7,B7
           MVKL    .S2     0xa0b5ed8d,B6

           STW     .D1T1   A4,*+A12(12)      ; |68| 
||         MVKH    .S2     0x3eb0c6f7,B7

           MV      .L1     A11,A3            ; |66| 
||         LDW     .D1T2   *+A11(16),B4      ; |69| 
||         MVKH    .S2     0xa0b5ed8d,B6

           CALLP   .S2     _isequal,B3
||         LDW     .D1T1   *A3,A4            ; |69| 
||         MV      .L1     A10,A6            ; |69| 
||         MVK     .S1     0x1,A8            ; |69| 

$C$RL3:    ; CALL OCCURS {_isequal} {0}      ; |69| 
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
||         MVKL    .S1     _all_pass,A3

   [ A0]   B       .S2     $C$L2             ; |72| 
||         MVKH    .S1     _all_pass,A3
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
           MVKL    .S1     _all_pass,A3

           MVKH    .S1     _all_pass,A3
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
;*   Local Frame Size  : 8 Args + 4 Auto + 56 Save = 68 byte                  *
;******************************************************************************
_main:
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 12
           STW     .D2T1   A11,*SP--(8)      ; |123| 
           STW     .D2T1   A10,*SP--(8)      ; |123| 
           STDW    .D2T2   B13:B12,*SP--     ; |123| 
           STDW    .D2T2   B11:B10,*SP--     ; |123| 
           STDW    .D2T1   A15:A14,*SP--     ; |123| 

           STDW    .D2T1   A13:A12,*SP--     ; |123| 
||         MVKL    .S1     $C$SL1+0,A4

           STW     .D2T2   B3,*SP--(24)      ; |123| 
||         CALLP   .S2     _driver_init,B3
||         MVKH    .S1     $C$SL1+0,A4

$C$RL4:    ; CALL OCCURS {_driver_init} {0}  ; |132| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 3

           MVK     .S2     0xc9,B4
||         MVKL    .S1     _a,A11

           MVKH    .S1     _a,A11
||         MVKL    .S2     _output,B11

           CALL    .S1     _asinf            ; |141| 
||         MV      .L1     A11,A12
||         MV      .D1X    B4,A10
||         MVKH    .S2     _output,B11
||         ZERO    .L2     B10

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L3:    
;          EXCLUSIVE CPU CYCLES: 5
           LDW     .D1T1   *A12++,A4         ; |141| 
           ADDKPC  .S2     $C$RL5,B3,3       ; |141| 
$C$RL5:    ; CALL OCCURS {_asinf} {0}        ; |141| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 7

           LDW     .D2T2   *B11,B4           ; |141| 
||         SUB     .L1     A10,1,A0          ; |140| 
||         SUB     .S1     A10,1,A10         ; |140| 

   [ A0]   BNOP    .S1     $C$L3,3           ; |140| 

           ADD     .L2     B10,B4,B4         ; |141| 
||         ADD     .S2     4,B10,B10         ; |140| 

   [ A0]   CALL    .S1     _asinf            ; |141| 
||         STW     .D2T1   A4,*B4            ; |141| 
|| [!A0]   MVK     .S2     0xc9,B4

           ; BRANCHCC OCCURS {$C$L3}         ; |140| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 2

           ZERO    .L2     B10
||         MV      .L1     A11,A12
||         ADD     .S2     4,B11,B11

           MV      .L1X    B4,A10
||         CALL    .S1     _asinsp           ; |144| 

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L4:    
;          EXCLUSIVE CPU CYCLES: 5
           LDW     .D1T1   *A12++,A4         ; |144| 
           ADDKPC  .S2     $C$RL6,B3,3       ; |144| 
$C$RL6:    ; CALL OCCURS {_asinsp} {0}       ; |144| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 7

           LDW     .D2T2   *B11,B4           ; |144| 
||         SUB     .L1     A10,1,A0          ; |143| 
||         SUB     .S1     A10,1,A10         ; |143| 

   [ A0]   BNOP    .S1     $C$L4,3           ; |143| 

           ADD     .L2     B10,B4,B4         ; |144| 
||         ADD     .S2     4,B10,B10         ; |143| 

   [ A0]   CALL    .S1     _asinsp           ; |144| 
||         STW     .D2T1   A4,*B4            ; |144| 
|| [!A0]   MVK     .S2     0xc9,B4

           ; BRANCHCC OCCURS {$C$L4}         ; |143| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 2

           ZERO    .L2     B10
||         MV      .L1     A11,A12
||         ADD     .S2     4,B11,B11

           MV      .L1X    B4,A10
||         CALL    .S1     _asinsp_c         ; |147| 

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L5:    
;          EXCLUSIVE CPU CYCLES: 5
           LDW     .D1T1   *A12++,A4         ; |147| 
           ADDKPC  .S2     $C$RL7,B3,3       ; |147| 
$C$RL7:    ; CALL OCCURS {_asinsp_c} {0}     ; |147| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 7

           LDW     .D2T2   *B11,B4           ; |147| 
||         SUB     .L1     A10,1,A0          ; |146| 
||         SUB     .S1     A10,1,A10         ; |146| 

   [ A0]   BNOP    .S2     $C$L5,2           ; |146| 
|| [!A0]   ADD     .L1X    4,B11,A8
|| [!A0]   ZERO    .D1     A12
|| [!A0]   MVKL    .S1     0x3e2aaa2b,A13

   [!A0]   MVKL    .S1     0x3d59196f,A15

           ADD     .L2     B10,B4,B4         ; |147| 
||         ADD     .S2     4,B10,B10         ; |146| 

   [ A0]   CALL    .S1     _asinsp_c         ; |147| 
||         STW     .D2T1   A4,*B4            ; |147| 

           ; BRANCHCC OCCURS {$C$L5}         ; |146| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 3

           SET     .S1     A12,0x16,0x1d,A12
||         MV      .L2X    A11,B17
||         MVK     .S2     0xc9,B0
||         ZERO    .D2     B12
||         LDW     .D1T1   *A8,A7

           MVKH    .S1     0x3d59196f,A15
           MVKH    .S1     0x3e2aaa2b,A13
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains control code
;*----------------------------------------------------------------------------*
$C$L6:    
;          EXCLUSIVE CPU CYCLES: 13
           LDW     .D2T2   *B17++,B19        ; |150| 
           MVKL    .S2     0x3f3504f3,B4
           MVKH    .S2     0x3f3504f3,B4
           NOP             2
           ABSSP   .S2     B19,B8            ; |152| 

           MPYSP   .M2     B8,B8,B5          ; |127| 
||         CMPGTSP .S2     B8,B4,B1          ; |155| 

   [ B1]   BNOP    .S1     $C$L7,2           ; |155| 
|| [!B1]   MVKL    .S2     0xbc33e814,B6

           MPYSP   .M2     B5,B5,B4          ; |127| 
|| [ B1]   ZERO    .L2     B5

   [ B1]   MPYSP   .M2     B8,B8,B4          ; |67| 
   [ B1]   SET     .S2     B5,0x17,0x1d,B5
           ; BRANCHCC OCCURS {$C$L7}         ; |155| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 33

           MVKH    .S2     0xbc33e814,B6
||         MVKL    .S1     0x3cbb4abc,A4
||         MPYSP   .M1X    A13,B5,A31        ; |127| 

           MPYSP   .M1X    A15,B4,A3         ; |127| 
||         MPYSP   .M2     B6,B5,B9          ; |127| 
||         MVKL    .S2     0x3d99abc6,B16

           MVKH    .S2     0x3d99abc6,B16
||         MPYSP   .M2     B4,B5,B6          ; |127| 

           MPYSP   .M2     B4,B4,B7          ; |127| 
||         MVKL    .S2     0x3ca93df4,B21

           MVKL    .S2     0x3d361236,B20
           MVKL    .S2     0x3cfaf877,B18

           ADDSP   .L2X    B9,A3,B16         ; |127| 
||         MPYSP   .M2     B16,B4,B9         ; |127| 
||         MVKH    .S2     0x3ca93df4,B21

           MVKH    .S2     0x3d361236,B20
||         MPYSP   .M2     B4,B6,B31         ; |127| 

           MVKH    .S2     0x3cfaf877,B18
           MPYSP   .M2     B18,B7,B18        ; |127| 

           ADDSP   .L2     B21,B16,B6        ; |127| 
||         MPYSP   .M2     B20,B6,B16        ; |127| 

           MPYSP   .M2     B7,B4,B7          ; |127| 
           MVKH    .S1     0x3cbb4abc,A4
           ADDSP   .L1X    A31,B9,A3         ; |127| 
           MPYSP   .M2X    A4,B31,B4         ; |127| 

           MPYSP   .M2     B7,B6,B5          ; |127| 
||         ADDSP   .L2     B16,B18,B6        ; |127| 

           SUB     .L2     B0,1,B0           ; |149| 
           CMPLTSP .S2     B19,B12,B1        ; |166| 
           ZERO    .L1     A4
           ADDSP   .L2     B4,B5,B4          ; |127| 
           ADDSP   .L1X    A3,B6,A3          ; |127| 
           SET     .S1     A4,0x0,0x1e,A4
           NOP             2
           ADDSP   .L1X    B4,A3,A3          ; |127| 
           ZERO    .L2     B4
           SET     .S2     B4,0x17,0x1d,B4
           B       .S1     $C$L8             ; |127| 
           MPYSP   .M1X    B8,A3,A3          ; |127| 
           CMPGTSP .S2     B8,B4,B2          ; |166| 
           NOP             2
           ADDSP   .L1X    B8,A3,A3          ; |127| 
           ; BRANCH OCCURS {$C$L8}           ; |127| 
;** --------------------------------------------------------------------------*
$C$L7:    
;          EXCLUSIVE CPU CYCLES: 91
           ZERO    .L1     A3
           SET     .S1     A3,0x18,0x1d,A3
           SUBSP   .L2     B5,B4,B4          ; |67| 
           MVKL    .S1     0x3cbb4abc,A30
           MVKL    .S2     0xbc33e814,B31
           MVKH    .S2     0xbc33e814,B31

           RSQRSP  .S2     B4,B6             ; |67| 
||         MPYSP   .M2X    A3,B4,B5          ; |67| 

           MPYSP   .M2     B6,B6,B7          ; |67| 
           MVKL    .S2     0x3d361236,B26
           CMPGTSP .S2     B4,B12,B1         ; |67| 
           MVKL    .S2     0x3ca93df4,B27
           MPYSP   .M2     B5,B7,B7          ; |67| 
           MVKL    .S2     0x3cfaf877,B29
   [!B1]   MV      .L2     B12,B21           ; |67| 
           MVKL    .S2     0x3d99abc6,B16
           MVKH    .S2     0x3d361236,B26
           SUBSP   .L1X    A12,B7,A3         ; |67| 
           MVKH    .S2     0x3ca93df4,B27
           MVKH    .S2     0x3cfaf877,B29
           MVKH    .S2     0x3d99abc6,B16
           MPYSP   .M1X    B6,A3,A3          ; |67| 
           MVKH    .S1     0x3cbb4abc,A30
           SUB     .L2     B0,1,B0           ; |149| 
           MVKL    .S1     0x3fc90fdb,A29
           MPYSP   .M1     A3,A3,A4          ; |67| 
           MVKH    .S1     0x3fc90fdb,A29
           NOP             2
           MPYSP   .M1X    B5,A4,A4          ; |67| 
           NOP             3
           SUBSP   .L1     A12,A4,A4         ; |67| 
           NOP             3
           MPYSP   .M1     A3,A4,A3          ; |67| 
           ZERO    .L1     A4
           SET     .S1     A4,0x0,0x1e,A4
           NOP             2
   [ B1]   MPYSP   .M2X    B4,A3,B21         ; |67| 
           CMPLTSP .S2     B19,B12,B1        ; |166| 
           NOP             2
           MPYSP   .M2     B21,B21,B5        ; |159| 
           NOP             3
           MPYSP   .M2     B5,B5,B4          ; |159| 
           MPYSP   .M1X    A13,B5,A31        ; |159| 
           MPYSP   .M2     B31,B5,B9         ; |159| 
           NOP             1
           MPYSP   .M2     B4,B5,B6          ; |159| 
           MPYSP   .M1X    A15,B4,A3         ; |159| 
           MPYSP   .M2     B4,B4,B7          ; |159| 
           MPYSP   .M2     B16,B4,B30        ; |159| 
           MPYSP   .M2     B4,B6,B18         ; |159| 
           NOP             1
           ADDSP   .L2X    B9,A3,B20         ; |159| 
           MPYSP   .M2     B4,B7,B28         ; |159| 
           MPYSP   .M2     B26,B6,B4         ; |159| 
           MPYSP   .M2     B29,B7,B16        ; |159| 
           ADDSP   .L2     B27,B20,B5        ; |159| 
           ADDSP   .L2X    A31,B30,B24       ; |159| 
           MPYSP   .M2X    A30,B18,B25       ; |159| 
           NOP             1

           MPYSP   .M2     B28,B5,B7         ; |159| 
||         ADDSP   .L2     B4,B16,B5         ; |159| 

           NOP             3

           ADDSP   .L2     B25,B7,B4         ; |159| 
||         ADDSP   .S2     B24,B5,B5         ; |159| 

           NOP             3
           ADDSP   .L2     B4,B5,B4          ; |159| 
           NOP             3
           MPYSP   .M2     B21,B4,B4         ; |159| 
           NOP             3
           ADDSP   .L2     B21,B4,B4         ; |159| 
           NOP             4

           SUBSP   .L1X    A29,B4,A3         ; |159| 
||         ZERO    .L2     B4

           SET     .S2     B4,0x17,0x1d,B4
           CMPGTSP .S2     B8,B4,B2          ; |166| 
;** --------------------------------------------------------------------------*
$C$L8:    
;          EXCLUSIVE CPU CYCLES: 11
   [!B0]   ADD     .S1     4,A8,A14
           NOP             2

   [ B2]   MV      .L1     A4,A3             ; |166| 
||         ZERO    .S1     A4

           MVKH    .S1     0xbf800000,A4

   [!B1]   MV      .L1X    B4,A4
|| [ B0]   B       .S1     $C$L6             ; |149| 

           MPYSP   .M1     A4,A3,A3          ; |166| 
           NOP             3

   [!B0]   CALL    .S1     _asinsp_v         ; |152| 
||         STW     .D1T1   A3,*A7++          ; |166| 

           ; BRANCHCC OCCURS {$C$L6}         ; |149| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           LDW     .D1T2   *A14,B4           ; |152| 
           MV      .L1     A11,A4            ; |152| 
           ADDKPC  .S2     $C$RL8,B3,1       ; |152| 
           MVK     .S1     0xc9,A6           ; |152| 
$C$RL8:    ; CALL OCCURS {_asinsp_v} {0}     ; |152| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 12

           CALLP   .S2     _allequal,B3
||         MVK     .S1     0xc9,A4           ; |157| 

$C$RL9:    ; CALL OCCURS {_allequal} {0}     ; |157| 

           CALLP   .S2     _print_test_results,B3
||         MVK     .L1     0x1,A4            ; |158| 

$C$RL10:   ; CALL OCCURS {_print_test_results} {0}  ; |158| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 7

           MVKL    .S1     _a_sc,A3
||         ZERO    .L2     B6

           MVKH    .S1     _a_sc,A3
||         SET     .S2     B6,0x0,0x1e,B6
||         ZERO    .L1     A5

           ADD     .L2     1,B6,B13
||         MVKH    .S1     0xbf800000,A5
||         ZERO    .L1     A4

           STDW    .D1T2   B13:B12,*A3       ; |166| 
||         SET     .S1     A4,0x17,0x1d,A4
||         ZERO    .L2     B5

           STDW    .D1T1   A5:A4,*+A3(16)    ; |170| 
||         MVKH    .S2     0xff800000,B5
||         ZERO    .L2     B4
||         MVK     .D2     -1,B7             ; |172| 

           STDW    .D1T2   B7:B6,*+A3(24)    ; |172| 
||         SET     .S2     B4,0x17,0x1e,B4

           CALL    .S2     _asinf            ; |175| 
||         STDW    .D1T2   B5:B4,*+A3(8)     ; |168| 
||         SUB     .L1     A3,4,A11
||         MVK     .L2     0x8,B10
||         MV      .S1X    B12,A10

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
$C$L9:    
;          EXCLUSIVE CPU CYCLES: 5
           LDW     .D1T1   *++A11,A4         ; |175| 
           ADDKPC  .S2     $C$RL11,B3,3      ; |175| 
$C$RL11:   ; CALL OCCURS {_asinf} {0}        ; |175| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 30
           MVKL    .S1     _output,A3
           MVKH    .S1     _output,A3
           LDW     .D1T2   *A3,B4            ; |175| 
           NOP             4
           ADD     .L2X    A10,B4,B4         ; |175| 
           STW     .D2T1   A4,*B4            ; |175| 

           CALLP   .S2     _asinsp,B3
||         LDW     .D1T1   *A11,A4           ; |176| 

$C$RL12:   ; CALL OCCURS {_asinsp} {0}       ; |176| 
           MVKL    .S1     _output,A3
           MVKH    .S1     _output,A3
           LDW     .D1T2   *+A3(4),B4        ; |176| 
           NOP             4
           ADD     .L2X    A10,B4,B4         ; |176| 
           STW     .D2T1   A4,*B4            ; |176| 

           CALLP   .S2     _asinsp_c,B3
||         LDW     .D1T1   *A11,A4           ; |177| 

$C$RL13:   ; CALL OCCURS {_asinsp_c} {0}     ; |177| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 22
           MVKL    .S1     _output,A3
           MVKH    .S1     _output,A3
           LDW     .D1T1   *+A3(8),A3        ; |177| 
           ZERO    .L1     A31
           MVKL    .S2     0x3f3504f3,B4
           MVKH    .S2     0x3f3504f3,B4
           NOP             1
           ADD     .L1     A10,A3,A3         ; |177| 
           STW     .D1T1   A4,*A3            ; |177| 
           LDW     .D1T2   *A11,B8           ; |178| 
           SET     .S1     A31,0x17,0x1d,A3
           MV      .L1     A3,A5             ; |149| 
           NOP             2
           ABSSP   .S2     B8,B6             ; |152| 

           CMPGTSP .S2     B6,B4,B0          ; |155| 
||         MPYSP   .M2     B6,B6,B4          ; |67| 

   [!B0]   BNOP    .S1     $C$L10,2          ; |155| 
||         MPYSP   .M2     B6,B6,B9          ; |127| 
|| [ B0]   ZERO    .L1     A3

   [ B0]   SET     .S1     A3,0x18,0x1d,A3

           SUBSP   .L1X    A5,B4,A4          ; |67| 
||         MPYSP   .M2     B9,B9,B5          ; |127| 

   [!B0]   MVKL    .S2     0xbc33e814,B4
           ; BRANCHCC OCCURS {$C$L10}        ; |155| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 83
           MVKL    .S1     0x3cbb4abc,A28
           MVKL    .S2     0xbc33e814,B31

           MPYSP   .M1     A3,A4,A6          ; |67| 
||         RSQRSP  .S1     A4,A3             ; |67| 

           MPYSP   .M1     A3,A3,A7          ; |67| 
           MVKH    .S1     0x3cbb4abc,A28
           MVKH    .S2     0xbc33e814,B31
           CMPGTSP .S2X    A4,B12,B0         ; |69| 
           MPYSP   .M1     A6,A7,A7          ; |67| 
           MVKL    .S2     0x3d99abc6,B30
           MVKH    .S2     0x3d99abc6,B30
           MVKL    .S2     0x3ca93df4,B27
           SUBSP   .L1     A12,A7,A7         ; |67| 
           MVKL    .S2     0x3d361236,B28
           MVKL    .S2     0x3cfaf877,B29
           MVKH    .S2     0x3ca93df4,B27
           MPYSP   .M1     A3,A7,A3          ; |67| 
           MVKH    .S2     0x3d361236,B28
           MVKH    .S2     0x3cfaf877,B29
           SUB     .L1X    B10,1,A0          ; |174| 
           MPYSP   .M1     A3,A3,A7          ; |67| 
           SUB     .L2     B10,1,B10         ; |174| 
           MVKL    .S1     0x3fc90fdb,A27
           MVKH    .S1     0x3fc90fdb,A27
           MPYSP   .M1     A6,A7,A6          ; |67| 
           CMPLTSP .S2     B8,B12,B2         ; |165| 
           NOP             2
           SUBSP   .L1     A12,A6,A6         ; |67| 
           NOP             3
           MPYSP   .M1     A3,A6,A3          ; |67| 
           NOP             3
           MPYSP   .M1     A4,A3,A3          ; |67| 
           NOP             3
   [!B0]   MV      .L1X    B12,A3            ; |70| 
           MPYSP   .M1     A3,A3,A4          ; |159| 
           NOP             3
           MPYSP   .M1     A4,A4,A7          ; |159| 
           MPYSP   .M2X    B31,A4,B4         ; |159| 
           MPYSP   .M1     A13,A4,A31        ; |159| 
           NOP             1
           MPYSP   .M1     A15,A7,A9         ; |159| 
           MPYSP   .M1     A7,A7,A6          ; |159| 
           MPYSP   .M1     A7,A4,A8          ; |159| 
           MPYSP   .M2X    B30,A7,B7         ; |159| 
           NOP             1

           ADDSP   .L2X    B4,A9,B5          ; |159| 
||         MPYSP   .M1     A7,A6,A30         ; |159| 

           MPYSP   .M2X    B29,A6,B9         ; |159| 
           MPYSP   .M1     A7,A8,A29         ; |159| 
           MPYSP   .M2X    B28,A8,B16        ; |159| 
           ADDSP   .L2     B27,B5,B4         ; |159| 
           ADDSP   .L1X    A31,B7,A8         ; |159| 
           MPYSP   .M1     A28,A29,A4        ; |159| 
           ADDSP   .L2     B16,B9,B5         ; |159| 
           MPYSP   .M2X    A30,B4,B4         ; |159| 
           MVKL    .S1     _output+12,A6
           MVKH    .S1     _output+12,A6
           ADDSP   .L2X    A8,B5,B5          ; |159| 
           ADDSP   .L2X    A4,B4,B4          ; |159| 
           ZERO    .L1     A31
           LDW     .D1T1   *A6,A6            ; |178| 
           MVKH    .S1     0xbf800000,A31
           ADDSP   .L2     B4,B5,B4          ; |159| 
           NOP             3
           MPYSP   .M2X    A3,B4,B4          ; |159| 
           NOP             3
           B       .S1     $C$L11            ; |160| 

           MV      .L2X    A5,B4
|| [ B2]   MV      .L1     A31,A5            ; |166| 
||         ADDSP   .S1X    A3,B4,A4          ; |159| 

           ZERO    .L1     A3
           SET     .S1     A3,0x0,0x1e,A3
           CMPGTSP .S2     B6,B4,B0          ; |169| 
           SUBSP   .L1     A27,A4,A4         ; |159| 
           ; BRANCH OCCURS {$C$L11}          ; |160| 
;** --------------------------------------------------------------------------*
$C$L10:    
;          EXCLUSIVE CPU CYCLES: 34

           MVKL    .S1     0x3cbb4abc,A31
||         MVKH    .S2     0xbc33e814,B4

           MPYSP   .M2     B4,B9,B7          ; |127| 
||         MVKL    .S2     0x3ca93df4,B27
||         MVKH    .S1     0x3cbb4abc,A31

           MPYSP   .M1X    A15,B5,A3         ; |127| 
||         MPYSP   .M2     B5,B9,B17         ; |127| 
||         MVKL    .S2     0x3d361236,B26

           MPYSP   .M2     B5,B5,B18         ; |127| 
||         MVKL    .S2     0x3cfaf877,B30

           MVKL    .S2     0x3d99abc6,B31
           MVKH    .S2     0x3ca93df4,B27

           MVKH    .S2     0x3d361236,B26
||         MPYSP   .M2     B5,B17,B19        ; |127| 

           ADDSP   .L2X    B7,A3,B20         ; |127| 
||         MVKH    .S2     0x3cfaf877,B30
||         MPYSP   .M2     B5,B18,B28        ; |127| 

           MVKH    .S2     0x3d99abc6,B31
||         MPYSP   .M2     B26,B17,B4        ; |127| 

           MPYSP   .M2     B30,B18,B29       ; |127| 
           MPYSP   .M2     B31,B5,B16        ; |127| 
           ADDSP   .L2     B27,B20,B5        ; |127| 
           MPYSP   .M1X    A13,B9,A4         ; |127| 
           MPYSP   .M2X    A31,B19,B9        ; |127| 
           ADDSP   .L2     B4,B29,B4         ; |127| 
           MPYSP   .M2     B28,B5,B5         ; |127| 
           ADDSP   .L1X    A4,B16,A30        ; |127| 
           SUB     .L1X    B10,1,A0          ; |174| 
           SUB     .L2     B10,1,B10         ; |174| 
           ADDSP   .L2     B9,B5,B5          ; |127| 
           ADDSP   .L1X    A30,B4,A3         ; |127| 
           MVKL    .S1     _output+12,A6
           MVKH    .S1     _output+12,A6
           LDW     .D1T1   *A6,A6            ; |178| 
           ADDSP   .L1X    B5,A3,A3          ; |127| 
           CMPLTSP .S2     B8,B12,B2         ; |165| 
           ZERO    .L1     A31
           MVKH    .S1     0xbf800000,A31
           MPYSP   .M1X    B6,A3,A3          ; |127| 
           MV      .L2X    A5,B4
   [ B2]   MV      .L1     A31,A5            ; |166| 
           CMPGTSP .S2     B6,B4,B0          ; |169| 

           ADDSP   .L1X    B6,A3,A4          ; |127| 
||         ZERO    .S1     A3

           SET     .S1     A3,0x0,0x1e,A3
;** --------------------------------------------------------------------------*
$C$L11:    
;          EXCLUSIVE CPU CYCLES: 9
           NOP             3

   [ B0]   MV      .L1     A3,A4             ; |170| 
|| [ A0]   B       .S1     $C$L9             ; |174| 

           MPYSP   .M1     A5,A4,A3          ; |178| 
           ADD     .L1     A10,A6,A4         ; |178| 
           ADD     .L1     4,A10,A10         ; |174| 
           NOP             1

   [ A0]   CALL    .S1     _asinf            ; |175| 
||         STW     .D1T1   A3,*A4            ; |178| 

           ; BRANCHCC OCCURS {$C$L9}         ; |174| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 6
           CALL    .S1     _asinsp_v         ; |180| 
           LDW     .D1T2   *A14,B4           ; |180| 
           MVKL    .S1     _a_sc,A4
           MVKH    .S1     _a_sc,A4
           ADDKPC  .S2     $C$RL14,B3,0      ; |180| 
           MVK     .L1     0x8,A6            ; |180| 
$C$RL14:   ; CALL OCCURS {_asinsp_v} {0}     ; |180| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 12

           CALLP   .S2     _allequal,B3
||         MVK     .L1     0x8,A4            ; |183| 

$C$RL15:   ; CALL OCCURS {_allequal} {0}     ; |183| 

           CALLP   .S2     _print_test_results,B3
||         MVK     .L1     0x3,A4            ; |184| 

$C$RL16:   ; CALL OCCURS {_print_test_results} {0}  ; |184| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 4
           MVKL    .S2     _a_ext,B11

           MVKH    .S2     _a_ext,B11
||         ZERO    .L1     A4

           SET     .S1     A4,0x17,0x17,A4

           CALL    .S1     _asinf            ; |189| 
||         STW     .D2T1   A4,*B11           ; |187| 
||         MV      .L1X    B11,A10           ; |187| 
||         MVK     .S2     0xd7,B10
||         MV      .L2     B12,B13           ; |187| 

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
;          EXCLUSIVE CPU CYCLES: 5
           LDW     .D1T1   *A10,A4           ; |189| 
           ADDKPC  .S2     $C$RL17,B3,3      ; |189| 
$C$RL17:   ; CALL OCCURS {_asinf} {0}        ; |189| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 28
           MVKL    .S1     _output,A11
           MVKH    .S1     _output,A11
           LDW     .D1T1   *A11,A3           ; |189| 
           NOP             4
           ADD     .L1X    B13,A3,A3         ; |189| 
           STW     .D1T1   A4,*A3            ; |189| 

           CALLP   .S2     _asinsp,B3
||         LDW     .D1T1   *A10,A4           ; |190| 

$C$RL18:   ; CALL OCCURS {_asinsp} {0}       ; |190| 
           LDW     .D1T1   *+A11(4),A3       ; |190| 
           NOP             4
           ADD     .L1X    B13,A3,A3         ; |190| 
           STW     .D1T1   A4,*A3            ; |190| 

           CALLP   .S2     _asinsp_c,B3
||         LDW     .D1T1   *A10,A4           ; |191| 

$C$RL19:   ; CALL OCCURS {_asinsp_c} {0}     ; |191| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 20
           LDW     .D1T1   *+A11(8),A3       ; |191| 
           ZERO    .L1     A31
           MVKL    .S2     0x3f3504f3,B31
           MVKH    .S2     0x3f3504f3,B31
           NOP             1
           ADD     .L2X    B13,A3,B4         ; |191| 
           STW     .D2T1   A4,*B4            ; |191| 
           LDW     .D1T1   *A10,A9           ; |192| 
           SET     .S1     A31,0x17,0x1d,A3
           MV      .L1     A3,A6             ; |149| 
           NOP             2
           ABSSP   .S2X    A9,B6             ; |152| 

           CMPGTSP .S2     B6,B31,B0         ; |155| 
||         MPYSP   .M2     B6,B6,B4          ; |67| 

   [!B0]   BNOP    .S1     $C$L13,2          ; |155| 
||         MPYSP   .M2     B6,B6,B7          ; |127| 
|| [ B0]   ZERO    .L1     A3

   [ B0]   SET     .S1     A3,0x18,0x1d,A3

           SUBSP   .L1X    A6,B4,A5          ; |67| 
||         MPYSP   .M2     B7,B7,B5          ; |127| 

   [!B0]   MVKL    .S2     0xbc33e814,B4
           ; BRANCHCC OCCURS {$C$L13}        ; |155| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 83
           MVKL    .S1     0x3cbb4abc,A28
           MVKL    .S2     0xbc33e814,B31

           MPYSP   .M1     A3,A5,A4          ; |67| 
||         RSQRSP  .S1     A5,A3             ; |67| 

           MPYSP   .M1     A3,A3,A7          ; |67| 
           MVKH    .S1     0x3cbb4abc,A28
           MVKH    .S2     0xbc33e814,B31
           CMPGTSP .S2X    A5,B12,B0         ; |69| 
           MPYSP   .M1     A4,A7,A7          ; |67| 
           MVKL    .S2     0x3d99abc6,B30
           MVKH    .S2     0x3d99abc6,B30
           MVKL    .S2     0x3ca93df4,B27
           SUBSP   .L1     A12,A7,A7         ; |67| 
           MVKL    .S2     0x3d361236,B28
           MVKL    .S2     0x3cfaf877,B29
           MVKH    .S2     0x3ca93df4,B27
           MPYSP   .M1     A3,A7,A3          ; |67| 
           MVKH    .S2     0x3d361236,B28
           MVKH    .S2     0x3cfaf877,B29
           MVKL    .S1     0x3fc90fdb,A27
           MPYSP   .M1     A3,A3,A7          ; |67| 
           MVKH    .S1     0x3fc90fdb,A27
           NOP             2
           MPYSP   .M1     A4,A7,A4          ; |67| 
           NOP             3
           SUBSP   .L1     A12,A4,A4         ; |67| 
           NOP             3
           MPYSP   .M1     A3,A4,A3          ; |67| 
           NOP             3
           MPYSP   .M1     A5,A3,A4          ; |67| 
           NOP             3
   [!B0]   MV      .L1X    B12,A4            ; |70| 
           MPYSP   .M1     A4,A4,A5          ; |159| 
           NOP             3
           MPYSP   .M1     A5,A5,A3          ; |159| 
           MPYSP   .M2X    B31,A5,B4         ; |159| 
           MPYSP   .M1     A13,A5,A31        ; |159| 
           NOP             1
           MPYSP   .M1     A15,A3,A16        ; |159| 
           MPYSP   .M1     A3,A5,A7          ; |159| 
           MPYSP   .M1     A3,A3,A8          ; |159| 
           MPYSP   .M2X    B30,A3,B7         ; |159| 
           NOP             1

           ADDSP   .L2X    B4,A16,B5         ; |159| 
||         MPYSP   .M1     A3,A7,A29         ; |159| 

           MPYSP   .M2X    B28,A7,B9         ; |159| 
           MPYSP   .M1     A3,A8,A30         ; |159| 
           MPYSP   .M2X    B29,A8,B8         ; |159| 
           ADDSP   .L2     B27,B5,B4         ; |159| 
           ADDSP   .L1X    A31,B7,A8         ; |159| 
           MPYSP   .M1     A28,A29,A3        ; |159| 
           ADDSP   .L2     B9,B8,B5          ; |159| 
           MPYSP   .M2X    A30,B4,B4         ; |159| 
           NOP             2
           ADDSP   .L2X    A8,B5,B5          ; |159| 
           ADDSP   .L2X    A3,B4,B4          ; |159| 
           NOP             3
           ADDSP   .L2     B4,B5,B4          ; |159| 
           NOP             3
           MPYSP   .M2X    A4,B4,B4          ; |159| 
           NOP             3
           B       .S1     $C$L14            ; |160| 
           ADDSP   .L1X    A4,B4,A4          ; |159| 
           NOP             3
           SUBSP   .L1     A27,A4,A4         ; |159| 
           ; BRANCH OCCURS {$C$L14}          ; |160| 
;** --------------------------------------------------------------------------*
$C$L13:    
;          EXCLUSIVE CPU CYCLES: 33

           MVKL    .S1     0x3cbb4abc,A31
||         MVKH    .S2     0xbc33e814,B4

           MPYSP   .M2     B4,B7,B8          ; |127| 
||         MVKL    .S2     0x3cfaf877,B30
||         MVKH    .S1     0x3cbb4abc,A31

           MPYSP   .M1X    A15,B5,A3         ; |127| 
||         MPYSP   .M2     B5,B5,B17         ; |127| 
||         MVKL    .S2     0x3d361236,B26

           MPYSP   .M2     B5,B7,B16         ; |127| 
||         MVKL    .S2     0x3ca93df4,B27

           MVKL    .S2     0x3d99abc6,B31
           MVKH    .S2     0x3cfaf877,B30

           MVKH    .S2     0x3d361236,B26
||         MPYSP   .M2     B5,B17,B28        ; |127| 

           ADDSP   .L2X    B8,A3,B18         ; |127| 
||         MVKH    .S2     0x3ca93df4,B27
||         MPYSP   .M2     B5,B16,B19        ; |127| 

           MVKH    .S2     0x3d99abc6,B31
||         MPYSP   .M2     B26,B16,B4        ; |127| 

           MPYSP   .M2     B30,B17,B29       ; |127| 
           MPYSP   .M2     B31,B5,B9         ; |127| 
           ADDSP   .L2     B27,B18,B5        ; |127| 
           MPYSP   .M1X    A13,B7,A4         ; |127| 
           MPYSP   .M2X    A31,B19,B7        ; |127| 
           ADDSP   .L2     B4,B29,B4         ; |127| 
           MPYSP   .M2     B28,B5,B5         ; |127| 
           ADDSP   .L1X    A4,B9,A30         ; |127| 
           NOP             2
           ADDSP   .L2     B7,B5,B5          ; |127| 
           ADDSP   .L1X    A30,B4,A3         ; |127| 
           NOP             3
           ADDSP   .L1X    B5,A3,A3          ; |127| 
           NOP             3
           MPYSP   .M1X    B6,A3,A3          ; |127| 
           NOP             3
           ADDSP   .L1X    B6,A3,A4          ; |127| 
;** --------------------------------------------------------------------------*
$C$L14:    
;          EXCLUSIVE CPU CYCLES: 19

           MVK     .S2     12,B31
||         MV      .L2X    A6,B4
||         ZERO    .L1     A3
||         ZERO    .D1     A31
||         CMPLTSP .S1X    A9,B12,A0         ; |165| 

           CMPGTSP .S2     B6,B4,B0          ; |169| 
||         ADD     .L2X    A11,B31,B4
||         SET     .S1     A3,0x0,0x1e,A3

           LDW     .D2T2   *B4,B4            ; |192| 
||         MVKH    .S1     0xbf800000,A31

   [ B0]   MV      .L1     A3,A4             ; |170| 
|| [ A0]   MV      .S1     A31,A6            ; |166| 

           MPYSP   .M1     A6,A4,A3          ; |192| 
           SUB     .L1X    B10,1,A2          ; |188| 
           ZERO    .L1     A30
           ADD     .L2     B13,B4,B4         ; |192| 
           STW     .D2T1   A3,*B4            ; |192| 
           LDW     .D1T1   *A10,A4           ; |193| 
           MVKH    .S1     0xbfc00000,A30
           SUB     .L2     B10,1,B10         ; |188| 
           ADD     .L2     4,B13,B13         ; |188| 
   [ A2]   B       .S1     $C$L12            ; |188| 
           MPYSP   .M1     A30,A4,A3         ; |193| 
           NOP             3

   [ A2]   CALL    .S1     _asinf            ; |189| 
||         STW     .D1T1   A3,*++A10         ; |193| 

           ; BRANCHCC OCCURS {$C$L12}        ; |188| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 6

           CALL    .S1     _asinsp_v         ; |195| 
||         MV      .L2X    A11,B10

           LDW     .D2T2   *+B10(16),B4      ; |195| 
           ADDKPC  .S2     $C$RL20,B3,2      ; |195| 

           MV      .L1X    B11,A4
||         MVK     .S1     0xd7,A6           ; |195| 

$C$RL20:   ; CALL OCCURS {_asinsp_v} {0}     ; |195| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 41
           MVKL    .S2     0x3eb0c6f7,B7
           MVKL    .S2     0xa0b5ed8d,B6
           MVKH    .S2     0x3eb0c6f7,B7

           LDW     .D2T1   *B10,A4           ; |66| 
||         MVKH    .S2     0xa0b5ed8d,B6

           CALLP   .S2     _isequal,B3
||         LDW     .D2T2   *+B10(4),B4       ; |66| 
||         MVK     .S1     0xd7,A6           ; |66| 
||         MVK     .L1     0x1,A8            ; |66| 

$C$RL21:   ; CALL OCCURS {_isequal} {0}      ; |66| 
           MVKL    .S1     _fcn_pass,A10

           MVKH    .S1     _fcn_pass,A10
||         MVKL    .S2     0xa0b5ed8d,B6

           MVKL    .S2     0x3eb0c6f7,B7

           MV      .L2X    A10,B5            ; |67| 
||         LDW     .D2T2   *+B10(8),B4       ; |67| 
||         MVKH    .S2     0xa0b5ed8d,B6

           STW     .D2T1   A4,*+B5(4)        ; |66| 
||         MVKH    .S2     0x3eb0c6f7,B7

           CALLP   .S2     _isequal,B3
||         LDW     .D2T1   *B10,A4           ; |67| 
||         MVK     .S1     0xd7,A6           ; |67| 
||         MVK     .L1     0x1,A8            ; |67| 

$C$RL22:   ; CALL OCCURS {_isequal} {0}      ; |67| 
           MVKL    .S2     0x3eb0c6f7,B7
           MVKL    .S2     0xa0b5ed8d,B6

           MV      .L2X    A10,B5            ; |68| 
||         MVKH    .S2     0x3eb0c6f7,B7

           MV      .L1     A11,A3            ; |67| 
||         STW     .D2T1   A4,*+B5(8)        ; |67| 
||         MVKH    .S2     0xa0b5ed8d,B6

           CALLP   .S2     _isequal,B3
||         LDW     .D1T1   *A3,A4            ; |68| 
||         LDW     .D2T2   *+B10(12),B4      ; |68| 
||         MVK     .S1     0xd7,A6           ; |68| 
||         MVK     .L1     0x1,A8            ; |68| 

$C$RL23:   ; CALL OCCURS {_isequal} {0}      ; |68| 
           MVKL    .S2     0xa0b5ed8d,B6
           MVKL    .S2     0x3eb0c6f7,B7

           MV      .L2X    A10,B4            ; |68| 
||         MVKH    .S2     0xa0b5ed8d,B6

           MV      .L1     A11,A3            ; |68| 
||         STW     .D2T1   A4,*+B4(12)       ; |68| 
||         LDW     .D1T2   *A14,B4           ; |69| 
||         MVKH    .S2     0x3eb0c6f7,B7

           CALLP   .S2     _isequal,B3
||         LDW     .D1T1   *A3,A4            ; |69| 
||         MVK     .S1     0xd7,A6           ; |69| 
||         MVK     .L1     0x1,A8            ; |69| 

$C$RL24:   ; CALL OCCURS {_isequal} {0}      ; |69| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 12
           ADD     .L2X    4,A10,B11
           LDW     .D2T2   *B11,B0           ; |72| 
           MV      .L2X    A10,B4            ; |72| 
           STW     .D2T1   A4,*+B4(16)       ; |69| 
           ADD     .L2X    8,A10,B10
           NOP             1

   [!B0]   MVKL    .S1     _all_pass,A3
|| [!B0]   B       .S2     $C$L15            ; |72| 
|| [!B0]   MV      .L1X    B12,A4
||         MV      .L2     B0,B1             ; guard predicate rewrite

   [!B0]   CALL    .S2     _print_test_results ; |199| 
|| [!B0]   MVKH    .S1     _all_pass,A3
|| [ B0]   LDW     .D2T2   *B10,B0           ; |72| 

   [ B1]   ADD     .L2     4,B10,B4
           NOP             3
           ; BRANCHCC OCCURS {$C$L15}        ; |72| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 10
   [ B0]   LDW     .D2T2   *B4,B4            ; |72| 
           CMPEQ   .L1     A4,0,A3           ; |72| 
           XOR     .L1     1,A3,A3           ; |72| 
   [!B0]   MV      .L1X    B12,A0            ; |72| 
           MVK     .L1     0x1,A4            ; |72| 
   [ B0]   CMPEQ   .L2     B4,0,B4           ; |72| 
   [ B0]   XOR     .L2     1,B4,B4           ; |72| 
           NOP             1
   [ B0]   AND     .L1X    A3,B4,A0          ; |72| 
   [!A0]   MV      .L1X    B12,A4
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
||         ADDKPC  .S2     $C$RL25,B3,0      ; |199| 

$C$RL25:   ; CALL OCCURS {_print_test_results} {0}  ; |199| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 14

           MV      .L1X    B12,A11           ; |114| 
||         MVKL    .S1     _cycle_counts+24,A3

           MVKH    .S1     _cycle_counts+24,A3
||         MV      .L2     B12,B4            ; |114| 
||         MV      .L1X    B12,A10           ; |114| 

           MVC     .S2     B4,TSCL           ; |115| 
||         STDW    .D1T1   A11:A10,*A3       ; |114| 

           MVC     .S2     TSCL,B6           ; |116| 
           MVC     .S2     TSCH,B7           ; |116| 
           MVKL    .S1     _t_start,A3
           MVKH    .S1     _t_start,A3

           MVC     .S2     TSCL,B4           ; |117| 
||         STDW    .D1T2   B7:B6,*A3         ; |116| 

           MVC     .S2     TSCH,B8           ; |117| 

           CALL    .S1     _gimme_random     ; |209| 
||         SUBU    .L2     B4,B6,B5:B4       ; |117| 

           EXT     .S2     B5,24,24,B6       ; |117| 
||         SUB     .L2     B8,B7,B31         ; |117| 
||         MVKL    .S1     _t_offset,A4

           ADD     .L2     B31,B6,B5         ; |117| 
||         MVKH    .S1     _t_offset,A4

           ZERO    .L2     B4
||         ZERO    .L1     A4
||         STDW    .D1T2   B5:B4,*A4         ; |117| 
||         MVK     .S2     0x80,B30

           MVKH    .S2     0xbf000000,B4
||         SET     .S1     A4,0x17,0x1d,A4
||         STW     .D2T2   B30,*+SP(12)      ; |117| 
||         MV      .L2     B12,B13

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
           ADDKPC  .S2     $C$RL26,B3,0      ; |209| 
$C$RL26:   ; CALL OCCURS {_gimme_random} {0}  ; |209| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 21
           MVKL    .S1     _input,A3
           MVKH    .S1     _input,A3
           LDW     .D1T1   *A3,A3            ; |209| 
           NOP             4
           ADD     .L2X    B13,A3,B4         ; |209| 

           STW     .D2T1   A4,*B4            ; |209| 
||         MVC     .S2     TSCL,B4           ; |122| 

           NOP             1

           MV      .L1X    B4,A6             ; |122| Define a twin register
||         MVC     .S2     TSCH,B5           ; |122| 

           MV      .L2X    A4,B6             ; |213| 
||         MVKL    .S2     0x3f3504f3,B4
||         ZERO    .L1     A3

           ABSSP   .S2     B6,B7             ; |152| 
||         MV      .L1X    B5,A7             ; |122| 
||         SET     .S1     A3,0x17,0x1d,A3

           MPYSP   .M2     B7,B7,B8          ; |127| 
||         MVKH    .S2     0x3f3504f3,B4
||         MV      .L1     A3,A8             ; |149| 

           CMPGTSP .S2     B7,B4,B0          ; |155| 
||         MPYSP   .M2     B7,B7,B4          ; |64| 

   [!B0]   BNOP    .S1     $C$L17,1          ; |155| 
|| [ B0]   ZERO    .L1     A3

           MPYSP   .M2     B8,B8,B5          ; |127| 
   [ B0]   SET     .S1     A3,0x18,0x1d,A3
           SUBSP   .L1X    A8,B4,A5          ; |64| 
   [!B0]   MVKL    .S2     0xbc33e814,B4
           ; BRANCHCC OCCURS {$C$L17}        ; |155| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 83
           MVKL    .S1     0x3cbb4abc,A28
           MVKL    .S2     0xbc33e814,B31

           MPYSP   .M1     A3,A5,A4          ; |64| 
||         RSQRSP  .S1     A5,A3             ; |64| 

           MPYSP   .M1     A3,A3,A9          ; |64| 
           MVKH    .S1     0x3cbb4abc,A28
           MVKH    .S2     0xbc33e814,B31
           CMPGTSP .S2X    A5,B12,B0         ; |69| 
           MPYSP   .M1     A4,A9,A9          ; |64| 
           MVKL    .S2     0x3d99abc6,B30
           MVKH    .S2     0x3d99abc6,B30
           MVKL    .S2     0x3ca93df4,B27
           SUBSP   .L1     A12,A9,A9         ; |64| 
           MVKL    .S2     0x3d361236,B28
           MVKL    .S2     0x3cfaf877,B29
           MVKH    .S2     0x3ca93df4,B27
           MPYSP   .M1     A3,A9,A3          ; |64| 
           MVKH    .S2     0x3d361236,B28
           MVKH    .S2     0x3cfaf877,B29
           MVKL    .S1     0x3fc90fdb,A27
           MPYSP   .M1     A3,A3,A9          ; |67| 
           MVKH    .S1     0x3fc90fdb,A27
           CMPLTSP .S2     B6,B12,B2         ; |165| 
           NOP             1
           MPYSP   .M1     A4,A9,A4          ; |67| 
           NOP             3
           SUBSP   .L1     A12,A4,A4         ; |67| 
           NOP             3
           MPYSP   .M1     A3,A4,A3          ; |67| 
           NOP             3
           MPYSP   .M1     A5,A3,A4          ; |67| 
           NOP             3
   [!B0]   MV      .L1X    B12,A4            ; |70| 
           MPYSP   .M1     A4,A4,A5          ; |159| 
           NOP             3
           MPYSP   .M1     A5,A5,A3          ; |159| 
           MPYSP   .M2X    B31,A5,B4         ; |159| 
           MPYSP   .M1     A13,A5,A31        ; |159| 
           MVKL    .S2     _output+12,B31
           MPYSP   .M1     A15,A3,A17        ; |159| 
           MPYSP   .M1     A3,A5,A9          ; |159| 
           MPYSP   .M1     A3,A3,A16         ; |159| 
           MPYSP   .M2X    B30,A3,B8         ; |159| 
           MVKH    .S2     _output+12,B31

           ADDSP   .L2X    B4,A17,B5         ; |159| 
||         MPYSP   .M1     A3,A9,A29         ; |159| 

           MPYSP   .M2X    B28,A9,B16        ; |159| 
           MPYSP   .M1     A3,A16,A30        ; |159| 
           MPYSP   .M2X    B29,A16,B9        ; |159| 
           ADDSP   .L2     B27,B5,B4         ; |159| 
           ADDSP   .L1X    A31,B8,A16        ; |159| 
           MPYSP   .M1     A28,A29,A3        ; |159| 
           ADDSP   .L2     B16,B9,B5         ; |159| 
           MPYSP   .M2X    A30,B4,B4         ; |159| 
           ZERO    .L1     A31
           MVKH    .S1     0xbf800000,A31
           ADDSP   .L2X    A16,B5,B5         ; |159| 
           ADDSP   .L2X    A3,B4,B4          ; |159| 
           MVKL    .S1     _t_start,A30
           MVKH    .S1     _t_start,A30
           STDW    .D1T1   A7:A6,*A30
           ADDSP   .L2     B4,B5,B4          ; |159| 
           ZERO    .L1     A3
           SET     .S1     A3,0x0,0x1e,A3
           NOP             1
           MPYSP   .M2X    A4,B4,B4          ; |159| 
           NOP             3
           B       .S1     $C$L18            ; |160| 

           ADDSP   .L1X    A4,B4,A4          ; |159| 
||         MV      .L2X    A8,B4

           CMPGTSP .S2     B7,B4,B0          ; |169| 
||         LDW     .D2T2   *B31,B4           ; |213| 

   [ B2]   MV      .L1     A31,A8            ; |166| 
           NOP             1
           SUBSP   .L1     A27,A4,A4         ; |159| 
           ; BRANCH OCCURS {$C$L18}          ; |160| 
;** --------------------------------------------------------------------------*
$C$L17:    
;          EXCLUSIVE CPU CYCLES: 32

           MPYSP   .M1X    A15,B5,A3         ; |127| 
||         MVKH    .S2     0xbc33e814,B4
||         MPYSP   .M2     B5,B8,B9          ; |127| 
||         MVKL    .S1     0x3cbb4abc,A31

           MPYSP   .M2     B4,B8,B16         ; |127| 
||         MVKL    .S2     0x3ca93df4,B27
||         MPYSP   .M1X    A13,B8,A4         ; |127| 
||         MVKH    .S1     0x3cbb4abc,A31

           MPYSP   .M2     B5,B5,B18         ; |127| 
||         MVKL    .S2     0x3d361236,B26

           MVKL    .S2     0x3cfaf877,B30

           MVKL    .S2     0x3d99abc6,B31
||         MPYSP   .M2     B5,B9,B19         ; |127| 

           ADDSP   .L2X    B16,A3,B20        ; |127| 
||         MVKH    .S2     0x3ca93df4,B27

           MVKH    .S2     0x3d361236,B26
||         MPYSP   .M2     B5,B18,B28        ; |127| 

           MVKH    .S2     0x3cfaf877,B30
||         MPYSP   .M2     B26,B9,B4         ; |127| 

           MVKH    .S2     0x3d99abc6,B31
||         MPYSP   .M2     B30,B18,B29       ; |127| 

           MPYSP   .M2     B31,B5,B17        ; |127| 
||         ADDSP   .L2     B27,B20,B5        ; |127| 

           MVKL    .S2     _output+12,B31
           MPYSP   .M2X    A31,B19,B8        ; |127| 
           ADDSP   .L2     B4,B29,B4         ; |127| 
           MPYSP   .M2     B28,B5,B5         ; |127| 
           ADDSP   .L1X    A4,B17,A30        ; |127| 
           ZERO    .L1     A31
           MVKH    .S2     _output+12,B31
           ADDSP   .L2     B8,B5,B5          ; |127| 
           ADDSP   .L1X    A30,B4,A3         ; |127| 
           CMPLTSP .S2     B6,B12,B2         ; |165| 
           MVKH    .S1     0xbf800000,A31
           MV      .L2X    A8,B4
           ADDSP   .L1X    B5,A3,A3          ; |127| 
   [ B2]   MV      .L1     A31,A8            ; |166| 
           MVKL    .S1     _t_start,A30
           CMPGTSP .S2     B7,B4,B0          ; |169| 
           MPYSP   .M1X    B7,A3,A3          ; |127| 
           MVKH    .S1     _t_start,A30
           LDW     .D2T2   *B31,B4           ; |213| 
           STDW    .D1T1   A7:A6,*A30

           ADDSP   .L1X    B7,A3,A4          ; |127| 
||         ZERO    .S1     A3

           SET     .S1     A3,0x0,0x1e,A3
;** --------------------------------------------------------------------------*
$C$L18:    
;          EXCLUSIVE CPU CYCLES: 37
           NOP             1
           ADD     .L2     B13,B4,B4         ; |213| 
           NOP             1
   [ B0]   MV      .L1     A3,A4             ; |170| 
           MPYSP   .M1     A8,A4,A4          ; |213| 
           NOP             3

           STW     .D2T1   A4,*B4            ; |213| 
||         MVC     .S2     TSCL,B8           ; |128| 

           MVC     .S2     TSCH,B4           ; |128| 

           MVKL    .S1     _t_offset,A3
||         MVKL    .S2     _cycle_counts+24,B5
||         MV      .L2     B4,B9             ; |128| 
||         ADD     .D2     4,B13,B13         ; |207| 

           MVKH    .S1     _t_offset,A3
||         MVKH    .S2     _cycle_counts+24,B5

           LDDW    .D1T1   *A3,A9:A8         ; |130| 
||         LDDW    .D2T2   *B5,B7:B6         ; |130| 
||         MVKL    .S1     _t_stop,A29

           MVKH    .S1     _t_stop,A29
           STDW    .D1T2   B9:B8,*A29        ; |128| 
           NOP             2
           ADDU    .L1     A8,A6,A5:A4       ; |130| 
           ADD     .L1     A5,A9,A5          ; |130| 
           ADD     .L1     A5,A7,A3          ; |130| 
           NOP             1

           SUB     .L2X    B4,A3,B17         ; |130| 
||         MVKL    .S1     _cycle_counts+24,A3

           SUBU    .L2X    B8,A4,B5:B4       ; |130| 
||         MVKH    .S1     _cycle_counts+24,A3

           EXT     .S2     B5,24,24,B16      ; |130| 
||         ADDU    .L2     B6,B4,B5:B4       ; |130| 

           MV      .L2     B4,B6             ; |130| 
||         ADD     .S2     B5,B7,B4          ; |130| 
||         ADD     .D2     B17,B16,B5        ; |130| 

           ADD     .L2     B4,B5,B7          ; |130| 
||         LDW     .D2T2   *+SP(12),B4       ; |130| 

           STDW    .D1T2   B7:B6,*A3         ; |130| 
           NOP             3

           SUB     .L1X    B4,1,A0           ; |207| 
||         SUB     .L2     B4,1,B4           ; |207| 

           STW     .D2T2   B4,*+SP(12)       ; |130| 
|| [ A0]   ZERO    .L2     B4
|| [ A0]   ZERO    .L1     A4
|| [ A0]   B       .S1     $C$L16            ; |207| 
|| [!A0]   LDDW    .D1T1   *A3,A5:A4         ; |135| 

   [ A0]   CALL    .S1     _gimme_random     ; |209| 
|| [ A0]   MVKH    .S2     0xbf000000,B4

   [ A0]   SET     .S1     A4,0x17,0x1d,A4
|| [!A0]   CALL    .S2     __fltllif         ; |135| 

           NOP             3
           ; BRANCHCC OCCURS {$C$L16}        ; |207| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 2
           ADDKPC  .S2     $C$RL27,B3,1      ; |135| 
$C$RL27:   ; CALL OCCURS {__fltllif} {0}     ; |135| 
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
$C$RL28:   ; CALL OCCURS {__fixdlli} {0}     ; |135| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 13
           MVKL    .S2     _cycle_counts+24,B4
           MVKH    .S2     _cycle_counts+24,B4
           STDW    .D2T1   A5:A4,*B4         ; |135| 

           SUBAW   .D2     B4,6,B5
||         MV      .L2     B12,B31           ; |114| 

           MVC     .S2     B31,TSCL          ; |115| 
||         STDW    .D2T1   A11:A10,*B5       ; |114| 

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
||         MVK     .S1     0x80,A15

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
||         CALL    .S1     _asinf            ; |222| 

           LDW     .D1T1   *A3,A4            ; |222| 
           ADDKPC  .S2     $C$RL29,B3,3      ; |222| 
$C$RL29:   ; CALL OCCURS {_asinf} {0}        ; |222| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 24
           MVKL    .S2     _output,B12
           MVKH    .S2     _output,B12
           LDW     .D2T2   *B12,B4           ; |222| 
           NOP             4
           ADD     .L1X    A12,B4,A3         ; |222| 

           STW     .D1T1   A4,*A3            ; |222| 
||         MVC     .S2     TSCL,B16          ; |128| 

           MVC     .S2     TSCH,B6           ; |128| 

           MVKL    .S2     _t_start,B4
||         MVKL    .S1     _t_offset,A3
||         SUB     .L1     A15,1,A0          ; |220| 
||         MV      .L2     B6,B17            ; |128| 
||         SUB     .D1     A15,1,A15         ; |220| 

           MVKH    .S1     _t_offset,A3
||         MVKH    .S2     _t_start,B4
||         ADD     .L1     4,A12,A12         ; |220| 

           LDDW    .D1T1   *A3,A5:A4         ; |130| 
||         LDDW    .D2T2   *B4,B9:B8         ; |130| 
||         MVKL    .S1     _cycle_counts,A31
||         MVKL    .S2     _cycle_counts,B6

           MVKH    .S1     _cycle_counts,A31
||         MVKH    .S2     _cycle_counts,B6

           LDDW    .D1T1   *A31,A7:A6        ; |130| 
||         MVKL    .S1     _t_stop,A30

           MVKH    .S1     _t_stop,A30
|| [!A0]   MV      .L1X    B6,A15

           STDW    .D1T2   B17:B16,*A30      ; |128| 
           ADDU    .L2X    A4,B8,B5:B4       ; |130| 

           ADD     .S2X    B5,A5,B7          ; |130| 
|| [ A0]   B       .S1     $C$L19            ; |220| 
||         SUBU    .L2     B16,B4,B5:B4      ; |130| 

           ADD     .D2     B7,B9,B7          ; |130| 
||         EXT     .S2     B5,24,24,B9       ; |130| 
||         ADDU    .L2X    A6,B4,B5:B4       ; |130| 

           SUB     .L2     B17,B7,B7         ; |130| 
||         MV      .S2     B4,B8             ; |130| 
||         ADD     .D2X    B5,A7,B4          ; |130| 

           ADD     .L2     B7,B9,B5          ; |130| 
           ADD     .L2     B4,B5,B9          ; |130| 

   [!A0]   CALL    .S1     __fltllif         ; |135| 
||         STDW    .D2T2   B9:B8,*B6         ; |130| 

           ; BRANCHCC OCCURS {$C$L19}        ; |220| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           LDDW    .D1T1   *A15,A5:A4        ; |135| 
           ADDKPC  .S2     $C$RL30,B3,3      ; |135| 
$C$RL30:   ; CALL OCCURS {__fltllif} {0}     ; |135| 
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
$C$RL31:   ; CALL OCCURS {__fixdlli} {0}     ; |135| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 11

           STDW    .D1T1   A11:A10,*+A15(16) ; |114| 
||         MV      .L2X    A10,B4            ; |114| 

           MVC     .S2     B4,TSCL           ; |115| 
||         STDW    .D1T1   A5:A4,*A15        ; |135| 

           MVC     .S2     TSCL,B4           ; |116| 
           MVC     .S2     TSCH,B6           ; |116| 
           MVC     .S2     TSCL,B5           ; |117| 
           MVC     .S2     TSCH,B8           ; |117| 
           MVKL    .S1     _t_offset,A3

           MVKH    .S1     _t_offset,A3
||         SUBU    .L2     B5,B4,B5:B4       ; |117| 

           EXT     .S2     B5,24,24,B6       ; |117| 
||         SUB     .L2     B8,B6,B5          ; |117| 
||         MVK     .S1     0x80,A31

           ADD     .L2     B5,B6,B5          ; |117| 
||         MV      .S2X    A3,B7             ; |117| 
||         STW     .D2T1   A31,*+SP(12)      ; |117| 

           STDW    .D2T2   B5:B4,*B7         ; |117| 
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
||         CALL    .S1     _asinsp_c         ; |231| 

           LDW     .D1T1   *A3,A4            ; |231| 
           ADDKPC  .S2     $C$RL32,B3,3      ; |231| 
$C$RL32:   ; CALL OCCURS {_asinsp_c} {0}     ; |231| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 23
           ADDAD   .D2     B12,1,B4
           LDW     .D2T2   *B4,B4            ; |231| 
           NOP             4
           ADD     .L1X    A12,B4,A3         ; |231| 

           STW     .D1T1   A4,*A3            ; |231| 
||         MVC     .S2     TSCL,B16          ; |128| 

           MVC     .S2     TSCH,B4           ; |128| 

           MVKL    .S2     _t_start,B13
||         MVKL    .S1     _t_offset,A3
||         LDW     .D2T1   *+SP(12),A29      ; |130| 
||         ADDAD   .D1     A15,2,A31
||         MV      .L2     B4,B17            ; |128| 
||         ADD     .L1     4,A12,A12         ; |229| 

           MVKH    .S2     _t_start,B13
||         MVKH    .S1     _t_offset,A3
||         LDDW    .D1T1   *A31,A7:A6        ; |130| 

           LDDW    .D1T1   *A3,A5:A4         ; |130| 
||         LDDW    .D2T2   *B13,B7:B6        ; |130| 
||         MVK     .S2     16,B31
||         MVKL    .S1     _t_stop,A30

           MVKH    .S1     _t_stop,A30
           STDW    .D1T2   B17:B16,*A30      ; |128| 
           SUB     .L1     A29,1,A0          ; |229| 
           STW     .D2T1   A0,*+SP(12)       ; |130| 
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
||         ADD     .S2X    A15,B31,B6

   [!A0]   CALL    .S1     __fltllif         ; |135| 
||         STDW    .D2T2   B5:B4,*B6         ; |130| 

           ; BRANCHCC OCCURS {$C$L20}        ; |229| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           LDDW    .D1T1   *+A15(16),A5:A4   ; |135| 
           ADDKPC  .S2     $C$RL33,B3,3      ; |135| 
$C$RL33:   ; CALL OCCURS {__fltllif} {0}     ; |135| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 69
           ZERO    .L1     A3
           SET     .S1     A3,0x1a,0x1d,A3
           MPYSP   .M1     A3,A4,A3          ; |135| 
           MV      .L1     A10,A12           ; |135| 
           NOP             2
           SPDP    .S1     A3,A5:A4          ; |135| 
           NOP             1
           ADDDP   .L1     A13:A12,A5:A4,A5:A4 ; |135| 
           CALLP   .S2     __fixdlli,B3
$C$RL34:   ; CALL OCCURS {__fixdlli} {0}     ; |135| 
           STDW    .D1T1   A11:A10,*+A15(32) ; |114| 

           MV      .L2X    A11,B4            ; |114| 
||         ADDAD   .D1     A15,2,A12

           STDW    .D1T1   A5:A4,*A12        ; |135| 
||         MVC     .S2     B4,TSCL           ; |115| 

           MVC     .S2     TSCL,B4           ; |116| 
           MVC     .S2     TSCH,B5           ; |116| 

           STDW    .D2T2   B5:B4,*B13        ; |116| 
||         MVC     .S2     TSCL,B6           ; |117| 

           MVC     .S2     TSCH,B8           ; |117| 

           SUBU    .L2     B6,B4,B7:B6       ; |117| 
||         MVKL    .S1     _input,A3

           MV      .L1     A14,A4            ; |117| 
||         SUB     .L2     B8,B5,B4          ; |117| 
||         EXT     .S2     B7,24,24,B5       ; |117| 
||         MVKL    .S1     _t_offset,A14

           ADD     .L2     B4,B5,B7          ; |117| 
||         LDW     .D1T2   *A4,B4            ; |238| 
||         MVKH    .S1     _t_offset,A14

           MVKH    .S1     _input,A3
||         STDW    .D1T2   B7:B6,*A14        ; |117| 

           CALLP   .S2     _asinsp_v,B3
||         LDW     .D1T1   *A3,A4            ; |238| 
||         MVK     .S1     0x80,A6           ; |238| 

$C$RL35:   ; CALL OCCURS {_asinsp_v} {0}     ; |238| 
           MVC     .S2     TSCL,B16          ; |128| 
           MVC     .S2     TSCH,B4           ; |128| 

           LDDW    .D2T2   *B13,B9:B8        ; |130| 
||         LDDW    .D1T1   *A14,A5:A4        ; |130| 

           MVK     .S2     16,B13
           ADD     .L2X    A12,B13,B13
           LDDW    .D2T2   *B13,B7:B6        ; |130| 
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

$C$RL36:   ; CALL OCCURS {__fltllif} {0}     ; |130| 
           ZERO    .L1     A3
           SET     .S1     A3,0x1a,0x1d,A3
           MPYSP   .M1     A3,A4,A3          ; |130| 
           MV      .L1     A10,A12           ; |130| 
           NOP             2
           SPDP    .S1     A3,A5:A4          ; |130| 
           NOP             1
           ADDDP   .L1     A13:A12,A5:A4,A5:A4 ; |130| 
           CALLP   .S2     __fixdlli,B3
$C$RL37:   ; CALL OCCURS {__fixdlli} {0}     ; |130| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 10

           STDW    .D1T1   A11:A10,*+A15(8)  ; |114| 
||         MV      .L2X    A11,B4            ; |114| 

           MVC     .S2     B4,TSCL           ; |115| 
||         STDW    .D2T1   A5:A4,*B13        ; |130| 

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
$C$L21:    
;          EXCLUSIVE CPU CYCLES: 15
           MVC     .S2     TSCL,B4           ; |122| 
           MVC     .S2     TSCH,B5           ; |122| 
           MVKL    .S1     _input,A3
           MVKH    .S1     _input,A3
           LDW     .D1T1   *A3,A3            ; |246| 
           MVKL    .S2     _t_start,B6
           MVKH    .S2     _t_start,B6
           STDW    .D2T2   B5:B4,*B6         ; |122| 
           NOP             1

           ADD     .L1     A11,A3,A3         ; |246| 
||         CALL    .S1     _asinsp           ; |246| 

           LDW     .D1T1   *A3,A4            ; |246| 
           ADDKPC  .S2     $C$RL38,B3,3      ; |246| 
$C$RL38:   ; CALL OCCURS {_asinsp} {0}       ; |246| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 23
           ADD     .L2     4,B12,B4
           LDW     .D2T2   *B4,B4            ; |246| 
           NOP             4
           ADD     .L1X    A11,B4,A3         ; |246| 

           STW     .D1T1   A4,*A3            ; |246| 
||         MVC     .S2     TSCL,B8           ; |128| 

           MVC     .S2     TSCH,B6           ; |128| 

           MVKL    .S2     _t_start,B4
||         MV      .L1     A14,A3            ; |128| 
||         ADDAD   .D1     A15,1,A31
||         SUB     .S1     A10,1,A0          ; |244| 
||         MV      .L2     B6,B9             ; |128| 

           MVKH    .S2     _t_start,B4
||         LDDW    .D1T1   *A3,A5:A4         ; |130| 
||         MVKL    .S1     _t_stop,A30
||         SUB     .L1     A10,1,A10         ; |244| 

           MVKH    .S1     _t_stop,A30
||         ADD     .L1     4,A11,A11         ; |244| 
||         LDDW    .D2T2   *B4,B17:B16       ; |130| 

           MVK     .S2     8,B13
           LDDW    .D1T1   *A31,A7:A6        ; |130| 
           STDW    .D1T2   B9:B8,*A30        ; |128| 
           ADD     .L2X    A15,B13,B13
           ADDU    .L2X    A4,B16,B5:B4      ; |130| 

           SUBU    .L2     B8,B4,B7:B6       ; |130| 
||         ADD     .S2X    B5,A5,B4          ; |130| 
|| [ A0]   B       .S1     $C$L21            ; |244| 

           MV      .L2     B6,B5             ; |130| 
||         ADD     .S2     B4,B17,B4         ; |130| 

           SUB     .D2     B9,B4,B5          ; |130| 
||         ADDU    .L2X    A6,B5,B7:B6       ; |130| 
||         EXT     .S2     B7,24,24,B4       ; |130| 

           ADD     .L2     B5,B4,B5          ; |130| 
||         ADD     .S2X    B7,A7,B4          ; |130| 

           ADD     .L2     B4,B5,B7          ; |130| 

   [!A0]   CALL    .S1     __fltllif         ; |135| 
||         STDW    .D2T2   B7:B6,*B13        ; |130| 

           ; BRANCHCC OCCURS {$C$L21}        ; |244| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           LDDW    .D2T1   *B13,A5:A4        ; |135| 
           ADDKPC  .S2     $C$RL39,B3,3      ; |135| 
$C$RL39:   ; CALL OCCURS {__fltllif} {0}     ; |135| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 55
           ZERO    .L1     A3
           SET     .S1     A3,0x1a,0x1d,A3
           MPYSP   .M1     A3,A4,A3          ; |135| 
           NOP             3
           SPDP    .S1     A3,A5:A4          ; |135| 
           NOP             1
           ADDDP   .L1     A13:A12,A5:A4,A5:A4 ; |135| 
           CALLP   .S2     __fixdlli,B3
$C$RL40:   ; CALL OCCURS {__fixdlli} {0}     ; |135| 
           MVKL    .S2     0xa0b5ed8d,B6
           MVKL    .S2     0x3eb0c6f7,B7

           MV      .L1X    B12,A10           ; |135| 
||         MVKH    .S2     0xa0b5ed8d,B6

           LDW     .D1T2   *+A10(4),B4       ; |66| 
||         STDW    .D2T1   A5:A4,*B13        ; |135| 
||         MVKH    .S2     0x3eb0c6f7,B7

           CALLP   .S2     _isequal,B3
||         LDW     .D1T1   *A10,A4           ; |66| 
||         MVK     .S1     0x80,A6           ; |66| 
||         MVK     .L1     0x1,A8            ; |66| 

$C$RL41:   ; CALL OCCURS {_isequal} {0}      ; |66| 

           MVKL    .S1     _fcn_pass,A3
||         MVKL    .S2     0xa0b5ed8d,B6

           MVKH    .S1     _fcn_pass,A3
||         MVKL    .S2     0x3eb0c6f7,B7

           MVKH    .S2     0xa0b5ed8d,B6

           MV      .L1     A4,A5             ; |66| 
||         LDW     .D1T1   *A10,A4           ; |67| 
||         MV      .L2X    A3,B13            ; |66| 
||         MVKH    .S2     0x3eb0c6f7,B7

           CALLP   .S2     _isequal,B3
||         LDW     .D1T2   *+A10(8),B4       ; |67| 
||         STW     .D2T1   A5,*+B13(4)       ; |66| 
||         MVK     .S1     0x80,A6           ; |67| 
||         MVK     .L1     0x1,A8            ; |67| 

$C$RL42:   ; CALL OCCURS {_isequal} {0}      ; |67| 
           MVKL    .S2     0xa0b5ed8d,B6
           MVKL    .S2     0x3eb0c6f7,B7

           MV      .L1     A4,A3             ; |67| 
||         MVKH    .S2     0xa0b5ed8d,B6

           LDW     .D1T2   *+A10(12),B4      ; |68| 
||         STW     .D2T1   A3,*+B13(8)       ; |67| 
||         MVKH    .S2     0x3eb0c6f7,B7

           CALLP   .S2     _isequal,B3
||         LDW     .D1T1   *A10,A4           ; |68| 
||         MVK     .S1     0x80,A6           ; |68| 
||         MVK     .L1     0x1,A8            ; |68| 

$C$RL43:   ; CALL OCCURS {_isequal} {0}      ; |68| 
           MVKL    .S2     0x3eb0c6f7,B7
           MVKL    .S2     0xa0b5ed8d,B6
           MVKH    .S2     0x3eb0c6f7,B7

           STW     .D2T1   A4,*+B13(12)      ; |68| 
||         MVKH    .S2     0xa0b5ed8d,B6

           CALLP   .S2     _isequal,B3
||         LDW     .D1T2   *+A10(16),B4      ; |69| 
||         LDW     .D2T1   *B12,A4           ; |69| 
||         MVK     .S1     0x80,A6           ; |69| 
||         MVK     .L1     0x1,A8            ; |69| 

$C$RL44:   ; CALL OCCURS {_isequal} {0}      ; |69| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 11
           LDW     .D2T2   *B11,B0           ; |72| 
           STW     .D2T1   A4,*+B13(16)      ; |69| 
           NOP             3

   [!B0]   BNOP    .S1     $C$L22,4          ; |72| 
||         MV      .L2     B0,B1             ; guard predicate rewrite
|| [ B0]   LDW     .D2T2   *B10,B0           ; |72| 

   [ B1]   ADD     .L2     4,B10,B4
           ; BRANCHCC OCCURS {$C$L22}        ; |72| 
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
   [ A0]   B       .S1     $C$L23            ; |72| 
   [ A0]   CALL    .S1     _print_test_results ; |253| 
           MVK     .L1     0x1,A3            ; |72| 
   [ A0]   MVKL    .S1     _all_pass,A4
   [ A0]   MVKH    .S1     _all_pass,A4
           NOP             1
           ; BRANCHCC OCCURS {$C$L23}        ; |72| 
;** --------------------------------------------------------------------------*
$C$L22:    
;          EXCLUSIVE CPU CYCLES: 5
           CALL    .S1     _print_test_results ; |253| 
           MVKL    .S1     _all_pass,A4
           MVKH    .S1     _all_pass,A4
           MV      .L1     A12,A3
           NOP             1
;** --------------------------------------------------------------------------*
$C$L23:    
;          EXCLUSIVE CPU CYCLES: 1

           STW     .D1T1   A3,*A4            ; |72| 
||         MVK     .L1     0x2,A4            ; |253| 
||         ADDKPC  .S2     $C$RL45,B3,0      ; |253| 

$C$RL45:   ; CALL OCCURS {_print_test_results} {0}  ; |253| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 30
           MVKL    .S2     $C$SL2+0,B4
           MVKH    .S2     $C$SL2+0,B4

           CALLP   .S2     _printf,B3
||         STW     .D2T2   B4,*+SP(4)        ; |254| 

$C$RL46:   ; CALL OCCURS {_printf} {0}       ; |254| 
           MVKL    .S2     $C$SL3+0,B4
           MVKH    .S2     $C$SL3+0,B4

           CALLP   .S2     _printf,B3
||         STW     .D2T2   B4,*+SP(4)        ; |254| 

$C$RL47:   ; CALL OCCURS {_printf} {0}       ; |254| 
           MVKL    .S1     $C$SL1+0,A10
           MVKH    .S1     $C$SL1+0,A10

           CALLP   .S2     _print_profile_results,B3
||         MV      .L1     A10,A4            ; |261| 

$C$RL48:   ; CALL OCCURS {_print_profile_results} {0}  ; |261| 

           CALLP   .S2     _print_memory_results,B3
||         MV      .L1     A10,A4            ; |264| 

$C$RL49:   ; CALL OCCURS {_print_memory_results} {0}  ; |264| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 11
           LDW     .D2T2   *++SP(24),B3      ; |265| 
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
$C$SL1:	.string	"asinSP",0
$C$SL2:	.string	"----------------------------------------",0
$C$SL3:	.string	"----------------------------------------",10,0
;*****************************************************************************
;* UNDEFINED EXTERNAL REFERENCES                                             *
;*****************************************************************************
	.global	_printf
	.global	_asinf
	.global	_driver_init
	.global	_print_profile_results
	.global	_print_memory_results
	.global	_print_test_results
	.global	_gimme_random
	.global	_isequal
	.global	_asinsp_c
	.global	_asinsp
	.global	_asinsp_v
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
