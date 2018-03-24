;******************************************************************************
;* TMS320C6x C/C++ Codegen                                          PC v7.4.2 *
;* Date/Time created: Mon May 16 23:53:59 2016                                *
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
	.word	0c27c3dc1h		; _a[0] @ 0
	.word	0c2af376ch		; _a[1] @ 32
	.word	0c267c9a1h		; _a[2] @ 64
	.word	042560122h		; _a[3] @ 96
	.word	0c29ae88ah		; _a[4] @ 128
	.word	041b38a67h		; _a[5] @ 160
	.word	0425f7412h		; _a[6] @ 192
	.word	0425ae64fh		; _a[7] @ 224
	.word	0c22b00cch		; _a[8] @ 256
	.word	0427924f6h		; _a[9] @ 288
$C$IR_1:	.set	40

	.global	_a
_a:	.usect	".far",40,8
;	C:\MATHLIB_Tools\CCSV5_5_0\ccsv5\tools\compiler\c6000_7.4.2\bin\opt6x.exe C:\\Users\\gtbldadm\\AppData\\Local\\Temp\\025366 C:\\Users\\gtbldadm\\AppData\\Local\\Temp\\025368 
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
;*   Local Frame Size  : 8 Args + 20 Auto + 56 Save = 84 byte                 *
;******************************************************************************
_main:
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 12
           STW     .D2T1   A11,*SP--(8)      ; |93| 
           STW     .D2T1   A10,*SP--(8)      ; |93| 
           STDW    .D2T2   B13:B12,*SP--     ; |93| 
           STDW    .D2T2   B11:B10,*SP--     ; |93| 
           STDW    .D2T1   A15:A14,*SP--     ; |93| 

           STDW    .D2T1   A13:A12,*SP--     ; |93| 
||         MVKL    .S1     $C$SL1+0,A4

           STW     .D2T2   B3,*SP--(40)      ; |93| 
||         CALLP   .S2     _driver_init,B3
||         MVKH    .S1     $C$SL1+0,A4

$C$RL0:    ; CALL OCCURS {_driver_init} {0}  ; |101| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 8
           MVKL    .S1     _a,A12

           MVKH    .S1     _a,A12
||         MVKL    .S2     _output,B13

           MVKH    .S2     _output,B13

           MV      .L2X    A12,B10
||         CALL    .S1     __divf            ; |110| 
||         LDW     .D2T1   *B13,A13

           LDW     .D2T2   *B10++,B4         ; |110| 
           ZERO    .L1     A4
           SET     .S1     A4,0x17,0x1d,A4
           MVK     .L1     0xa,A10
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L1:    
;          EXCLUSIVE CPU CYCLES: 1
           ADDKPC  .S2     $C$RL1,B3,0       ; |110| 
$C$RL1:    ; CALL OCCURS {__divf} {0}        ; |110| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 7

           SUB     .L1     A10,1,A0          ; |109| 
||         STW     .D1T1   A4,*A13++         ; |110| 
||         SUB     .S1     A10,1,A10         ; |109| 

   [ A0]   B       .S1     $C$L1             ; |109| 
|| [ A0]   LDW     .D2T2   *B10++,B4         ; |110| 
|| [!A0]   MVK     .L2     0xa,B5
|| [ A0]   ZERO    .L1     A4
|| [!A0]   ADD     .S2     4,B13,B4
|| [!A0]   MV      .D1     A12,A11

   [ A0]   CALL    .S1     __divf            ; |110| 
   [!A0]   ZERO    .L2     B10
   [!A0]   STW     .D2T2   B4,*+SP(20)
   [ A0]   SET     .S1     A4,0x17,0x1d,A4
   [!A0]   MV      .L1X    B5,A10
           ; BRANCHCC OCCURS {$C$L1}         ; |109| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 1
           CALL    .S1     _recipsp          ; |113| 
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L2:    
;          EXCLUSIVE CPU CYCLES: 5
           LDW     .D1T1   *A12++,A4         ; |113| 
           ADDKPC  .S2     $C$RL2,B3,3       ; |113| 
$C$RL2:    ; CALL OCCURS {_recipsp} {0}      ; |113| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 12
           LDW     .D2T2   *+SP(20),B4       ; |113| 
           SUB     .L1     A10,1,A0          ; |112| 
           SUB     .L1     A10,1,A10         ; |112| 
           NOP             2
           LDW     .D2T2   *B4,B4            ; |113| 
   [ A0]   BNOP    .S1     $C$L2,3           ; |112| 

           ADD     .L2     B10,B4,B4         ; |113| 
||         ADD     .S2     4,B10,B10         ; |112| 

   [ A0]   CALL    .S1     _recipsp          ; |113| 
||         STW     .D2T1   A4,*B4            ; |113| 

           ; BRANCHCC OCCURS {$C$L2}         ; |112| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 7
           LDW     .D2T2   *+SP(20),B4
           MVK     .L2     0xa,B5
           ZERO    .L2     B10
           MV      .L1     A11,A13
           MV      .L1X    B5,A12
           ADD     .L2     4,B4,B4

           STW     .D2T2   B4,*+SP(24)
||         CALL    .S1     _recipsp_c        ; |116| 

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L3:    
;          EXCLUSIVE CPU CYCLES: 5
           LDW     .D1T1   *A13++,A4         ; |116| 
           ADDKPC  .S2     $C$RL3,B3,3       ; |116| 
$C$RL3:    ; CALL OCCURS {_recipsp_c} {0}    ; |116| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 12
           LDW     .D2T2   *+SP(24),B4       ; |116| 
           SUB     .L1     A12,1,A0          ; |115| 
           SUB     .L1     A12,1,A12         ; |115| 
   [!A0]   ZERO    .L1     A3
           NOP             1
           LDW     .D2T2   *B4,B4            ; |116| 
   [ A0]   BNOP    .S1     $C$L3,3           ; |115| 

           ADD     .L2     B10,B4,B4         ; |116| 
||         ADD     .S2     4,B10,B10         ; |115| 

   [ A0]   CALL    .S1     _recipsp_c        ; |116| 
|| [!A0]   MVKL    .S2     0x7f7fffff,B10
||         STW     .D2T1   A4,*B4            ; |116| 

           ; BRANCHCC OCCURS {$C$L3}         ; |115| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 3

           SET     .S1     A3,0x1e,0x1e,A3
||         MVKH    .S2     0x7f7fffff,B10
||         MVK     .L1     9,A1
||         LDW     .D2T2   *+B13(12),B8
||         ZERO    .L2     B4

           DINT                              ; interrupts off
||         MV      .L2X    A11,B7

           MV      .L2X    A3,B5
