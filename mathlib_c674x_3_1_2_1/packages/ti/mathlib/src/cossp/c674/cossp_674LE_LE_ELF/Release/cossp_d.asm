;******************************************************************************
;* TMS320C6x C/C++ Codegen                                          PC v7.4.2 *
;* Date/Time created: Mon May 16 23:42:14 2016                                *
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
	.elfsym	a,SYM_SIZE(40)
a:
	.word	0422d856dh		; a[0] @ 0
	.word	0c27bc39bh		; a[1] @ 32
	.word	0c1d58d28h		; a[2] @ 64
	.word	0c2462238h		; a[3] @ 96
	.word	0421f8aadh		; a[4] @ 128
	.word	0406e00efh		; a[5] @ 160
	.word	0c18569f3h		; a[6] @ 192
	.word	0429a18dah		; a[7] @ 224
	.word	0428ed11eh		; a[8] @ 256
	.word	0c1e7f9aeh		; a[9] @ 288

;	C:\MATHLIB_Tools\CCSV5_5_0\ccsv5\tools\compiler\c6000_7.4.2\bin\opt6x.exe C:\\Users\\gtbldadm\\AppData\\Local\\Temp\\030683 C:\\Users\\gtbldadm\\AppData\\Local\\Temp\\030685 
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
;*   Local Frame Size  : 8 Args + 16 Auto + 56 Save = 80 byte                 *
;******************************************************************************
main:
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 12
           STW     .D2T1   A11,*SP--(8)      ; |92| 
           STW     .D2T1   A10,*SP--(8)      ; |92| 
           STDW    .D2T2   B13:B12,*SP--     ; |92| 
           STDW    .D2T2   B11:B10,*SP--     ; |92| 
           STDW    .D2T1   A15:A14,*SP--     ; |92| 

           STDW    .D2T1   A13:A12,*SP--     ; |92| 
||         MVKL    .S1     $C$SL1+0,A4

           STW     .D2T2   B3,*SP--(32)      ; |92| 
||         CALLP   .S2     driver_init,B3
||         MVKH    .S1     $C$SL1+0,A4

$C$RL0:    ; CALL OCCURS {driver_init} {0}   ; |100| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 3

           MVK     .L2     0xa,B4
||         MVKL    .S1     a,A11

           MVKH    .S1     a,A11
||         MVKL    .S2     output,B13

           CALL    .S1     cosf              ; |109| 
||         MV      .L1     A11,A13
||         MV      .D1X    B4,A12
||         MVKH    .S2     output,B13
||         ZERO    .L2     B10

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L1:    
;          EXCLUSIVE CPU CYCLES: 5
           LDW     .D1T1   *A13++,A4         ; |109| 
           ADDKPC  .S2     $C$RL1,B3,3       ; |109| 
$C$RL1:    ; CALL OCCURS {cosf} {0}          ; |109| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 7

           LDW     .D2T2   *B13,B4           ; |109| 
||         SUB     .L1     A12,1,A0          ; |108| 
||         SUB     .S1     A12,1,A12         ; |108| 

   [ A0]   BNOP    .S1     $C$L1,3           ; |108| 

           ADD     .L2     B10,B4,B4         ; |109| 
||         ADD     .S2     4,B10,B10         ; |108| 

   [ A0]   CALL    .S1     cosf              ; |109| 
||         STW     .D2T1   A4,*B4            ; |109| 
|| [!A0]   MVK     .L2     0xa,B4

           ; BRANCHCC OCCURS {$C$L1}         ; |108| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 2

           ZERO    .L2     B10
||         MV      .L1     A11,A10
||         ADD     .S2     4,B13,B12

           MV      .L1X    B4,A12
||         CALL    .S1     cossp             ; |112| 

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L2:    
;          EXCLUSIVE CPU CYCLES: 5
           LDW     .D1T1   *A11++,A4         ; |112| 
           ADDKPC  .S2     $C$RL2,B3,3       ; |112| 
$C$RL2:    ; CALL OCCURS {cossp} {0}         ; |112| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 7

           LDW     .D2T2   *B12,B4           ; |112| 
||         SUB     .L1     A12,1,A0          ; |111| 
||         SUB     .S1     A12,1,A12         ; |111| 

   [ A0]   BNOP    .S1     $C$L2,3           ; |111| 

           ADD     .L2     B10,B4,B4         ; |112| 
||         ADD     .S2     4,B10,B10         ; |111| 

   [ A0]   CALL    .S1     cossp             ; |112| 
||         STW     .D2T1   A4,*B4            ; |112| 
|| [!A0]   MVK     .L2     0xa,B4

           ; BRANCHCC OCCURS {$C$L2}         ; |111| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 2

           ZERO    .L2     B10
||         MV      .L1     A10,A12
||         ADD     .S2     4,B12,B11

           MV      .L1X    B4,A11
||         CALL    .S1     cossp_c           ; |115| 

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L3:    
;          EXCLUSIVE CPU CYCLES: 5
           LDW     .D1T1   *A12++,A4         ; |115| 
           ADDKPC  .S2     $C$RL3,B3,3       ; |115| 
$C$RL3:    ; CALL OCCURS {cossp_c} {0}       ; |115| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 7

           LDW     .D2T2   *B11,B4           ; |115| 
||         SUB     .L1     A11,1,A0          ; |114| 
||         SUB     .S1     A11,1,A11         ; |114| 

   [ A0]   BNOP    .S1     $C$L3,3           ; |114| 
|| [!A0]   ADD     .L1X    4,B11,A14

           ADD     .L2     B10,B4,B4         ; |115| 
||         ADD     .S2     4,B10,B10         ; |114| 

   [ A0]   CALL    .S1     cossp_c           ; |115| 
||         STW     .D2T1   A4,*B4            ; |115| 

           ; BRANCHCC OCCURS {$C$L3}         ; |114| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 1

           MV      .L1     A10,A9
||         MVK     .L2     0xa,B0
||         ZERO    .S1     A28
||         LDW     .D1T2   *A14,B16

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*
;*      Loop found in file               : C:/nightlybuilds/mathlib/ti/mathlib/src/cossp/cossp_d.c
;*      Loop source line                 : 117
;*      Loop opening brace source line   : 117
;*      Loop closing brace source line   : 119
;*      Known Minimum Trip Count         : 10                    
;*      Known Maximum Trip Count         : 10                    
;*      Known Max Trip Count Factor      : 10
;*      Loop Carried Dependency Bound(^) : 84
;*      Unpartitioned Resource Bound     : 6
;*      Partitioned Resource Bound(*)    : 6
;*      Resource Partition:
;*                                A-side   B-side
;*      .L units                     0        2     
;*      .S units                     2        3     
;*      .D units                     1        1     
;*      .M units                     6*       5     
;*      .X cross paths               8*       2     
;*      .T address paths             1        1     
;*      Long read paths              0        0     
;*      Long write paths             0        0     
;*      Logical  ops (.LS)           4        3     (.L or .S unit)
;*      Addition ops (.LSD)          4        4     (.L or .S or .D unit)
;*      Bound(.L .S .LS)             3        4     
;*      Bound(.L .S .D .LS .LSD)     4        5     
;*
;*      Disqualified loop: Loop carried dependency bound too large
;*----------------------------------------------------------------------------*
$C$L4:    
;          EXCLUSIVE CPU CYCLES: 3
           LDW     .D1T1   *A9++,A3          ; |79| 
           NOP             2
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 79

           MVKL    .S1     0x3fc90fdb,A4
||         ZERO    .L1     A31

           MVKH    .S1     0x3fc90fdb,A4
           ABSSP   .S1     A3,A3             ; |79| 

           ADDSP   .L1     A4,A3,A3          ; |79| 
||         MVKH    .S1     0x49800000,A31

           MVKL    .S1     0x3fc90fdb,A30
           MVKH    .S1     0x3fc90fdb,A30
           MVKL    .S1     0x3ea2f983,A29
           CMPGTSP .S1     A3,A31,A0         ; |79| 

   [ A0]   MV      .L1     A30,A3            ; |79| 
||         MVKH    .S1     0x3ea2f983,A29

           MPYSP   .M1     A29,A3,A4         ; |79| 
           ZERO    .L1     A6
           MVKH    .S1     0x40490000,A6
           MVKL    .S2     0x3a7daa22,B4
           SPINT   .L1     A4,A4             ; |79| 
           MVKH    .S2     0x3a7daa22,B4
           MVKL    .S2     0x362e9c5b,B6
           MVKH    .S2     0x362e9c5b,B6
           INTSP   .L1     A4,A5             ; |86| 
           MVKL    .S2     0xb94fb222,B7
           MVKH    .S2     0xb94fb222,B7
           MVKL    .S2     0x3c08873e,B31
           MPYSP   .M1     A6,A5,A6          ; |86| 
           MPYSP   .M2X    B4,A5,B4          ; |86| 
           MVKH    .S2     0x3c08873e,B31
           MVKL    .S2     0xbe2aaaa4,B30
           SUBSP   .L1     A3,A6,A3          ; |86| 
           MVKH    .S2     0xbe2aaaa4,B30
           SUB     .L2     B0,1,B0           ; |117| 
           ZERO    .L2     B29
           MVKH    .S2     0x39800000,B29
           SUBSP   .L2X    A3,B4,B4          ; |86| 
           AND     .L1     1,A4,A0           ; |79| 
           SET     .S1     A28,0x17,0x1d,A3
           NOP             1
           MPYSP   .M2     B4,B4,B5          ; |96| 
           NOP             3
           MPYSP   .M2     B6,B5,B6          ; |96| 
           NOP             3
           ADDSP   .L2     B7,B6,B6          ; |96| 
           NOP             3
           MPYSP   .M2     B5,B6,B6          ; |96| 
           NOP             3
           ADDSP   .L2     B31,B6,B6         ; |96| 
           NOP             3
           MPYSP   .M2     B5,B6,B6          ; |96| 
           NOP             3
           ADDSP   .L2     B30,B6,B6         ; |96| 
           NOP             3
           MPYSP   .M2     B5,B6,B5          ; |96| 
           NOP             3
           MPYSP   .M2     B4,B5,B6          ; |96| 
           ZERO    .L2     B5
           MVKH    .S2     0xbf800000,B5
   [!A0]   MV      .L2X    A3,B5             ; |79| 

           ADDSP   .L2     B6,B4,B6          ; |96| 
