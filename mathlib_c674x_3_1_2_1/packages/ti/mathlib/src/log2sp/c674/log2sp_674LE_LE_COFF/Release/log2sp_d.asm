;******************************************************************************
;* TMS320C6x C/C++ Codegen                                          PC v7.4.2 *
;* Date/Time created: Mon May 16 23:49:53 2016                                *
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
	.word	0451b943dh		; _a[0] @ 0
	.word	046138d3bh		; _a[1] @ 32
	.word	045d95bfch		; _a[2] @ 64
	.word	044f1a053h		; _a[3] @ 96
	.word	045249b7dh		; _a[4] @ 128
	.word	04592f9a6h		; _a[5] @ 160
	.word	044045c86h		; _a[6] @ 192
	.word	0451769c3h		; _a[7] @ 224
	.word	0461a7820h		; _a[8] @ 256
	.word	042af4475h		; _a[9] @ 288
	.word	04510e3c4h		; _a[10] @ 320
	.word	045cc1eb3h		; _a[11] @ 352
	.word	0459ccdb4h		; _a[12] @ 384
	.word	046034912h		; _a[13] @ 416
	.word	04599c238h		; _a[14] @ 448
	.word	0456a8a8ah		; _a[15] @ 480
	.word	045085001h		; _a[16] @ 512
	.word	045b9bef4h		; _a[17] @ 544
	.word	04581d7ech		; _a[18] @ 576
	.word	045e0ba99h		; _a[19] @ 608
	.word	0460cf8deh		; _a[20] @ 640
	.word	0451cb21dh		; _a[21] @ 672
	.word	04613227ch		; _a[22] @ 704
	.word	0454da5ceh		; _a[23] @ 736
	.word	045cbe0eah		; _a[24] @ 768
	.word	044943e9fh		; _a[25] @ 800
	.word	0455b9d3ah		; _a[26] @ 832
	.word	044eee802h		; _a[27] @ 864
	.word	04611124eh		; _a[28] @ 896
	.word	046071e7ah		; _a[29] @ 928
	.word	0451fd402h		; _a[30] @ 960
	.word	045c5da1dh		; _a[31] @ 992
	.word	045a2731fh		; _a[32] @ 1024
	.word	04598f737h		; _a[33] @ 1056
	.word	045c3e5e8h		; _a[34] @ 1088
	.word	0455204aah		; _a[35] @ 1120
	.word	045b0cca5h		; _a[36] @ 1152
	.word	04558c5aah		; _a[37] @ 1184
	.word	045f216eeh		; _a[38] @ 1216
	.word	0454c262eh		; _a[39] @ 1248
	.word	045a9b1adh		; _a[40] @ 1280
	.word	0449baae4h		; _a[41] @ 1312
	.word	0455da619h		; _a[42] @ 1344
	.word	04616420ah		; _a[43] @ 1376
	.word	045302cbfh		; _a[44] @ 1408
	.word	0460525f0h		; _a[45] @ 1440
	.word	045610c33h		; _a[46] @ 1472
	.word	046149718h		; _a[47] @ 1504
	.word	0461481c0h		; _a[48] @ 1536
	.word	0461061cdh		; _a[49] @ 1568
	.word	044a248a7h		; _a[50] @ 1600
	.word	0455873ddh		; _a[51] @ 1632
	.word	0441172c6h		; _a[52] @ 1664
	.word	044047101h		; _a[53] @ 1696
	.word	0455c2f21h		; _a[54] @ 1728
	.word	045a7e951h		; _a[55] @ 1760
	.word	045912cdch		; _a[56] @ 1792
	.word	045414c87h		; _a[57] @ 1824
	.word	04405c101h		; _a[58] @ 1856
	.word	04529251ah		; _a[59] @ 1888
	.word	04564f5b7h		; _a[60] @ 1920
	.word	04482ab1ch		; _a[61] @ 1952
	.word	045bd25d6h		; _a[62] @ 1984
	.word	045c3f12dh		; _a[63] @ 2016
	.word	0453f5255h		; _a[64] @ 2048
	.word	044eb74bdh		; _a[65] @ 2080
	.word	045e14381h		; _a[66] @ 2112
	.word	043a2c826h		; _a[67] @ 2144
	.word	044dbe056h		; _a[68] @ 2176
	.word	045d1d6d1h		; _a[69] @ 2208
	.word	04590b70fh		; _a[70] @ 2240
	.word	045220333h		; _a[71] @ 2272
	.word	045007068h		; _a[72] @ 2304
	.word	046199263h		; _a[73] @ 2336
	.word	04513de7fh		; _a[74] @ 2368
	.word	045822aaah		; _a[75] @ 2400
	.word	0461702b1h		; _a[76] @ 2432
	.word	0460e98c1h		; _a[77] @ 2464
	.word	045f4e8b5h		; _a[78] @ 2496
	.word	046168f77h		; _a[79] @ 2528
	.word	0456f9d2fh		; _a[80] @ 2560
	.word	045b93401h		; _a[81] @ 2592
	.word	044f02a83h		; _a[82] @ 2624
	.word	045dc4702h		; _a[83] @ 2656
	.word	045df8454h		; _a[84] @ 2688
	.word	04598b88bh		; _a[85] @ 2720
	.word	0460dc397h		; _a[86] @ 2752
	.word	045f4b0a9h		; _a[87] @ 2784
	.word	045b22874h		; _a[88] @ 2816
	.word	04586e31ch		; _a[89] @ 2848
	.word	045dacf37h		; _a[90] @ 2880
	.word	045d78d77h		; _a[91] @ 2912
	.word	0460bb19bh		; _a[92] @ 2944
	.word	045b24739h		; _a[93] @ 2976
	.word	045d82584h		; _a[94] @ 3008
	.word	0451cd74ch		; _a[95] @ 3040
	.word	04619818dh		; _a[96] @ 3072
	.word	04583114ah		; _a[97] @ 3104
	.word	045597c65h		; _a[98] @ 3136
	.word	045cc4143h		; _a[99] @ 3168
	.word	04594d7f9h		; _a[100] @ 3200
	.word	045ffd8c8h		; _a[101] @ 3232
	.word	045978f44h		; _a[102] @ 3264
	.word	04580530dh		; _a[103] @ 3296
	.word	0455b27c4h		; _a[104] @ 3328
	.word	04615b1f8h		; _a[105] @ 3360
	.word	0451b34afh		; _a[106] @ 3392
	.word	04572d7bdh		; _a[107] @ 3424
	.word	04611e7d5h		; _a[108] @ 3456
	.word	045703bbbh		; _a[109] @ 3488
	.word	044a6a411h		; _a[110] @ 3520
	.word	045f759fah		; _a[111] @ 3552
	.word	0460bef19h		; _a[112] @ 3584
	.word	04617b602h		; _a[113] @ 3616
	.word	04619dd8dh		; _a[114] @ 3648
	.word	044dd46e5h		; _a[115] @ 3680
	.word	0451acb43h		; _a[116] @ 3712
	.word	04612e6e1h		; _a[117] @ 3744
	.word	0461a7f6ah		; _a[118] @ 3776
	.word	0458874cch		; _a[119] @ 3808
	.word	045592618h		; _a[120] @ 3840
	.word	046066814h		; _a[121] @ 3872
	.word	045d14798h		; _a[122] @ 3904
	.word	045fd858bh		; _a[123] @ 3936
	.word	0460b08b0h		; _a[124] @ 3968
	.word	045c97e81h		; _a[125] @ 4000
	.word	0460cd0bch		; _a[126] @ 4032
	.word	046096dc0h		; _a[127] @ 4064
	.word	046103d6fh		; _a[128] @ 4096
	.word	045aa6f8bh		; _a[129] @ 4128
	.word	0460bc9fbh		; _a[130] @ 4160
	.word	045b33bc0h		; _a[131] @ 4192
	.word	046023f33h		; _a[132] @ 4224
	.word	044cbb94eh		; _a[133] @ 4256
	.word	04506409fh		; _a[134] @ 4288
	.word	044c70c96h		; _a[135] @ 4320
	.word	0455c8ae2h		; _a[136] @ 4352
	.word	045885f70h		; _a[137] @ 4384
	.word	045eee1f4h		; _a[138] @ 4416
	.word	0451d982bh		; _a[139] @ 4448
	.word	045ae82d3h		; _a[140] @ 4480
	.word	045cb179bh		; _a[141] @ 4512
	.word	045f61d2ah		; _a[142] @ 4544
	.word	045fcee28h		; _a[143] @ 4576
	.word	0460697f6h		; _a[144] @ 4608
	.word	04589d91ah		; _a[145] @ 4640
	.word	04609331dh		; _a[146] @ 4672
	.word	044abb02bh		; _a[147] @ 4704
	.word	04396a4dfh		; _a[148] @ 4736
	.word	045f1dd70h		; _a[149] @ 4768
	.word	0461729cch		; _a[150] @ 4800
	.word	046090153h		; _a[151] @ 4832
	.word	044d5d584h		; _a[152] @ 4864
	.word	046181528h		; _a[153] @ 4896
	.word	0454feca4h		; _a[154] @ 4928
	.word	043071dadh		; _a[155] @ 4960
	.word	045e391beh		; _a[156] @ 4992
	.word	045da2210h		; _a[157] @ 5024
	.word	045bba960h		; _a[158] @ 5056
	.word	0460a02e7h		; _a[159] @ 5088
	.word	0459e542ch		; _a[160] @ 5120
	.word	04614d5c0h		; _a[161] @ 5152
	.word	045e3515dh		; _a[162] @ 5184
	.word	044d583a6h		; _a[163] @ 5216
	.word	045c4df9ch		; _a[164] @ 5248
	.word	04445550ah		; _a[165] @ 5280
	.word	043ae8d86h		; _a[166] @ 5312
	.word	046097323h		; _a[167] @ 5344
	.word	045b89309h		; _a[168] @ 5376
	.word	045f40348h		; _a[169] @ 5408
	.word	044d0bf74h		; _a[170] @ 5440
	.word	04573918ah		; _a[171] @ 5472
	.word	045016f82h		; _a[172] @ 5504
	.word	04450bbb9h		; _a[173] @ 5536
	.word	0449bcd3bh		; _a[174] @ 5568
	.word	045772e55h		; _a[175] @ 5600
	.word	045cccc83h		; _a[176] @ 5632
	.word	04569abc6h		; _a[177] @ 5664
	.word	04517c709h		; _a[178] @ 5696
	.word	04616aea8h		; _a[179] @ 5728
	.word	0458899dah		; _a[180] @ 5760
	.word	04568cef4h		; _a[181] @ 5792
	.word	0450813bah		; _a[182] @ 5824
	.word	045941ba3h		; _a[183] @ 5856
	.word	04581dd0ch		; _a[184] @ 5888
	.word	044b5dcd0h		; _a[185] @ 5920
	.word	0441f2aedh		; _a[186] @ 5952
	.word	045d2f7a7h		; _a[187] @ 5984
	.word	045f62592h		; _a[188] @ 6016
	.word	04487c01ch		; _a[189] @ 6048
	.word	044c84e12h		; _a[190] @ 6080
	.word	045ca9e1dh		; _a[191] @ 6112
	.word	04479663ah		; _a[192] @ 6144
	.word	042e2dd0dh		; _a[193] @ 6176
	.word	0450c6f52h		; _a[194] @ 6208
	.word	045ff0c98h		; _a[195] @ 6240
	.word	045160d8dh		; _a[196] @ 6272
	.word	0461444f6h		; _a[197] @ 6304
	.word	04543086ch		; _a[198] @ 6336
	.word	0461478aeh		; _a[199] @ 6368
	.word	04587c610h		; _a[200] @ 6400
$C$IR_1:	.set	804

	.global	_a
_a:	.usect	".far",804,8
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
;*   Local Frame Size  : 8 Args + 100 Auto + 56 Save = 164 byte               *
;******************************************************************************
_main:
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 12
           STW     .D2T1   A11,*SP--(8)      ; |132| 
           STW     .D2T1   A10,*SP--(8)      ; |132| 
           STDW    .D2T2   B13:B12,*SP--     ; |132| 
           STDW    .D2T2   B11:B10,*SP--     ; |132| 
           STDW    .D2T1   A15:A14,*SP--     ; |132| 

           STDW    .D2T1   A13:A12,*SP--     ; |132| 
||         MVKL    .S1     $C$SL1+0,A4

           STW     .D2T2   B3,*SP--(120)     ; |132| 
||         CALLP   .S2     _driver_init,B3
||         MVKH    .S1     $C$SL1+0,A4

$C$RL0:    ; CALL OCCURS {_driver_init} {0}  ; |140| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 3

           MVK     .S2     0xc9,B4
||         MVKL    .S1     _a,A11

           MVKH    .S1     _a,A11