||         MV      .L1X    B10,A3

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*
;*      Loop found in file               : C:/nightlybuilds/mathlib/ti/mathlib/src/recipsp/recipsp_d.c
;*      Loop source line                 : 118
;*      Loop opening brace source line   : 118
;*      Loop closing brace source line   : 120
;*      Known Minimum Trip Count         : 10                    
;*      Known Maximum Trip Count         : 10                    
;*      Known Max Trip Count Factor      : 10
;*      Loop Carried Dependency Bound(^) : 31
;*      Unpartitioned Resource Bound     : 2
;*      Partitioned Resource Bound(*)    : 4
;*      Resource Partition:
;*                                A-side   B-side
;*      .L units                     0        0     
;*      .S units                     3        1     
;*      .D units                     0        2     
;*      .M units                     0        4*    
;*      .X cross paths               1        0     
;*      .T address paths             0        2     
;*      Long read paths              0        0     
;*      Long write paths             0        0     
;*      Logical  ops (.LS)           0        2     (.L or .S unit)
;*      Addition ops (.LSD)          0        1     (.L or .S or .D unit)
;*      Bound(.L .S .LS)             2        2     
;*      Bound(.L .S .D .LS .LSD)     1        2     
;*
;*      Searching for software pipeline schedule at ...
;*         ii = 31 Schedule found with 1 iterations in parallel
;*
;*      Register Usage Table:
;*          +-----------------------------------------------------------------+
;*          |AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA|BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB|
;*          |00000000001111111111222222222233|00000000001111111111222222222233|
;*          |01234567890123456789012345678901|01234567890123456789012345678901|
;*          |--------------------------------+--------------------------------|
;*       0: | * *                            |    ** **                       |
;*       1: | * *                            |    ** **                       |
;*       2: | * *                            |    ** **                       |
;*       3: | * *                            |    ** **                       |
;*       4: | * *                            |    ** **                       |
;*       5: | * *                            |    *****                       |
;*       6: | * **                           |    *****       *               |
;*       7: | * **                           |    *****       *               |
;*       8: | * **                           |    *****       *               |
;*       9: | * **                           |    *****       *               |
;*      10: | * **                           |    ******      *               |
;*      11: | * **                           |    *****       *               |
;*      12: | * **                           |    *****       *               |
;*      13: | * **                           |    *****       *               |
;*      14: | * **                           |    ******      *               |
;*      15: | * **                           |    *****                       |
;*      16: | * **                           |    *****                       |
;*      17: | * **                           |    *****                       |
;*      18: | * **                           |    ******                      |
;*      19: | * **                           |    ** ***                      |
;*      20: | * **                           |    ** ***                      |
;*      21: | * **                           |    ** ***                      |
;*      22: | * **                           |    ******                      |
;*      23: | * **                           |    ** ***                      |
;*      24: | * **                           |    ** ***                      |
;*      25: |** *                            |    ** ***                      |
;*      26: |** *                            |    ******      *               |
;*      27: | * *                            |    ** **       *               |
;*      28: | * *                            |    ** **       *               |
;*      29: | * *                            |    ** **       *               |
;*      30: | * *                            |    ** **       *               |
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
;*      Total cycles (est.)         : 0 + min_trip_cnt * 31 = 310        
;*----------------------------------------------------------------------------*
;*       SETUP CODE
;*
;*                  SUB             A1,1,A1
;*
;*        SINGLE SCHEDULED ITERATION
;*
;*        $C$C77:
;*   0              LDW     .D2T2   *B7++,B6          ; |60|  ^ 
;*   1              NOP             4
;*   5              RCPSP   .S2     B6,B16            ; |60|  ^ 
;*     ||           ABSSP   .S1X    B6,A4             ; |60| 
;*   6              MPYSP   .M2     B16,B6,B9         ; |60|  ^ 
;*   7              NOP             3
;*  10              SUBSP   .L2     B5,B9,B9          ; |60|  ^ 
;*  11              NOP             3
;*  14              MPYSP   .M2     B16,B9,B9         ; |60|  ^ 
;*  15              NOP             3
;*  18              MPYSP   .M2     B9,B6,B6          ; |60|  ^ 
;*  19              NOP             3
;*  22              SUBSP   .L2     B5,B6,B6          ; |60|  ^ 
;*  23              NOP             1
;*  24              CMPGTSP .S1     A4,A3,A0          ; |60| 
;*  25      [ A0]   MV      .S2     B4,B16            ; |60| 
;*     ||   [ A1]   BDEC    .S1     $C$C77,A1         ; |118| 
;*  26      [!A0]   MPYSP   .M2     B9,B6,B16         ; |60|  ^ 
;*  27              NOP             3
;*  30              STW     .D2T2   B16,*B8++         ; |60|  ^ 
;*  31              ; BRANCHCC OCCURS {$C$C77}        ; |118| 
;*----------------------------------------------------------------------------*
$C$L4:    ; PIPED LOOP PROLOG
;** --------------------------------------------------------------------------*
$C$L5:    ; PIPED LOOP KERNEL
;          EXCLUSIVE CPU CYCLES: 31
           LDW     .D2T2   *B7++,B6          ; |60| <0,0>  ^ 
           NOP             4

           ABSSP   .S1X    B6,A4             ; |60| <0,5> 
||         RCPSP   .S2     B6,B16            ; |60| <0,5>  ^ 

           MPYSP   .M2     B16,B6,B9         ; |60| <0,6>  ^ 
           NOP             3
           SUBSP   .L2     B5,B9,B9          ; |60| <0,10>  ^ 
           NOP             3
           MPYSP   .M2     B16,B9,B9         ; |60| <0,14>  ^ 
           NOP             3
           MPYSP   .M2     B9,B6,B6          ; |60| <0,18>  ^ 
           NOP             3
           SUBSP   .L2     B5,B6,B6          ; |60| <0,22>  ^ 
           NOP             1
           CMPGTSP .S1     A4,A3,A0          ; |60| <0,24> 

   [ A0]   MV      .S2     B4,B16            ; |60| <0,25> 
|| [ A1]   BDEC    .S1     $C$L5,A1          ; |118| <0,25> 

   [!A0]   MPYSP   .M2     B9,B6,B16         ; |60| <0,26>  ^ 
           NOP             3
           STW     .D2T2   B16,*B8++         ; |60| <0,30>  ^ 
;** --------------------------------------------------------------------------*
$C$L6:    ; PIPED LOOP EPILOG
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 8
           MV      .L1X    B13,A14

           MV      .L1X    B4,A15
||         MVK     .S1     0xa,A6            ; |121| 
||         RINT                              ; interrupts on
||         MV      .D1     A11,A4            ; |121| 

           CALLP   .S2     _recipsp_v,B3
||         LDW     .D1T2   *+A14(16),B4      ; |121| 
||         MV      .L1     A3,A13
||         MV      .S1X    B5,A12

$C$RL4:    ; CALL OCCURS {_recipsp_v} {0}    ; |121| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 48
           MVKL    .S2     0x3eb0c6f7,B7
           MVKL    .S2     0xa0b5ed8d,B6
           MVKH    .S2     0x3eb0c6f7,B7

           LDW     .D1T1   *A14,A4           ; |66| 
||         MVKH    .S2     0xa0b5ed8d,B6

           CALLP   .S2     _isequal,B3
||         LDW     .D1T2   *+A14(4),B4       ; |66| 
||         MVK     .L1     0xa,A6            ; |66| 
||         MVK     .S1     0x1,A8            ; |66| 

$C$RL5:    ; CALL OCCURS {_isequal} {0}      ; |66| 
           MVKL    .S2     _fcn_pass,B4
           MVKL    .S2     0xa0b5ed8d,B6
           MVKL    .S2     0x3eb0c6f7,B7
           MVKH    .S2     _fcn_pass,B4
           MVKH    .S2     0xa0b5ed8d,B6

           MV      .L1     A4,A3             ; |66| 
||         LDW     .D1T1   *A14,A4           ; |67| 
||         MVKH    .S2     0x3eb0c6f7,B7

           CALLP   .S2     _isequal,B3
||         STW     .D2T1   A3,*+B4(4)        ; |66| 
||         LDW     .D1T2   *+A14(8),B4       ; |67| 
||         MVK     .L1     0xa,A6            ; |67| 
||         MVK     .S1     0x1,A8            ; |67| 

$C$RL6:    ; CALL OCCURS {_isequal} {0}      ; |67| 
           MVKL    .S2     _fcn_pass,B4
           MVKL    .S2     0xa0b5ed8d,B6
           MVKL    .S2     0x3eb0c6f7,B7
           MVKH    .S2     _fcn_pass,B4
           MVKH    .S2     0xa0b5ed8d,B6

           MV      .L1X    B13,A3
||         STW     .D2T1   A4,*+B4(8)        ; |67| 
||         LDW     .D1T2   *+A14(12),B4      ; |68| 
||         MVKH    .S2     0x3eb0c6f7,B7

           CALLP   .S2     _isequal,B3
||         LDW     .D1T1   *A3,A4            ; |68| 
||         MVK     .L1     0xa,A6            ; |68| 
||         MVK     .S1     0x1,A8            ; |68| 

$C$RL7:    ; CALL OCCURS {_isequal} {0}      ; |68| 
           MVKL    .S2     0xa0b5ed8d,B6

           LDW     .D2T2   *+SP(24),B5
||         MVKL    .S2     _fcn_pass,B31

           MVKL    .S2     0x3eb0c6f7,B7
           MVKH    .S2     _fcn_pass,B31
           MVKH    .S2     0xa0b5ed8d,B6

           STW     .D2T1   A4,*+B31(12)      ; |68| 
||         MVKH    .S2     0x3eb0c6f7,B7

           ADDAD   .D2     B5,1,B4
||         MVKL    .S2     _output,B5

           MVKH    .S2     _output,B5
||         LDW     .D2T2   *B4,B4            ; |69| 

           CALLP   .S2     _isequal,B3
||         LDW     .D2T1   *B5,A4            ; |69| 
||         MVK     .L1     0xa,A6            ; |69| 
||         MVK     .S1     0x1,A8            ; |69| 

$C$RL8:    ; CALL OCCURS {_isequal} {0}      ; |69| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 14
           MVKL    .S1     _fcn_pass,A3
           MVKH    .S1     _fcn_pass,A3
           ADD     .L1     4,A3,A11
           LDW     .D1T1   *A11,A0           ; |72| 
           MV      .L2X    A3,B5             ; |72| 
           ADD     .L2X    8,A3,B11
           STW     .D2T1   A4,*+B5(16)       ; |69| 
           NOP             1

   [!A0]   B       .S1     $C$L7             ; |72| 