||         ABSSP   .S2     B4,B4             ; |86| 

           CMPLTSP .S2     B4,B29,B1         ; |89| 
   [ B1]   MPYSP   .M2     B5,B4,B4          ; |90| 
   [ B0]   B       .S1     $C$L4             ; |117| 
   [!B1]   MPYSP   .M2     B5,B6,B4          ; |96| 
           NOP             3

   [!B0]   CALL    .S1     cossp_v           ; |120| 
||         STW     .D2T2   B4,*B16++         ; |118| 

           ; BRANCHCC OCCURS {$C$L4}         ; |117| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           LDW     .D2T2   *+B13(16),B4      ; |120| 
           MVK     .L1     0xa,A6            ; |120| 
           MV      .L1     A10,A4            ; |120| 
           ADDKPC  .S2     $C$RL4,B3,1       ; |120| 
$C$RL4:    ; CALL OCCURS {cossp_v} {0}       ; |120| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 46
           MVKL    .S2     0x3f2a36e2,B7
           MVKL    .S2     0xeb1c432d,B6
           MVKH    .S2     0x3f2a36e2,B7

           LDW     .D2T1   *B13,A4           ; |66| 
||         MVKH    .S2     0xeb1c432d,B6

           CALLP   .S2     isequal,B3
||         LDW     .D2T2   *+B13(4),B4       ; |66| 
||         MVK     .L1     0xa,A6            ; |66| 
||         MVK     .S1     0x1,A8            ; |66| 

$C$RL5:    ; CALL OCCURS {isequal} {0}       ; |66| 
           MVKL    .S2     fcn_pass,B6
           MVKL    .S2     0x3f2a36e2,B7
           MVKH    .S2     fcn_pass,B6
           MVKH    .S2     0x3f2a36e2,B7

           STW     .D2T1   A4,*+B6(4)        ; |66| 
||         MVKL    .S2     0xeb1c432d,B6

           LDW     .D2T2   *+B13(8),B4       ; |67| 
||         MVKH    .S2     0xeb1c432d,B6

           CALLP   .S2     isequal,B3
||         LDW     .D2T1   *B13,A4           ; |67| 
||         MVK     .L1     0xa,A6            ; |67| 
||         MVK     .S1     0x1,A8            ; |67| 

$C$RL6:    ; CALL OCCURS {isequal} {0}       ; |67| 
           MVKL    .S2     fcn_pass,B6
           MVKL    .S2     0x3f2a36e2,B7
           MVKH    .S2     fcn_pass,B6
           MVKH    .S2     0x3f2a36e2,B7

           STW     .D2T1   A4,*+B6(8)        ; |67| 
||         MVKL    .S2     0xeb1c432d,B6

           MV      .L2     B13,B5
||         LDW     .D2T2   *+B13(12),B4      ; |68| 
||         MVKH    .S2     0xeb1c432d,B6

           CALLP   .S2     isequal,B3
||         LDW     .D2T1   *B5,A4            ; |68| 
||         MVK     .L1     0xa,A6            ; |68| 
||         MVK     .S1     0x1,A8            ; |68| 

$C$RL7:    ; CALL OCCURS {isequal} {0}       ; |68| 
           MVKL    .S2     fcn_pass,B4
           MVKL    .S2     0x3f2a36e2,B7
           MVKL    .S2     0xeb1c432d,B6
           MVKH    .S2     fcn_pass,B4
           MVKH    .S2     0x3f2a36e2,B7

           MV      .L2     B13,B31           ; |69| 
||         ADD     .L1     4,A14,A10
||         STW     .D2T1   A4,*+B4(12)       ; |68| 
||         MVKH    .S2     0xeb1c432d,B6

           CALLP   .S2     isequal,B3
||         LDW     .D1T2   *A10,B4           ; |69| 
||         LDW     .D2T1   *B31,A4           ; |69| 
||         MVK     .L1     0xa,A6            ; |69| 
||         MVK     .S1     0x1,A8            ; |69| 

$C$RL8:    ; CALL OCCURS {isequal} {0}       ; |69| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 14

           MVKL    .S1     fcn_pass,A3
||         MVKL    .S2     fcn_pass,B5

           MVKH    .S1     fcn_pass,A3
           ADD     .L1     4,A3,A3
           LDW     .D1T1   *A3,A0            ; |72| 
           MVKH    .S2     fcn_pass,B5
           STW     .D2T1   A4,*+B5(16)       ; |69| 
           ADD     .L2     8,B5,B10
           STW     .D2T1   A3,*+SP(16)

   [!A0]   B       .S1     $C$L5             ; |72| 
|| [ A0]   LDW     .D2T2   *B10,B0           ; |72| 

   [!A0]   CALL    .S1     print_test_results ; |124| 
   [!A0]   ZERO    .L1     A3                ; |72| 
   [ A0]   ADD     .L2     4,B10,B4
   [!A0]   MVKL    .S1     all_pass,A4
   [!A0]   MVKH    .S1     all_pass,A4
           ; BRANCHCC OCCURS {$C$L5}         ; |72| 
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
           CALL    .S1     print_test_results ; |124| 
           MVKL    .S1     all_pass,A4
           MVKH    .S1     all_pass,A4
           NOP             2
;** --------------------------------------------------------------------------*
$C$L5:    
;          EXCLUSIVE CPU CYCLES: 1

           STW     .D1T1   A3,*A4            ; |72| 
||         MVK     .L1     0x1,A4            ; |124| 
||         ADDKPC  .S2     $C$RL9,B3,0       ; |124| 

$C$RL9:    ; CALL OCCURS {print_test_results} {0}  ; |124| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 8

           MVKL    .S2     a_sc,B4
||         ZERO    .L2     B6

           SET     .S2     B6,0x17,0x1d,B6
||         ZERO    .L2     B7

           MVKH    .S2     0xbf800000,B7

           MVKH    .S2     a_sc,B4
||         ZERO    .L1     A5

           MV      .L2     B4,B6             ; |132| 
||         STDW    .D2T2   B7:B6,*+B4(16)    ; |136| 
||         MVKH    .S1     0xff800000,A5
||         ZERO    .L1     A4
||         MVK     .S2     -1,B8             ; |137| 

           MV      .L2     B6,B31            ; |132| 
||         STW     .D2T2   B8,*+B4(24)       ; |137| 
||         SET     .S1     A4,0x17,0x1e,A4
||         ZERO    .S2     B5

           STDW    .D2T1   A5:A4,*+B31(8)    ; |134| 
||         ZERO    .L2     B4                ; |132| 
||         MV      .L1X    B4,A13            ; |132| 
||         MVKH    .S2     0x80000000,B5

           STDW    .D2T2   B5:B4,*B6         ; |132| 
||         ZERO    .L1     A12
||         MVK     .S1     0x7,A11

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
;          EXCLUSIVE CPU CYCLES: 7
           LDW     .D1T1   *A13,A3           ; |139| 
           CALL    .S1     cos               ; |139| 
           ADDKPC  .S2     $C$RL10,B3,2      ; |139| 
           SPDP    .S1     A3,A5:A4          ; |139| 
           NOP             1
$C$RL10:   ; CALL OCCURS {cos} {0}           ; |139| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 26
           LDW     .D2T2   *B13,B4           ; |139| 
           DPSP    .L1     A5:A4,A3          ; |139| 
           NOP             3
           ADD     .L1X    A12,B4,A4         ; |139| 
           STW     .D1T1   A3,*A4            ; |139| 

           CALLP   .S2     cossp,B3
||         LDW     .D1T1   *A13,A4           ; |140| 

$C$RL11:   ; CALL OCCURS {cossp} {0}         ; |140| 
           LDW     .D2T2   *+B13(4),B4       ; |140| 
           MV      .L2X    A4,B5             ; |140| 
           NOP             3
           ADD     .L1X    A12,B4,A3         ; |140| 
           STW     .D1T2   B5,*A3            ; |140| 

           CALLP   .S2     cossp_c,B3
||         LDW     .D1T1   *A13,A4           ; |141| 