||         MVKL    .S2     _output,B10

           CALL    .S1     _log2f            ; |149| 
||         MV      .L1     A11,A13
||         MV      .D1X    B4,A10
||         MVKH    .S2     _output,B10
||         ZERO    .L2     B11

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L1:    
;          EXCLUSIVE CPU CYCLES: 5
           LDW     .D1T1   *A13++,A4         ; |149| 
           ADDKPC  .S2     $C$RL1,B3,3       ; |149| 
$C$RL1:    ; CALL OCCURS {_log2f} {0}        ; |149| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 7

           LDW     .D2T2   *B10,B4           ; |149| 
||         SUB     .L1     A10,1,A0          ; |148| 
||         SUB     .S1     A10,1,A10         ; |148| 

   [ A0]   BNOP    .S1     $C$L1,3           ; |148| 
|| [!A0]   ADD     .L2     4,B10,B5

           ADD     .L2     B11,B4,B4         ; |149| 
||         ADD     .S2     4,B11,B11         ; |148| 

   [ A0]   CALL    .S1     _log2f            ; |149| 
||         STW     .D2T1   A4,*B4            ; |149| 
|| [!A0]   MVK     .S2     0xc9,B4

           ; BRANCHCC OCCURS {$C$L1}         ; |148| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 2

           ZERO    .L2     B11
||         STW     .D2T2   B5,*+SP(60)
||         MV      .L1     A11,A12

           MV      .L1X    B4,A10
||         CALL    .S1     _log2sp           ; |152| 

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L2:    
;          EXCLUSIVE CPU CYCLES: 5
           LDW     .D1T1   *A11++,A4         ; |152| 
           ADDKPC  .S2     $C$RL2,B3,3       ; |152| 
$C$RL2:    ; CALL OCCURS {_log2sp} {0}       ; |152| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 12
           LDW     .D2T2   *+SP(60),B4       ; |152| 
           SUB     .L1     A10,1,A0          ; |151| 
           SUB     .L1     A10,1,A10         ; |151| 
           NOP             2
           LDW     .D2T2   *B4,B4            ; |152| 
   [ A0]   BNOP    .S1     $C$L2,3           ; |151| 

           ADD     .L2     B11,B4,B4         ; |152| 
||         ADD     .S2     4,B11,B11         ; |151| 

   [ A0]   CALL    .S1     _log2sp           ; |152| 
||         STW     .D2T1   A4,*B4            ; |152| 

           ; BRANCHCC OCCURS {$C$L2}         ; |151| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 7
           LDW     .D2T2   *+SP(60),B4
           MVK     .S2     0xc9,B5
           ZERO    .L2     B11
           MV      .L1     A12,A11
           MV      .L1X    B5,A10
           ADD     .L2     4,B4,B4

           STW     .D2T2   B4,*+SP(64)
||         CALL    .S1     _log2sp_c         ; |155| 

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L3:    
;          EXCLUSIVE CPU CYCLES: 5
           LDW     .D1T1   *A11++,A4         ; |155| 
           ADDKPC  .S2     $C$RL3,B3,3       ; |155| 
$C$RL3:    ; CALL OCCURS {_log2sp_c} {0}     ; |155| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 12

           LDW     .D2T2   *+SP(64),B4       ; |155| 
||         SUB     .L1     A10,1,A0          ; |154| 
||         SUB     .S1     A10,1,A10         ; |154| 

   [!A0]   ZERO    .L2     B6
|| [!A0]   MVKL    .S1     0x3eaaa872,A5

   [!A0]   MVKL    .S2     0xbf000003,B5
   [!A0]   LDW     .D2T2   *+SP(64),B31
   [!A0]   MVKL    .S1     0xbe6bd0fc,A3
           LDW     .D2T2   *B4,B4            ; |155| 
   [ A0]   BNOP    .S1     $C$L3,3           ; |154| 

           ADD     .L2     B11,B4,B4         ; |155| 
||         ADD     .S2     4,B11,B11         ; |154| 

   [ A0]   CALL    .S2     _log2sp_c         ; |155| 
||         STW     .D2T1   A4,*B4            ; |155| 
|| [!A0]   MVKL    .S1     0x3e436581,A4

           ; BRANCHCC OCCURS {$C$L3}         ; |154| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 16

           SET     .S2     B6,0x14,0x1d,B24
||         MVKL    .S1     0xfefa39ec,A10
||         ZERO    .L2     B6
||         ZERO    .D2     B9

           MVKL    .S2     0x3fb8aa3b,B4
||         MVKL    .S1     0x3fe62e42,A11
||         ADD     .L2     4,B31,B13
||         ZERO    .D2     B16               ; |83| 

           MVK     .S1     0xfffffc01,A6
||         MVKL    .S2     0xbe804d66,B7
||         LDW     .D2T2   *B13,B18
||         MV      .L2X    A12,B17

           MVKL    .S1     0x3ff71547,A9
||         MVKL    .S2     _ti_math_logtable,B8
||         STW     .D2T1   A6,*+SP(32)

           MVKL    .S1     0x652b83a3,A8
||         MVKH    .S2     0xbf000003,B5
||         MV      .L2X    A6,B22

           MVKL    .S1     0x7f7fffff,A14
||         MVKH    .S2     0xff800000,B6
||         STW     .D2T2   B5,*+SP(28)

           MVKH    .S1     0x3eaaa872,A5
||         MVKH    .S2     0x3fb8aa3b,B4
||         STW     .D2T2   B6,*+SP(40)
||         MV      .L2     B6,B20

           MVKH    .S1     0xbe6bd0fc,A3
||         MVKH    .S2     0xbe804d66,B7
||         STW     .D2T2   B4,*+SP(12)
||         ZERO    .L2     B6                ; |83| 

           MVKH    .S1     0x3e436581,A4
||         MVKH    .S2     _ti_math_logtable,B8
||         MV      .L2     B7,B25
||         MV      .D2     B24,B7

           MVKH    .S1     0xfefa39ec,A10
||         MVKH    .S2     0x44800000,B9
||         STW     .D2T2   B8,*+SP(36)
||         MV      .L2X    A5,B23

           MVKH    .S1     0x3fe62e42,A11
||         MV      .L1     A10,A16
||         STW     .D2T2   B9,*+SP(44)
||         DINT                              ; interrupts off
||         MV      .L2X    A4,B24

           MVKH    .S1     0x3ff71547,A9
||         MV      .L1     A11,A17
||         STW     .D2T1   A4,*+SP(20)
||         ZERO    .D1     A4                ; |83| 
||         MV      .L2X    A3,B26
||         MV      .S2     B8,B21

           MVKH    .S1     0x652b83a3,A8
||         STW     .D2T1   A9,*+SP(56)       ; |83| 
||         MV      .L1     A9,A19
||         MV      .L2     B9,B19
||         MV      .S2     B4,B27

           MVKH    .S1     0x7f7fffff,A14
||         STW     .D2T1   A8,*+SP(52)       ; |83| 
||         MV      .L1     A8,A18

           MVK     .S1     0xc9,A7
||         STW     .D2T1   A3,*+SP(16)
||         MV      .L1     A14,A3

           STW     .D2T1   A5,*+SP(24)
||         MV      .L1X    B5,A5
||         SUB     .S1     A7,1,A1

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*
;*      Loop found in file               : C:/nightlybuilds/mathlib/ti/mathlib/src/log2sp/log2sp_d.c
;*      Loop source line                 : 157
;*      Loop opening brace source line   : 157
;*      Loop closing brace source line   : 159
;*      Known Minimum Trip Count         : 201                    
;*      Known Maximum Trip Count         : 201                    
;*      Known Max Trip Count Factor      : 201
;*      Loop Carried Dependency Bound(^) : 73
;*      Unpartitioned Resource Bound     : 13
;*      Partitioned Resource Bound(*)    : 13
;*      Resource Partition:
;*                                A-side   B-side
;*      .L units                     0        4     
;*      .S units                     3        9     
;*      .D units                     0        3     
;*      .M units                    13*      10     
;*      .X cross paths              12        2     
;*      .T address paths             0        3     
;*      Long read paths              0        0     
;*      Long write paths             0        0     
;*      Logical  ops (.LS)           4        8     (.L or .S unit)
;*      Addition ops (.LSD)          0        7     (.L or .S or .D unit)
;*      Bound(.L .S .LS)             4       11     
;*      Bound(.L .S .D .LS .LSD)     3       11     
;*
;*      Searching for software pipeline schedule at ...
;*         ii = 73 Did not find schedule
;*         ii = 74 Schedule found with 1 iterations in parallel
;*
;*      Register Usage Table:
;*          +-----------------------------------------------------------------+
;*          |AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA|BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB|
;*          |00000000001111111111222222222233|00000000001111111111222222222233|
;*          |01234567890123456789012345678901|01234567890123456789012345678901|
;*          |--------------------------------+--------------------------------|
;*       0: | * ***  **      ****            |      **        ************    |
;*       1: | * ***  **      ****            |      **        ************    |
;*       2: | * ***  **      ****            |      **        ************    |
;*       3: | * ***  **      ****            |      **        ************    |
;*       4: | * ***  **      ****            |      **        ************    |
;*       5: | * ***  **      ****            |      **        *************   |
;*       6: | * ***  **      ****            |      **        *************   |
;*       7: | * ***  **      ****            |    ****        *************   |
;*       8: | * ***  **      ****            |      **        *************   |
;*       9: | * ***  **      ****            |     ***        *************   |
;*      10: | * ***  **      ****            |      ** *      *************   |
;*      11: | * ***  **      ****            |    ******      *************   |
;*      12: | * ***  **      ****            |    *****       **************  |
;*      13: | * ***  **      ****            |      ***       **************  |
;*      14: | * ***  **      ****            |      ***       **************  |
;*      15: | * ***  **      ****            |      ***       **************  |
;*      16: | * ***  **      ****            |      ***       **************  |
;*      17: | * ***  **      ****            |      ***       **************  |
;*      18: | * ***  **      ****            |    ****        **************  |
;*      19: | * ***  **      ****            |    ****        **************  |
;*      20: | * ***  **      ****            |      **        **************  |
;*      21: | * ***  **      ****            |      **        **************  |
;*      22: | * ***  **      ****            |    ****        **************  |
;*      23: | * ***  **      ****            |    ****        **************  |
;*      24: | * ***  **      ****            |    ****        **************  |
;*      25: | * ***  **      ****            |    ******      **************  |
;*      26: | * ***  **      ****            |    ******      **************  |
;*      27: | * ***  **      ****            |      ****      **************  |
;*      28: | * ***  **      ****            |      ****      **************  |
;*      29: | * ***  **      ****            |      ****      **************  |
;*      30: | * ***  **      ****            |      ****      **************  |
;*      31: | * ***  **      ****            |      **        **************  |
;*      32: | * ***  **      ****            |      **        **************  |
;*      33: | * *******      ****            |    *****       **************  |
;*      34: | * *******      ****            |    ******      *************   |
;*      35: | * ***  **      ****            |      ***       *************   |
;*      36: | * ***  **      ****            |      **        *************   |
;*      37: | * ***  **      ******          |    * **        *************   |
;*      38: | * ***  **      ******          |    ****        *************   |
;*      39: | * ***  **      *******         |      ***       *************   |
;*      40: | * *******      *******         |      ***       *************   |
;*      41: | * *******      *******         |    * ***       *************   |
;*      42: | * *******      *******         |    *****       *************   |
;*      43: | * *******      *******         |    * **        *************   |
;*      44: | * ***  **      *******         |    * **        *************   |
;*      45: | * ***  **      *******         |    * **        *************   |
;*      46: | * ***  **      *******         |    ****        *************   |
;*      47: | * ***  **      *******         |      **        *************   |
;*      48: | * ***  **      *******         |      **        *************   |
;*      49: | * ***  **      *******         |      **        *************   |
;*      50: | * *******      *******         |    * **        *************   |
;*      51: | * *******      ******          |      **        *************   |
;*      52: | * ***  **      ****            |      **        *************   |
;*      53: | * ***  **      ****            |      **        *************   |
;*      54: | * ***  **      ****            |    * **        *************   |
;*      55: | * ***  **      ****            |      **        *************   |
;*      56: | * ***  **      ****            |      **        *************   |
;*      57: | * *******      ****            |      **        *************   |
;*      58: | * *******      ****            |    * **        *************   |
;*      59: | * *******      ****            |      **        *************   |
;*      60: | * *******      ****            |    ****        *************   |
;*      61: | * *******      ****            |    ****        *************   |
;*      62: | * ***  **      ****            |      **        *************   |
;*      63: | * ***  **      ****            |      **        *************   |
;*      64: | * ***  **      ****            |      **        *************   |
;*      65: | * ***  **      ****            |      **        *************   |
;*      66: | * ***  **      ****            |      **        *************   |
;*      67: | * ***  **      ****            |    ****        *************   |
;*      68: | * ***  **      ****            |      **        *************   |
;*      69: | * ***  **      ****            |      **        *************   |
;*      70: | * ***  **      ****            |      **        *************   |
;*      71: |** ***  **      ****            |    * **        *************   |
;*      72: |** ***  **      ****            |    * **        ************    |
;*      73: | * ***  **      ****            |    ****        ************    |
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
;*      Total cycles (est.)         : 0 + min_trip_cnt * 74 = 14874        
;*----------------------------------------------------------------------------*
;*       SETUP CODE
;*
;*                  SUB             A1,1,A1
;*
;*        SINGLE SCHEDULED ITERATION
;*
;*        $C$C100:
;*   0              LDW     .D2T2   *B17++,B28        ; |83|  ^ 
;*   1              NOP             4
;*   5              SPDP    .S2     B28,B5:B4         ; |83|  ^ 
;*   6              NOP             1
;*   7              RCPDP   .S2     B5:B4,B5:B4       ; |83|  ^ 
;*   8              NOP             1
;*   9              CLR     .S2     B5,0,16,B9        ; |83|  ^ 
;*  10              MV      .D2     B9,B5             ; |83|  ^ 
;*     ||           MV      .L2     B16,B4            ; |83| 
;*     ||           EXTU    .S2     B9,1,21,B8        ; |83| 
;*  11              MPYSPDP .M2     B28,B5:B4,B5:B4   ; |83|  ^ 
;*     ||           ADD     .L2     B22,B8,B8         ; |83| 
;*     ||           EXTU    .S2     B9,12,29,B29      ; |83| 
;*  12              NOP             5
;*  17              INTDP   .L2     B8,B5:B4          ; |83| 
;*  18              SUBDP   .L2     B5:B4,B7:B6,B9:B8 ; |83|  ^ 
;*  19              NOP             4
;*  23              MPYDP   .M1X    A17:A16,B5:B4,A7:A6 ; |83| 
;*  24              NOP             1
;*  25              DPSP    .L2     B9:B8,B29         ; |83|  ^ 
;*  26              NOP             1
;*  27              MPYDP   .M1X    A9:A8,B9:B8,A21:A20 ; |83| 
;*  28              LDDW    .D2T2   *+B21[B29],B5:B4  ; |83| 
;*  29              MPYSP   .M2     B29,B29,B8        ; |83|  ^ 
;*  30              MPYSP   .M2     B24,B29,B9        ; |83|  ^ 
;*  31              NOP             2
;*  33              SUBDP   .L1X    B5:B4,A7:A6,A7:A6 ; |83| 
;*     ||           MPYSP   .M2     B8,B29,B4         ; |83| 
;*  34              ADDSP   .L2     B25,B9,B4         ; |83|  ^ 
;*     ||           MPYSP   .M2     B26,B8,B5         ; |83|  ^ 
;*  35              MPYSP   .M2     B8,B8,B8          ; |83| 
;*     ||           MPYSP   .M1X    A5,B8,A22         ; |83| 
;*  36              NOP             1
;*  37              MPYSP   .M2     B23,B4,B4         ; |83| 
;*  38              ADDSP   .L2     B5,B4,B5          ; |83|  ^ 
;*  39              NOP             1
;*  40              MPYDP   .M1     A19:A18,A7:A6,A7:A6 ; |83| 
;*  41              NOP             1
;*  42              MPYSP   .M2     B8,B5,B5          ; |83|  ^ 
;*  43              NOP             3
;*  46              ADDSP   .L2     B5,B4,B4          ; |83|  ^ 
;*  47              NOP             3
;*  50              ADDDP   .L1     A7:A6,A21:A20,A7:A6 ; |83| 
;*     ||           ADDSP   .L2X    B4,A22,B4         ; |83|  ^ 
;*  51              NOP             3
;*  54              MPYSP   .M2     B27,B4,B4         ; |83|  ^ 
;*  55              NOP             3
;*  58              SPDP    .S2     B4,B5:B4          ; |83|  ^ 
;*  59              NOP             1
;*  60              ADDDP   .L2X    B5:B4,A7:A6,B5:B4 ; |83|  ^ 
;*  61              NOP             6
;*  67              DPSP    .L2     B5:B4,B4          ; |83|  ^ 
;*  68      [ A1]   BDEC    .S1     $C$C100,A1        ; |157| 
;*  69              NOP             1
;*  70              CMPGTSP .S1X    B28,A4,A0         ; |83| 
;*  71      [!A0]   MV      .L2     B20,B4            ; |83| 
;*     ||           CMPGTSP .S1X    B28,A3,A0         ; |83| 
;*  72      [!A0]   MV      .S2     B4,B5             ; |83|  ^ 
;*     ||   [ A0]   MV      .L2     B19,B5            ; |83| 
;*  73              STW     .D2T2   B5,*B18++         ; |83|  ^ 
;*  74              ; BRANCHCC OCCURS {$C$C100}       ; |157| 
;*----------------------------------------------------------------------------*
$C$L4:    ; PIPED LOOP PROLOG
;** --------------------------------------------------------------------------*
$C$L5:    ; PIPED LOOP KERNEL
;          EXCLUSIVE CPU CYCLES: 74
           LDW     .D2T2   *B17++,B28        ; |83| <0,0>  ^ 
           NOP             4
           SPDP    .S2     B28,B5:B4         ; |83| <0,5>  ^ 
           NOP             1
           RCPDP   .S2     B5:B4,B5:B4       ; |83| <0,7>  ^ 
           NOP             1
           CLR     .S2     B5,0,16,B9        ; |83| <0,9>  ^ 

           MV      .L2     B16,B4            ; |83| <0,10> 