|| [ A0]   LDW     .D2T2   *B11,B0           ; |72| 

   [!A0]   CALL    .S1     _print_test_results ; |125| 
   [!A0]   ZERO    .L1     A3                ; |72| 
   [ A0]   ADD     .L2     4,B11,B4
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
           CALL    .S1     _print_test_results ; |125| 
           MVKL    .S1     _all_pass,A4
           MVKH    .S1     _all_pass,A4
           NOP             2
;** --------------------------------------------------------------------------*
$C$L7:    
;          EXCLUSIVE CPU CYCLES: 1

           STW     .D1T1   A3,*A4            ; |72| 
||         MVK     .L1     0x1,A4            ; |125| 
||         ADDKPC  .S2     $C$RL9,B3,0       ; |125| 

$C$RL9:    ; CALL OCCURS {_print_test_results} {0}  ; |125| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 7

           MVKL    .S2     _a_sc,B4
||         ZERO    .L2     B7

           LDW     .D2T2   *+SP(24),B31      ; |133| 
||         MVKH    .S2     0xff800000,B7
||         ZERO    .L1     A3

           MVKH    .S2     _a_sc,B4
||         SET     .S1     A3,0x17,0x1d,A3
||         ZERO    .L1     A7
||         ADD     .L2     1,B10,B6

           STDW    .D2T2   B7:B6,*+B4(8)     ; |135| 
||         MV      .L1     A3,A6             ; |137| 
||         MVKH    .S1     0xbf800000,A7
||         ZERO    .D1     A5

           MVK     .L2     0x6,B4
||         STDW    .D2T1   A7:A6,*+B4(16)    ; |137| 
||         MV      .L1X    B4,A14            ; |133| 
||         MV      .S2     B4,B5             ; |133| 
||         MVKH    .S1     0x80000000,A5
||         MV      .D1     A15,A4            ; |133| 

           ZERO    .L1     A4
||         STDW    .D2T1   A5:A4,*B5         ; |133| 

           CALL    .S2     __divf            ; |139| 
||         MV      .L1X    B4,A10            ; |135| 
||         SET     .S1     A4,0x17,0x1d,A4
||         ADD     .L2     4,B31,B10
||         ZERO    .D2     B12

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
           LDW     .D1T2   *A14,B4           ; |139| 
           ADDKPC  .S2     $C$RL10,B3,3      ; |139| 
$C$RL10:   ; CALL OCCURS {__divf} {0}        ; |139| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 26
           LDW     .D2T2   *B13,B4           ; |139| 
           NOP             4
           ADD     .L2     B12,B4,B4         ; |139| 
           STW     .D2T1   A4,*B4            ; |139| 

           CALLP   .S2     _recipsp,B3
||         LDW     .D1T1   *A14,A4           ; |140| 

$C$RL11:   ; CALL OCCURS {_recipsp} {0}      ; |140| 
           LDW     .D2T2   *+B13(4),B4       ; |140| 
           NOP             4
           ADD     .L2     B12,B4,B4         ; |140| 
           STW     .D2T1   A4,*B4            ; |140| 

           CALLP   .S2     _recipsp_c,B3
||         LDW     .D1T1   *A14,A4           ; |141| 

$C$RL12:   ; CALL OCCURS {_recipsp_c} {0}    ; |141| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 39
           LDW     .D2T2   *+B13(8),B4       ; |141| 
           LDW     .D2T2   *B10,B31          ; |142| 
           SUB     .L1     A10,1,A2          ; |138| 
           SUB     .L1     A10,1,A10         ; |138| 
           NOP             1
           ADD     .L2     B12,B4,B4         ; |141| 
           STW     .D2T1   A4,*B4            ; |141| 
           LDW     .D1T1   *A14++,A4         ; |60| 
           ADD     .L2     B12,B31,B30       ; |142| 
           ADD     .L2     4,B12,B12         ; |138| 
           NOP             2
           RCPSP   .S1     A4,A3             ; |60| 
           MPYSP   .M1     A3,A4,A5          ; |60| 
           ABSSP   .S2X    A4,B5             ; |62| 
           NOP             2
           SUBSP   .L1     A12,A5,A5         ; |60| 
           CMPGTSP .S1X    B5,A13,A0         ; |62| 
           NOP             2
           MPYSP   .M1     A3,A5,A3          ; |60| 
           NOP             3
           MPYSP   .M1     A3,A4,A5          ; |60| 
   [ A2]   ZERO    .L1     A4
   [ A2]   SET     .S1     A4,0x17,0x1d,A4
           NOP             1
           SUBSP   .L1     A12,A5,A5         ; |60| 
           NOP             3

   [ A2]   BNOP    .S1     $C$L8,3           ; |138| 
||         MPYSP   .M1     A3,A5,A3          ; |60| 

   [ A0]   MV      .L1     A15,A3            ; |63| 

   [ A2]   CALL    .S1     __divf            ; |139| 
||         STW     .D2T1   A3,*B30           ; |142| 

           ; BRANCHCC OCCURS {$C$L8}         ; |138| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 6
           CALL    .S1     _recipsp_v        ; |144| 
           LDW     .D2T2   *+B10(4),B4       ; |144| 
           MVKL    .S1     _a_sc,A4
           MVKH    .S1     _a_sc,A4
           ADDKPC  .S2     $C$RL13,B3,0      ; |144| 
           MVK     .L1     0x6,A6            ; |144| 
$C$RL13:   ; CALL OCCURS {_recipsp_v} {0}    ; |144| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 46
           MVKL    .S2     0x3eb0c6f7,B7
           MVKL    .S2     0xa0b5ed8d,B6
           MVKH    .S2     0x3eb0c6f7,B7

           LDW     .D2T1   *B13,A4           ; |66| 
||         MVKH    .S2     0xa0b5ed8d,B6

           CALLP   .S2     _isequal,B3
||         LDW     .D2T2   *+B13(4),B4       ; |66| 
||         MVK     .L1     0x6,A6            ; |66| 
||         MVK     .S1     0x1,A8            ; |66| 

$C$RL14:   ; CALL OCCURS {_isequal} {0}      ; |66| 
           MVKL    .S2     _fcn_pass,B5
           MVKL    .S2     0x3eb0c6f7,B7
           MVKH    .S2     _fcn_pass,B5
           MVKL    .S2     0xa0b5ed8d,B6

           LDW     .D2T2   *+B13(8),B4       ; |67| 
||         MVKH    .S2     0x3eb0c6f7,B7

           STW     .D2T1   A4,*+B5(4)        ; |66| 
||         MVKH    .S2     0xa0b5ed8d,B6

           CALLP   .S2     _isequal,B3
||         LDW     .D2T1   *B13,A4           ; |67| 
||         MVK     .L1     0x6,A6            ; |67| 
||         MVK     .S1     0x1,A8            ; |67| 

$C$RL15:   ; CALL OCCURS {_isequal} {0}      ; |67| 
           MVKL    .S2     _fcn_pass,B5
           MVKL    .S2     0x3eb0c6f7,B7
           MVKL    .S2     0xa0b5ed8d,B6
           MVKH    .S2     _fcn_pass,B5

           LDW     .D2T2   *+B13(12),B4      ; |68| 
||         MVKH    .S2     0x3eb0c6f7,B7

           STW     .D2T1   A4,*+B5(8)        ; |67| 
||         MVKH    .S2     0xa0b5ed8d,B6

           CALLP   .S2     _isequal,B3
||         LDW     .D2T1   *B13,A4           ; |68| 
||         MVK     .L1     0x6,A6            ; |68| 
||         MVK     .S1     0x1,A8            ; |68| 

$C$RL16:   ; CALL OCCURS {_isequal} {0}      ; |68| 
           MVKL    .S2     _fcn_pass,B5
           MVKL    .S2     0x3eb0c6f7,B7
           MVKL    .S2     0xa0b5ed8d,B6
           MVKH    .S2     _fcn_pass,B5

           MVKL    .S1     _output,A3
||         MVKH    .S2     0x3eb0c6f7,B7

           MVKH    .S1     _output,A3
||         STW     .D2T1   A4,*+B5(12)       ; |68| 
||         MVKH    .S2     0xa0b5ed8d,B6

           CALLP   .S2     _isequal,B3