$C$RL12:   ; CALL OCCURS {cossp_c} {0}       ; |141| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 89
           LDW     .D2T2   *+B13(8),B4       ; |141| 
           MV      .L2X    A4,B5             ; |141| 
           ZERO    .L1     A31
           MVKL    .S1     0x3fc90fdb,A4
           MVKH    .S1     0x3fc90fdb,A4
           ADD     .L1X    A12,B4,A3         ; |141| 
           STW     .D1T2   B5,*A3            ; |141| 
           LDW     .D1T1   *A13++,A3         ; |68| 
           MVKH    .S1     0x49800000,A31
           MVKL    .S1     0x3fc90fdb,A30
           MVKH    .S1     0x3fc90fdb,A30
           MVKL    .S1     0x3ea2f983,A29
           ABSSP   .S1     A3,A3             ; |68| 
           ADDSP   .L1     A4,A3,A3          ; |68| 
           MVKH    .S1     0x3ea2f983,A29
           ZERO    .L1     A6
           MVKH    .S1     0x40490000,A6
           CMPGTSP .S1     A3,A31,A0         ; |70| 
   [ A0]   MV      .L1     A30,A3            ; |71| 
           MPYSP   .M1     A29,A3,A4         ; |76| 
           MVKL    .S2     0x3a7daa22,B31
           MVKH    .S2     0x3a7daa22,B31
           MVKL    .S2     0x362e9c5b,B6
           SPINT   .L1     A4,A5             ; |76| 
           MVKH    .S2     0x362e9c5b,B6
           MVKL    .S2     0xb94fb222,B7
           MVKH    .S2     0xb94fb222,B7
           INTSP   .L1     A5,A4             ; |76| 
           LDW     .D1T1   *A14,A27          ; |142| 
           MVKL    .S2     0x3c08873e,B30
           MVKH    .S2     0x3c08873e,B30
           MPYSP   .M1     A6,A4,A6          ; |82| 
           MPYSP   .M2X    B31,A4,B4         ; |82| 
           ZERO    .L2     B28               ; |86| 
           ZERO    .L2     B8                ; |132| 
           SUBSP   .L1     A3,A6,A3          ; |82| 
           ZERO    .L1     A28
           SUB     .L1     A11,1,A2          ; |138| 
           MVKL    .S2     0xbe2aaaa4,B29
           MVKH    .S2     0xbe2aaaa4,B29
           SUBSP   .L2X    A3,B4,B5          ; |82| 
           ZERO    .L2     B27
           MVKH    .S2     0x39800000,B27
           AND     .L1     1,A5,A0           ; |79| 
           MPYSP   .M2     B5,B5,B4          ; |96| 
           SET     .S1     A28,0x17,0x1d,A3
           CMPLTSP .S2     B5,B8,B0          ; |85| 
           SUB     .L1     A11,1,A11         ; |138| 
           MPYSP   .M2     B6,B4,B6          ; |96| 
           NOP             3
           ADDSP   .L2     B7,B6,B6          ; |96| 
           SET     .S2     B28,31,31,B7      ; |86| 
           NOP             2
           MPYSP   .M2     B4,B6,B6          ; |96| 
           NOP             3
           ADDSP   .L2     B30,B6,B6         ; |96| 
           NOP             3
           MPYSP   .M2     B4,B6,B6          ; |96| 
           NOP             3
           ADDSP   .L2     B29,B6,B6         ; |96| 
           NOP             3
           MPYSP   .M2     B4,B6,B4          ; |96| 
           NOP             3
           MPYSP   .M2     B5,B4,B6          ; |96| 
           ZERO    .L2     B4
           MVKH    .S2     0xbf800000,B4
   [!A0]   MV      .L2X    A3,B4             ; |79| 

           ADDSP   .L2     B6,B5,B6          ; |96| 
|| [ B0]   XOR     .S2     B5,B7,B5          ; |86| 

           CMPLTSP .S2     B5,B27,B0         ; |89| 
   [ B0]   MPYSP   .M2     B4,B5,B4          ; |90| 
   [ A2]   B       .S1     $C$L6             ; |138| 
   [!B0]   MPYSP   .M2     B4,B6,B4          ; |96| 
           ADD     .L1     A12,A27,A3        ; |142| 
           ADD     .L1     4,A12,A12         ; |138| 
           NOP             1

   [!A2]   CALL    .S1     cossp_v           ; |144| 
||         STW     .D1T2   B4,*A3            ; |142| 

           ; BRANCHCC OCCURS {$C$L6}         ; |138| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           LDW     .D2T2   *+B13(16),B4      ; |144| 
           MVKL    .S1     a_sc,A4
           MVKH    .S1     a_sc,A4
           MVK     .L1     0x7,A6            ; |144| 
           ADDKPC  .S2     $C$RL13,B3,0      ; |144| 
$C$RL13:   ; CALL OCCURS {cossp_v} {0}       ; |144| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 46
           MVKL    .S2     0x3f2a36e2,B7
           MVKL    .S2     0xeb1c432d,B6
           MVKH    .S2     0x3f2a36e2,B7

           LDW     .D2T1   *B13,A4           ; |66| 
||         MVKH    .S2     0xeb1c432d,B6

           CALLP   .S2     isequal,B3
||         LDW     .D2T2   *+B13(4),B4       ; |66| 
||         MVK     .L1     0x7,A6            ; |66| 
||         MVK     .S1     0x1,A8            ; |66| 

$C$RL14:   ; CALL OCCURS {isequal} {0}       ; |66| 
           MVKL    .S2     fcn_pass,B6
           MVKL    .S2     0x3f2a36e2,B7
           MVKH    .S2     fcn_pass,B6
           MVKH    .S2     0x3f2a36e2,B7

           STW     .D2T1   A4,*+B6(4)        ; |66| 
||         MVKL    .S2     0xeb1c432d,B6

           LDW     .D2T2   *+B13(8),B4       ; |67| 
||         MVKH    .S2     0xeb1c432d,B6

           CALLP   .S2     isequal,B3
||         LDW     .D2T1   *B13,A4           ; |67| 
||         MVK     .L1     0x7,A6            ; |67| 
||         MVK     .S1     0x1,A8            ; |67| 

$C$RL15:   ; CALL OCCURS {isequal} {0}       ; |67| 
           MVKL    .S2     fcn_pass,B5
           MVKL    .S2     0x3f2a36e2,B7
           MVKL    .S2     0xeb1c432d,B6
           MVKH    .S2     fcn_pass,B5
           MVKH    .S2     0x3f2a36e2,B7

           MV      .L1X    B13,A3            ; |144| 
||         STW     .D2T1   A4,*+B5(8)        ; |67| 
||         MVKH    .S2     0xeb1c432d,B6

           CALLP   .S2     isequal,B3
||         LDW     .D1T1   *A3,A4            ; |68| 
||         LDW     .D2T2   *+B13(12),B4      ; |68| 
||         MVK     .L1     0x7,A6            ; |68| 
||         MVK     .S1     0x1,A8            ; |68| 

$C$RL16:   ; CALL OCCURS {isequal} {0}       ; |68| 
           MVKL    .S2     fcn_pass,B4
           MVKL    .S2     0x3f2a36e2,B7
           MVKL    .S2     0xeb1c432d,B6
           MVKH    .S2     fcn_pass,B4
           MVKH    .S2     0x3f2a36e2,B7

           MV      .L2     B13,B31           ; |69| 
||         STW     .D2T1   A4,*+B4(12)       ; |68| 
||         MVKH    .S2     0xeb1c432d,B6

           CALLP   .S2     isequal,B3
||         LDW     .D1T2   *A10,B4           ; |69| 
||         LDW     .D2T1   *B31,A4           ; |69| 
||         MVK     .L1     0x7,A6            ; |69| 
||         MVK     .S1     0x1,A8            ; |69| 

$C$RL17:   ; CALL OCCURS {isequal} {0}       ; |69| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 17
           LDW     .D2T1   *+SP(16),A3       ; |69| 
           MVKL    .S2     fcn_pass,B31
           MVKH    .S2     fcn_pass,B31
           STW     .D2T1   A4,*+B31(16)      ; |69| 
           NOP             1
           MV      .L2X    A3,B4             ; |69| 
           LDW     .D2T2   *B4,B0            ; |72| 
           STW     .D2T1   A3,*+SP(24)       ; |69| 
           NOP             3

   [!B0]   MVKL    .S1     all_pass,A4
|| [!B0]   B       .S2     $C$L7             ; |72| 
||         MV      .L2     B0,B1             ; guard predicate rewrite
|| [!B0]   ZERO    .L1     A3                ; |72| 

   [!B0]   CALL    .S2     print_test_results ; |148| 
|| [!B0]   MVKH    .S1     all_pass,A4
|| [ B0]   LDW     .D2T2   *B10,B0           ; |72| 

   [ B1]   ADD     .L2     4,B10,B4
           NOP             3
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
           CALL    .S1     print_test_results ; |148| 
           MVKL    .S1     all_pass,A4
           MVKH    .S1     all_pass,A4
           NOP             2
;** --------------------------------------------------------------------------*
$C$L7:    
;          EXCLUSIVE CPU CYCLES: 1

           STW     .D1T1   A3,*A4            ; |72| 