||         EXTU    .S2     B9,1,21,B8        ; |83| <0,10> 
||         MV      .D2     B9,B5             ; |83| <0,10>  ^ 

           EXTU    .S2     B9,12,29,B29      ; |83| <0,11> 
||         ADD     .L2     B22,B8,B8         ; |83| <0,11> 
||         MPYSPDP .M2     B28,B5:B4,B5:B4   ; |83| <0,11>  ^ 

           NOP             5
           INTDP   .L2     B8,B5:B4          ; |83| <0,17> 
           SUBDP   .L2     B5:B4,B7:B6,B9:B8 ; |83| <0,18>  ^ 
           NOP             4
           MPYDP   .M1X    A17:A16,B5:B4,A7:A6 ; |83| <0,23> 
           NOP             1
           DPSP    .L2     B9:B8,B29         ; |83| <0,25>  ^ 
           NOP             1
           MPYDP   .M1X    A9:A8,B9:B8,A21:A20 ; |83| <0,27> 
           LDDW    .D2T2   *+B21[B29],B5:B4  ; |83| <0,28> 
           MPYSP   .M2     B29,B29,B8        ; |83| <0,29>  ^ 
           MPYSP   .M2     B24,B29,B9        ; |83| <0,30>  ^ 
           NOP             2

           SUBDP   .L1X    B5:B4,A7:A6,A7:A6 ; |83| <0,33> 
||         MPYSP   .M2     B8,B29,B4         ; |83| <0,33> 

           MPYSP   .M2     B26,B8,B5         ; |83| <0,34>  ^ 
||         ADDSP   .L2     B25,B9,B4         ; |83| <0,34>  ^ 

           MPYSP   .M1X    A5,B8,A22         ; |83| <0,35> 
||         MPYSP   .M2     B8,B8,B8          ; |83| <0,35> 

           NOP             1
           MPYSP   .M2     B23,B4,B4         ; |83| <0,37> 
           ADDSP   .L2     B5,B4,B5          ; |83| <0,38>  ^ 
           NOP             1
           MPYDP   .M1     A19:A18,A7:A6,A7:A6 ; |83| <0,40> 
           NOP             1
           MPYSP   .M2     B8,B5,B5          ; |83| <0,42>  ^ 
           NOP             3
           ADDSP   .L2     B5,B4,B4          ; |83| <0,46>  ^ 
           NOP             3

           ADDDP   .L1     A7:A6,A21:A20,A7:A6 ; |83| <0,50> 
||         ADDSP   .L2X    B4,A22,B4         ; |83| <0,50>  ^ 

           NOP             3
           MPYSP   .M2     B27,B4,B4         ; |83| <0,54>  ^ 
           NOP             3
           SPDP    .S2     B4,B5:B4          ; |83| <0,58>  ^ 
           NOP             1
           ADDDP   .L2X    B5:B4,A7:A6,B5:B4 ; |83| <0,60>  ^ 
           NOP             6
           DPSP    .L2     B5:B4,B4          ; |83| <0,67>  ^ 
   [ A1]   BDEC    .S1     $C$L5,A1          ; |157| <0,68> 
           NOP             1
           CMPGTSP .S1X    B28,A4,A0         ; |83| <0,70> 

           CMPGTSP .S1X    B28,A3,A0         ; |83| <0,71> 
|| [!A0]   MV      .L2     B20,B4            ; |83| <0,71> 

   [ A0]   MV      .L2     B19,B5            ; |83| <0,72> 
|| [!A0]   MV      .S2     B4,B5             ; |83| <0,72>  ^ 

           STW     .D2T2   B5,*B18++         ; |83| <0,73>  ^ 
;** --------------------------------------------------------------------------*
$C$L6:    ; PIPED LOOP EPILOG
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 17
           STW     .D2T2   B26,*+SP(16)
           STW     .D2T2   B24,*+SP(20)
           STW     .D2T2   B23,*+SP(24)
           STW     .D2T2   B22,*+SP(32)
           STW     .D2T2   B21,*+SP(36)
           STW     .D2T2   B20,*+SP(40)
           STW     .D2T2   B19,*+SP(44)
           STW     .D2T1   A19,*+SP(56)
           STW     .D2T1   A18,*+SP(52)

           MV      .L1     A4,A13
||         STW     .D2T1   A5,*+SP(28)

           RINT                              ; interrupts on
||         MV      .L1     A3,A14
||         MV      .D1     A16,A10
||         STW     .D2T2   B27,*+SP(12)
||         MVK     .S1     0xc9,A6           ; |160| 

           CALLP   .S2     _log2sp_v,B3
||         LDW     .D2T2   *+B10(16),B4      ; |160| 
||         MV      .L1     A12,A4            ; |160| 
||         MV      .L2     B7,B12
||         MV      .S1     A17,A11
||         MV      .D1X    B25,A15

$C$RL4:    ; CALL OCCURS {_log2sp_v} {0}     ; |160| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 48
           MVKL    .S2     0x3ee4f8b5,B7
           MVKL    .S2     0x88e368f1,B6
           MVKH    .S2     0x3ee4f8b5,B7

           LDW     .D2T1   *B10,A4           ; |66| 
||         MVKH    .S2     0x88e368f1,B6

           CALLP   .S2     _isequal,B3
||         LDW     .D2T2   *+B10(4),B4       ; |66| 
||         MVK     .S1     0xc9,A6           ; |66| 
||         MVK     .L1     0x1,A8            ; |66| 

$C$RL5:    ; CALL OCCURS {_isequal} {0}      ; |66| 
           MVKL    .S2     _fcn_pass,B6
           MVKL    .S2     0x3ee4f8b5,B7
           MVKH    .S2     _fcn_pass,B6
           MVKH    .S2     0x3ee4f8b5,B7

           STW     .D2T1   A4,*+B6(4)        ; |66| 
||         MVKL    .S2     0x88e368f1,B6

           LDW     .D2T2   *+B10(8),B4       ; |67| 
||         MVKH    .S2     0x88e368f1,B6

           CALLP   .S2     _isequal,B3
||         LDW     .D2T1   *B10,A4           ; |67| 
||         MVK     .S1     0xc9,A6           ; |67| 
||         MVK     .L1     0x1,A8            ; |67| 

$C$RL6:    ; CALL OCCURS {_isequal} {0}      ; |67| 
           MVKL    .S2     _fcn_pass,B6
           MVKL    .S2     0x3ee4f8b5,B7
           MVKH    .S2     _fcn_pass,B6
           MVKH    .S2     0x3ee4f8b5,B7

           STW     .D2T1   A4,*+B6(8)        ; |67| 
||         MVKL    .S2     0x88e368f1,B6

           MV      .L2     B10,B5
||         LDW     .D2T2   *+B10(12),B4      ; |68| 
||         MVKH    .S2     0x88e368f1,B6

           CALLP   .S2     _isequal,B3
||         LDW     .D2T1   *B5,A4            ; |68| 
||         MVK     .S1     0xc9,A6           ; |68| 
||         MVK     .L1     0x1,A8            ; |68| 

$C$RL7:    ; CALL OCCURS {_isequal} {0}      ; |68| 
           MVKL    .S2     _fcn_pass,B4
           MVKL    .S2     0x3ee4f8b5,B7
           MVKL    .S2     0x88e368f1,B6
           MVKH    .S2     _fcn_pass,B4
           MVKL    .S2     _output,B31
           MVKH    .S2     0x3ee4f8b5,B7

           ADD     .L1X    4,B13,A3