||         LDW     .D1T1   *A3,A4            ; |69| 
||         LDW     .D2T2   *+B13(16),B4      ; |69| 
||         MVK     .L1     0x6,A6            ; |69| 
||         MVK     .S1     0x1,A8            ; |69| 

$C$RL17:   ; CALL OCCURS {_isequal} {0}      ; |69| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 11
           LDW     .D1T1   *A11,A0           ; |72| 
           STW     .D2T2   B11,*+SP(28)      ; |72| 
           MVKL    .S2     _fcn_pass,B4
           MVKH    .S2     _fcn_pass,B4
           STW     .D2T1   A4,*+B4(16)       ; |69| 

   [!A0]   B       .S1     $C$L9             ; |72| 
|| [ A0]   MV      .L2     B11,B4

   [!A0]   CALL    .S1     _print_test_results ; |148| 
|| [ A0]   LDW     .D2T2   *B4,B0            ; |72| 

   [!A0]   ZERO    .L1     A4                ; |72| 
   [!A0]   MVKL    .S1     _all_pass,A3
   [ A0]   ADD     .L2     4,B4,B4
   [!A0]   MVKH    .S1     _all_pass,A3
           ; BRANCHCC OCCURS {$C$L9}         ; |72| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 10
   [ B0]   LDW     .D2T2   *B4,B4            ; |72| 
           CMPEQ   .L1     A4,0,A3           ; |72| 
           XOR     .L1     1,A3,A3           ; |72| 
           MVK     .L1     0x1,A4            ; |72| 
   [!B0]   ZERO    .L1     A0                ; |72| 
   [ B0]   CMPEQ   .L2     B4,0,B4           ; |72| 
   [ B0]   XOR     .L2     1,B4,B4           ; |72| 
           NOP             1
   [ B0]   AND     .L1X    A3,B4,A0          ; |72| 
   [!A0]   ZERO    .L1     A4                ; |72| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           CALL    .S1     _print_test_results ; |148| 
           MVKL    .S1     _all_pass,A3
           MVKH    .S1     _all_pass,A3
           NOP             2
;** --------------------------------------------------------------------------*
$C$L9:    
;          EXCLUSIVE CPU CYCLES: 1

           STW     .D1T1   A4,*A3            ; |72| 
||         MVK     .L1     0x3,A4            ; |148| 
||         ADDKPC  .S2     $C$RL18,B3,0      ; |148| 

$C$RL18:   ; CALL OCCURS {_print_test_results} {0}  ; |148| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 8
           MVKL    .S2     _a_ext,B4
           MVKL    .S2     0xc000cccc,B13
           MVKL    .S2     0xcccccccd,B12
           MVK     .S2     0xed,B31

           MVKH    .S2     _a_ext,B4
||         ZERO    .L1     A4

           MVKH    .S2     0xc000cccc,B13
||         SET     .S1     A4,0x17,0x17,A4

           ZERO    .L1     A4
||         STW     .D2T1   A4,*B4            ; |151| 
||         MVKH    .S2     0xcccccccd,B12
||         MV      .S1X    B10,A10

           CALL    .S2     __divf            ; |153| 
||         SET     .S1     A4,0x17,0x1d,A4
||         MV      .L1X    B4,A14            ; |151| 
||         STW     .D2T2   B31,*+SP(12)      ; |151| 
||         ZERO    .L2     B10

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
           LDW     .D1T2   *A14,B4           ; |153| 
           ADDKPC  .S2     $C$RL19,B3,3      ; |153| 
$C$RL19:   ; CALL OCCURS {__divf} {0}        ; |153| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 30
           MVKL    .S2     _output,B4
           MVKH    .S2     _output,B4
           LDW     .D2T1   *B4,A3            ; |153| 
           NOP             4
           ADD     .L1X    B10,A3,A3         ; |153| 
           STW     .D1T1   A4,*A3            ; |153| 

           CALLP   .S2     _recipsp,B3
||         LDW     .D1T1   *A14,A4           ; |154| 

$C$RL20:   ; CALL OCCURS {_recipsp} {0}      ; |154| 
           MVKL    .S2     _output,B4
           MVKH    .S2     _output,B4
           LDW     .D2T2   *+B4(4),B4        ; |154| 
           NOP             4
           ADD     .L2     B10,B4,B4         ; |154| 
           STW     .D2T1   A4,*B4            ; |154| 

           CALLP   .S2     _recipsp_c,B3
||         LDW     .D1T1   *A14,A4           ; |155| 

$C$RL21:   ; CALL OCCURS {_recipsp_c} {0}    ; |155| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 59
           MVKL    .S2     _output,B4
           MVKH    .S2     _output,B4
           LDW     .D2T2   *+B4(8),B4        ; |155| 
           MV      .L2X    A4,B5             ; |155| 
           NOP             3
           ADD     .L2     B10,B4,B4         ; |155| 
           STW     .D2T2   B5,*B4            ; |155| 
           LDW     .D1T1   *A14,A4           ; |60| 
           MV      .L2X    A10,B5            ; |156| 
           LDW     .D2T2   *B5,B4            ; |156| 
           NOP             2
           RCPSP   .S1     A4,A3             ; |60| 
           MPYSP   .M1     A3,A4,A5          ; |60| 
           ABSSP   .S2X    A4,B6             ; |62| 
           ADD     .L2     B10,B4,B4         ; |156| 
           CMPGTSP .S1X    B6,A13,A0         ; |62| 
           SUBSP   .L1     A12,A5,A5         ; |60| 
           ADD     .L2     4,B10,B10         ; |152| 
           NOP             2
           MPYSP   .M1     A3,A5,A3          ; |60| 
           NOP             3
           MPYSP   .M1     A3,A4,A5          ; |60| 
           NOP             3
           SUBSP   .L1     A12,A5,A5         ; |60| 
           NOP             3
           MPYSP   .M1     A3,A5,A3          ; |60| 
           NOP             3
   [ A0]   MV      .L1     A15,A3            ; |63| 
           STW     .D2T1   A3,*B4            ; |156| 
           LDW     .D1T2   *A14,B4           ; |157| 
           NOP             4

           MPYSPDP .M2     B4,B13:B12,B7:B6  ; |157| 
||         LDW     .D2T2   *+SP(12),B4

           NOP             4

           SUB     .L1X    B4,1,A0           ; |152| 
||         SUB     .L2     B4,1,B4           ; |152| 

   [ A0]   ZERO    .L1     A4

   [ A0]   BNOP    .S2     $C$L10,3          ; |152| 
||         DPSP    .L2     B7:B6,B6          ; |157| 
|| [ A0]   SET     .S1     A4,0x17,0x1d,A4

           STW     .D1T2   B6,*++A14         ; |157| 

   [ A0]   CALL    .S1     __divf            ; |153| 
||         STW     .D2T2   B4,*+SP(12)       ; |157| 

           ; BRANCHCC OCCURS {$C$L10}        ; |152| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 6
           CALL    .S1     _recipsp_v        ; |159| 
           LDW     .D2T2   *+B5(4),B4        ; |159| 
           MVKL    .S1     _a_ext,A4
           MVKH    .S1     _a_ext,A4
           ADDKPC  .S2     $C$RL22,B3,0      ; |159| 
           MVK     .S1     0xed,A6           ; |159| 
$C$RL22:   ; CALL OCCURS {_recipsp_v} {0}    ; |159| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 44
           MVKL    .S2     _output,B10
           MVKL    .S2     0xa0b5ed8d,B6
           MVKL    .S2     0x3eb0c6f7,B7
           MVKH    .S2     _output,B10
           MVKH    .S2     0xa0b5ed8d,B6

           LDW     .D2T1   *B10,A4           ; |66| 
||         MVKH    .S2     0x3eb0c6f7,B7

           CALLP   .S2     _isequal,B3
||         LDW     .D2T2   *+B10(4),B4       ; |66| 
||         MVK     .S1     0xed,A6           ; |66| 
||         MVK     .L1     0x1,A8            ; |66| 

$C$RL23:   ; CALL OCCURS {_isequal} {0}      ; |66| 
           MVKL    .S2     _fcn_pass,B12
           MVKH    .S2     _fcn_pass,B12
           MVKL    .S2     0xa0b5ed8d,B6
           MVKL    .S2     0x3eb0c6f7,B7

           STW     .D2T1   A4,*+B12(4)       ; |66| 
||         MVKH    .S2     0xa0b5ed8d,B6

           LDW     .D2T2   *+B10(8),B4       ; |67| 
||         MVKH    .S2     0x3eb0c6f7,B7

           CALLP   .S2     _isequal,B3