||         MVK     .L1     0x3,A4            ; |148| 
||         ADDKPC  .S2     $C$RL18,B3,0      ; |148| 

$C$RL18:   ; CALL OCCURS {print_test_results} {0}  ; |148| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5

           MVKL    .S1     0xc000cccc,A13
||         MVKL    .S2     a_ext,B4

           MVKL    .S1     0xcccccccd,A12
||         MVK     .S2     0x81,B31
||         ZERO    .L1     A3

           SET     .S1     A3,0x17,0x17,A3
||         MVKH    .S2     a_ext,B4

           MVKH    .S1     0xc000cccc,A13
||         STW     .D2T2   B31,*+SP(12)      ; |151| 

           STW     .D2T1   A3,*B4            ; |151| 
||         MV      .L1X    B4,A11            ; |151| 
||         MVKH    .S1     0xcccccccd,A12
||         ZERO    .D1     A15

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
;          EXCLUSIVE CPU CYCLES: 7
           LDW     .D1T1   *A11,A3           ; |153| 
           CALL    .S1     cos               ; |153| 
           ADDKPC  .S2     $C$RL19,B3,2      ; |153| 
           SPDP    .S1     A3,A5:A4          ; |153| 
           NOP             1
$C$RL19:   ; CALL OCCURS {cos} {0}           ; |153| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 26
           LDW     .D2T2   *B13,B4           ; |153| 
           DPSP    .L1     A5:A4,A3          ; |153| 
           NOP             3
           ADD     .L1X    A15,B4,A4         ; |153| 
           STW     .D1T1   A3,*A4            ; |153| 

           CALLP   .S2     cossp,B3
||         LDW     .D1T1   *A11,A4           ; |154| 

$C$RL20:   ; CALL OCCURS {cossp} {0}         ; |154| 
           LDW     .D2T2   *+B13(4),B4       ; |154| 
           NOP             4
           ADD     .L1X    A15,B4,A3         ; |154| 
           STW     .D1T1   A4,*A3            ; |154| 

           CALLP   .S2     cossp_c,B3
||         LDW     .D1T1   *A11,A4           ; |155| 

$C$RL21:   ; CALL OCCURS {cossp_c} {0}       ; |155| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 106
           LDW     .D2T2   *+B13(8),B4       ; |155| 
           MV      .L2X    A4,B5             ; |155| 
           ZERO    .L1     A30
           MVKL    .S1     0x3fc90fdb,A31
           MVKH    .S1     0x3fc90fdb,A31
           ADD     .L2X    A15,B4,B4         ; |155| 
           STW     .D2T2   B5,*B4            ; |155| 
           LDW     .D1T1   *A11,A3           ; |68| 
           MVKH    .S1     0x49800000,A30
           MVKL    .S1     0x3fc90fdb,A29
           MVKH    .S1     0x3fc90fdb,A29
           MVKL    .S1     0x3ea2f983,A28
           ABSSP   .S1     A3,A4             ; |68| 
           ADDSP   .L1     A31,A4,A4         ; |68| 
           MVKH    .S1     0x3ea2f983,A28
           ZERO    .L1     A27
           MVKH    .S1     0x40490000,A27
           CMPGTSP .S1     A4,A30,A0         ; |70| 
   [ A0]   MV      .L1     A29,A4            ; |71| 
           MPYSP   .M1     A28,A4,A3         ; |76| 
           MVKL    .S2     0x3a7daa22,B31
           MVKH    .S2     0x3a7daa22,B31
           MVKL    .S2     0x362e9c5b,B30
           SPINT   .L1     A3,A6             ; |76| 
           MVKH    .S2     0x362e9c5b,B30
           MVKL    .S2     0xb94fb222,B29
           MVKH    .S2     0xb94fb222,B29
           INTSP   .L1     A6,A5             ; |76| 
           MVKL    .S2     0x3c08873e,B28
           MVKH    .S2     0x3c08873e,B28
           LDW     .D1T1   *A14,A25          ; |156| 
           MPYSP   .M1     A27,A5,A3         ; |82| 
           MPYSP   .M2X    B31,A5,B4         ; |82| 
           ZERO    .L2     B26               ; |86| 
           ZERO    .L2     B25               ; |132| 
           SUBSP   .L1     A4,A3,A3          ; |82| 
           ZERO    .L1     A26
           MVKL    .S2     0xbe2aaaa4,B27
           MVKH    .S2     0xbe2aaaa4,B27
           ZERO    .L2     B24
           SUBSP   .L2X    A3,B4,B4          ; |82| 
           SET     .S2     B26,31,31,B8      ; |86| 
           MVKH    .S2     0x39800000,B24
           AND     .L1     1,A6,A0           ; |79| 
           MPYSP   .M2     B4,B4,B6          ; |96| 
           SET     .S1     A26,0x17,0x1d,A3
           CMPLTSP .S2     B4,B25,B0         ; |85| 
           NOP             1
           MPYSP   .M2     B30,B6,B7         ; |96| 
           NOP             3
           ADDSP   .L2     B29,B7,B5         ; |96| 
           NOP             3
           MPYSP   .M2     B6,B5,B7          ; |96| 
           NOP             3
           ADDSP   .L2     B28,B7,B5         ; |96| 
           NOP             3
           MPYSP   .M2     B6,B5,B7          ; |96| 
           NOP             3
           ADDSP   .L2     B27,B7,B5         ; |96| 
           NOP             3
           MPYSP   .M2     B6,B5,B6          ; |96| 
           ZERO    .L2     B5
           MVKH    .S2     0xbf800000,B5
   [!A0]   MV      .L2X    A3,B5             ; |79| 
           MPYSP   .M2     B4,B6,B7          ; |96| 
           ADD     .L1     A15,A25,A3        ; |156| 
           ADD     .L1     4,A15,A15         ; |152| 
           NOP             1
           ADDSP   .L2     B7,B4,B7          ; |96| 
   [ B0]   XOR     .L2     B4,B8,B4          ; |86| 
           CMPLTSP .S2     B4,B24,B0         ; |89| 
   [ B0]   MPYSP   .M2     B5,B4,B4          ; |90| 
   [!B0]   MPYSP   .M2     B5,B7,B4          ; |96| 
           NOP             3
           STW     .D1T2   B4,*A3            ; |156| 
           LDW     .D1T1   *A11,A3           ; |157| 
           LDW     .D2T2   *+SP(12),B4
           NOP             3
           MPYSPDP .M1     A3,A13:A12,A5:A4  ; |157| 
           SUB     .L1X    B4,1,A0           ; |152| 
           SUB     .L2     B4,1,B4           ; |152| 
           NOP             3
   [ A0]   B       .S1     $C$L8             ; |152| 
           DPSP    .L1     A5:A4,A3          ; |157| 
           NOP             3

   [!A0]   CALL    .S1     cossp_v           ; |159| 
||         STW     .D1T1   A3,*++A11         ; |157| 
||         STW     .D2T2   B4,*+SP(12)       ; |157| 

           ; BRANCHCC OCCURS {$C$L8}         ; |152| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           LDW     .D2T2   *+B13(16),B4      ; |159| 
           MVKL    .S1     a_ext,A4
           MVKH    .S1     a_ext,A4
           MVK     .S1     0x81,A6           ; |159| 
           ADDKPC  .S2     $C$RL22,B3,0      ; |159| 
$C$RL22:   ; CALL OCCURS {cossp_v} {0}       ; |159| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 47
           LDW     .D2T2   *B13,B5           ; |66| 
           MVKL    .S2     0x3f2a36e2,B7
           MVKL    .S2     0xeb1c432d,B6
           MVKH    .S2     0x3f2a36e2,B7
           MVKH    .S2     0xeb1c432d,B6

           CALLP   .S2     isequal,B3
||         LDW     .D2T2   *+B13(4),B4       ; |66| 
||         MV      .L1X    B5,A4             ; |66| 
||         MVK     .S1     0x81,A6           ; |66| 
||         MVK     .D1     0x1,A8            ; |66| 

$C$RL23:   ; CALL OCCURS {isequal} {0}       ; |66| 
           MVKL    .S2     fcn_pass,B5
           MVKL    .S2     0x3f2a36e2,B7
           MVKL    .S2     0xeb1c432d,B6
           MVKH    .S2     fcn_pass,B5

           LDW     .D2T2   *+B13(8),B4       ; |67| 
||         MVKH    .S2     0x3f2a36e2,B7

           STW     .D2T1   A4,*+B5(4)        ; |66| 
||         MVKH    .S2     0xeb1c432d,B6

           CALLP   .S2     isequal,B3
||         LDW     .D2T1   *B13,A4           ; |67| 
||         MVK     .S1     0x81,A6           ; |67| 
||         MVK     .L1     0x1,A8            ; |67| 

$C$RL24:   ; CALL OCCURS {isequal} {0}       ; |67| 
           MVKL    .S2     fcn_pass,B5
           MVKL    .S2     0x3f2a36e2,B7
           MVKL    .S2     0xeb1c432d,B6
           MVKH    .S2     fcn_pass,B5
           MVKH    .S2     0x3f2a36e2,B7

           MV      .L1X    B13,A3            ; |159| 
||         STW     .D2T1   A4,*+B5(8)        ; |67| 
||         MVKH    .S2     0xeb1c432d,B6

           CALLP   .S2     isequal,B3