||         STW     .D2T1   A4,*+B4(12)       ; |68| 
||         MVKH    .S2     0x88e368f1,B6

           MVKH    .S2     _output,B31
||         STW     .D2T1   A3,*+SP(68)

           CALLP   .S2     _isequal,B3
||         LDW     .D1T2   *A3,B4            ; |69| 
||         LDW     .D2T1   *B31,A4           ; |69| 
||         MVK     .S1     0xc9,A6           ; |69| 
||         MVK     .L1     0x1,A8            ; |69| 

$C$RL8:    ; CALL OCCURS {_isequal} {0}      ; |69| 
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
           STW     .D2T2   B4,*+SP(76)       ; |69| 
           STW     .D2T1   A3,*+SP(72)

   [!A0]   B       .S1     $C$L7             ; |72| 
|| [ A0]   LDW     .D2T2   *B4,B0            ; |72| 

   [!A0]   CALL    .S1     _print_test_results ; |164| 
   [!A0]   ZERO    .L1     A3                ; |72| 
   [ A0]   ADD     .L2     4,B4,B4
   [!A0]   MVKL    .S1     _all_pass,A4
   [!A0]   MVKH    .S1     _all_pass,A4
           ; BRANCHCC OCCURS {$C$L7}         ; |72| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 10
   [ B0]   LDW     .D2T2   *B4,B4            ; |72| 
           CMPEQ   .L1     A4,0,A3           ; |72| 
           XOR     .L1     1,A3,A3           ; |72| 
   [!B0]   ZERO    .L1     A0                ; |72| 
           NOP             1
   [ B0]   CMPEQ   .L2     B4,0,B4           ; |72| 
   [ B0]   XOR     .L2     1,B4,B4           ; |72| 
           NOP             1

   [ B0]   AND     .L1X    A3,B4,A0          ; |72| 
||         MVK     .S1     0x1,A3            ; |72| 

   [!A0]   ZERO    .L1     A3                ; |72| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           CALL    .S1     _print_test_results ; |164| 
           MVKL    .S1     _all_pass,A4
           MVKH    .S1     _all_pass,A4
           NOP             2
;** --------------------------------------------------------------------------*
$C$L7:    
;          EXCLUSIVE CPU CYCLES: 1

           STW     .D1T1   A3,*A4            ; |72| 
||         MVK     .L1     0x1,A4            ; |164| 
||         ADDKPC  .S2     $C$RL9,B3,0       ; |164| 

$C$RL9:    ; CALL OCCURS {_print_test_results} {0}  ; |164| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 14

           MVKL    .S2     _a_sc,B4
||         MVK     .L2     -1,B6             ; |177| 
||         ZERO    .D2     B11

           MVKH    .S2     _a_sc,B4
||         ZERO    .L2     B10
||         MVK     .D2     0x7,B29

           LDW     .D2T2   *+SP(40),B5       ; |177| 
||         MV      .L2     B4,B7             ; |172| 
||         MVKL    .S2     0x7f7fffff,B31

           STW     .D2T2   B6,*+B7(24)       ; |177| 
||         MV      .L2     B7,B6
||         MVKH    .S2     0xbf800000,B11

           ZERO    .L1     A5
||         MV      .L2     B6,B30            ; |174| 
||         SET     .S2     B10,0x17,0x1d,B10
||         STW     .D2T2   B29,*+SP(48)      ; |176| 

           MVKH    .S2     0x7f7fffff,B31
||         MVKH    .S1     0x80000000,A5
||         MV      .L1     A13,A4            ; |172| 
||         STDW    .D2T2   B11:B10,*+B30(16) ; |176| 

           MV      .L1X    B4,A12            ; |172| 
||         ADD     .L2     1,B31,B4
||         STDW    .D2T1   A5:A4,*B30        ; |172| 

           STDW    .D2T2   B5:B4,*+B6(8)     ; |174| 
           LDW     .D1T1   *A12,A3           ; |179| 
           CALL    .S1     _log2             ; |179| 
           ZERO    .L2     B10
           NOP             2
           SPDP    .S1     A3,A5:A4          ; |179| 
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains control code
;*----------------------------------------------------------------------------*
$C$L8:    
;          EXCLUSIVE CPU CYCLES: 1
           ADDKPC  .S2     $C$RL10,B3,0      ; |179| 
$C$RL10:   ; CALL OCCURS {_log2} {0}         ; |179| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 15
           MVKL    .S2     _output,B4
           MVKH    .S2     _output,B4
           LDW     .D2T2   *B4,B4            ; |179| 
           DPSP    .L1     A5:A4,A3          ; |179| 
           NOP             3
           ADD     .L2     B10,B4,B4         ; |179| 
           STW     .D2T1   A3,*B4            ; |179| 

           CALLP   .S2     ___isinff,B3
||         LDW     .D1T1   *A12,A4           ; |180| 

$C$RL11:   ; CALL OCCURS {___isinff} {0}     ; |180| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 7
           MV      .L1     A4,A0             ; |180| 

           MV      .L1     A0,A2             ; |180| branch predicate copy
|| [ A0]   LDW     .D1T1   *A12,A3           ; |180| 
|| [!A0]   B       .S1     $C$L10            ; |180| 

   [!A2]   CALL    .S1     _log2sp           ; |180| 
   [!A2]   LDW     .D1T1   *A12,A4           ; |180| 
           NOP             2
           CMPGTSP .S1     A3,A13,A0         ; |180| 
           ; BRANCHCC OCCURS {$C$L10}        ; |180| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 6
   [!A0]   B       .S1     $C$L9             ; |180| 
   [ A0]   CALL    .S1     _log2             ; |180| 
   [ A0]   SPDP    .S1     A3,A5:A4          ; |180| 
           NOP             3
           ; BRANCHCC OCCURS {$C$L9}         ; |180| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 1
           ADDKPC  .S2     $C$RL12,B3,0      ; |180| 
$C$RL12:   ; CALL OCCURS {_log2} {0}         ; |180| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 6

           B       .S1     $C$L11            ; |180| 
||         DPSP    .L1     A5:A4,A3          ; |180| 
||         MVKL    .S2     _output,B5

           MVKH    .S2     _output,B5
           LDW     .D2T2   *+B5(4),B5        ; |180| 
           NOP             2
           MV      .L2X    A3,B4             ; |180| 
           ; BRANCH OCCURS {$C$L11}          ; |180| 
;** --------------------------------------------------------------------------*
$C$L9:    
;          EXCLUSIVE CPU CYCLES: 5
           CALL    .S1     _log2sp           ; |180| 
           LDW     .D1T1   *A12,A4           ; |180| 
           NOP             3
;** --------------------------------------------------------------------------*
$C$L10:    
;          EXCLUSIVE CPU CYCLES: 1
           ADDKPC  .S2     $C$RL13,B3,0      ; |180| 
$C$RL13:   ; CALL OCCURS {_log2sp} {0}       ; |180| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 8
           SPDP    .S1     A4,A5:A4          ; |180| 
           MVKL    .S2     _output,B5
           DPSP    .L1     A5:A4,A3          ; |180| 
           MVKH    .S2     _output,B5
           LDW     .D2T2   *+B5(4),B5        ; |180| 
           NOP             2
           MV      .L2X    A3,B4             ; |180| 
;** --------------------------------------------------------------------------*
$C$L11:    
;          EXCLUSIVE CPU CYCLES: 8
           NOP             1
           ADD     .L2     B10,B5,B5         ; |180| 

           STW     .D2T2   B4,*B5            ; |180| 
||         CALL    .S1     _log2sp_c         ; |181| 

           LDW     .D1T1   *A12,A4           ; |181| 
           ADDKPC  .S2     $C$RL14,B3,3      ; |181| 
$C$RL14:   ; CALL OCCURS {_log2sp_c} {0}     ; |181| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 91
           MVKL    .S2     _output,B4
           MVKH    .S2     _output,B4
           LDW     .D2T2   *+B4(8),B4        ; |181| 
           ZERO    .L1     A8                ; |83| 
           ZERO    .L1     A9
           LDW     .D2T1   *+SP(32),A6       ; |83| 
           LDW     .D2T1   *+SP(36),A30      ; |83| 
           ADD     .L2     B10,B4,B4         ; |181| 
           STW     .D2T1   A4,*B4            ; |181| 
           LDW     .D1T1   *A12++,A3         ; |182| 
           SET     .S1     A9,0x14,0x1d,A9
           MVKL    .S2     0x3fe62e42,B5
           LDW     .D2T1   *+SP(20),A29      ; |83| 
           MVKH    .S2     0x3fe62e42,B5
           SPDP    .S1     A3,A5:A4          ; |83| 
           MVKL    .S2     0x3ff71547,B7
           RCPDP   .S1     A5:A4,A5:A4       ; |83| 
           LDW     .D2T1   *+SP(16),A28      ; |83| 

           CLR     .S1     A5,0,16,A16       ; |83| 
||         ZERO    .L1     A4                ; |83| 

           MV      .L1     A16,A5            ; |83| 
           MPYSPDP .M1     A3,A5:A4,A5:A4    ; |83| 
           EXTU    .S1     A16,1,21,A7       ; |83| 
           ADD     .L1     A6,A7,A6          ; |83| 
           INTDP   .L1     A6,A7:A6          ; |83| 
           LDW     .D2T1   *+SP(24),A26      ; |83| 
           MVKL    .S2     0x652b83a3,B6
           MVKL    .S2     0xfefa39ec,B4
           SUBDP   .L1     A5:A4,A9:A8,A5:A4 ; |83| 
           MVKH    .S2     0xfefa39ec,B4
           MPYDP   .M2X    B5:B4,A7:A6,B5:B4 ; |83| 
           LDW     .D2T2   *+SP(28),B8       ; |83| 
           MVKH    .S2     0x3ff71547,B7
           EXTU    .S1     A16,12,29,A31     ; |83| 
           LDDW    .D1T1   *+A30[A31],A9:A8  ; |83| 
           DPSP    .L1     A5:A4,A17         ; |83| 
           MVKH    .S2     0x652b83a3,B6
           MV      .L1X    B7,A7             ; |83| 
           LDW     .D2T2   *+SP(12),B31      ; |83| 
           MPYSP   .M1     A17,A17,A16       ; |83| 
           MPYSP   .M1     A29,A17,A6        ; |83| 
           SUBDP   .L2X    A9:A8,B5:B4,B5:B4 ; |83| 
           MVKL    .S2     _output+12,B30
           MPYSP   .M1     A28,A16,A9        ; |83| 

           ADDSP   .L1     A15,A6,A8         ; |83| 
||         MV      .S1X    B6,A6             ; |83| 

           MPYDP   .M2X    B7:B6,A5:A4,B7:B6 ; |83| 
           MPYSP   .M1     A16,A16,A27       ; |83| 
           MPYSP   .M1     A16,A17,A4        ; |83| 
           ADDSP   .L1     A9,A8,A5          ; |83| 
           MVKH    .S2     _output+12,B30
           CMPGTSP .S1     A3,A13,A1         ; |85| 
           MPYSP   .M1     A26,A4,A4         ; |83| 
           MPYSP   .M1     A27,A5,A5         ; |83| 
           MPYSP   .M2X    B8,A16,B8         ; |83| 
           MPYDP   .M2X    A7:A6,B5:B4,B5:B4 ; |83| 
           CMPGTSP .S1     A3,A14,A0         ; |88| 
           ADDSP   .L1     A5,A4,A4          ; |83| 
           NOP             4
           ADDSP   .L2X    A4,B8,B8          ; |83| 
           NOP             2
           ADDDP   .L2     B5:B4,B7:B6,B5:B4 ; |83| 
           MPYSP   .M2     B31,B8,B6         ; |83| 
           NOP             3
           SPDP    .S2     B6,B7:B6          ; |83| 
           NOP             1
           ADDDP   .L2     B7:B6,B5:B4,B5:B4 ; |83| 
           LDW     .D2T2   *B30,B6           ; |182| 
           NOP             5

           DPSP    .L2     B5:B4,B4          ; |83| 
|| [!A1]   LDW     .D2T2   *+SP(40),B4       ; |88| 
||         ADD     .S2     B10,B6,B5         ; |182| 

   [ A0]   LDW     .D2T2   *+SP(44),B4       ; |86| 
           LDW     .D2T2   *+SP(48),B6       ; |89| 
           ADD     .S2     4,B10,B10         ; |178| 
           NOP             2
           STW     .D2T2   B4,*B5            ; |182| 

           SUB     .L1X    B6,1,A0           ; |178| 
||         SUB     .L2     B6,1,B4           ; |178| 

   [ A0]   LDW     .D1T1   *A12,A3           ; |179| 