||         LDW     .D2T1   *B10,A4           ; |67| 
||         MVK     .S1     0xed,A6           ; |67| 
||         MVK     .L1     0x1,A8            ; |67| 

$C$RL24:   ; CALL OCCURS {_isequal} {0}      ; |67| 
           MVKL    .S2     0xa0b5ed8d,B6
           MVKL    .S2     0x3eb0c6f7,B7

           STW     .D2T1   A4,*+B12(8)       ; |67| 
||         MVKH    .S2     0xa0b5ed8d,B6

           LDW     .D2T2   *+B10(12),B4      ; |68| 
||         MVKH    .S2     0x3eb0c6f7,B7

           CALLP   .S2     _isequal,B3
||         LDW     .D2T1   *B10,A4           ; |68| 
||         MVK     .S1     0xed,A6           ; |68| 
||         MVK     .L1     0x1,A8            ; |68| 

$C$RL25:   ; CALL OCCURS {_isequal} {0}      ; |68| 
           MVKL    .S2     0x3eb0c6f7,B7
           MVKL    .S2     0xa0b5ed8d,B6
           MVKH    .S2     0x3eb0c6f7,B7

           MV      .L1X    B10,A3            ; |68| 
||         STW     .D2T1   A4,*+B12(12)      ; |68| 
||         MVKH    .S2     0xa0b5ed8d,B6

           CALLP   .S2     _isequal,B3
||         LDW     .D2T2   *+B10(16),B4      ; |69| 
||         LDW     .D1T1   *A3,A4            ; |69| 
||         MVK     .S1     0xed,A6           ; |69| 
||         MVK     .L1     0x1,A8            ; |69| 

$C$RL26:   ; CALL OCCURS {_isequal} {0}      ; |69| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 12
           MV      .L1     A11,A3            ; |69| 
           LDW     .D1T1   *A3,A0            ; |72| 
           STW     .D2T1   A4,*+B12(16)      ; |69| 
           NOP             3

   [!A0]   B       .S1     $C$L11            ; |72| 
|| [ A0]   LDW     .D2T2   *B11,B0           ; |72| 

   [!A0]   CALL    .S1     _print_test_results ; |163| 
   [ A0]   ADD     .L2     4,B11,B4
   [!A0]   ZERO    .L1     A4                ; |72| 
   [!A0]   MVKL    .S1     _all_pass,A3
   [!A0]   MVKH    .S1     _all_pass,A3
           ; BRANCHCC OCCURS {$C$L11}        ; |72| 
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
           CALL    .S1     _print_test_results ; |163| 
           MVKL    .S1     _all_pass,A3
           MVKH    .S1     _all_pass,A3
           NOP             2
;** --------------------------------------------------------------------------*
$C$L11:    
;          EXCLUSIVE CPU CYCLES: 1

           STW     .D1T1   A4,*A3            ; |72| 
||         MVK     .L1     0x4,A4            ; |163| 
||         ADDKPC  .S2     $C$RL27,B3,0      ; |163| 

$C$RL27:   ; CALL OCCURS {_print_test_results} {0}  ; |163| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 16

           ZERO    .L2     B13               ; |114| 
||         MVKL    .S2     _cycle_counts+24,B5

           MVKH    .S2     _cycle_counts+24,B5
||         ZERO    .L2     B4                ; |114| 
||         ZERO    .D2     B12               ; |114| 

           MVC     .S2     B4,TSCL           ; |115| 
||         STDW    .D2T2   B13:B12,*B5       ; |114| 

           MVC     .S2     TSCL,B6           ; |116| 
           MVC     .S2     TSCH,B7           ; |116| 
           MVKL    .S1     _t_start,A3
           MVKH    .S1     _t_start,A3

           MVC     .S2     TSCL,B4           ; |117| 
||         STDW    .D1T2   B7:B6,*A3         ; |116| 

           MVC     .S2     TSCH,B8           ; |117| 
           SUBU    .L2     B4,B6,B5:B4       ; |117| 

           SUB     .L2     B8,B7,B6          ; |117| 
||         EXT     .S2     B5,24,24,B5       ; |117| 
||         MVKL    .S1     _t_offset,A4

           ADD     .L2     B6,B5,B5          ; |117| 
||         MVKH    .S1     _t_offset,A4

           MVK     .S2     0x80,B4
||         STDW    .D1T2   B5:B4,*A4         ; |117| 
||         MVKL    .S1     _input,A3

           ZERO    .L1     A4
||         MVKH    .S1     _input,A3

           ZERO    .L2     B4
||         MV      .L1X    B4,A10            ; |117| 
||         MVKH    .S1     0x43480000,A4

           CALL    .S1     _gimme_random     ; |173| 
||         MVKH    .S2     0xc2c80000,B4
||         MV      .L2     B12,B10

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
           LDW     .D1T1   *A3,A14           ; |173| 
           ADDKPC  .S2     $C$RL28,B3,3      ; |173| 
$C$RL28:   ; CALL OCCURS {_gimme_random} {0}  ; |173| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 45
           ADD     .L1X    A14,B10,A3        ; |173| 

           STW     .D1T1   A4,*A3            ; |173| 
||         MVC     .S2     TSCL,B16          ; |122| 

           MVC     .S2     TSCH,B4           ; |122| 
           RCPSP   .S1     A4,A3             ; |60| 
           MPYSP   .M1     A3,A4,A5          ; |60| 
           MV      .L2X    A14,B11           ; |62| 
           MV      .L2     B4,B17            ; |122| 
           MVKL    .S2     _output+12,B5
           SUBSP   .L1     A12,A5,A5         ; |60| 
           ADD     .L1X    A14,B10,A31       ; |62| 
           MVKL    .S1     _t_start,A30
           MVKH    .S2     _output+12,B5
           MPYSP   .M1     A3,A5,A5          ; |60| 
           LDW     .D2T2   *B5,B5            ; |177| 
           LDW     .D1T1   *A31,A6           ; |62| 
           MVKH    .S1     _t_start,A30
           MPYSP   .M1     A5,A4,A4          ; |60| 
           STDW    .D1T2   B17:B16,*A30
           ADD     .L2     B10,B5,B4         ; |177| 
           ABSSP   .S1     A6,A3             ; |62| 
           SUBSP   .L1     A12,A4,A4         ; |60| 
           CMPGTSP .S1     A3,A13,A0         ; |62| 
           NOP             2
           MPYSP   .M1     A5,A4,A4          ; |60| 
           NOP             3
   [ A0]   MV      .L1     A15,A4            ; |63| 

           STW     .D2T1   A4,*B4            ; |177| 
||         MVC     .S2     TSCL,B8           ; |128| 

           MVC     .S2     TSCH,B9           ; |128| 

           MVKL    .S1     _t_offset,A3
||         MVKL    .S2     _cycle_counts+24,B4
||         SUB     .L1     A10,1,A0          ; |171| 
||         ADD     .L2     4,B10,B10         ; |171| 
||         SUB     .D1     A10,1,A10         ; |171| 

           MVKH    .S1     _t_offset,A3
||         MVKH    .S2     _cycle_counts+24,B4

           LDDW    .D1T1   *A3,A5:A4         ; |130| 
||         LDDW    .D2T2   *B4,B7:B6         ; |130| 
||         MVKL    .S1     _t_stop,A29

           MVKL    .S1     _cycle_counts+24,A14
   [ A0]   MVKL    .S1     _input,A3
           MVKH    .S1     _t_stop,A29

           MVKH    .S1     _cycle_counts+24,A14
||         STDW    .D1T2   B9:B8,*A29        ; |128| 

           ADDU    .L2X    A4,B16,B5:B4      ; |130| 
|| [ A0]   ZERO    .L1     A4
|| [ A0]   MVKH    .S1     _input,A3

           ADD     .D2X    B5,A5,B16         ; |130| 
|| [ A0]   B       .S2     $C$L12            ; |171| 
||         SUBU    .L2     B8,B4,B5:B4       ; |130| 
|| [ A0]   MVKH    .S1     0x43480000,A4

           ADD     .D2     B16,B17,B16       ; |130| 
||         EXT     .S2     B5,24,24,B17      ; |130| 
||         ADDU    .L2     B6,B4,B5:B4       ; |130| 

           SUB     .L2     B9,B16,B16        ; |130| 
||         MV      .S2     B4,B6             ; |130| 
||         ADD     .D2     B5,B7,B4          ; |130| 

           ADD     .L2     B16,B17,B5        ; |130| 

           ADD     .L2     B4,B5,B7          ; |130| 