||         LDW     .D1T1   *A3,A4            ; |68| 
||         LDW     .D2T2   *+B13(12),B4      ; |68| 
||         MVK     .S1     0x81,A6           ; |68| 
||         MVK     .L1     0x1,A8            ; |68| 

$C$RL25:   ; CALL OCCURS {isequal} {0}       ; |68| 
           MVKL    .S2     fcn_pass,B4
           MVKL    .S2     0x3f2a36e2,B7
           MVKL    .S2     0xeb1c432d,B6
           MVKH    .S2     fcn_pass,B4
           MVKH    .S2     0x3f2a36e2,B7

           MV      .L1     A10,A3            ; |68| 
||         STW     .D2T1   A4,*+B4(12)       ; |68| 
||         MVKH    .S2     0xeb1c432d,B6

           CALLP   .S2     isequal,B3
||         LDW     .D2T1   *B13,A4           ; |69| 
||         LDW     .D1T2   *A3,B4            ; |69| 
||         MVK     .S1     0x81,A6           ; |69| 
||         MVK     .L1     0x1,A8            ; |69| 

$C$RL26:   ; CALL OCCURS {isequal} {0}       ; |69| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 16
           LDW     .D2T1   *+SP(16),A3       ; |69| 
           MVKL    .S2     fcn_pass,B4
           MV      .L2     B10,B5            ; |72| 
           MVKH    .S2     fcn_pass,B4
           STW     .D2T1   A4,*+B4(16)       ; |69| 
           LDW     .D1T1   *A3,A0            ; |72| 
           NOP             4

   [!A0]   B       .S1     $C$L9             ; |72| 
|| [ A0]   LDW     .D2T2   *B5,B0            ; |72| 

   [!A0]   CALL    .S1     print_test_results ; |163| 
   [ A0]   ADD     .L2     4,B5,B4
   [!A0]   ZERO    .L1     A4                ; |72| 
   [!A0]   MVKL    .S1     all_pass,A3
   [!A0]   MVKH    .S1     all_pass,A3
           ; BRANCHCC OCCURS {$C$L9}         ; |72| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 10
   [ B0]   LDW     .D2T2   *B4,B4            ; |72| 
           CMPEQ   .L1     A4,0,A3           ; |72| 
           XOR     .L1     1,A3,A3           ; |72| 
   [!B0]   ZERO    .L1     A0                ; |72| 
           MVK     .L1     0x1,A4            ; |72| 
   [ B0]   CMPEQ   .L2     B4,0,B4           ; |72| 
   [ B0]   XOR     .L2     1,B4,B4           ; |72| 
           NOP             1
   [ B0]   AND     .L1X    A3,B4,A0          ; |72| 
   [!A0]   ZERO    .L1     A4                ; |72| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           CALL    .S1     print_test_results ; |163| 
           MVKL    .S1     all_pass,A3
           MVKH    .S1     all_pass,A3
           NOP             2
;** --------------------------------------------------------------------------*
$C$L9:    
;          EXCLUSIVE CPU CYCLES: 1

           STW     .D1T1   A4,*A3            ; |72| 
||         MVK     .L1     0x4,A4            ; |163| 
||         ADDKPC  .S2     $C$RL27,B3,0      ; |163| 

$C$RL27:   ; CALL OCCURS {print_test_results} {0}  ; |163| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 16
           ZERO    .L2     B5                ; |114| 

           STW     .D2T2   B5,*+SP(16)       ; |114| 
||         ZERO    .L2     B4                ; |114| 
||         MVKL    .S2     cycle_counts+24,B7

           MVKH    .S2     cycle_counts+24,B7
||         STW     .D2T2   B4,*+SP(12)       ; |114| 
||         ZERO    .L2     B6                ; |114| 

           MVC     .S2     B6,TSCL           ; |115| 
||         STDW    .D2T2   B5:B4,*B7         ; |114| 

           MVC     .S2     TSCL,B6           ; |116| 
           MVC     .S2     TSCH,B7           ; |116| 
           MVKL    .S1     t_start,A3
           MVKH    .S1     t_start,A3

           MVC     .S2     TSCL,B4           ; |117| 
||         STDW    .D1T2   B7:B6,*A3         ; |116| 

           MVC     .S2     TSCH,B8           ; |117| 
           MVK     .S1     0x80,A31

           CALL    .S2     gimme_random      ; |173| 
||         MVKL    .S1     t_offset,A3
||         ZERO    .L1     A13

           SUBU    .L2     B4,B6,B5:B4       ; |117| 
||         MVKH    .S1     0xc2c80000,A13
||         ZERO    .L1     A12

           EXT     .S2     B5,24,24,B6       ; |117| 
||         MVKH    .S1     0x43480000,A12
||         SUB     .L2     B8,B7,B31         ; |117| 

           ADD     .L2     B31,B6,B5         ; |117| 
||         MVKH    .S1     t_offset,A3

           MV      .L2X    A13,B4            ; |173| 
||         STDW    .D1T2   B5:B4,*A3         ; |117| 
||         MV      .L1     A12,A4            ; |173| 
||         STW     .D2T1   A31,*+SP(20)      ; |117| 
||         ZERO    .S2     B13

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
           ADDKPC  .S2     $C$RL28,B3,0      ; |173| 
$C$RL28:   ; CALL OCCURS {gimme_random} {0}  ; |173| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 105
           MVKL    .S1     input,A11
           MVKH    .S1     input,A11
           LDW     .D1T1   *A11,A3           ; |173| 
           NOP             4
           ADD     .L1X    B13,A3,A3         ; |173| 

           STW     .D1T1   A4,*A3            ; |173| 
||         MVC     .S2     TSCL,B6           ; |122| 

           MVC     .S2     TSCH,B7           ; |122| 

           MVKL    .S1     0x3fc90fdb,A3
||         ZERO    .L1     A31

           MVKH    .S1     0x3fc90fdb,A3
           ABSSP   .S1     A4,A4             ; |68| 

           ADDSP   .L1     A3,A4,A4          ; |68| 
||         MVKH    .S1     0x49800000,A31

           MVKL    .S1     0x3fc90fdb,A30
           MVKH    .S1     0x3fc90fdb,A30
           MVKL    .S1     0x3ea2f983,A29
           CMPGTSP .S1     A4,A31,A0         ; |70| 

   [ A0]   MV      .L1     A30,A4            ; |71| 
||         MVKH    .S1     0x3ea2f983,A29

           MPYSP   .M1     A29,A4,A3         ; |76| 
           ZERO    .L1     A28
           MVKH    .S1     0x40490000,A28
           MVKL    .S2     0x3a7daa22,B4
           SPINT   .L1     A3,A6             ; |76| 
           MVKH    .S2     0x3a7daa22,B4
           MVKL    .S2     0x362e9c5b,B31
           MVKH    .S2     0x362e9c5b,B31
           INTSP   .L1     A6,A5             ; |76| 
           MVKL    .S2     0xb94fb222,B30
           MVKH    .S2     0xb94fb222,B30
           ZERO    .L2     B27               ; |132| 
           MPYSP   .M1     A28,A5,A3         ; |82| 
           MPYSP   .M2X    B4,A5,B4          ; |82| 
           ZERO    .L1     A26
           ZERO    .L1     A27               ; |86| 
           SUBSP   .L1     A4,A3,A3          ; |82| 
           MVKL    .S2     0x3c08873e,B29
           MVKH    .S2     0x3c08873e,B29
           MVKL    .S2     0xbe2aaaa4,B28
           MVKH    .S2     0xbe2aaaa4,B28
           SUBSP   .L2X    A3,B4,B8          ; |82| 
           MVKL    .S1     t_start,A14
           MVKL    .S2     output+12,B16
           MVKH    .S2     output+12,B16
           MPYSP   .M2     B8,B8,B5          ; |96| 
           LDW     .D2T2   *B16,B16          ; |177| 
           AND     .L1     1,A6,A0           ; |79| 
           SET     .S1     A27,31,31,A4      ; |86| 
           MPYSP   .M2     B31,B5,B9         ; |96| 
           ZERO    .L1     A3
           MVKH    .S1     0xbf800000,A3
           CMPLTSP .S2     B8,B27,B0         ; |85| 
           ADDSP   .L2     B30,B9,B4         ; |96| 
           MVKH    .S1     t_start,A14
           STDW    .D1T2   B7:B6,*A14
           ADD     .S2     B13,B16,B26       ; |177| 
           MPYSP   .M2     B5,B4,B9          ; |96| 
           NOP             3
           ADDSP   .L2     B29,B9,B4         ; |96| 
           NOP             3
           MPYSP   .M2     B5,B4,B9          ; |96| 
           NOP             3
           ADDSP   .L2     B28,B9,B4         ; |96| 
           NOP             3
           MPYSP   .M2     B5,B4,B4          ; |96| 
   [ A0]   MV      .L2X    A3,B5             ; |79| 
           SET     .S1     A26,0x17,0x1d,A3
           NOP             1
           MPYSP   .M2     B8,B4,B9          ; |96| 
   [!A0]   MV      .L2X    A3,B5             ; |79| 
           ZERO    .L2     B4
           MVKH    .S2     0x39800000,B4
           ADDSP   .L2     B9,B8,B9          ; |96| 
   [ B0]   XOR     .L2X    B8,A4,B8          ; |86| 
           CMPLTSP .S2     B8,B4,B0          ; |89| 
   [ B0]   MPYSP   .M2     B5,B8,B4          ; |90| 
   [!B0]   MPYSP   .M2     B5,B9,B4          ; |96| 
           NOP             3

           STW     .D2T2   B4,*B26           ; |177| 