|| [ A0]   B       .S1     $C$L8             ; |178| 
|| [!A0]   MVKL    .S2     _output,B10
||         STW     .D2T2   B4,*+SP(48)       ; |182| 

   [ A0]   CALL    .S1     _log2             ; |179| 
|| [!A0]   MVKH    .S2     _output,B10

   [!A0]   CALL    .S1     _log2sp_v         ; |184| 
   [!A0]   LDW     .D2T2   *+B10(16),B4      ; |184| 
   [!A0]   MVKL    .S1     _a_sc,A4
   [ A0]   SPDP    .S1     A3,A5:A4          ; |179| 
           ; BRANCHCC OCCURS {$C$L8}         ; |178| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 2
           MVK     .L1     0x7,A6            ; |184| 

           ADDKPC  .S2     $C$RL15,B3,0      ; |184| 
||         MVKH    .S1     _a_sc,A4

$C$RL15:   ; CALL OCCURS {_log2sp_v} {0}     ; |184| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 46
           MVKL    .S2     0x3ee4f8b5,B7
           MVKL    .S2     0x88e368f1,B6
           MVKH    .S2     0x3ee4f8b5,B7

           LDW     .D2T1   *B10,A4           ; |66| 
||         MVKH    .S2     0x88e368f1,B6

           CALLP   .S2     _isequal,B3
||         LDW     .D2T2   *+B10(4),B4       ; |66| 
||         MVK     .L1     0x7,A6            ; |66| 
||         MVK     .S1     0x1,A8            ; |66| 

$C$RL16:   ; CALL OCCURS {_isequal} {0}      ; |66| 
           MVKL    .S2     _fcn_pass,B5
           MVKL    .S2     0x3ee4f8b5,B7
           MVKH    .S2     _fcn_pass,B5
           MVKL    .S2     0x88e368f1,B6

           LDW     .D2T2   *+B10(8),B4       ; |67| 
||         MVKH    .S2     0x3ee4f8b5,B7

           STW     .D2T1   A4,*+B5(4)        ; |66| 
||         MVKH    .S2     0x88e368f1,B6

           CALLP   .S2     _isequal,B3
||         LDW     .D2T1   *B10,A4           ; |67| 
||         MVK     .L1     0x7,A6            ; |67| 
||         MVK     .S1     0x1,A8            ; |67| 

$C$RL17:   ; CALL OCCURS {_isequal} {0}      ; |67| 
           MVKL    .S2     _fcn_pass,B5
           MVKL    .S2     0x3ee4f8b5,B7
           MVKL    .S2     0x88e368f1,B6
           MVKH    .S2     _fcn_pass,B5
           MVKH    .S2     0x3ee4f8b5,B7

           MV      .L1X    B10,A3            ; |67| 
||         STW     .D2T1   A4,*+B5(8)        ; |67| 
||         MVKH    .S2     0x88e368f1,B6

           CALLP   .S2     _isequal,B3
||         LDW     .D1T1   *A3,A4            ; |68| 
||         LDW     .D2T2   *+B10(12),B4      ; |68| 
||         MVK     .L1     0x7,A6            ; |68| 
||         MVK     .S1     0x1,A8            ; |68| 

$C$RL18:   ; CALL OCCURS {_isequal} {0}      ; |68| 

           LDW     .D2T1   *+SP(68),A3       ; |68| 
||         MVKL    .S2     _fcn_pass,B4

           MVKL    .S2     0x88e368f1,B6
           MVKL    .S2     0x3ee4f8b5,B7
           MVKH    .S2     _fcn_pass,B4

           STW     .D2T1   A4,*+B4(12)       ; |68| 
||         MVKH    .S2     0x88e368f1,B6

           MV      .L2     B10,B31           ; |69| 
||         STW     .D2T1   A3,*+SP(80)       ; |68| 
||         MVKH    .S2     0x3ee4f8b5,B7

           CALLP   .S2     _isequal,B3
||         LDW     .D1T2   *A3,B4            ; |69| 
||         LDW     .D2T1   *B31,A4           ; |69| 
||         MVK     .L1     0x7,A6            ; |69| 
||         MVK     .S1     0x1,A8            ; |69| 

$C$RL19:   ; CALL OCCURS {_isequal} {0}      ; |69| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 17
           LDW     .D2T1   *+SP(72),A3       ; |69| 
           MVKL    .S2     _fcn_pass,B31
           MVKH    .S2     _fcn_pass,B31
           STW     .D2T1   A4,*+B31(16)      ; |69| 
           STW     .D2T2   B11,*+SP(48)      ; |69| 

           MV      .L2X    A3,B4             ; |176| 
||         STW     .D2T1   A3,*+SP(84)       ; |176| 

           LDW     .D2T2   *B4,B0            ; |72| 
           LDW     .D2T1   *+SP(76),A3
           NOP             3

   [!B0]   B       .S1     $C$L12            ; |72| 
|| [!B0]   ZERO    .L1     A4                ; |72| 
||         MV      .L2     B0,B1             ; guard predicate rewrite

   [!B0]   CALL    .S2     _print_test_results ; |188| 
|| [ B0]   MV      .L2X    A3,B4
||         STW     .D2T1   A3,*+SP(88)       ; |72| 
|| [!B0]   MVKL    .S1     _all_pass,A3

   [!B0]   MVKH    .S1     _all_pass,A3
|| [ B0]   LDW     .D2T2   *B4,B0            ; |72| 

   [ B1]   ADD     .L2     4,B4,B4
           NOP             2
           ; BRANCHCC OCCURS {$C$L12}        ; |72| 
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
           CALL    .S1     _print_test_results ; |188| 
           MVKL    .S1     _all_pass,A3
           MVKH    .S1     _all_pass,A3
           NOP             2
;** --------------------------------------------------------------------------*
$C$L12:    
;          EXCLUSIVE CPU CYCLES: 1

           STW     .D1T1   A4,*A3            ; |72| 
||         MVK     .L1     0x3,A4            ; |188| 
||         ADDKPC  .S2     $C$RL20,B3,0      ; |188| 

$C$RL20:   ; CALL OCCURS {_print_test_results} {0}  ; |188| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 16

           LDW     .D2T2   *+SP(56),B11      ; |83| 
||         MVKL    .S2     0xc000cccc,B5

           LDW     .D2T2   *+SP(52),B10      ; |83| 
||         MVK     .S2     0xed,B30

           MVKL    .S2     0xcccccccd,B31
||         ZERO    .L1     A4                ; |83| 
||         STW     .D2T2   B12,*+SP(92)      ; |83| 

           MVKL    .S2     _a_ext,B4
||         STW     .D2T1   A4,*+SP(56)       ; |191| 

           MVKH    .S2     0xc000cccc,B5
||         STW     .D2T2   B30,*+SP(52)      ; |191| 

           ZERO    .L1     A3
||         MVKH    .S2     0xcccccccd,B31
||         STW     .D2T2   B5,*+SP(108)      ; |197| 

           MVKH    .S2     _a_ext,B4
||         SET     .S1     A3,0x17,0x17,A3
||         STW     .D2T2   B31,*+SP(104)     ; |197| 

           STW     .D2T1   A3,*B4            ; |191| 
           STW     .D2T2   B10,*+SP(96)      ; |83| 

           STW     .D2T2   B11,*+SP(100)     ; |83| 
||         MV      .L1X    B4,A12            ; |191| 

           LDW     .D1T1   *A12,A3           ; |193| 
           ZERO    .L2     B12               ; |83| 
           NOP             2
           CALL    .S1     _log2             ; |193| 
           SPDP    .S2X    A3,B5:B4          ; |193| 
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L13:    
;          EXCLUSIVE CPU CYCLES: 4
           NOP             2
           MV      .L1X    B5,A5             ; |193| 

           MV      .L1X    B4,A4             ; |193| 
||         ADDKPC  .S2     $C$RL21,B3,0      ; |193| 

$C$RL21:   ; CALL OCCURS {_log2} {0}         ; |193| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 30
           MVKL    .S2     _output,B4
           MVKH    .S2     _output,B4
           LDW     .D2T2   *B4,B4            ; |193| 
           DPSP    .L1     A5:A4,A3          ; |193| 
           NOP             3
           ADD     .L2     B12,B4,B4         ; |193| 
           STW     .D2T1   A3,*B4            ; |193| 

           CALLP   .S2     _log2sp,B3
||         LDW     .D1T1   *A12,A4           ; |194| 

$C$RL22:   ; CALL OCCURS {_log2sp} {0}       ; |194| 
           MVKL    .S2     _output,B4
           MVKH    .S2     _output,B4
           LDW     .D2T2   *+B4(4),B4        ; |194| 
           MV      .L2X    A4,B5             ; |194| 
           NOP             3
           ADD     .L2     B12,B4,B4         ; |194| 
           STW     .D2T2   B5,*B4            ; |194| 

           CALLP   .S2     _log2sp_c,B3
||         LDW     .D1T1   *A12,A4           ; |195| 

$C$RL23:   ; CALL OCCURS {_log2sp_c} {0}     ; |195| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 109
           MVKL    .S2     _output,B4
           MVKH    .S2     _output,B4
           LDW     .D2T2   *+B4(8),B4        ; |195| 
           LDW     .D2T1   *+SP(32),A30      ; |83| 
           MV      .L2     B11,B5            ; |83| 
           LDW     .D2T1   *+SP(36),A28      ; |83| 
           LDW     .D2T1   *+SP(20),A18      ; |83| 
           ADD     .L2     B12,B4,B4         ; |195| 
           STW     .D2T1   A4,*B4            ; |195| 
           LDW     .D1T1   *A12,A3           ; |196| 
           LDW     .D2T1   *+SP(16),A27
           LDW     .D2T1   *+SP(24),A25      ; |83| 
           LDW     .D2T2   *+SP(28),B8       ; |83| 
           MV      .L2     B10,B4            ; |83| 
           SPDP    .S1     A3,A5:A4          ; |83| 
           LDW     .D2T2   *+SP(12),B31      ; |83| 
           RCPDP   .S1     A5:A4,A5:A4       ; |83| 
           LDW     .D2T2   *B13,B30          ; |196| 

           CLR     .S1     A5,0,16,A16       ; |83| 
||         ZERO    .L1     A4                ; |83| 

           MV      .L1     A16,A5            ; |83| 
||         EXTU    .S1     A16,1,21,A31      ; |83| 

           MPYSPDP .M1     A3,A5:A4,A9:A8    ; |83| 
||         LDW     .D2T1   *+SP(92),A5       ; |83| 

           ADD     .L1     A30,A31,A4        ; |83| 

           INTDP   .L1     A4,A7:A6          ; |83| 
||         LDW     .D2T1   *+SP(56),A4       ; |83| 

           EXTU    .S1     A16,12,29,A29     ; |83| 
           CMPGTSP .S1     A3,A13,A1         ; |85| 
           CMPGTSP .S1     A3,A14,A0         ; |88| 
           ADD     .L2     B12,B30,B29       ; |196| 
           SUBDP   .L1     A9:A8,A5:A4,A9:A8 ; |83| 
           MPYDP   .M1     A11:A10,A7:A6,A5:A4 ; |83| 
           LDDW    .D1T1   *+A28[A29],A7:A6  ; |83| 
           ADD     .L2     4,B12,B12         ; |192| 
           NOP             3
           DPSP    .L1     A9:A8,A17         ; |83| 
           MPYDP   .M2X    B11:B10,A9:A8,B7:B6 ; |83| 
           NOP             2
           MPYSP   .M1     A17,A17,A16       ; |83| 
           MPYSP   .M1     A18,A17,A18       ; |83| 
           SUBDP   .S1     A7:A6,A5:A4,A5:A4 ; |83| 
           NOP             1
           MPYSP   .M1     A27,A16,A7        ; |83| 
           ADDSP   .L1     A15,A18,A6        ; |83| 
           MPYSP   .M1     A16,A16,A26       ; |83| 
           MPYSP   .M1     A16,A17,A8        ; |83| 
           MPYSP   .M2X    B8,A16,B8         ; |83| 
           ADDSP   .L1     A7,A6,A6          ; |83| 
           MPYDP   .M2X    B5:B4,A5:A4,B5:B4 ; |83| 
           MPYSP   .M1     A25,A8,A4         ; |83| 
           NOP             1
           MPYSP   .M1     A26,A6,A5         ; |83| 
           NOP             3
           ADDSP   .L1     A5,A4,A4          ; |83| 
           NOP             4
           ADDSP   .L2X    A4,B8,B8          ; |83| 
           ADDDP   .L2     B5:B4,B7:B6,B5:B4 ; |83| 
           NOP             2
           MPYSP   .M2     B31,B8,B6         ; |83| 
           NOP             3
           SPDP    .S2     B6,B7:B6          ; |83| 
           NOP             1
           ADDDP   .L2     B7:B6,B5:B4,B5:B4 ; |83| 
           NOP             6

           DPSP    .L2     B5:B4,B4          ; |83| 