|| [ A0]   ZERO    .S2     B4

   [ A0]   CALL    .S1     _gimme_random     ; |173| 
|| [ A0]   MVKH    .S2     0xc2c80000,B4
||         STDW    .D1T2   B7:B6,*A14        ; |130| 

           ; BRANCHCC OCCURS {$C$L12}        ; |171| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 6
           CALL    .S1     __fltllif         ; |135| 
           LDDW    .D1T1   *A14,A5:A4        ; |135| 
           ADDKPC  .S2     $C$RL29,B3,3      ; |135| 
$C$RL29:   ; CALL OCCURS {__fltllif} {0}     ; |135| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 16
           ZERO    .L1     A3
           SET     .S1     A3,0x1a,0x1d,A3
           MPYSP   .M1     A3,A4,A3          ; |135| 
           ZERO    .L1     A13
           SET     .S1     A13,0x15,0x1d,A13
           MV      .L1X    B13,A12           ; |135| 
           SPDP    .S1     A3,A5:A4          ; |135| 
           NOP             2
           ADDDP   .L1     A13:A12,A5:A4,A5:A4 ; |135| 
           CALLP   .S2     __fixdlli,B3
$C$RL30:   ; CALL OCCURS {__fixdlli} {0}     ; |135| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 16

           MVK     .S2     24,B10
||         MV      .L2X    A14,B4

           SUB     .L2X    A14,B10,B10
||         MV      .S2     B12,B5            ; |114| 
||         STDW    .D2T1   A5:A4,*B4         ; |135| 

           STDW    .D2T2   B13:B12,*B10      ; |114| 
||         MVC     .S2     B5,TSCL           ; |115| 

           MVC     .S2     TSCL,B4           ; |116| 
           MVC     .S2     TSCH,B5           ; |116| 
           MV      .L1X    B4,A15            ; |116| 

           MV      .L1X    B5,A14            ; |116| 
||         MVC     .S2     TSCL,B5           ; |117| 

           MVC     .S2     TSCH,B4           ; |117| 
           SUBU    .L2X    B5,A15,B7:B6      ; |117| 

           SUB     .L1X    B4,A14,A4         ; |117| 
||         MVK     .S1     0x80,A30

           MV      .L1X    B6,A3             ; |117| 
||         EXT     .S2     B7,24,24,B4       ; |117| 
||         MVKL    .S1     _output,A31
||         STW     .D2T1   A30,*+SP(12)      ; |117| 

           STW     .D2T1   A3,*+SP(16)       ; |117| 
||         MVKH    .S1     _output,A31
||         CALL    .S2     __divf            ; |185| 

           ADD     .L1X    A4,B4,A10         ; |117| 
||         LDW     .D2T2   *B11++,B4         ; |185| 
||         LDW     .D1T1   *A31,A12

           ZERO    .L1     A4
           SET     .S1     A4,0x17,0x1d,A4
           NOP             1
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L13:    
;          EXCLUSIVE CPU CYCLES: 1
           ADDKPC  .S2     $C$RL31,B3,0      ; |185| 
$C$RL31:   ; CALL OCCURS {__divf} {0}        ; |185| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 12
           LDW     .D2T1   *+SP(12),A3       ; |185| 
           STW     .D1T1   A4,*A12++         ; |185| 
           NOP             3

           SUB     .L1     A3,1,A0           ; |184| 
||         SUB     .S1     A3,1,A3           ; |184| 

   [ A0]   B       .S1     $C$L13            ; |184| 
||         STW     .D2T1   A3,*+SP(12)       ; |185| 

   [ A0]   CALL    .S1     __divf            ; |185| 
   [ A0]   LDW     .D2T2   *B11++,B4         ; |185| 
   [ A0]   ZERO    .L1     A4
   [ A0]   SET     .S1     A4,0x17,0x1d,A4
           NOP             1
           ; BRANCHCC OCCURS {$C$L13}        ; |184| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 14
           MVC     .S2     TSCL,B6           ; |128| 
           MVC     .S2     TSCH,B4           ; |128| 
           LDW     .D2T1   *+SP(16),A3       ; |128| 
           MV      .L2     B4,B7             ; |128| 
           LDDW    .D2T2   *B10,B5:B4        ; |130| 
           NOP             2
           ADDU    .L1     A3,A15,A5:A4      ; |130| 

           ADD     .S1     A5,A10,A3         ; |130| 
||         SUBU    .L1X    B6,A4,A5:A4       ; |130| 
||         CALL    .S2     __fltllif         ; |130| 

           ADD     .L1     A3,A14,A3         ; |130| 
||         EXT     .S1     A5,24,24,A31      ; |130| 

           ADDU    .L2X    B4,A4,B9:B8       ; |130| 
||         SUB     .L1X    B7,A3,A3          ; |130| 
||         MVKL    .S2     _t_stop,B4

           ADD     .L2     B9,B5,B5          ; |130| 
||         ADD     .L1     A3,A31,A3         ; |130| 
||         MVKH    .S2     _t_stop,B4

           STDW    .D2T2   B7:B6,*B4         ; |128| 
||         MV      .L1X    B8,A4             ; |130| 

           ADD     .L1X    B5,A3,A5          ; |130| 
||         ADDKPC  .S2     $C$RL32,B3,0      ; |130| 

$C$RL32:   ; CALL OCCURS {__fltllif} {0}     ; |130| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 15
           ZERO    .L1     A3
           SET     .S1     A3,0x1a,0x1d,A3
           MPYSP   .M1     A3,A4,A3          ; |130| 
           MV      .L1X    B13,A12           ; |130| 
           NOP             2
           SPDP    .S1     A3,A5:A4          ; |130| 
           NOP             1
           ADDDP   .L1     A13:A12,A5:A4,A5:A4 ; |130| 
           CALLP   .S2     __fixdlli,B3
$C$RL33:   ; CALL OCCURS {__fixdlli} {0}     ; |130| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 14

           MV      .L2     B12,B4            ; |114| 
||         STDW    .D2T2   B13:B12,*+B10(8)  ; |114| 

           MVC     .S2     B4,TSCL           ; |115| 
||         STDW    .D2T1   A5:A4,*B10        ; |130| 

           MVC     .S2     TSCL,B6           ; |116| 
           MVC     .S2     TSCH,B4           ; |116| 
           MVKL    .S1     _t_start,A10

           MVKH    .S1     _t_start,A10
||         MV      .L2     B4,B7             ; |116| 

           MVC     .S2     TSCL,B4           ; |117| 
||         STDW    .D1T2   B7:B6,*A10        ; |116| 

           MVC     .S2     TSCH,B8           ; |117| 

           SUBU    .L2     B4,B6,B5:B4       ; |117| 
||         MVKL    .S2     _t_offset,B31

           SUB     .L2     B8,B7,B6          ; |117| 
||         EXT     .S2     B5,24,24,B5       ; |117| 

           ADD     .L2     B6,B5,B5          ; |117| 
||         MVKH    .S2     _t_offset,B31

           MVK     .S2     0x80,B4
||         STDW    .D2T2   B5:B4,*B31        ; |117| 

           MVKL    .S1     _input,A14

           MV      .L1X    B4,A15            ; |117| 
||         MVKH    .S1     _input,A14
||         LDW     .D2T2   *+SP(20),B11      ; |117| 

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L14:    
;          EXCLUSIVE CPU CYCLES: 11
           LDW     .D1T1   *A14,A3           ; |193| 
           NOP             4

           ADD     .L1     A12,A3,A3         ; |193| 
||         CALL    .S1     _recipsp          ; |193| 

           LDW     .D1T1   *A3,A4            ; |193| 
           ADDKPC  .S2     $C$RL34,B3,3      ; |193| 
$C$RL34:   ; CALL OCCURS {_recipsp} {0}      ; |193| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 7

           LDW     .D2T2   *B11,B4           ; |193| 
||         SUB     .L1     A15,1,A0          ; |192| 
||         SUB     .S1     A15,1,A15         ; |192| 

   [ A0]   BNOP    .S1     $C$L14,3          ; |192| 

           ADD     .L1X    A12,B4,A3         ; |193| 
||         ADD     .S1     4,A12,A12         ; |192| 

           STW     .D1T1   A4,*A3            ; |193| 
           ; BRANCHCC OCCURS {$C$L14}        ; |192| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 18
           MVC     .S2     TSCL,B16          ; |128| 
           MVC     .S2     TSCH,B4           ; |128| 

           MVKL    .S2     _t_offset,B5