||         MVC     .S2     TSCL,B8           ; |128| 

           MVC     .S2     TSCH,B9           ; |128| 

           MVKL    .S2     t_offset,B4
||         LDW     .D2T1   *+SP(20),A25      ; |128| 
||         MVKL    .S1     cycle_counts+24,A3
||         ADD     .L2     4,B13,B13         ; |171| 

           MVKH    .S2     t_offset,B4
||         MVKH    .S1     cycle_counts+24,A3

           LDDW    .D2T2   *B4,B17:B16       ; |130| 
||         LDDW    .D1T1   *A3,A7:A6         ; |130| 
||         MV      .L1     A3,A15            ; |130| 
||         MVKL    .S2     t_stop,B25

           MVKH    .S2     t_stop,B25
           STDW    .D2T2   B9:B8,*B25        ; |128| 
           SUB     .L1     A25,1,A0          ; |171| 
           STW     .D2T1   A0,*+SP(20)       ; |130| 
           ADDU    .L2     B16,B6,B5:B4      ; |130| 

           ADD     .S2     B5,B17,B5         ; |130| 
||         SUBU    .L2     B8,B4,B17:B16     ; |130| 

           ADD     .L2     B5,B7,B4          ; |130| 
|| [ A0]   B       .S1     $C$L10            ; |171| 
||         EXT     .S2     B17,24,24,B5      ; |130| 

   [ A0]   CALL    .S1     gimme_random      ; |173| 
||         SUB     .L2     B9,B4,B4          ; |130| 
||         ADDU    .L1X    A6,B16,A5:A4      ; |130| 

           ADD     .L2     B4,B5,B4          ; |130| 
           ADD     .L1     A5,A7,A3          ; |130| 

           ADD     .L1X    A3,B4,A5          ; |130| 
|| [ A0]   MV      .L2X    A13,B4            ; |173| 

   [!A0]   CALL    .S1     __c6xabi_fltllif  ; |135| 
||         STDW    .D1T1   A5:A4,*A15        ; |130| 
|| [ A0]   MV      .L1     A12,A4            ; |173| 

           ; BRANCHCC OCCURS {$C$L10}        ; |171| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           LDDW    .D1T1   *A15,A5:A4        ; |135| 
           ADDKPC  .S2     $C$RL29,B3,3      ; |135| 
$C$RL29:   ; CALL OCCURS {__c6xabi_fltllif} {0}  ; |135| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 16
           ZERO    .L1     A3
           SET     .S1     A3,0x1a,0x1d,A3
           MPYSP   .M1     A3,A4,A3          ; |135| 
           ZERO    .L1     A13
           SET     .S1     A13,0x15,0x1d,A13
           ZERO    .L1     A12               ; |135| 
           SPDP    .S1     A3,A5:A4          ; |135| 
           NOP             2
           ADDDP   .L1     A13:A12,A5:A4,A5:A4 ; |135| 
           CALLP   .S2     __c6xabi_fixdlli,B3
$C$RL30:   ; CALL OCCURS {__c6xabi_fixdlli} {0}  ; |135| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 15
           MV      .L2X    A15,B6
           MV      .L2X    A12,B4

           MV      .L2X    A12,B5
||         MVK     .S2     24,B13

           SUB     .L2X    A15,B13,B13
||         STDW    .D2T1   A5:A4,*B6         ; |135| 

           MVC     .S2     B4,TSCL           ; |115| 
||         STDW    .D2T2   B5:B4,*B13        ; |114| 

           MVC     .S2     TSCL,B6           ; |116| 
           MVC     .S2     TSCH,B4           ; |116| 
           MV      .L2     B4,B7             ; |116| 

           MVC     .S2     TSCL,B5           ; |117| 
||         STDW    .D1T2   B7:B6,*A14        ; |116| 

           MVC     .S2     TSCH,B4           ; |117| 

           SUBU    .L2     B5,B6,B9:B8       ; |117| 
||         MVKL    .S2     t_offset,B31

           EXT     .S2     B9,24,24,B5       ; |117| 
||         SUB     .L2     B4,B7,B4          ; |117| 

           MVK     .S2     0x80,B4
||         ADD     .L2     B4,B5,B9          ; |117| 

           MVKH    .S2     t_offset,B31

           MV      .L1X    B4,A12            ; |117| 
||         STDW    .D2T2   B9:B8,*B31        ; |117| 
||         MV      .S1     A12,A15

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L11:    
;          EXCLUSIVE CPU CYCLES: 11
           LDW     .D1T1   *A11,A3           ; |185| 
           NOP             4

           ADD     .L1     A15,A3,A3         ; |185| 
||         CALL    .S1     cosf              ; |185| 

           LDW     .D1T1   *A3,A4            ; |185| 
           ADDKPC  .S2     $C$RL31,B3,3      ; |185| 
$C$RL31:   ; CALL OCCURS {cosf} {0}          ; |185| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 9

           MVKL    .S2     output,B4
||         SUB     .L1     A12,1,A0          ; |184| 
||         SUB     .S1     A12,1,A12         ; |184| 

           MVKH    .S2     output,B4
           LDW     .D2T2   *B4,B4            ; |185| 
   [ A0]   BNOP    .S1     $C$L11,3          ; |184| 

           ADD     .L1X    A15,B4,A3         ; |185| 
||         ADD     .S1     4,A15,A15         ; |184| 

           STW     .D1T1   A4,*A3            ; |185| 
           ; BRANCHCC OCCURS {$C$L11}        ; |184| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 19
           MVC     .S2     TSCL,B6           ; |128| 
           MVC     .S2     TSCH,B7           ; |128| 

           MVKL    .S2     t_offset,B4
||         LDDW    .D1T1   *A14,A7:A6        ; |130| 

           MVKH    .S2     t_offset,B4
           LDDW    .D2T2   *B4,B5:B4         ; |130| 
           LDDW    .D2T2   *B13,B9:B8        ; |130| 
           MVKL    .S2     t_stop,B31
           MVKH    .S2     t_stop,B31
           STDW    .D2T2   B7:B6,*B31        ; |128| 
           ADDU    .L1X    B4,A6,A5:A4       ; |130| 
           NOP             1

           ADD     .L1X    A5,B5,A4          ; |130| 
||         SUBU    .L2X    B6,A4,B5:B4       ; |130| 

           ADD     .L1     A4,A7,A3          ; |130| 
||         EXT     .S2     B5,24,24,B16      ; |130| 
||         ADDU    .L2     B8,B4,B5:B4       ; |130| 

           CALL    .S1     __c6xabi_fltllif  ; |130| 
||         ADD     .L2     B5,B9,B5          ; |130| 

           SUB     .L2X    B7,A3,B8          ; |130| 
||         MV      .L1X    B4,A4             ; |130| 

           ADD     .L2     B8,B16,B8         ; |130| 
           ADD     .L2     B5,B8,B4          ; |130| 
           ADDKPC  .S2     $C$RL32,B3,0      ; |130| 
           MV      .L1X    B4,A5             ; |130| 
$C$RL32:   ; CALL OCCURS {__c6xabi_fltllif} {0}  ; |130| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 15
           ZERO    .L1     A3
           SET     .S1     A3,0x1a,0x1d,A3
           MPYSP   .M1     A3,A4,A3          ; |130| 
           ZERO    .L1     A12               ; |130| 
           NOP             2
           SPDP    .S1     A3,A5:A4          ; |130| 
           NOP             1
           ADDDP   .L1     A13:A12,A5:A4,A5:A4 ; |130| 
           CALLP   .S2     __c6xabi_fixdlli,B3
$C$RL33:   ; CALL OCCURS {__c6xabi_fixdlli} {0}  ; |130| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 18
           MV      .L2X    A12,B4            ; |135| 

           ZERO    .L1     A15
||         MV      .L2X    A12,B5            ; |135| 
||         STDW    .D2T1   A5:A4,*B13        ; |130| 

           SET     .S1     A15,0x1a,0x1d,A15
||         STDW    .D2T2   B5:B4,*+B13(8)    ; |114| 
||         MVC     .S2     B4,TSCL           ; |115| 

           MVC     .S2     TSCL,B8           ; |116| 
           MVC     .S2     TSCH,B4           ; |116| 
           MV      .L2     B4,B9             ; |116| 

           STDW    .D1T2   B9:B8,*A14        ; |116| 
||         MVC     .S2     TSCL,B4           ; |117| 

           MVC     .S2     TSCH,B6           ; |117| 

           SUBU    .L2     B4,B8,B5:B4       ; |117| 
||         MVKL    .S2     t_offset,B30

           EXT     .S2     B5,24,24,B7       ; |117| 
||         SUB     .L2     B6,B9,B31         ; |117| 

           ADD     .L2     B31,B7,B7         ; |117| 