|| [!A1]   LDW     .D2T2   *+SP(40),B4       ; |88| 

   [ A0]   LDW     .D2T2   *+SP(44),B4       ; |86| 
           LDW     .D2T2   *+SP(108),B5
           NOP             3
           STW     .D2T2   B4,*B29           ; |196| 
           LDW     .D1T2   *A12,B6           ; |197| 
           LDW     .D2T2   *+SP(104),B4
           NOP             4
           MPYSPDP .M2     B6,B5:B4,B5:B4    ; |197| 
           NOP             6

           DPSP    .L2     B5:B4,B4          ; |197| 
||         LDW     .D2T2   *+SP(52),B5

           NOP             3
           STW     .D1T2   B4,*++A12         ; |197| 

           SUB     .L1X    B5,1,A0           ; |192| 
||         SUB     .L2     B5,1,B4           ; |192| 

   [ A0]   BNOP    .S1     $C$L13,1          ; |192| 
|| [ A0]   LDW     .D1T1   *A12,A3           ; |193| 
|| [!A0]   MVKL    .S2     _output,B10
||         STW     .D2T2   B4,*+SP(52)       ; |197| 

   [!A0]   MVKL    .S1     _a_ext,A4
   [!A0]   MVKH    .S2     _output,B10
   [ A0]   CALL    .S1     _log2             ; |193| 

   [!A0]   CALL    .S1     _log2sp_v         ; |199| 
||         SPDP    .S2X    A3,B5:B4          ; |193| 
|| [!A0]   LDW     .D2T2   *+B10(16),B4      ; |199| 

           ; BRANCHCC OCCURS {$C$L13}        ; |192| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           MVKH    .S1     _a_ext,A4
           MVK     .S1     0xed,A6           ; |199| 
           ADDKPC  .S2     $C$RL24,B3,2      ; |199| 
$C$RL24:   ; CALL OCCURS {_log2sp_v} {0}     ; |199| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 43
           MVKL    .S2     0x3ee4f8b5,B7
           MVKL    .S2     0x88e368f1,B6
           MVKH    .S2     0x3ee4f8b5,B7

           LDW     .D2T1   *B10,A4           ; |66| 
||         MVKH    .S2     0x88e368f1,B6

           CALLP   .S2     _isequal,B3
||         LDW     .D2T2   *+B10(4),B4       ; |66| 
||         MVK     .S1     0xed,A6           ; |66| 
||         MVK     .L1     0x1,A8            ; |66| 

$C$RL25:   ; CALL OCCURS {_isequal} {0}      ; |66| 
           MVKL    .S2     _fcn_pass,B11
           MVKL    .S2     0x3ee4f8b5,B7
           MVKH    .S2     _fcn_pass,B11
           MVKL    .S2     0x88e368f1,B6

           LDW     .D2T2   *+B10(8),B4       ; |67| 
||         MVKH    .S2     0x3ee4f8b5,B7

           STW     .D2T1   A4,*+B11(4)       ; |66| 
||         MVKH    .S2     0x88e368f1,B6

           CALLP   .S2     _isequal,B3
||         LDW     .D2T1   *B10,A4           ; |67| 
||         MVK     .S1     0xed,A6           ; |67| 
||         MVK     .L1     0x1,A8            ; |67| 

$C$RL26:   ; CALL OCCURS {_isequal} {0}      ; |67| 
           MVKL    .S2     0x3ee4f8b5,B7
           MVKL    .S2     0x88e368f1,B6
           MVKH    .S2     0x3ee4f8b5,B7

           MV      .L1X    B10,A3            ; |67| 
||         STW     .D2T1   A4,*+B11(8)       ; |67| 
||         MVKH    .S2     0x88e368f1,B6

           CALLP   .S2     _isequal,B3
||         LDW     .D1T1   *A3,A4            ; |68| 
||         LDW     .D2T2   *+B10(12),B4      ; |68| 
||         MVK     .S1     0xed,A6           ; |68| 
||         MVK     .L1     0x1,A8            ; |68| 

$C$RL27:   ; CALL OCCURS {_isequal} {0}      ; |68| 
           LDW     .D2T1   *+SP(68),A3       ; |68| 
           MVKL    .S2     0x3ee4f8b5,B7
           MVKL    .S2     0x88e368f1,B6
           MVKH    .S2     0x3ee4f8b5,B7

           MV      .L2     B10,B4            ; |68| 
||         STW     .D2T1   A4,*+B11(12)      ; |68| 
||         MVKH    .S2     0x88e368f1,B6

           CALLP   .S2     _isequal,B3
||         LDW     .D2T1   *B4,A4            ; |69| 
||         LDW     .D1T2   *A3,B4            ; |69| 
||         MVK     .S1     0xed,A6           ; |69| 
||         MVK     .L1     0x1,A8            ; |69| 

$C$RL28:   ; CALL OCCURS {_isequal} {0}      ; |69| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 16
           LDW     .D2T1   *+SP(72),A3       ; |69| 
           LDW     .D2T2   *+SP(76),B4
           STW     .D2T1   A4,*+B11(16)      ; |69| 
           NOP             2
           LDW     .D1T1   *A3,A0            ; |72| 
           NOP             4

   [!A0]   B       .S1     $C$L14            ; |72| 
|| [ A0]   LDW     .D2T2   *B4,B0            ; |72| 

   [!A0]   CALL    .S1     _print_test_results ; |203| 
   [ A0]   ADD     .L2     4,B4,B4
   [!A0]   ZERO    .L1     A3                ; |72| 
   [!A0]   MVKL    .S1     _all_pass,A4
   [!A0]   MVKH    .S1     _all_pass,A4
           ; BRANCHCC OCCURS {$C$L14}        ; |72| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 10
   [ B0]   LDW     .D2T2   *B4,B4            ; |72| 
           CMPEQ   .L1     A4,0,A3           ; |72| 
           XOR     .L1     1,A3,A3           ; |72| 
   [!B0]   ZERO    .L1     A0                ; |72| 
           NOP             1
   [ B0]   CMPEQ   .L2     B4,0,B4           ; |72| 
   [ B0]   XOR     .L2     1,B4,B4           ; |72| 
           NOP             1

   [ B0]   AND     .L1X    A3,B4,A0          ; |72| 
||         MVK     .S1     0x1,A3            ; |72| 

   [!A0]   ZERO    .L1     A3                ; |72| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           CALL    .S1     _print_test_results ; |203| 
           MVKL    .S1     _all_pass,A4
           MVKH    .S1     _all_pass,A4
           NOP             2
;** --------------------------------------------------------------------------*
$C$L14:    
;          EXCLUSIVE CPU CYCLES: 1

           STW     .D1T1   A3,*A4            ; |72| 
||         MVK     .L1     0x4,A4            ; |203| 
||         ADDKPC  .S2     $C$RL29,B3,0      ; |203| 

$C$RL29:   ; CALL OCCURS {_print_test_results} {0}  ; |203| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 15

           ZERO    .L2     B5                ; |114| 
||         ZERO    .D2     B4                ; |114| 
||         MVKL    .S2     _cycle_counts+24,B7

           MVKH    .S2     _cycle_counts+24,B7
||         STW     .D2T2   B4,*+SP(52)       ; |114| 
||         ZERO    .L2     B6                ; |114| 

           MVC     .S2     B6,TSCL           ; |115| 
||         STDW    .D2T2   B5:B4,*B7         ; |114| 

           MVC     .S2     TSCL,B4           ; |116| 
           MVC     .S2     TSCH,B5           ; |116| 
           MVKL    .S1     _t_start,A3
           MVKH    .S1     _t_start,A3

           MVC     .S2     TSCL,B6           ; |117| 
||         STDW    .D1T2   B5:B4,*A3         ; |116| 

           MVC     .S2     TSCH,B8           ; |117| 
           MVKL    .S1     0x461c4400,A12
           MVKL    .S1     _t_offset,A3

           SUBU    .L2     B6,B4,B7:B6       ; |117| 
||         MVKH    .S1     0x461c4400,A12

           CALL    .S1     _gimme_random     ; |213| 
||         EXT     .S2     B7,24,24,B5       ; |117| 
||         SUB     .L2     B8,B5,B4          ; |117| 

           LDW     .D2T2   *+SP(48),B4       ; |213| 
||         ADD     .L2     B4,B5,B7          ; |117| 
||         MVKH    .S1     _t_offset,A3

           STDW    .D1T2   B7:B6,*A3         ; |117| 
||         MV      .L1     A12,A4            ; |213| 
||         MVK     .S1     0x80,A10
||         ZERO    .L2     B10

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L15:    
;          EXCLUSIVE CPU CYCLES: 3
           ADDKPC  .S2     $C$RL30,B3,2      ; |213| 
$C$RL30:   ; CALL OCCURS {_gimme_random} {0}  ; |213| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 96
           MVKL    .S2     _input,B13
           MVKH    .S2     _input,B13
           LDW     .D2T2   *B13,B4           ; |213| 
           NOP             4
           ADD     .L2     B10,B4,B4         ; |213| 

           STW     .D2T1   A4,*B4            ; |213| 
||         MVC     .S2     TSCL,B4           ; |122| 

           MVC     .S2     TSCH,B5           ; |122| 

           SPDP    .S1     A4,A7:A6          ; |83| 
||         LDW     .D2T1   *+SP(32),A5       ; |83| 
||         ZERO    .L1     A17
||         ZERO    .D1     A16               ; |83| 
||         MVKL    .S2     0xfefa39ec,B6

           MVKL    .S2     0x3fe62e42,B7
||         LDW     .D2T1   *+SP(36),A30      ; |83| 

           LDW     .D2T1   *+SP(20),A29      ; |83| 
||         RCPDP   .S1     A7:A6,A7:A6       ; |83| 

           MVKH    .S2     0xfefa39ec,B6

           CLR     .S1     A7,0,16,A3        ; |83| 
||         ZERO    .L1     A6                ; |83| 

           MV      .L1     A3,A7             ; |83| 
           MPYSPDP .M1     A4,A7:A6,A7:A6    ; |83| 
           LDW     .D2T1   *+SP(16),A28      ; |83| 
           MVKH    .S2     0x3fe62e42,B7
           EXTU    .S1     A3,1,21,A8        ; |83| 
           ADD     .L1     A5,A8,A5          ; |83| 
           INTDP   .L1     A5,A9:A8          ; |83| 
           SET     .S1     A17,0x14,0x1d,A17
           SUBDP   .L1     A7:A6,A17:A16,A7:A6 ; |83| 
           LDW     .D2T1   *+SP(24),A25      ; |83| 
           MVKL    .S2     0x3ff71547,B9
           LDW     .D2T2   *+SP(28),B16      ; |83| 
           MPYDP   .M2X    B7:B6,A9:A8,B7:B6 ; |83| 
           MVKL    .S2     0x652b83a3,B8
           MVKH    .S2     0x3ff71547,B9
           DPSP    .L1     A7:A6,A5          ; |83| 
           EXTU    .S1     A3,12,29,A31      ; |83| 
           LDDW    .D1T1   *+A30[A31],A17:A16 ; |83| 
           MVKH    .S2     0x652b83a3,B8
           MPYSP   .M1     A5,A5,A3          ; |83| 
           MPYSP   .M1     A29,A5,A8         ; |83| 
           MV      .L1X    B9,A9             ; |83| 
           SUBDP   .L2X    A17:A16,B7:B6,B7:B6 ; |83| 
           MPYSP   .M1     A28,A3,A17        ; |83| 

           ADDSP   .L1     A15,A8,A27        ; |83| 
||         MV      .S1X    B8,A8             ; |83| 

           MPYSP   .M1     A3,A3,A26         ; |83| 
           MPYDP   .M2X    B9:B8,A7:A6,B9:B8 ; |83| 
           MPYSP   .M1     A3,A5,A5          ; |83| 
           ADDSP   .L1     A17,A27,A6        ; |83| 
           LDW     .D2T2   *+SP(12),B31      ; |83| 
           CMPGTSP .S1     A4,A13,A1         ; |85| 
           MPYSP   .M1     A25,A5,A5         ; |83| 
           MPYSP   .M1     A26,A6,A6         ; |83| 
           MPYSP   .M2X    B16,A3,B16        ; |83| 
           MPYDP   .M2X    A9:A8,B7:B6,B7:B6 ; |83| 
           MVKL    .S2     _output+12,B30
           ADDSP   .L1     A6,A5,A5          ; |83| 
           CMPGTSP .S1     A4,A14,A0         ; |88| 
           MVKH    .S2     _output+12,B30
           MVKL    .S2     _t_start,B12
           MVKH    .S2     _t_start,B12
           ADDSP   .L2X    A5,B16,B16        ; |83| 
           STDW    .D2T2   B5:B4,*B12
           NOP             1
           ADDDP   .L2     B7:B6,B9:B8,B7:B6 ; |83| 
           MPYSP   .M2     B31,B16,B8        ; |83| 
           NOP             3
           SPDP    .S2     B8,B9:B8          ; |83| 
           NOP             1
           ADDDP   .L2     B9:B8,B7:B6,B7:B6 ; |83| 
           LDW     .D2T2   *B30,B8           ; |217| 
           NOP             5

           DPSP    .L2     B7:B6,B6          ; |83| 