||         LDDW    .D1T1   *A10,A7:A6        ; |130| 

           MVKH    .S2     _t_offset,B5
           LDDW    .D2T2   *B5,B7:B6         ; |130| 
           MV      .L2     B4,B17            ; |128| 
           LDDW    .D2T2   *+B10(8),B5:B4    ; |130| 
           NOP             2
           ADDU    .L1X    B6,A6,A5:A4       ; |130| 
           ADD     .L1X    A5,B7,A3          ; |130| 

           ADD     .L1     A3,A7,A3          ; |130| 
||         SUBU    .L2X    B16,A4,B7:B6      ; |130| 

           CALL    .S1     __fltllif         ; |130| 
||         EXT     .S2     B7,24,24,B8       ; |130| 
||         ADDU    .L2     B4,B6,B7:B6       ; |130| 

           SUB     .L2X    B17,A3,B4         ; |130| 

           ADD     .L2     B7,B5,B4          ; |130| 
||         ADD     .D2     B4,B8,B5          ; |130| 
||         MV      .L1X    B6,A4             ; |130| 
||         MVKL    .S2     _t_stop,B6

           ADD     .L2     B4,B5,B4          ; |130| 
||         MVKH    .S2     _t_stop,B6

           STDW    .D2T2   B17:B16,*B6       ; |128| 

           MV      .L1X    B4,A5             ; |130| 
||         ADDKPC  .S2     $C$RL35,B3,0      ; |130| 

$C$RL35:   ; CALL OCCURS {__fltllif} {0}     ; |130| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 15
           ZERO    .L1     A3
           SET     .S1     A3,0x1a,0x1d,A3
           MPYSP   .M1     A3,A4,A3          ; |130| 
           MV      .L1X    B13,A12           ; |130| 
           NOP             2
           SPDP    .S1     A3,A5:A4          ; |130| 
           NOP             1
           ADDDP   .L1     A13:A12,A5:A4,A5:A4 ; |130| 
           CALLP   .S2     __fixdlli,B3
$C$RL36:   ; CALL OCCURS {__fixdlli} {0}     ; |130| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 18
           STDW    .D2T2   B13:B12,*+B10(16) ; |114| 

           ADDAD   .D2     B10,1,B11
||         MV      .L2     B12,B4            ; |114| 

           STDW    .D2T1   A5:A4,*B11        ; |130| 
||         MVC     .S2     B4,TSCL           ; |115| 

           MVC     .S2     TSCL,B6           ; |116| 
           MVC     .S2     TSCH,B7           ; |116| 
           MV      .L1     A10,A12           ; |116| 

           STDW    .D1T2   B7:B6,*A12        ; |116| 
||         MVC     .S2     TSCL,B4           ; |117| 

           MVC     .S2     TSCH,B8           ; |117| 

           SUBU    .L2     B4,B6,B5:B4       ; |117| 
||         MVKL    .S2     _t_offset,B31

           EXT     .S2     B5,24,24,B5       ; |117| 
||         SUB     .L2     B8,B7,B7          ; |117| 

           ADD     .L2     B7,B5,B7          ; |117| 
||         MV      .D2     B4,B6             ; |117| 
||         MVKH    .S2     _t_offset,B31

           STDW    .D2T2   B7:B6,*B31        ; |117| 
           LDW     .D1T1   *A14,A3           ; |201| 
           MV      .L1X    B13,A15
           MVK     .S2     0x80,B30
           LDW     .D2T1   *+SP(24),A10      ; |117| 
           STW     .D2T2   B30,*+SP(12)      ; |117| 

           CALL    .S1     _recipsp_c        ; |201| 
||         ADD     .L1     A15,A3,A3         ; |201| 

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L15:    
;          EXCLUSIVE CPU CYCLES: 5
           LDW     .D1T1   *A3,A4            ; |201| 
           ADDKPC  .S2     $C$RL37,B3,3      ; |201| 
$C$RL37:   ; CALL OCCURS {_recipsp_c} {0}    ; |201| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 18
           MV      .L2X    A10,B4            ; |201| 
           LDW     .D2T2   *B4,B4            ; |201| 
           STW     .D2T1   A10,*+SP(16)      ; |201| 
           NOP             3

           ADD     .L1X    A15,B4,A3         ; |201| 
||         LDW     .D2T2   *+SP(12),B4       ; |201| 

           ADD     .L1     4,A15,A15         ; |200| 
           STW     .D1T1   A4,*A3            ; |201| 
           NOP             2

           SUB     .L1X    B4,1,A0           ; |200| 
||         SUB     .L2     B4,1,B4           ; |200| 

   [ A0]   BNOP    .S1     $C$L15,4          ; |200| 
|| [ A0]   LDW     .D1T1   *A14,A3           ; |201| 
||         STW     .D2T2   B4,*+SP(12)       ; |201| 

   [ A0]   CALL    .S1     _recipsp_c        ; |201| 
||         ADD     .L1     A15,A3,A3         ; |201| 

           ; BRANCHCC OCCURS {$C$L15}        ; |200| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 17
           MVC     .S2     TSCL,B6           ; |128| 
           MVC     .S2     TSCH,B7           ; |128| 

           MVKL    .S2     _t_offset,B4
||         MV      .L1     A12,A10           ; |128| 
||         MV      .L2     B10,B31           ; |130| 

           MVKH    .S2     _t_offset,B4
||         LDDW    .D1T1   *A10,A5:A4        ; |130| 

           LDDW    .D2T2   *B4,B9:B8         ; |130| 
           LDDW    .D2T2   *+B31(16),B17:B16 ; |130| 
           MVKL    .S2     _t_stop,B30
           MVKH    .S2     _t_stop,B30
           STDW    .D2T2   B7:B6,*B30        ; |128| 
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
           MV      .L1X    B10,A15           ; |130| 

           MV      .L1X    B4,A5             ; |130| 
||         ADDKPC  .S2     $C$RL38,B3,0      ; |130| 

$C$RL38:   ; CALL OCCURS {__fltllif} {0}     ; |130| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 112
           ZERO    .L1     A3
           SET     .S1     A3,0x1a,0x1d,A3
           MPYSP   .M1     A3,A4,A3          ; |130| 
           MV      .L1X    B13,A12           ; |130| 
           NOP             3
           SPDP    .S2X    A3,B5:B4          ; |130| 
           NOP             2
           ADDDP   .L1X    A13:A12,B5:B4,A5:A4 ; |130| 
           CALLP   .S2     __fixdlli,B3
$C$RL39:   ; CALL OCCURS {__fixdlli} {0}     ; |130| 

           ADDAD   .D2     B11,1,B10
||         MV      .L2X    A15,B4

           MV      .L2     B12,B31           ; |114| 
||         STDW    .D2T2   B13:B12,*+B4(32)  ; |114| 

           STDW    .D2T1   A5:A4,*B10        ; |130| 
||         MVC     .S2     B31,TSCL          ; |115| 

           MVC     .S2     TSCL,B4           ; |116| 
           MVC     .S2     TSCH,B5           ; |116| 

           STDW    .D1T2   B5:B4,*A10        ; |116| 
||         MVC     .S2     TSCL,B6           ; |117| 

           MVC     .S2     TSCH,B8           ; |117| 

           SUBU    .L2     B6,B4,B7:B6       ; |117| 
||         LDW     .D2T2   *+SP(16),B4       ; |117| 

           MV      .L2X    A14,B9            ; |208| 
           MVKL    .S2     _t_offset,B11
           LDW     .D2T1   *B9,A4            ; |208| 

           EXT     .S2     B7,24,24,B5       ; |117| 
||         SUB     .L2     B8,B5,B7          ; |117| 

           LDW     .D2T2   *+B4(8),B4        ; |208| 
||         ADD     .L2     B7,B5,B7          ; |117| 
||         MVKH    .S2     _t_offset,B11

           CALLP   .S2     _recipsp_v,B3
||         STDW    .D2T2   B7:B6,*B11        ; |117| 
||         MVK     .S1     0x80,A6           ; |208| 

$C$RL40:   ; CALL OCCURS {_recipsp_v} {0}    ; |208| 
           MVC     .S2     TSCL,B8           ; |128| 
           MVC     .S2     TSCH,B4           ; |128| 

           LDDW    .D1T1   *A10,A7:A6        ; |130| 
||         LDDW    .D2T2   *B11,B7:B6        ; |130| 

           MVK     .S1     16,A10
           ADD     .L1X    B10,A10,A10
           MVKL    .S1     _t_stop,A3

           LDDW    .D1T1   *A10,A17:A16      ; |130| 