||         MV      .D2     B4,B6             ; |117| 
||         MVKH    .S2     t_offset,B30

           STDW    .D2T2   B7:B6,*B30        ; |117| 
           LDW     .D1T1   *A11,A3           ; |193| 
           MVK     .S2     0x80,B29
           STW     .D2T2   B29,*+SP(20)      ; |117| 
           NOP             2

           CALL    .S1     cossp             ; |193| 
||         ADD     .L1     A12,A3,A3         ; |193| 

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L12:    
;          EXCLUSIVE CPU CYCLES: 5
           LDW     .D1T1   *A3,A4            ; |193| 
           ADDKPC  .S2     $C$RL34,B3,3      ; |193| 
$C$RL34:   ; CALL OCCURS {cossp} {0}         ; |193| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 17
           LDW     .D2T2   *B12,B4           ; |193| 
           NOP             4

           ADD     .L1X    A12,B4,A3         ; |193| 
||         LDW     .D2T2   *+SP(20),B4       ; |193| 

           ADD     .L1     4,A12,A12         ; |192| 
           STW     .D1T1   A4,*A3            ; |193| 
           NOP             2

           SUB     .L1X    B4,1,A0           ; |192| 
||         SUB     .L2     B4,1,B4           ; |192| 

   [ A0]   BNOP    .S1     $C$L12,4          ; |192| 
|| [ A0]   LDW     .D1T1   *A11,A3           ; |193| 
||         STW     .D2T2   B4,*+SP(20)       ; |193| 

   [ A0]   CALL    .S1     cossp             ; |193| 
||         ADD     .L1     A12,A3,A3         ; |193| 

           ; BRANCHCC OCCURS {$C$L12}        ; |192| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 19
           MVC     .S2     TSCL,B8           ; |128| 
           MVC     .S2     TSCH,B4           ; |128| 

           MV      .L2     B4,B9             ; |128| 
||         MVKL    .S2     t_offset,B5
||         LDDW    .D1T1   *A14,A5:A4        ; |130| 

           MVKH    .S2     t_offset,B5
           LDDW    .D2T2   *B5,B7:B6         ; |130| 
           MV      .L2     B13,B12           ; |130| 
           MVKL    .S2     t_stop,B31
           MVKH    .S2     t_stop,B31
           LDDW    .D2T2   *+B12(8),B5:B4    ; |130| 
           ADDU    .L1X    B6,A4,A7:A6       ; |130| 
           MV      .L1     A6,A3             ; |130| 
           ADD     .L1X    A7,B7,A4          ; |130| 

           SUBU    .L2X    B8,A3,B7:B6       ; |130| 
||         ADD     .L1     A4,A5,A3          ; |130| 

           EXT     .S2     B7,24,24,B16      ; |130| 
||         ADDU    .L2     B4,B6,B7:B6       ; |130| 
||         CALL    .S1     __c6xabi_fltllif  ; |130| 

           SUB     .L2X    B9,A3,B4          ; |130| 
||         ADD     .S2     B7,B5,B5          ; |130| 

           MV      .L1X    B6,A4             ; |130| 
||         ADD     .L2     B4,B16,B6         ; |130| 

           ADD     .L2     B5,B6,B4          ; |130| 
           STDW    .D2T2   B9:B8,*B31        ; |128| 

           MV      .L1X    B4,A5             ; |130| 
||         ADDKPC  .S2     $C$RL35,B3,0      ; |130| 

$C$RL35:   ; CALL OCCURS {__c6xabi_fltllif} {0}  ; |130| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 13
           MPYSP   .M1     A15,A4,A3         ; |130| 
           ZERO    .L1     A12               ; |130| 
           NOP             2
           SPDP    .S1     A3,A5:A4          ; |130| 
           NOP             1
           ADDDP   .L1     A13:A12,A5:A4,A5:A4 ; |130| 
           CALLP   .S2     __c6xabi_fixdlli,B3
$C$RL36:   ; CALL OCCURS {__c6xabi_fixdlli} {0}  ; |130| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 18

           ADDAD   .D2     B12,1,B13
||         MV      .L2X    A12,B5

           MV      .L2X    A12,B4
||         STDW    .D2T1   A5:A4,*B13        ; |130| 

           STDW    .D2T2   B5:B4,*+B12(16)   ; |114| 
||         MVC     .S2     B4,TSCL           ; |115| 

           MVC     .S2     TSCL,B8           ; |116| 
           MVC     .S2     TSCH,B4           ; |116| 
           MV      .L2     B4,B9             ; |116| 

           STDW    .D1T2   B9:B8,*A14        ; |116| 
||         MVC     .S2     TSCL,B5           ; |117| 

           MVC     .S2     TSCH,B4           ; |117| 

           SUBU    .L2     B5,B8,B7:B6       ; |117| 
||         MVKL    .S2     t_offset,B31

           EXT     .S2     B7,24,24,B5       ; |117| 
||         SUB     .L2     B4,B9,B4          ; |117| 

           ADD     .L2     B4,B5,B7          ; |117| 
||         MVKH    .S2     t_offset,B31

           STDW    .D2T2   B7:B6,*B31        ; |117| 
           LDW     .D1T1   *A11,A3           ; |201| 
           MVK     .S2     0x80,B30
           STW     .D2T2   B30,*+SP(20)      ; |117| 
           NOP             2

           CALL    .S1     cossp_c           ; |201| 
||         ADD     .L1     A12,A3,A3         ; |201| 

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L13:    
;          EXCLUSIVE CPU CYCLES: 5
           LDW     .D1T1   *A3,A4            ; |201| 
           ADDKPC  .S2     $C$RL37,B3,3      ; |201| 
$C$RL37:   ; CALL OCCURS {cossp_c} {0}       ; |201| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 17
           LDW     .D2T2   *B11,B4           ; |201| 
           NOP             4

           ADD     .L1X    A12,B4,A3         ; |201| 
||         LDW     .D2T2   *+SP(20),B4       ; |201| 

           ADD     .L1     4,A12,A12         ; |200| 
           STW     .D1T1   A4,*A3            ; |201| 
           NOP             2

           SUB     .L1X    B4,1,A0           ; |200| 
||         SUB     .L2     B4,1,B4           ; |200| 

   [ A0]   BNOP    .S1     $C$L13,4          ; |200| 
|| [ A0]   LDW     .D1T1   *A11,A3           ; |201| 
||         STW     .D2T2   B4,*+SP(20)       ; |201| 

   [ A0]   CALL    .S1     cossp_c           ; |201| 
||         ADD     .L1     A12,A3,A3         ; |201| 

           ; BRANCHCC OCCURS {$C$L13}        ; |200| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 17
           MVC     .S2     TSCL,B6           ; |128| 
           MVC     .S2     TSCH,B5           ; |128| 

           MVKL    .S2     t_offset,B4
||         LDDW    .D1T1   *A14,A5:A4        ; |130| 

           MVKH    .S2     t_offset,B4
           LDDW    .D2T2   *B4,B9:B8         ; |130| 
           MV      .L2     B5,B7             ; |128| 
           LDDW    .D2T2   *+B12(16),B17:B16 ; |130| 
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
||         ADDKPC  .S2     $C$RL38,B3,0      ; |130| 

$C$RL38:   ; CALL OCCURS {__c6xabi_fltllif} {0}  ; |130| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 106
           MPYSP   .M1     A15,A4,A3         ; |130| 
           ZERO    .L1     A12               ; |130| 
           NOP             3
           SPDP    .S2X    A3,B5:B4          ; |130| 
           NOP             2
           ADDDP   .L1X    A13:A12,B5:B4,A5:A4 ; |130| 
           CALLP   .S2     __c6xabi_fixdlli,B3
$C$RL39:   ; CALL OCCURS {__c6xabi_fixdlli} {0}  ; |130| 

           ADDAD   .D2     B13,1,B11
||         MV      .L2X    A12,B5

           MV      .L2X    A12,B4
||         STDW    .D2T1   A5:A4,*B11        ; |130| 

           STDW    .D2T2   B5:B4,*+B12(32)   ; |114| 
||         MVC     .S2     B4,TSCL           ; |115| 

           MVC     .S2     TSCL,B4           ; |116| 
           MVC     .S2     TSCH,B5           ; |116| 

           STDW    .D1T2   B5:B4,*A14        ; |116| 
||         MVC     .S2     TSCL,B6           ; |117| 

           MVC     .S2     TSCH,B8           ; |117| 
           MVKL    .S1     t_offset,A3
           MVKL    .S1     output,A12

           SUBU    .L2     B6,B4,B7:B6       ; |117| 
||         MVKH    .S1     t_offset,A3

           MVKH    .S1     output,A12
||         MV      .L2X    A11,B9            ; |208| 
||         SUB     .D2     B8,B5,B4          ; |117| 
||         EXT     .S2     B7,24,24,B5       ; |117| 

           ADD     .L2     B4,B5,B7          ; |117| 
||         LDW     .D1T2   *+A12(16),B4      ; |208| 
||         LDW     .D2T1   *B9,A4            ; |208| 
||         MV      .S2X    A3,B12            ; |117| 

           CALLP   .S2     cossp_v,B3