|| [!A1]   LDW     .D2T2   *+SP(40),B6       ; |217| 

   [ A0]   LDW     .D2T2   *+SP(44),B6       ; |86| 
           ADD     .L2     B10,B8,B7         ; |217| 
           NOP             3

           STW     .D2T2   B6,*B7            ; |217| 
||         MVC     .S2     TSCL,B6           ; |128| 

           MVC     .S2     TSCH,B7           ; |128| 

           MVKL    .S2     _t_offset,B11
||         MVKL    .S1     _cycle_counts+24,A3
||         SUB     .L1     A10,1,A0          ; |211| 
||         ADD     .L2     4,B10,B10         ; |211| 
||         SUB     .D1     A10,1,A10         ; |211| 

           MVKH    .S2     _t_offset,B11
||         MVKH    .S1     _cycle_counts+24,A3

           MV      .L1     A3,A11            ; |130| 
||         LDDW    .D2T2   *B11,B17:B16      ; |130| 

           MVKL    .S1     _t_stop,A24
           LDDW    .D1T1   *A3,A7:A6         ; |130| 
           MVKH    .S1     _t_stop,A24
           STDW    .D1T2   B7:B6,*A24        ; |128| 
           ADDU    .L2     B16,B4,B9:B8      ; |130| 

           ADD     .S2     B9,B17,B4         ; |130| 
||         SUBU    .L2     B6,B8,B9:B8       ; |130| 

           ADD     .L2     B4,B5,B4          ; |130| 
|| [ A0]   B       .S1     $C$L15            ; |211| 
||         EXT     .S2     B9,24,24,B5       ; |130| 

           SUB     .L2     B7,B4,B4          ; |130| 
||         ADDU    .L1X    A6,B8,A5:A4       ; |130| 

           ADD     .L2     B4,B5,B4          ; |130| 
||         ADD     .L1     A5,A7,A5          ; |130| 

   [ A0]   CALL    .S1     _gimme_random     ; |213| 

           ADD     .L1X    A5,B4,A5          ; |130| 
|| [ A0]   LDW     .D2T2   *+SP(48),B4       ; |213| 

   [!A0]   CALL    .S1     __fltllif         ; |135| 
||         STDW    .D1T1   A5:A4,*A11        ; |130| 
|| [ A0]   MV      .L1     A12,A4            ; |213| 

           ; BRANCHCC OCCURS {$C$L15}        ; |211| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           LDDW    .D1T1   *A11,A5:A4        ; |135| 
           ADDKPC  .S2     $C$RL31,B3,3      ; |135| 
$C$RL31:   ; CALL OCCURS {__fltllif} {0}     ; |135| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 16
           ZERO    .L1     A14
           SET     .S1     A14,0x1a,0x1d,A14
           MPYSP   .M1     A14,A4,A3         ; |135| 
           ZERO    .L1     A13
           SET     .S1     A13,0x15,0x1d,A13
           ZERO    .L1     A12               ; |135| 
           SPDP    .S1     A3,A5:A4          ; |135| 
           NOP             2
           ADDDP   .L1     A13:A12,A5:A4,A5:A4 ; |135| 
           CALLP   .S2     __fixdlli,B3
$C$RL32:   ; CALL OCCURS {__fixdlli} {0}     ; |135| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 15
           MV      .L2X    A11,B6
           MV      .L2X    A12,B4

           MV      .L2X    A12,B5
||         MVK     .S2     24,B10

           SUB     .L2X    A11,B10,B10
||         STDW    .D2T1   A5:A4,*B6         ; |135| 

           MVC     .S2     B4,TSCL           ; |115| 
||         STDW    .D2T2   B5:B4,*B10        ; |114| 

           MVC     .S2     TSCL,B4           ; |116| 
           MVC     .S2     TSCH,B5           ; |116| 
           MV      .L1X    B12,A12           ; |116| 

           MVC     .S2     TSCL,B6           ; |117| 
||         STDW    .D1T2   B5:B4,*A12        ; |116| 

           MVC     .S2     TSCH,B8           ; |117| 
           SUBU    .L2     B6,B4,B7:B6       ; |117| 

           EXT     .S2     B7,24,24,B5       ; |117| 
||         SUB     .L2     B8,B5,B4          ; |117| 

           MVK     .S2     0x80,B4
||         ADD     .L2     B4,B5,B7          ; |117| 

           MV      .L1X    B13,A15

           MV      .L1X    B4,A11            ; |117| 
||         STDW    .D2T2   B7:B6,*B11        ; |117| 
||         ZERO    .S1     A10

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L16:    
;          EXCLUSIVE CPU CYCLES: 11
           LDW     .D1T1   *A15,A3           ; |225| 
           NOP             4

           ADD     .L1     A10,A3,A3         ; |225| 
||         CALL    .S1     _log2f            ; |225| 

           LDW     .D1T1   *A3,A4            ; |225| 
           ADDKPC  .S2     $C$RL33,B3,3      ; |225| 
$C$RL33:   ; CALL OCCURS {_log2f} {0}        ; |225| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 9

           MVKL    .S2     _output,B4
||         SUB     .L1     A11,1,A0          ; |224| 
||         SUB     .S1     A11,1,A11         ; |224| 

           MVKH    .S2     _output,B4
           LDW     .D2T2   *B4,B4            ; |225| 
   [ A0]   BNOP    .S1     $C$L16,3          ; |224| 

           ADD     .L1X    A10,B4,A3         ; |225| 
||         ADD     .S1     4,A10,A10         ; |224| 

           STW     .D1T1   A4,*A3            ; |225| 
           ; BRANCHCC OCCURS {$C$L16}        ; |224| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 18
           MVC     .S2     TSCL,B6           ; |128| 
           MVC     .S2     TSCH,B4           ; |128| 

           LDDW    .D1T1   *A12,A7:A6        ; |130| 
||         LDDW    .D2T2   *B11,B9:B8        ; |130| 

           MVKL    .S2     _t_stop,B12
           MV      .L2     B4,B7             ; |128| 
           MVKH    .S2     _t_stop,B12
           NOP             1
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
||         ADDKPC  .S2     $C$RL34,B3,0      ; |130| 

$C$RL34:   ; CALL OCCURS {__fltllif} {0}     ; |130| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 13
           MPYSP   .M1     A14,A4,A3         ; |130| 
           MV      .L1     A13,A11           ; |130| 
           ZERO    .L1     A10               ; |130| 
           NOP             1
           SPDP    .S1     A3,A5:A4          ; |130| 
           NOP             1
           ADDDP   .L1     A11:A10,A5:A4,A5:A4 ; |130| 
           CALLP   .S2     __fixdlli,B3
$C$RL35:   ; CALL OCCURS {__fixdlli} {0}     ; |130| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 13
           MV      .L2X    A10,B4            ; |130| 

           MV      .L2X    A10,B5            ; |130| 
||         STDW    .D2T1   A5:A4,*B10        ; |130| 

           STDW    .D2T2   B5:B4,*+B10(8)    ; |114| 
||         MVC     .S2     B4,TSCL           ; |115| 

           MVC     .S2     TSCL,B6           ; |116| 
           MVC     .S2     TSCH,B7           ; |116| 

           STDW    .D1T2   B7:B6,*A12        ; |116| 
||         MVC     .S2     TSCL,B4           ; |117| 

           MVC     .S2     TSCH,B8           ; |117| 
           SUBU    .L2     B4,B6,B5:B4       ; |117| 

           EXT     .S2     B5,24,24,B5       ; |117| 
||         SUB     .L2     B8,B7,B6          ; |117| 

           ADD     .L2     B6,B5,B5          ; |117| 

           STDW    .D2T2   B5:B4,*B11        ; |117| 
||         MVK     .S2     0x80,B4

           MV      .L1     A10,A13

           MV      .L1X    B4,A10            ; |117| 
||         LDW     .D2T2   *+SP(60),B13      ; |117| 

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L17:    
;          EXCLUSIVE CPU CYCLES: 11
           LDW     .D1T1   *A15,A3           ; |233| 
           NOP             4

           ADD     .L1     A13,A3,A3         ; |233| 
||         CALL    .S1     _log2sp           ; |233| 

           LDW     .D1T1   *A3,A4            ; |233| 
           ADDKPC  .S2     $C$RL36,B3,3      ; |233| 
$C$RL36:   ; CALL OCCURS {_log2sp} {0}       ; |233| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 7

           LDW     .D2T2   *B13,B4           ; |233| 
||         SUB     .L1     A10,1,A0          ; |232| 
||         SUB     .S1     A10,1,A10         ; |232| 

   [ A0]   BNOP    .S1     $C$L17,3          ; |232| 

           ADD     .L1X    A13,B4,A3         ; |233| 
||         ADD     .S1     4,A13,A13         ; |232| 

           STW     .D1T1   A4,*A3            ; |233| 
           ; BRANCHCC OCCURS {$C$L17}        ; |232| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 18
           MVC     .S2     TSCL,B6           ; |128| 
           MVC     .S2     TSCH,B4           ; |128| 

           LDDW    .D1T1   *A12,A7:A6        ; |130| 
||         LDDW    .D2T2   *B11,B9:B8        ; |130| 

           MV      .L2     B4,B7             ; |128| 
           NOP             3
           ADDU    .L1X    B8,A6,A5:A4       ; |130| 

           ADD     .L1X    A5,B9,A3          ; |130| 
||         LDDW    .D2T2   *+B10(8),B9:B8    ; |130| 

           ADD     .L1     A3,A7,A3          ; |130| 
||         SUBU    .L2X    B6,A4,B5:B4       ; |130| 

           EXT     .S2     B5,24,24,B16      ; |130| 
           SUB     .L2X    B7,A3,B31         ; |130| 
           CALL    .S1     __fltllif         ; |130| 

           ADDU    .L2     B8,B4,B5:B4       ; |130| 
||         MV      .S2     B12,B8            ; |130| 

           ADD     .L2     B5,B9,B30         ; |130| 
||         ADD     .S2     B31,B16,B5        ; |130| 

           MV      .L1X    B4,A4             ; |130| 
||         ADD     .L2     B30,B5,B4         ; |130| 

           STDW    .D2T2   B7:B6,*B8         ; |128| 

           MV      .L1X    B4,A5             ; |130| 
||         ADDKPC  .S2     $C$RL37,B3,0      ; |130| 

$C$RL37:   ; CALL OCCURS {__fltllif} {0}     ; |130| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 13
           MPYSP   .M1     A14,A4,A3         ; |130| 
           ZERO    .L1     A10               ; |130| 
           NOP             2
           SPDP    .S1     A3,A5:A4          ; |130| 
           NOP             1
           ADDDP   .L1     A11:A10,A5:A4,A5:A4 ; |130| 
           CALLP   .S2     __fixdlli,B3
$C$RL38:   ; CALL OCCURS {__fixdlli} {0}     ; |130| 
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

           STDW    .D1T2   B7:B6,*A12        ; |116| 
||         MVC     .S2     TSCL,B4           ; |117| 

           MVC     .S2     TSCH,B8           ; |117| 
           SUBU    .L2     B4,B6,B5:B4       ; |117| 

           EXT     .S2     B5,24,24,B6       ; |117| 
||         SUB     .L2     B8,B7,B31         ; |117| 

           ADD     .L2     B31,B6,B5         ; |117| 

           STDW    .D2T2   B5:B4,*B11        ; |117| 
||         MVK     .S2     0x80,B4

           MV      .L1     A10,A13

           MV      .L1X    B4,A10            ; |117| 
||         LDW     .D2T2   *+SP(64),B13      ; |117| 

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L18:    
;          EXCLUSIVE CPU CYCLES: 11
           LDW     .D1T1   *A15,A3           ; |241| 
           NOP             4

           ADD     .L1     A13,A3,A3         ; |241| 
||         CALL    .S1     _log2sp_c         ; |241| 

           LDW     .D1T1   *A3,A4            ; |241| 
           ADDKPC  .S2     $C$RL39,B3,3      ; |241| 
$C$RL39:   ; CALL OCCURS {_log2sp_c} {0}     ; |241| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 7

           LDW     .D2T2   *B13,B4           ; |241| 