||         MVKH    .S1     _t_stop,A3

           ADDU    .L1X    B6,A6,A9:A8       ; |130| 

           MV      .L2     B4,B9             ; |128| 
||         MV      .S2X    A3,B4             ; |128| 
||         ADD     .L1X    A9,B7,A3          ; |130| 

           SUBU    .L1X    B8,A8,A5:A4       ; |130| 

           ADD     .L1     A3,A7,A5          ; |130| 
||         EXT     .S1     A5,24,24,A3       ; |130| 

           SUB     .S1X    B9,A5,A6          ; |130| 
||         ADDU    .L1     A16,A4,A5:A4      ; |130| 

           ADD     .L1     A5,A17,A3         ; |130| 
||         ADD     .S1     A6,A3,A5          ; |130| 

           CALLP   .S2     __fltllif,B3
||         ADD     .L1     A3,A5,A5          ; |130| 
||         STDW    .D2T2   B9:B8,*B4         ; |128| 

$C$RL41:   ; CALL OCCURS {__fltllif} {0}     ; |130| 
           ZERO    .L1     A3
           SET     .S1     A3,0x1a,0x1d,A3
           MPYSP   .M1     A3,A4,A3          ; |130| 
           NOP             3
           SPDP    .S1     A3,A5:A4          ; |130| 
           NOP             1
           ADDDP   .L1     A13:A12,A5:A4,A5:A4 ; |130| 
           CALLP   .S2     __fixdlli,B3
$C$RL42:   ; CALL OCCURS {__fixdlli} {0}     ; |130| 

           MVKL    .S1     _output,A3
||         MVKL    .S2     0xa0b5ed8d,B6

           MVKH    .S1     _output,A3
||         MVKL    .S2     0x3eb0c6f7,B7

           MV      .L1     A3,A12            ; |130| 
||         STDW    .D1T1   A5:A4,*A10        ; |130| 
||         MVKH    .S2     0xa0b5ed8d,B6

           LDW     .D1T1   *A12,A4           ; |66| 
||         MVKH    .S2     0x3eb0c6f7,B7

           CALLP   .S2     _isequal,B3
||         LDW     .D1T2   *+A12(4),B4       ; |66| 
||         MVK     .S1     0x80,A6           ; |66| 
||         MVK     .L1     0x1,A8            ; |66| 

$C$RL43:   ; CALL OCCURS {_isequal} {0}      ; |66| 
           MVKL    .S2     0x3eb0c6f7,B7
           MVKL    .S2     0xa0b5ed8d,B6
           MVKL    .S2     _fcn_pass,B10
           MVKH    .S2     0x3eb0c6f7,B7
           MVKH    .S2     0xa0b5ed8d,B6

           MV      .L1     A4,A3             ; |66| 
||         LDW     .D1T1   *A12,A4           ; |67| 
||         MVKH    .S2     _fcn_pass,B10

           CALLP   .S2     _isequal,B3
||         LDW     .D1T2   *+A12(8),B4       ; |67| 
||         STW     .D2T1   A3,*+B10(4)       ; |66| 
||         MVK     .S1     0x80,A6           ; |67| 
||         MVK     .L1     0x1,A8            ; |67| 

$C$RL44:   ; CALL OCCURS {_isequal} {0}      ; |67| 
           MVKL    .S2     0xa0b5ed8d,B6
           MVKL    .S2     0x3eb0c6f7,B7

           MV      .L1     A4,A3             ; |67| 
||         MVKH    .S2     0xa0b5ed8d,B6

           LDW     .D1T2   *+A12(12),B4      ; |68| 
||         MVKH    .S2     0x3eb0c6f7,B7
||         STW     .D2T1   A3,*+B10(8)       ; |67| 

           CALLP   .S2     _isequal,B3
||         LDW     .D1T1   *A12,A4           ; |68| 
||         MVK     .S1     0x80,A6           ; |68| 
||         MVK     .L1     0x1,A8            ; |68| 

$C$RL45:   ; CALL OCCURS {_isequal} {0}      ; |68| 
           MVKL    .S2     0x3eb0c6f7,B7
           MVKL    .S2     0xa0b5ed8d,B6
           MVKH    .S2     0x3eb0c6f7,B7

           MV      .L1     A12,A3            ; |68| 
||         STW     .D2T1   A4,*+B10(12)      ; |68| 
||         LDW     .D1T2   *+A12(16),B4      ; |69| 
||         MVKH    .S2     0xa0b5ed8d,B6

           CALLP   .S2     _isequal,B3
||         LDW     .D1T1   *A3,A4            ; |69| 
||         MVK     .S1     0x80,A6           ; |69| 
||         MVK     .L1     0x1,A8            ; |69| 

$C$RL46:   ; CALL OCCURS {_isequal} {0}      ; |69| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 11

           LDW     .D1T1   *A11,A0           ; |72| 
||         LDW     .D2T2   *+SP(28),B5

           MV      .L2X    A4,B4             ; |69| 
           STW     .D2T2   B4,*+B10(16)      ; |69| 
           NOP             2

   [!A0]   BNOP    .S1     $C$L16,5          ; |72| 
|| [ A0]   LDW     .D2T2   *B5,B0            ; |72| 
|| [ A0]   ADD     .L2     4,B5,B5

           ; BRANCHCC OCCURS {$C$L16}        ; |72| 
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

   [ B0]   B       .S1     $C$L17            ; |72| 
   [ B0]   CALL    .S1     _print_test_results ; |214| 
   [ B0]   MVKL    .S1     _all_pass,A4
   [ B0]   MVKH    .S1     _all_pass,A4
           NOP             2
           ; BRANCHCC OCCURS {$C$L17}        ; |72| 
;** --------------------------------------------------------------------------*
$C$L16:    
;          EXCLUSIVE CPU CYCLES: 5
           CALL    .S1     _print_test_results ; |214| 
           MVKL    .S1     _all_pass,A4
           MVKH    .S1     _all_pass,A4
           MV      .L1X    B12,A3
           NOP             1
;** --------------------------------------------------------------------------*
$C$L17:    
;          EXCLUSIVE CPU CYCLES: 1

           STW     .D1T1   A3,*A4            ; |72| 
||         MVK     .L1     0x2,A4            ; |214| 
||         ADDKPC  .S2     $C$RL47,B3,0      ; |214| 

$C$RL47:   ; CALL OCCURS {_print_test_results} {0}  ; |214| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 30
           MVKL    .S2     $C$SL2+0,B4
           MVKH    .S2     $C$SL2+0,B4

           CALLP   .S2     _printf,B3
||         STW     .D2T2   B4,*+SP(4)        ; |215| 

$C$RL48:   ; CALL OCCURS {_printf} {0}       ; |215| 
           MVKL    .S2     $C$SL3+0,B4
           MVKH    .S2     $C$SL3+0,B4

           CALLP   .S2     _printf,B3
||         STW     .D2T2   B4,*+SP(4)        ; |215| 

$C$RL49:   ; CALL OCCURS {_printf} {0}       ; |215| 
           MVKL    .S1     $C$SL1+0,A10
           MVKH    .S1     $C$SL1+0,A10

           CALLP   .S2     _print_profile_results,B3
||         MV      .L1     A10,A4            ; |222| 

$C$RL50:   ; CALL OCCURS {_print_profile_results} {0}  ; |222| 

           CALLP   .S2     _print_memory_results,B3
||         MV      .L1     A10,A4            ; |225| 

$C$RL51:   ; CALL OCCURS {_print_memory_results} {0}  ; |225| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 11
           LDW     .D2T2   *++SP(40),B3      ; |226| 
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
$C$SL1:	.string	"recipSP",0
$C$SL2:	.string	"----------------------------------------",0
$C$SL3:	.string	"----------------------------------------",10,0
;*****************************************************************************
;* UNDEFINED EXTERNAL REFERENCES                                             *
;*****************************************************************************
	.global	_printf
	.global	_driver_init
	.global	_print_profile_results
	.global	_print_memory_results
	.global	_print_test_results
	.global	_gimme_random
	.global	_isequal
	.global	_recipsp
	.global	_recipsp_c
	.global	_recipsp_v
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
	.global	__divf
	.global	__fltllif
	.global	__fixdlli

;******************************************************************************
;* BUILD ATTRIBUTES                                                           *
;******************************************************************************
	.battr "TI", Tag_File, 1, Tag_ABI_stack_align_needed(0)
	.battr "TI", Tag_File, 1, Tag_ABI_stack_align_preserved(0)
	.battr "TI", Tag_File, 1, Tag_Tramps_Use_SOC(1)