||         STDW    .D2T2   B7:B6,*B12        ; |117| 
||         MVK     .S1     0x80,A6           ; |208| 

$C$RL40:   ; CALL OCCURS {cossp_v} {0}       ; |208| 
           MVC     .S2     TSCL,B8           ; |128| 
           MVC     .S2     TSCH,B4           ; |128| 

           LDDW    .D1T1   *A14,A17:A16      ; |130| 
||         LDDW    .D2T2   *B12,B7:B6        ; |130| 

           MVK     .S1     16,A11
           ADD     .L1X    B11,A11,A11
           LDDW    .D1T1   *A11,A9:A8        ; |130| 
           MV      .L2     B4,B9             ; |128| 
           ADDU    .L1X    B6,A16,A5:A4      ; |130| 
           ADD     .L1X    A5,B7,A3          ; |130| 
           SUBU    .L1X    B8,A4,A7:A6       ; |130| 

           ADD     .L1     A3,A17,A3         ; |130| 
||         EXT     .S1     A7,24,24,A7       ; |130| 

           SUB     .S1X    B9,A3,A3          ; |130| 
||         ADDU    .L1     A8,A6,A5:A4       ; |130| 
||         MVKL    .S2     t_stop,B4

           ADD     .L1     A5,A9,A3          ; |130| 
||         ADD     .S1     A3,A7,A5          ; |130| 
||         MVKH    .S2     t_stop,B4

           CALLP   .S2     __c6xabi_fltllif,B3
||         ADD     .L1     A3,A5,A5          ; |130| 
||         STDW    .D2T2   B9:B8,*B4         ; |128| 

$C$RL41:   ; CALL OCCURS {__c6xabi_fltllif} {0}  ; |130| 
           MPYSP   .M1     A15,A4,A3         ; |130| 
           MV      .L1     A13,A5            ; |130| 
           ZERO    .L1     A4                ; |130| 
           NOP             2
           SPDP    .S1     A3,A7:A6          ; |130| 
           NOP             1
           ADDDP   .L1     A5:A4,A7:A6,A5:A4 ; |130| 
           CALLP   .S2     __c6xabi_fixdlli,B3
$C$RL42:   ; CALL OCCURS {__c6xabi_fixdlli} {0}  ; |130| 
           MVKL    .S2     0x3f2a36e2,B7
           MVKL    .S2     0xeb1c432d,B6

           STDW    .D1T1   A5:A4,*A11        ; |130| 
||         MVKH    .S2     0x3f2a36e2,B7

           LDW     .D1T2   *+A12(4),B4       ; |66| 
||         MVKH    .S2     0xeb1c432d,B6

           CALLP   .S2     isequal,B3
||         LDW     .D1T1   *A12,A4           ; |66| 
||         MVK     .S1     0x80,A6           ; |66| 
||         MVK     .L1     0x1,A8            ; |66| 

$C$RL43:   ; CALL OCCURS {isequal} {0}       ; |66| 

           MVKL    .S1     fcn_pass,A3
||         MVKL    .S2     0xeb1c432d,B6

           MVKH    .S1     fcn_pass,A3
||         MVKL    .S2     0x3f2a36e2,B7

           MVKH    .S2     0xeb1c432d,B6

           MV      .L1     A4,A5             ; |66| 
||         LDW     .D1T1   *A12,A4           ; |67| 
||         MV      .L2X    A3,B11            ; |66| 
||         MVKH    .S2     0x3f2a36e2,B7

           CALLP   .S2     isequal,B3
||         LDW     .D1T2   *+A12(8),B4       ; |67| 
||         STW     .D2T1   A5,*+B11(4)       ; |66| 
||         MVK     .S1     0x80,A6           ; |67| 
||         MVK     .L1     0x1,A8            ; |67| 

$C$RL44:   ; CALL OCCURS {isequal} {0}       ; |67| 
           MVKL    .S2     0x3f2a36e2,B7
           MVKL    .S2     0xeb1c432d,B6
           MVKH    .S2     0x3f2a36e2,B7

           STW     .D2T1   A4,*+B11(8)       ; |67| 
||         LDW     .D1T2   *+A12(12),B4      ; |68| 
||         MVKH    .S2     0xeb1c432d,B6

           CALLP   .S2     isequal,B3
||         LDW     .D1T1   *A12,A4           ; |68| 
||         MVK     .S1     0x80,A6           ; |68| 
||         MVK     .L1     0x1,A8            ; |68| 

$C$RL45:   ; CALL OCCURS {isequal} {0}       ; |68| 
           MVKL    .S2     0x3f2a36e2,B7
           MVKL    .S2     0xeb1c432d,B6
           MVKH    .S2     0x3f2a36e2,B7

           STW     .D2T1   A4,*+B11(12)      ; |68| 
||         LDW     .D1T2   *A10,B4           ; |69| 
||         MVKH    .S2     0xeb1c432d,B6

           CALLP   .S2     isequal,B3
||         LDW     .D1T1   *A12,A4           ; |69| 
||         MVK     .S1     0x80,A6           ; |69| 
||         MVK     .L1     0x1,A8            ; |69| 

$C$RL46:   ; CALL OCCURS {isequal} {0}       ; |69| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 16
           LDW     .D2T2   *+SP(24),B5       ; |69| 
           MV      .L2X    A4,B4             ; |69| 
           STW     .D2T2   B4,*+B11(16)      ; |69| 
           NOP             2
           LDW     .D2T2   *B5,B0            ; |72| 
           NOP             4

   [!B0]   BNOP    .S1     $C$L14,4          ; |72| 
||         MV      .L2     B0,B1             ; guard predicate rewrite
|| [ B0]   LDW     .D2T2   *B10,B0           ; |72| 

   [ B1]   ADD     .L2     4,B10,B5
           ; BRANCHCC OCCURS {$C$L14}        ; |72| 
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

   [ B0]   B       .S1     $C$L15            ; |72| 
   [ B0]   CALL    .S1     print_test_results ; |214| 
   [ B0]   MVKL    .S1     all_pass,A4
   [ B0]   MVKH    .S1     all_pass,A4
           NOP             2
           ; BRANCHCC OCCURS {$C$L15}        ; |72| 
;** --------------------------------------------------------------------------*
$C$L14:    
;          EXCLUSIVE CPU CYCLES: 5
           CALL    .S1     print_test_results ; |214| 
           MVKL    .S1     all_pass,A4
           MVKH    .S1     all_pass,A4
           ZERO    .L1     A3                ; |72| 
           NOP             1
;** --------------------------------------------------------------------------*
$C$L15:    
;          EXCLUSIVE CPU CYCLES: 1

           STW     .D1T1   A3,*A4            ; |72| 
||         MVK     .L1     0x2,A4            ; |214| 
||         ADDKPC  .S2     $C$RL47,B3,0      ; |214| 

$C$RL47:   ; CALL OCCURS {print_test_results} {0}  ; |214| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 30
           MVKL    .S2     $C$SL2+0,B4
           MVKH    .S2     $C$SL2+0,B4

           CALLP   .S2     printf,B3
||         STW     .D2T2   B4,*+SP(4)        ; |215| 

$C$RL48:   ; CALL OCCURS {printf} {0}        ; |215| 
           MVKL    .S2     $C$SL3+0,B4
           MVKH    .S2     $C$SL3+0,B4

           CALLP   .S2     printf,B3
||         STW     .D2T2   B4,*+SP(4)        ; |215| 

$C$RL49:   ; CALL OCCURS {printf} {0}        ; |215| 
           MVKL    .S1     $C$SL1+0,A10
           MVKH    .S1     $C$SL1+0,A10

           CALLP   .S2     print_profile_results,B3
||         MV      .L1     A10,A4            ; |222| 

$C$RL50:   ; CALL OCCURS {print_profile_results} {0}  ; |222| 

           CALLP   .S2     print_memory_results,B3
||         MV      .L1     A10,A4            ; |225| 

$C$RL51:   ; CALL OCCURS {print_memory_results} {0}  ; |225| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 11
           LDW     .D2T2   *++SP(32),B3      ; |226| 
           LDDW    .D2T1   *++SP,A13:A12     ; |226| 
           LDDW    .D2T1   *++SP,A15:A14     ; |226| 
           LDDW    .D2T2   *++SP,B11:B10     ; |226| 
           LDDW    .D2T2   *++SP,B13:B12     ; |226| 

           LDW     .D2T1   *++SP(8),A10      ; |226| 
||         RET     .S2     B3                ; |226| 

           LDW     .D2T1   *++SP(8),A11      ; |226| 
           NOP             4
           ; BRANCH OCCURS {B3}              ; |226| 
;******************************************************************************
;* STRINGS                                                                    *
;******************************************************************************
	.sect	".const:.string"
$C$SL1:	.string	"cosSP",0
$C$SL2:	.string	"----------------------------------------",0
$C$SL3:	.string	"----------------------------------------",10,0
;*****************************************************************************
;* UNDEFINED EXTERNAL REFERENCES                                             *
;*****************************************************************************
	.global	printf
	.global	cos
	.global	cosf
	.global	driver_init
	.global	print_profile_results
	.global	print_memory_results
	.global	print_test_results
	.global	gimme_random
	.global	isequal
	.global	cossp
	.global	cossp_c
	.global	cossp_v
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