||         SUB     .L1     A10,1,A0          ; |240| 
||         SUB     .S1     A10,1,A10         ; |240| 

   [ A0]   BNOP    .S1     $C$L18,3          ; |240| 

           ADD     .L1X    A13,B4,A3         ; |241| 
||         ADD     .S1     4,A13,A13         ; |240| 

           STW     .D1T1   A4,*A3            ; |241| 
           ; BRANCHCC OCCURS {$C$L18}        ; |240| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 15
           MVC     .S2     TSCL,B6           ; |128| 
           MVC     .S2     TSCH,B4           ; |128| 

           MV      .L2     B4,B7             ; |128| 
||         LDDW    .D1T1   *A12,A5:A4        ; |130| 
||         LDDW    .D2T2   *B11,B9:B8        ; |130| 

           MV      .L2     B10,B13           ; |130| 
           LDDW    .D2T2   *+B13(16),B17:B16 ; |130| 
           MVKL    .S2     _t_stop,B31
           MVKH    .S2     _t_stop,B31
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
           STDW    .D2T2   B7:B6,*B31        ; |128| 

           MV      .L1X    B4,A5             ; |130| 
||         ADDKPC  .S2     $C$RL40,B3,0      ; |130| 

$C$RL40:   ; CALL OCCURS {__fltllif} {0}     ; |130| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 107
           MPYSP   .M1     A14,A4,A3         ; |130| 
           ZERO    .L1     A10               ; |130| 
           NOP             3
           SPDP    .S2X    A3,B5:B4          ; |130| 
           NOP             2
           ADDDP   .L1X    A11:A10,B5:B4,A5:A4 ; |130| 
           CALLP   .S2     __fixdlli,B3
$C$RL41:   ; CALL OCCURS {__fixdlli} {0}     ; |130| 

           ADDAD   .D2     B12,1,B10
||         MV      .L2X    A10,B5

           MV      .L2X    A10,B4
||         STDW    .D2T1   A5:A4,*B10        ; |130| 

           STDW    .D2T2   B5:B4,*+B13(32)   ; |114| 
||         MVC     .S2     B4,TSCL           ; |115| 

           MVC     .S2     TSCL,B6           ; |116| 
           MVC     .S2     TSCH,B7           ; |116| 

           STDW    .D1T2   B7:B6,*A12        ; |116| 
||         MVC     .S2     TSCL,B4           ; |117| 

           MVC     .S2     TSCH,B8           ; |117| 
           SUBU    .L2     B4,B6,B5:B4       ; |117| 

           EXT     .S2     B5,24,24,B6       ; |117| 
||         SUB     .L2     B8,B7,B31         ; |117| 

           MVKL    .S1     _output,A13
||         ADD     .L2     B31,B6,B5         ; |117| 

           MVKH    .S1     _output,A13
||         MV      .L2X    A15,B9            ; |248| 
||         STDW    .D2T2   B5:B4,*B11        ; |117| 

           CALLP   .S2     _log2sp_v,B3
||         LDW     .D1T2   *+A13(16),B4      ; |248| 
||         LDW     .D2T1   *B9,A4            ; |248| 
||         MVK     .S1     0x80,A6           ; |248| 

$C$RL42:   ; CALL OCCURS {_log2sp_v} {0}     ; |248| 
           MVC     .S2     TSCL,B8           ; |128| 
           MVC     .S2     TSCH,B4           ; |128| 

           LDDW    .D1T1   *A12,A17:A16      ; |130| 
||         LDDW    .D2T2   *B11,B7:B6        ; |130| 

           MVK     .S1     16,A12
           ADD     .L1X    B10,A12,A12
           MVKL    .S1     _t_stop,A3

           LDDW    .D1T1   *A12,A9:A8        ; |130| 
||         MVKH    .S1     _t_stop,A3

           ADDU    .L1X    B6,A16,A7:A6      ; |130| 

           MV      .L2     B4,B9             ; |128| 
||         MV      .S2X    A3,B4             ; |128| 
||         ADD     .L1X    A7,B7,A3          ; |130| 

           SUBU    .L1X    B8,A6,A5:A4       ; |130| 

           ADD     .L1     A3,A17,A3         ; |130| 
||         EXT     .S1     A5,24,24,A6       ; |130| 

           SUB     .S1X    B9,A3,A3          ; |130| 
||         ADDU    .L1     A8,A4,A5:A4       ; |130| 

           ADD     .L1     A5,A9,A3          ; |130| 
||         ADD     .S1     A3,A6,A5          ; |130| 

           CALLP   .S2     __fltllif,B3
||         ADD     .L1     A3,A5,A5          ; |130| 
||         STDW    .D2T2   B9:B8,*B4         ; |128| 

$C$RL43:   ; CALL OCCURS {__fltllif} {0}     ; |130| 
           MPYSP   .M1     A14,A4,A3         ; |130| 
           NOP             3
           SPDP    .S1     A3,A5:A4          ; |130| 
           NOP             1
           ADDDP   .L1     A11:A10,A5:A4,A5:A4 ; |130| 
           CALLP   .S2     __fixdlli,B3
$C$RL44:   ; CALL OCCURS {__fixdlli} {0}     ; |130| 
           MVKL    .S2     0x3ee4f8b5,B7
           MVKL    .S2     0x88e368f1,B6

           STDW    .D1T1   A5:A4,*A12        ; |130| 
||         MVKH    .S2     0x3ee4f8b5,B7

           LDW     .D1T2   *+A13(4),B4       ; |66| 
||         MVKH    .S2     0x88e368f1,B6

           CALLP   .S2     _isequal,B3
||         LDW     .D1T1   *A13,A4           ; |66| 
||         MVK     .S1     0x80,A6           ; |66| 
||         MVK     .L1     0x1,A8            ; |66| 

$C$RL45:   ; CALL OCCURS {_isequal} {0}      ; |66| 
           MVKL    .S2     0x3ee4f8b5,B7
           MVKL    .S2     0x88e368f1,B6
           MVKL    .S2     _fcn_pass,B10
           MVKH    .S2     0x3ee4f8b5,B7
           MVKH    .S2     0x88e368f1,B6

           MV      .L1     A4,A3             ; |66| 
||         LDW     .D1T1   *A13,A4           ; |67| 
||         MVKH    .S2     _fcn_pass,B10

           CALLP   .S2     _isequal,B3
||         LDW     .D1T2   *+A13(8),B4       ; |67| 
||         STW     .D2T1   A3,*+B10(4)       ; |66| 
||         MVK     .S1     0x80,A6           ; |67| 
||         MVK     .L1     0x1,A8            ; |67| 

$C$RL46:   ; CALL OCCURS {_isequal} {0}      ; |67| 
           MVKL    .S2     0x3ee4f8b5,B7
           MVKL    .S2     0x88e368f1,B6
           MVKH    .S2     0x3ee4f8b5,B7

           STW     .D2T1   A4,*+B10(8)       ; |67| 
||         LDW     .D1T2   *+A13(12),B4      ; |68| 
||         MVKH    .S2     0x88e368f1,B6

           CALLP   .S2     _isequal,B3
||         LDW     .D1T1   *A13,A4           ; |68| 
||         MVK     .S1     0x80,A6           ; |68| 
||         MVK     .L1     0x1,A8            ; |68| 

$C$RL47:   ; CALL OCCURS {_isequal} {0}      ; |68| 
           LDW     .D2T1   *+SP(80),A3       ; |68| 
           MVKL    .S2     0x88e368f1,B6
           MVKL    .S2     0x3ee4f8b5,B7

           STW     .D2T1   A4,*+B10(12)      ; |68| 
||         MVKH    .S2     0x88e368f1,B6

           LDW     .D1T1   *A13,A4           ; |69| 
||         MVKH    .S2     0x3ee4f8b5,B7

           CALLP   .S2     _isequal,B3
||         LDW     .D1T2   *A3,B4            ; |69| 
||         MVK     .S1     0x80,A6           ; |69| 
||         MVK     .L1     0x1,A8            ; |69| 

$C$RL48:   ; CALL OCCURS {_isequal} {0}      ; |69| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 16
           LDW     .D2T2   *+SP(84),B5       ; |69| 
           MV      .L2X    A4,B4             ; |69| 
           STW     .D2T2   B4,*+B10(16)      ; |69| 
           NOP             2
           LDW     .D2T2   *B5,B0            ; |72| 
           LDW     .D2T2   *+SP(88),B5
           NOP             3

   [!B0]   B       .S1     $C$L19            ; |72| 
||         MV      .L2     B0,B1             ; guard predicate rewrite

   [ B0]   LDW     .D2T2   *B5,B0            ; |72| 
   [ B1]   ADD     .L2     4,B5,B5
           NOP             3
           ; BRANCHCC OCCURS {$C$L19}        ; |72| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 14
   [ B0]   LDW     .D2T2   *B5,B5            ; |72| 
           CMPEQ   .L2     B4,0,B6           ; |72| 
           XOR     .L2     1,B6,B31          ; |72| 
           MVK     .L1     0x1,A3            ; |72| 
           NOP             1
   [ B0]   CMPEQ   .L2     B5,0,B4           ; |72| 
   [ B0]   XOR     .L2     1,B4,B4           ; |72| 

   [ B0]   AND     .L2     B31,B4,B0         ; |72| 
|| [!B0]   ZERO    .S2     B0                ; |72| 

   [ B0]   B       .S1     $C$L20            ; |72| 
   [ B0]   CALL    .S1     _print_test_results ; |254| 
   [ B0]   MVKL    .S1     _all_pass,A4
   [ B0]   MVKH    .S1     _all_pass,A4
           NOP             2
           ; BRANCHCC OCCURS {$C$L20}        ; |72| 
;** --------------------------------------------------------------------------*
$C$L19:    
;          EXCLUSIVE CPU CYCLES: 5
           CALL    .S1     _print_test_results ; |254| 
           MVKL    .S1     _all_pass,A4
           MVKH    .S1     _all_pass,A4
           MV      .L1     A10,A3
           NOP             1
;** --------------------------------------------------------------------------*
$C$L20:    
;          EXCLUSIVE CPU CYCLES: 1

           STW     .D1T1   A3,*A4            ; |72| 
||         MVK     .L1     0x2,A4            ; |254| 
||         ADDKPC  .S2     $C$RL49,B3,0      ; |254| 

$C$RL49:   ; CALL OCCURS {_print_test_results} {0}  ; |254| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 30
           MVKL    .S2     $C$SL2+0,B4
           MVKH    .S2     $C$SL2+0,B4

           CALLP   .S2     _printf,B3
||         STW     .D2T2   B4,*+SP(4)        ; |255| 

$C$RL50:   ; CALL OCCURS {_printf} {0}       ; |255| 
           MVKL    .S2     $C$SL3+0,B4
           MVKH    .S2     $C$SL3+0,B4

           CALLP   .S2     _printf,B3
||         STW     .D2T2   B4,*+SP(4)        ; |255| 

$C$RL51:   ; CALL OCCURS {_printf} {0}       ; |255| 
           MVKL    .S1     $C$SL1+0,A10
           MVKH    .S1     $C$SL1+0,A10

           CALLP   .S2     _print_profile_results,B3
||         MV      .L1     A10,A4            ; |262| 

$C$RL52:   ; CALL OCCURS {_print_profile_results} {0}  ; |262| 

           CALLP   .S2     _print_memory_results,B3
||         MV      .L1     A10,A4            ; |265| 

$C$RL53:   ; CALL OCCURS {_print_memory_results} {0}  ; |265| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 11
           LDW     .D2T2   *++SP(120),B3     ; |266| 
           LDDW    .D2T1   *++SP,A13:A12     ; |266| 
           LDDW    .D2T1   *++SP,A15:A14     ; |266| 
           LDDW    .D2T2   *++SP,B11:B10     ; |266| 
           LDDW    .D2T2   *++SP,B13:B12     ; |266| 

           LDW     .D2T1   *++SP(8),A10      ; |266| 
||         RET     .S2     B3                ; |266| 

           LDW     .D2T1   *++SP(8),A11      ; |266| 
           NOP             4
           ; BRANCH OCCURS {B3}              ; |266| 
;******************************************************************************
;* STRINGS                                                                    *
;******************************************************************************
	.sect	".const:.string"
$C$SL1:	.string	"log2SP",0
$C$SL2:	.string	"----------------------------------------",0
$C$SL3:	.string	"----------------------------------------",10,0
;*****************************************************************************
;* UNDEFINED EXTERNAL REFERENCES                                             *
;*****************************************************************************
	.global	_printf
	.global	_log2f
	.global	___isinff
	.global	_log2
	.global	_driver_init
	.global	_print_profile_results
	.global	_print_memory_results
	.global	_print_test_results
	.global	_gimme_random
	.global	_isequal
	.global	_log2sp
	.global	_log2sp_c
	.global	_log2sp_v
	.global	_ti_math_logtable
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
