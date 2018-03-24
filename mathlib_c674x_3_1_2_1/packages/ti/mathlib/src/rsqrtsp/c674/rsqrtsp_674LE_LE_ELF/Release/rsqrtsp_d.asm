;******************************************************************************
;* TMS320C6x C/C++ Codegen                                          PC v7.4.2 *
;* Date/Time created: Mon May 16 23:55:37 2016                                *
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
	.word	04476e6ddh		; a[0] @ 0
	.word	043b50493h		; a[1] @ 32
	.word	0439400b5h		; a[2] @ 64
	.word	0431e7a78h		; a[3] @ 96
	.word	044627782h		; a[4] @ 128
	.word	04433b225h		; a[5] @ 160
	.word	0440c0d41h		; a[6] @ 192
	.word	04404a940h		; a[7] @ 224
	.word	0433db9c4h		; a[8] @ 256
	.word	0442b64bbh		; a[9] @ 288

;	C:\MATHLIB_Tools\CCSV5_5_0\ccsv5\tools\compiler\c6000_7.4.2\bin\opt6x.exe C:\\Users\\gtbldadm\\AppData\\Local\\Temp\\025164 C:\\Users\\gtbldadm\\AppData\\Local\\Temp\\025166 
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
;*   Local Frame Size  : 8 Args + 28 Auto + 56 Save = 92 byte                 *
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

           STW     .D2T2   B3,*SP--(48)      ; |92| 
||         CALLP   .S2     driver_init,B3
||         MVKH    .S1     $C$SL1+0,A4

$C$RL0:    ; CALL OCCURS {driver_init} {0}   ; |100| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 3

           MVK     .L2     0xa,B4
||         MVKL    .S1     a,A12

           MVKH    .S1     a,A12
||         MVKL    .S2     output,B10

           CALL    .S1     rsqrtf            ; |109| 
||         MV      .L1     A12,A13
||         MV      .D1X    B4,A10
||         MVKH    .S2     output,B10
||         ZERO    .L2     B11

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L1:    
;          EXCLUSIVE CPU CYCLES: 5
           LDW     .D1T1   *A13++,A4         ; |109| 
           ADDKPC  .S2     $C$RL1,B3,3       ; |109| 
$C$RL1:    ; CALL OCCURS {rsqrtf} {0}        ; |109| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 7

           LDW     .D2T2   *B10,B4           ; |109| 
||         SUB     .L1     A10,1,A0          ; |108| 
||         SUB     .S1     A10,1,A10         ; |108| 

   [ A0]   BNOP    .S1     $C$L1,3           ; |108| 
|| [!A0]   MVK     .L2     0xa,B5

           ADD     .L2     B11,B4,B4         ; |109| 
||         ADD     .S2     4,B11,B11         ; |108| 

   [ A0]   CALL    .S1     rsqrtf            ; |109| 
||         STW     .D2T1   A4,*B4            ; |109| 
|| [!A0]   ADD     .L2     4,B10,B4

           ; BRANCHCC OCCURS {$C$L1}         ; |108| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 1

           CALL    .S1     rsqrtsp           ; |112| 
||         ZERO    .L2     B11
||         MV      .L1X    B5,A10
||         MV      .D1     A12,A11
||         STW     .D2T2   B4,*+SP(20)

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L2:    
;          EXCLUSIVE CPU CYCLES: 5
           LDW     .D1T1   *A12++,A4         ; |112| 
           ADDKPC  .S2     $C$RL2,B3,3       ; |112| 
$C$RL2:    ; CALL OCCURS {rsqrtsp} {0}       ; |112| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 12
           LDW     .D2T2   *+SP(20),B4       ; |112| 
           SUB     .L1     A10,1,A0          ; |111| 
           SUB     .L1     A10,1,A10         ; |111| 
           NOP             2
           LDW     .D2T2   *B4,B4            ; |112| 
   [ A0]   BNOP    .S1     $C$L2,3           ; |111| 

           ADD     .L2     B11,B4,B4         ; |112| 
||         ADD     .S2     4,B11,B11         ; |111| 

   [ A0]   CALL    .S1     rsqrtsp           ; |112| 
||         STW     .D2T1   A4,*B4            ; |112| 

           ; BRANCHCC OCCURS {$C$L2}         ; |111| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 7
           LDW     .D2T2   *+SP(20),B4
           MVK     .L2     0xa,B5
           ZERO    .L2     B11
           MV      .L1     A11,A12
           MV      .L1X    B5,A10
           ADD     .L2     4,B4,B4

           STW     .D2T2   B4,*+SP(24)
||         CALL    .S1     rsqrtsp_c         ; |115| 

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L3:    
;          EXCLUSIVE CPU CYCLES: 5
           LDW     .D1T1   *A12++,A4         ; |115| 
           ADDKPC  .S2     $C$RL3,B3,3       ; |115| 
$C$RL3:    ; CALL OCCURS {rsqrtsp_c} {0}     ; |115| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 12

           LDW     .D2T2   *+SP(24),B4       ; |115| 
||         SUB     .L1     A10,1,A0          ; |114| 
||         SUB     .S1     A10,1,A10         ; |114| 

   [!A0]   ZERO    .L1     A3
   [!A0]   SET     .S1     A3,0x16,0x1d,A5
   [!A0]   ZERO    .L1     A3
   [!A0]   SET     .S1     A3,0x17,0x1e,A3
           LDW     .D2T2   *B4,B4            ; |115| 
   [ A0]   BNOP    .S1     $C$L3,3           ; |114| 

           ADD     .L2     B11,B4,B4         ; |115| 
||         ADD     .S2     4,B11,B11         ; |114| 

   [ A0]   CALL    .S1     rsqrtsp_c         ; |115| 
||         STW     .D2T1   A4,*B4            ; |115| 
|| [!A0]   ZERO    .L1     A4
|| [!A0]   ZERO    .L2     B4

           ; BRANCHCC OCCURS {$C$L3}         ; |114| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 3

           SET     .S2     B4,0x18,0x1d,B4
||         SET     .S1     A4,0x17,0x17,A4
||         MV      .L2X    A11,B8
||         MVK     .L1     9,A1
||         LDW     .D2T2   *+B10(12),B9

           MV      .L2     B4,B6
||         MV      .D2X    A3,B4
||         MV      .L1     A4,A3
||         DINT                              ; interrupts off

           MV      .L2X    A5,B5
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*
;*      Loop found in file               : C:/nightlybuilds/mathlib/ti/mathlib/src/rsqrtsp/rsqrtsp_d.c
;*      Loop source line                 : 117
;*      Loop opening brace source line   : 117
;*      Loop closing brace source line   : 119
;*      Known Minimum Trip Count         : 10                    
;*      Known Maximum Trip Count         : 10                    
;*      Known Max Trip Count Factor      : 10
;*      Loop Carried Dependency Bound(^) : 47
;*      Unpartitioned Resource Bound     : 4
;*      Partitioned Resource Bound(*)    : 8
;*      Resource Partition:
;*                                A-side   B-side
;*      .L units                     0        0     
;*      .S units                     2        1     
;*      .D units                     0        2     
;*      .M units                     0        8*    
;*      .X cross paths               1        0     
;*      .T address paths             0        2     
;*      Long read paths              0        0     
;*      Long write paths             0        0     
;*      Logical  ops (.LS)           0        2     (.L or .S unit)
;*      Addition ops (.LSD)          0        1     (.L or .S or .D unit)
;*      Bound(.L .S .LS)             1        2     
;*      Bound(.L .S .D .LS .LSD)     1        2     
;*
;*      Searching for software pipeline schedule at ...
;*         ii = 47 Schedule found with 1 iterations in parallel
;*
;*      Register Usage Table:
;*          +-----------------------------------------------------------------+
;*          |AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA|BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB|
;*          |00000000001111111111222222222233|00000000001111111111222222222233|
;*          |01234567890123456789012345678901|01234567890123456789012345678901|
;*          |--------------------------------+--------------------------------|
;*       0: | * *                            |    *** **                      |
;*       1: | * *                            |    *** **                      |
;*       2: | * *                            |    *** **                      |
;*       3: | * *                            |    *** **                      |
;*       4: | * *                            |    *** **                      |
;*       5: | * *                            |    *** **       *              |
;*       6: | * *                            |    *** **      **              |
;*       7: | * *                            |    *** **      **              |
;*       8: | * *                            |    *** **      **              |
;*       9: | * *                            |    *** **      **              |
;*      10: | * *                            |    ******      **              |
;*      11: | * *                            |    *** **      **              |
;*      12: | * *                            |    *** **      **              |
;*      13: | * *                            |    *** **      **              |
;*      14: | * *                            |    ******      **              |
;*      15: | * *                            |    *** **      **              |
;*      16: | * *                            |    *** **      **              |
;*      17: | * *                            |    *** **      **              |
;*      18: | * *                            |    ******      **              |
;*      19: | * *                            |    *** **      **              |
;*      20: | * *                            |    *** **      **              |
;*      21: | * *                            |    *** **      **              |
;*      22: | * *                            |    ******      **              |
;*      23: | * *                            |    *** **       *              |
;*      24: | * *                            |    *** **       *              |
;*      25: | * *                            |    *** **       *              |
;*      26: | * *                            |    *** **      **              |
;*      27: | * *                            |    *** **      **              |
;*      28: | * *                            |    *** **      **              |
;*      29: | * *                            |    *** **      **              |
;*      30: | * *                            |    ******      **              |
;*      31: | * *                            |    *** **      **              |
;*      32: | * *                            |    *** **      **              |
;*      33: | * *                            |    *** **      **              |
;*      34: | * *                            |    ******      **              |
;*      35: | * *                            |    *** **      **              |
;*      36: | * *                            |    *** **      **              |
;*      37: | * *                            |    *** **      **              |
;*      38: | * *                            |    ******      **              |
;*      39: | * *                            |    *** **      **              |
;*      40: | * *                            |    *** **      **              |
;*      41: |** *                            |    *** **      *               |
;*      42: |** *                            |    ******      **              |
;*      43: | * *                            |    *** **       *              |
;*      44: | * *                            |    *** **       *              |
;*      45: | * *                            |    *** **       *              |
;*      46: | * *                            |    *** **       *              |
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
;*      Total cycles (est.)         : 0 + min_trip_cnt * 47 = 470        
;*----------------------------------------------------------------------------*
;*       SETUP CODE
;*
;*                  SUB             A1,1,A1
;*
;*        SINGLE SCHEDULED ITERATION
;*
;*        $C$C77:
;*   0              LDW     .D2T2   *B8++,B17         ; |62|  ^ 
;*   1              NOP             4
;*   5              RSQRSP  .S2     B17,B16           ; |62|  ^ 
;*   6              MPYSP   .M2     B16,B17,B7        ; |62|  ^ 
;*   7              NOP             3
;*  10              MPYSP   .M2     B16,B7,B7         ; |62|  ^ 
;*  11              NOP             3
;*  14              MPYSP   .M2     B6,B7,B7          ; |62|  ^ 
;*  15              NOP             3
;*  18              SUBSP   .L2     B5,B7,B7          ; |62|  ^ 
;*  19              NOP             3
;*  22              MPYSP   .M2     B16,B7,B16        ; |62|  ^ 
;*  23              NOP             3
;*  26              MPYSP   .M2     B16,B17,B7        ; |62|  ^ 
;*  27              NOP             3
;*  30              MPYSP   .M2     B16,B7,B7         ; |62|  ^ 
;*  31              NOP             3
;*  34              MPYSP   .M2     B6,B7,B7          ; |62|  ^ 
;*  35              NOP             3
;*  38              SUBSP   .L2     B5,B7,B7          ; |62|  ^ 
;*  39              NOP             1
;*  40              CMPLTSP .S1X    B17,A3,A0         ; |62| 
;*  41      [ A0]   MV      .S2     B4,B17            ; |62| 
;*     ||   [ A1]   BDEC    .S1     $C$C77,A1         ; |117| 
;*  42      [!A0]   MPYSP   .M2     B16,B7,B17        ; |62|  ^ 
;*  43              NOP             3
;*  46              STW     .D2T2   B17,*B9++         ; |62|  ^ 
;*  47              ; BRANCHCC OCCURS {$C$C77}        ; |117| 
;*----------------------------------------------------------------------------*
$C$L4:    ; PIPED LOOP PROLOG
;** --------------------------------------------------------------------------*
$C$L5:    ; PIPED LOOP KERNEL
;          EXCLUSIVE CPU CYCLES: 47
           LDW     .D2T2   *B8++,B17         ; |62| <0,0>  ^ 
           NOP             4
           RSQRSP  .S2     B17,B16           ; |62| <0,5>  ^ 
           MPYSP   .M2     B16,B17,B7        ; |62| <0,6>  ^ 
           NOP             3
           MPYSP   .M2     B16,B7,B7         ; |62| <0,10>  ^ 
           NOP             3
           MPYSP   .M2     B6,B7,B7          ; |62| <0,14>  ^ 
           NOP             3
           SUBSP   .L2     B5,B7,B7          ; |62| <0,18>  ^ 
           NOP             3
           MPYSP   .M2     B16,B7,B16        ; |62| <0,22>  ^ 
           NOP             3
           MPYSP   .M2     B16,B17,B7        ; |62| <0,26>  ^ 
           NOP             3
           MPYSP   .M2     B16,B7,B7         ; |62| <0,30>  ^ 
           NOP             3
           MPYSP   .M2     B6,B7,B7          ; |62| <0,34>  ^ 
           NOP             3
           SUBSP   .L2     B5,B7,B7          ; |62| <0,38>  ^ 
           NOP             1
           CMPLTSP .S1X    B17,A3,A0         ; |62| <0,40> 

   [ A0]   MV      .S2     B4,B17            ; |62| <0,41> 
|| [ A1]   BDEC    .S1     $C$L5,A1          ; |117| <0,41> 

   [!A0]   MPYSP   .M2     B16,B7,B17        ; |62| <0,42>  ^ 
           NOP             3
           STW     .D2T2   B17,*B9++         ; |62| <0,46>  ^ 
;** --------------------------------------------------------------------------*
$C$L6:    ; PIPED LOOP EPILOG
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 9
           MV      .L1X    B4,A15
           MV      .L1X    B10,A10

           MVK     .L1     0xa,A6            ; |120| 
||         RINT                              ; interrupts on
||         MV      .S1X    B5,A12
||         MV      .D1     A11,A4            ; |120| 

           CALLP   .S2     rsqrtsp_v,B3
||         LDW     .D1T2   *+A10(16),B4      ; |120| 
||         MV      .L1     A3,A14
||         MV      .S1X    B6,A13

$C$RL4:    ; CALL OCCURS {rsqrtsp_v} {0}     ; |120| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 48
           MVKL    .S2     0x3ee4f8b5,B7
           MVKL    .S2     0x88e368f1,B6
           MVKH    .S2     0x3ee4f8b5,B7

           LDW     .D1T1   *A10,A4           ; |66| 
||         MVKH    .S2     0x88e368f1,B6

           CALLP   .S2     isequal,B3
||         LDW     .D1T2   *+A10(4),B4       ; |66| 
||         MVK     .L1     0xa,A6            ; |66| 
||         MVK     .S1     0x1,A8            ; |66| 

$C$RL5:    ; CALL OCCURS {isequal} {0}       ; |66| 
           MVKL    .S2     fcn_pass,B4
           MVKL    .S2     0x88e368f1,B6
           MVKL    .S2     0x3ee4f8b5,B7
           MVKH    .S2     fcn_pass,B4
           MVKH    .S2     0x88e368f1,B6

           MV      .L1     A4,A3             ; |66| 
||         LDW     .D1T1   *A10,A4           ; |67| 
||         MVKH    .S2     0x3ee4f8b5,B7

           CALLP   .S2     isequal,B3
||         STW     .D2T1   A3,*+B4(4)        ; |66| 
||         LDW     .D1T2   *+A10(8),B4       ; |67| 
||         MVK     .L1     0xa,A6            ; |67| 
||         MVK     .S1     0x1,A8            ; |67| 

$C$RL6:    ; CALL OCCURS {isequal} {0}       ; |67| 
           MVKL    .S2     fcn_pass,B4
           MVKL    .S2     0x88e368f1,B6
           MVKL    .S2     0x3ee4f8b5,B7
           MVKH    .S2     fcn_pass,B4
           MVKH    .S2     0x88e368f1,B6

           MV      .L1X    B10,A3
||         STW     .D2T1   A4,*+B4(8)        ; |67| 
||         LDW     .D1T2   *+A10(12),B4      ; |68| 
||         MVKH    .S2     0x3ee4f8b5,B7

           CALLP   .S2     isequal,B3
||         LDW     .D1T1   *A3,A4            ; |68| 
||         MVK     .L1     0xa,A6            ; |68| 
||         MVK     .S1     0x1,A8            ; |68| 

$C$RL7:    ; CALL OCCURS {isequal} {0}       ; |68| 
           MVKL    .S2     0x88e368f1,B6

           LDW     .D2T2   *+SP(24),B5
||         MVKL    .S2     fcn_pass,B31

           MVKL    .S2     0x3ee4f8b5,B7
           MVKH    .S2     fcn_pass,B31
           MVKH    .S2     0x88e368f1,B6

           STW     .D2T1   A4,*+B31(12)      ; |68| 
||         MVKH    .S2     0x3ee4f8b5,B7

           ADDAD   .D2     B5,1,B4
||         MVKL    .S2     output,B5

           MVKH    .S2     output,B5
||         LDW     .D2T2   *B4,B4            ; |69| 

           CALLP   .S2     isequal,B3
||         LDW     .D2T1   *B5,A4            ; |69| 
||         MVK     .L1     0xa,A6            ; |69| 
||         MVK     .S1     0x1,A8            ; |69| 

$C$RL8:    ; CALL OCCURS {isequal} {0}       ; |69| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 14

           MVKL    .S1     fcn_pass,A3
||         MVKL    .S2     fcn_pass,B5

           MVKH    .S1     fcn_pass,A3
||         MVKH    .S2     fcn_pass,B5

           ADD     .L1     4,A3,A3
           LDW     .D1T1   *A3,A0            ; |72| 
           STW     .D2T1   A4,*+B5(16)       ; |69| 
           ADD     .L2     8,B5,B4
           STW     .D2T2   B4,*+SP(32)       ; |69| 
           STW     .D2T1   A3,*+SP(28)

   [!A0]   B       .S1     $C$L7             ; |72| 
|| [ A0]   LDW     .D2T2   *B4,B0            ; |72| 

   [!A0]   CALL    .S1     print_test_results ; |124| 
   [!A0]   ZERO    .L1     A3                ; |72| 
   [ A0]   ADD     .L2     4,B4,B4
   [!A0]   MVKL    .S1     all_pass,A4
   [!A0]   MVKH    .S1     all_pass,A4
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
           CALL    .S1     print_test_results ; |124| 
           MVKL    .S1     all_pass,A4
           MVKH    .S1     all_pass,A4
           NOP             2
;** --------------------------------------------------------------------------*
$C$L7:    
;          EXCLUSIVE CPU CYCLES: 1

           STW     .D1T1   A3,*A4            ; |72| 
||         MVK     .L1     0x1,A4            ; |124| 
||         ADDKPC  .S2     $C$RL9,B3,0       ; |124| 

$C$RL9:    ; CALL OCCURS {print_test_results} {0}  ; |124| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 6

           LDW     .D2T2   *+SP(24),B4       ; |132| 
||         MVKL    .S1     a_sc,A11
||         ZERO    .L2     B13

           MVKH    .S2     0xbf800000,B13
||         MVKH    .S1     a_sc,A11
||         MVK     .L1     0x7,A31
||         ZERO    .L2     B12
||         MVK     .D1     -1,A3             ; |137| 

           STW     .D1T1   A3,*+A11(24)      ; |137| 
||         SET     .S2     B12,0x17,0x1d,B12
||         ZERO    .L1     A6                ; |132| 
||         ZERO    .S1     A7

           STDW    .D1T2   B13:B12,*+A11(16) ; |136| 
||         STW     .D2T1   A31,*+SP(12)      ; |136| 
||         MVKH    .S1     0x80000000,A7
||         ZERO    .L1     A5

           STDW    .D1T1   A7:A6,*A11        ; |132| 
||         MVKH    .S1     0xff800000,A5
||         MV      .L1     A15,A4            ; |134| 

           MV      .L2X    A6,B12            ; |136| 
||         STDW    .D1T1   A5:A4,*+A11(8)    ; |134| 
||         ADD     .S2     4,B4,B11
||         MV      .L1     A11,A10           ; |132| 

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
           LDW     .D1T1   *A10,A3           ; |139| 
           CALL    .S1     rsqrt             ; |139| 
           ADDKPC  .S2     $C$RL10,B3,2      ; |139| 
           SPDP    .S1     A3,A5:A4          ; |139| 
           NOP             1
$C$RL10:   ; CALL OCCURS {rsqrt} {0}         ; |139| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 26
           LDW     .D2T2   *B10,B4           ; |139| 
           DPSP    .L1     A5:A4,A3          ; |139| 
           NOP             3
           ADD     .L2     B12,B4,B4         ; |139| 
           STW     .D2T1   A3,*B4            ; |139| 

           CALLP   .S2     rsqrtsp,B3
||         LDW     .D1T1   *A10,A4           ; |140| 

$C$RL11:   ; CALL OCCURS {rsqrtsp} {0}       ; |140| 
           LDW     .D2T2   *+B10(4),B4       ; |140| 
           NOP             4
           ADD     .L2     B12,B4,B4         ; |140| 
           STW     .D2T1   A4,*B4            ; |140| 

           CALLP   .S2     rsqrtsp_c,B3
||         LDW     .D1T1   *A10,A4           ; |141| 

$C$RL12:   ; CALL OCCURS {rsqrtsp_c} {0}     ; |141| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 55
           LDW     .D2T2   *+B10(8),B4       ; |141| 
           LDW     .D2T1   *+SP(12),A31      ; |65| 
           LDW     .D2T2   *B11,B31          ; |142| 
           NOP             2
           ADD     .L2     B12,B4,B4         ; |141| 
           STW     .D2T1   A4,*B4            ; |141| 
           LDW     .D1T1   *A10++,A4         ; |62| 
           SUB     .L1     A31,1,A30         ; |138| 
           SUB     .L1     A31,1,A2          ; |138| 
           ADD     .L2     B12,B31,B4        ; |142| 
           ADD     .L2     4,B12,B12         ; |138| 
           RSQRSP  .S1     A4,A3             ; |62| 
           MPYSP   .M1     A3,A4,A5          ; |62| 
           STW     .D2T1   A30,*+SP(12)      ; |142| 
           CMPLTSP .S1     A4,A14,A0         ; |64| 
           NOP             1
           MPYSP   .M1     A3,A5,A5          ; |62| 
           NOP             3
           MPYSP   .M1     A13,A5,A5         ; |62| 
           NOP             3
           SUBSP   .L1     A12,A5,A5         ; |62| 
           NOP             3
           MPYSP   .M1     A3,A5,A3          ; |62| 
           NOP             3
           MPYSP   .M1     A3,A4,A5          ; |62| 
           NOP             3
           MPYSP   .M1     A3,A5,A5          ; |62| 
           NOP             3
           MPYSP   .M1     A13,A5,A5         ; |62| 
           NOP             3
           SUBSP   .L1     A12,A5,A5         ; |62| 
           NOP             3

   [ A2]   BNOP    .S1     $C$L8,3           ; |138| 
||         MPYSP   .M1     A3,A5,A3          ; |62| 

   [ A0]   MV      .L1     A15,A3            ; |65| 

   [!A2]   CALL    .S1     rsqrtsp_v         ; |144| 
||         STW     .D2T1   A3,*B4            ; |142| 

           ; BRANCHCC OCCURS {$C$L8}         ; |138| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           LDW     .D2T2   *+B11(4),B4       ; |144| 
           MV      .L1     A11,A4
           MVK     .L1     0x7,A6            ; |144| 
           ADDKPC  .S2     $C$RL13,B3,1      ; |144| 
$C$RL13:   ; CALL OCCURS {rsqrtsp_v} {0}     ; |144| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 48
           MVKL    .S2     0x3ee4f8b5,B7
           MVKL    .S2     0x88e368f1,B6
           MVKH    .S2     0x3ee4f8b5,B7

           LDW     .D2T1   *B10,A4           ; |66| 
||         MVKH    .S2     0x88e368f1,B6

           CALLP   .S2     isequal,B3
||         LDW     .D2T2   *+B10(4),B4       ; |66| 
||         MVK     .L1     0x7,A6            ; |66| 
||         MVK     .S1     0x1,A8            ; |66| 

$C$RL14:   ; CALL OCCURS {isequal} {0}       ; |66| 
           MVKL    .S2     fcn_pass,B5
           MVKL    .S2     0x3ee4f8b5,B7
           MVKH    .S2     fcn_pass,B5
           MVKL    .S2     0x88e368f1,B6

           LDW     .D2T2   *+B10(8),B4       ; |67| 
||         MVKH    .S2     0x3ee4f8b5,B7

           STW     .D2T1   A4,*+B5(4)        ; |66| 
||         MVKH    .S2     0x88e368f1,B6

           CALLP   .S2     isequal,B3
||         LDW     .D2T1   *B10,A4           ; |67| 
||         MVK     .L1     0x7,A6            ; |67| 
||         MVK     .S1     0x1,A8            ; |67| 

$C$RL15:   ; CALL OCCURS {isequal} {0}       ; |67| 
           MVKL    .S2     fcn_pass,B5
           MVKL    .S2     0x3ee4f8b5,B7
           MVKL    .S2     0x88e368f1,B6
           MVKH    .S2     fcn_pass,B5

           LDW     .D2T2   *+B10(12),B4      ; |68| 
||         MVKH    .S2     0x3ee4f8b5,B7

           STW     .D2T1   A4,*+B5(8)        ; |67| 
||         MVKH    .S2     0x88e368f1,B6

           CALLP   .S2     isequal,B3
||         LDW     .D2T1   *B10,A4           ; |68| 
||         MVK     .L1     0x7,A6            ; |68| 
||         MVK     .S1     0x1,A8            ; |68| 

$C$RL16:   ; CALL OCCURS {isequal} {0}       ; |68| 
           MVKL    .S2     fcn_pass,B5
           MVKL    .S2     0x3ee4f8b5,B7
           MVKL    .S2     0x88e368f1,B6
           MVKH    .S2     fcn_pass,B5
           MVKH    .S2     0x3ee4f8b5,B7
           MVKH    .S2     0x88e368f1,B6

           STW     .D2T1   A4,*+B5(12)       ; |68| 
||         MVKL    .S2     output,B5

           MVKH    .S2     output,B5
||         LDW     .D2T2   *+B10(16),B4      ; |69| 

           CALLP   .S2     isequal,B3
||         LDW     .D2T1   *B5,A4            ; |69| 
||         MVK     .L1     0x7,A6            ; |69| 
||         MVK     .S1     0x1,A8            ; |69| 

$C$RL17:   ; CALL OCCURS {isequal} {0}       ; |69| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 17
           LDW     .D2T1   *+SP(28),A3       ; |69| 
           MVKL    .S2     fcn_pass,B31
           LDW     .D2T1   *+SP(32),A10
           MVKH    .S2     fcn_pass,B31
           STW     .D2T1   A4,*+B31(16)      ; |69| 
           MV      .L2X    A3,B4             ; |136| 
           LDW     .D2T2   *B4,B0            ; |72| 
           STW     .D2T2   B13,*+SP(12)      ; |69| 
           STW     .D2T1   A3,*+SP(36)       ; |136| 
           NOP             2

   [!B0]   B       .S1     $C$L9             ; |72| 
|| [ B0]   LDW     .D1T1   *A10,A0           ; |72| 

   [!B0]   CALL    .S1     print_test_results ; |148| 
   [ B0]   ADD     .L1     4,A10,A3
   [!B0]   MVKL    .S1     all_pass,A3
   [!B0]   ZERO    .L1     A4                ; |72| 
   [!B0]   MVKH    .S1     all_pass,A3
           ; BRANCHCC OCCURS {$C$L9}         ; |72| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 9
   [ A0]   LDW     .D1T1   *A3,A3            ; |72| 
           CMPEQ   .L1     A4,0,A4           ; |72| 
           XOR     .L1     1,A4,A4           ; |72| 
           NOP             2
   [ A0]   CMPEQ   .L1     A3,0,A3           ; |72| 
   [ A0]   XOR     .L1     1,A3,A3           ; |72| 

   [ A0]   AND     .L1     A4,A3,A0          ; |72| 
|| [!A0]   ZERO    .S1     A0                ; |72| 
||         MVK     .D1     0x1,A4            ; |72| 

   [!A0]   ZERO    .L1     A4                ; |72| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           CALL    .S1     print_test_results ; |148| 
           MVKL    .S1     all_pass,A3
           MVKH    .S1     all_pass,A3
           NOP             2
;** --------------------------------------------------------------------------*
$C$L9:    
;          EXCLUSIVE CPU CYCLES: 1

           STW     .D1T1   A4,*A3            ; |72| 
||         MVK     .L1     0x3,A4            ; |148| 
||         ADDKPC  .S2     $C$RL18,B3,0      ; |148| 

$C$RL18:   ; CALL OCCURS {print_test_results} {0}  ; |148| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 6
           MVKL    .S2     a_ext,B4
           MVKL    .S2     0xc000cccc,B13
           MVKL    .S2     0xcccccccd,B12

           MVKH    .S2     a_ext,B4
||         MVK     .S1     0xed,A3

           MVKH    .S2     0xc000cccc,B13
||         STW     .D2T1   A3,*+SP(16)       ; |151| 

           MV      .L1X    B4,A11            ; |151| 
||         STW     .D2T1   A14,*B4           ; |151| 
||         MVKH    .S2     0xcccccccd,B12
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
;          EXCLUSIVE CPU CYCLES: 7
           LDW     .D1T1   *A11,A3           ; |153| 
           CALL    .S1     rsqrt             ; |153| 
           ADDKPC  .S2     $C$RL19,B3,2      ; |153| 
           SPDP    .S1     A3,A5:A4          ; |153| 
           NOP             1
$C$RL19:   ; CALL OCCURS {rsqrt} {0}         ; |153| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 30
           MVKL    .S2     output,B4
           MVKH    .S2     output,B4
           LDW     .D2T1   *B4,A3            ; |153| 
           DPSP    .L1     A5:A4,A4          ; |153| 
           NOP             3
           ADD     .L1X    B10,A3,A3         ; |153| 
           STW     .D1T1   A4,*A3            ; |153| 

           CALLP   .S2     rsqrtsp,B3
||         LDW     .D1T1   *A11,A4           ; |154| 

$C$RL20:   ; CALL OCCURS {rsqrtsp} {0}       ; |154| 
           MVKL    .S2     output,B4
           MVKH    .S2     output,B4
           LDW     .D2T2   *+B4(4),B4        ; |154| 
           NOP             4
           ADD     .L2     B10,B4,B4         ; |154| 
           STW     .D2T1   A4,*B4            ; |154| 

           CALLP   .S2     rsqrtsp_c,B3
||         LDW     .D1T1   *A11,A4           ; |155| 

$C$RL21:   ; CALL OCCURS {rsqrtsp_c} {0}     ; |155| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 75
           MVKL    .S2     output,B4
           MVKH    .S2     output,B4
           LDW     .D2T2   *+B4(8),B4        ; |155| 
           LDW     .D2T2   *B11,B31          ; |156| 
           LDW     .D2T1   *+SP(16),A31
           NOP             2
           ADD     .L2     B10,B4,B4         ; |155| 
           STW     .D2T1   A4,*B4            ; |155| 
           LDW     .D1T1   *A11,A4           ; |62| 
           ADD     .L2     B10,B31,B4        ; |156| 
           ADD     .L2     4,B10,B10         ; |152| 
           NOP             2
           RSQRSP  .S1     A4,A3             ; |62| 
           MPYSP   .M1     A3,A4,A5          ; |62| 
           CMPLTSP .S1     A4,A14,A0         ; |64| 
           NOP             2
           MPYSP   .M1     A3,A5,A5          ; |62| 
           NOP             3
           MPYSP   .M1     A13,A5,A5         ; |62| 
           NOP             3
           SUBSP   .L1     A12,A5,A5         ; |62| 
           NOP             3
           MPYSP   .M1     A3,A5,A3          ; |62| 
           NOP             3
           MPYSP   .M1     A3,A4,A5          ; |62| 
           NOP             3
           MPYSP   .M1     A3,A5,A5          ; |62| 
           NOP             3
           MPYSP   .M1     A13,A5,A5         ; |62| 
           NOP             3
           SUBSP   .L1     A12,A5,A5         ; |62| 
           NOP             3
           MPYSP   .M1     A3,A5,A3          ; |62| 
           NOP             3
   [ A0]   MV      .L1     A15,A3            ; |65| 
           STW     .D2T1   A3,*B4            ; |156| 
           LDW     .D1T2   *A11,B4           ; |157| 
           SUB     .L1     A31,1,A0          ; |152| 
           SUB     .L1     A31,1,A3          ; |152| 
           NOP             2
           MPYSPDP .M2     B4,B13:B12,B5:B4  ; |157| 
           NOP             6

   [ A0]   BNOP    .S1     $C$L10,3          ; |152| 
||         DPSP    .L2     B5:B4,B4          ; |157| 

           STW     .D1T2   B4,*++A11         ; |157| 

   [!A0]   CALL    .S1     rsqrtsp_v         ; |159| 
||         STW     .D2T1   A3,*+SP(16)       ; |157| 

           ; BRANCHCC OCCURS {$C$L10}        ; |152| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           LDW     .D2T2   *+B11(4),B4       ; |159| 
           MVKL    .S1     a_ext,A4
           MVKH    .S1     a_ext,A4
           MVK     .S1     0xed,A6           ; |159| 
           ADDKPC  .S2     $C$RL22,B3,0      ; |159| 
$C$RL22:   ; CALL OCCURS {rsqrtsp_v} {0}     ; |159| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 44
           MVKL    .S2     output,B10
           MVKL    .S2     0x88e368f1,B6
           MVKL    .S2     0x3ee4f8b5,B7
           MVKH    .S2     output,B10
           MVKH    .S2     0x88e368f1,B6

           LDW     .D2T1   *B10,A4           ; |66| 
||         MVKH    .S2     0x3ee4f8b5,B7

           CALLP   .S2     isequal,B3
||         LDW     .D2T2   *+B10(4),B4       ; |66| 
||         MVK     .S1     0xed,A6           ; |66| 
||         MVK     .L1     0x1,A8            ; |66| 

$C$RL23:   ; CALL OCCURS {isequal} {0}       ; |66| 
           MVKL    .S2     fcn_pass,B11
           MVKH    .S2     fcn_pass,B11
           MVKL    .S2     0x88e368f1,B6
           MVKL    .S2     0x3ee4f8b5,B7

           STW     .D2T1   A4,*+B11(4)       ; |66| 
||         MVKH    .S2     0x88e368f1,B6

           LDW     .D2T2   *+B10(8),B4       ; |67| 
||         MVKH    .S2     0x3ee4f8b5,B7

           CALLP   .S2     isequal,B3
||         LDW     .D2T1   *B10,A4           ; |67| 
||         MVK     .S1     0xed,A6           ; |67| 
||         MVK     .L1     0x1,A8            ; |67| 

$C$RL24:   ; CALL OCCURS {isequal} {0}       ; |67| 
           MVKL    .S2     0x88e368f1,B6
           MVKL    .S2     0x3ee4f8b5,B7

           STW     .D2T1   A4,*+B11(8)       ; |67| 
||         MVKH    .S2     0x88e368f1,B6

           LDW     .D2T2   *+B10(12),B4      ; |68| 
||         MVKH    .S2     0x3ee4f8b5,B7

           CALLP   .S2     isequal,B3
||         LDW     .D2T1   *B10,A4           ; |68| 
||         MVK     .S1     0xed,A6           ; |68| 
||         MVK     .L1     0x1,A8            ; |68| 

$C$RL25:   ; CALL OCCURS {isequal} {0}       ; |68| 
           MVKL    .S2     0x3ee4f8b5,B7
           MVKL    .S2     0x88e368f1,B6
           MVKH    .S2     0x3ee4f8b5,B7

           MV      .L1X    B10,A3            ; |68| 
||         STW     .D2T1   A4,*+B11(12)      ; |68| 
||         MVKH    .S2     0x88e368f1,B6

           CALLP   .S2     isequal,B3
||         LDW     .D2T2   *+B10(16),B4      ; |69| 
||         LDW     .D1T1   *A3,A4            ; |69| 
||         MVK     .S1     0xed,A6           ; |69| 
||         MVK     .L1     0x1,A8            ; |69| 

$C$RL26:   ; CALL OCCURS {isequal} {0}       ; |69| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 16
           LDW     .D2T1   *+SP(28),A3       ; |69| 
           MV      .L2X    A10,B4            ; |72| 
           STW     .D2T1   A4,*+B11(16)      ; |69| 
           NOP             2
           LDW     .D1T1   *A3,A0            ; |72| 
           NOP             4

   [!A0]   B       .S1     $C$L11            ; |72| 
|| [ A0]   LDW     .D2T2   *B4,B0            ; |72| 

   [!A0]   CALL    .S1     print_test_results ; |163| 
   [!A0]   ZERO    .L1     A4                ; |72| 
   [ A0]   ADD     .L2     4,B4,B4
   [!A0]   MVKL    .S1     all_pass,A3
   [!A0]   MVKH    .S1     all_pass,A3
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
           CALL    .S1     print_test_results ; |163| 
           MVKL    .S1     all_pass,A3
           MVKH    .S1     all_pass,A3
           NOP             2
;** --------------------------------------------------------------------------*
$C$L11:    
;          EXCLUSIVE CPU CYCLES: 1

           STW     .D1T1   A4,*A3            ; |72| 
||         MVK     .L1     0x4,A4            ; |163| 
||         ADDKPC  .S2     $C$RL27,B3,0      ; |163| 

$C$RL27:   ; CALL OCCURS {print_test_results} {0}  ; |163| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 15

           ZERO    .L2     B13               ; |114| 
||         MVKL    .S2     cycle_counts+24,B5

           MVKH    .S2     cycle_counts+24,B5
||         ZERO    .L2     B4                ; |114| 
||         ZERO    .D2     B12               ; |114| 

           MVC     .S2     B4,TSCL           ; |115| 
||         STDW    .D2T2   B13:B12,*B5       ; |114| 

           MVC     .S2     TSCL,B4           ; |116| 
           MVC     .S2     TSCH,B5           ; |116| 
           MVKL    .S1     t_start,A3
           MVKH    .S1     t_start,A3

           MVC     .S2     TSCL,B6           ; |117| 
||         STDW    .D1T2   B5:B4,*A3         ; |116| 

           MVC     .S2     TSCH,B8           ; |117| 

           SUBU    .L2     B6,B4,B7:B6       ; |117| 
||         MVKL    .S1     0x447a4000,A3

           EXT     .S2     B7,24,24,B5       ; |117| 
||         SUB     .L2     B8,B5,B4          ; |117| 
||         MVKH    .S1     0x447a4000,A3

           MVK     .S2     0x80,B4
||         ADD     .L2     B4,B5,B7          ; |117| 

           CALL    .S2     gimme_random      ; |173| 
||         MV      .L2X    A3,B11
||         MVKL    .S1     t_offset,A4

           LDW     .D2T2   *+SP(12),B4       ; |173| 
||         MV      .L1X    B4,A11            ; |117| 
||         MVKH    .S1     t_offset,A4

           MV      .L1X    B11,A4            ; |173| 
||         STDW    .D1T2   B7:B6,*A4         ; |117| 
||         MV      .L2     B12,B10           ; |117| 

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
;          EXCLUSIVE CPU CYCLES: 3
           ADDKPC  .S2     $C$RL28,B3,2      ; |173| 
$C$RL28:   ; CALL OCCURS {gimme_random} {0}  ; |173| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 68
           MVKL    .S1     input,A3
           MVKH    .S1     input,A3
           LDW     .D1T1   *A3,A3            ; |173| 
           NOP             4
           ADD     .L1X    B10,A3,A3         ; |173| 

           STW     .D1T1   A4,*A3            ; |173| 
||         MVC     .S2     TSCL,B16          ; |122| 

           MVC     .S2     TSCH,B4           ; |122| 

           RSQRSP  .S1     A4,A3             ; |62| 
||         MVKL    .S2     output+12,B5
||         MV      .L2     B4,B17            ; |122| 

           MPYSP   .M1     A3,A4,A5          ; |62| 
||         MVKH    .S2     output+12,B5
||         MVKL    .S1     t_start,A31

           LDW     .D2T2   *B5,B5            ; |177| 
||         CMPLTSP .S1     A4,A14,A0         ; |64| 

           MVKH    .S1     t_start,A31
           STDW    .D1T2   B17:B16,*A31
           MPYSP   .M1     A3,A5,A5          ; |62| 
           NOP             1
           ADD     .L2     B10,B5,B4         ; |177| 
           NOP             1
           MPYSP   .M1     A13,A5,A5         ; |62| 
           NOP             3
           SUBSP   .L1     A12,A5,A5         ; |62| 
           NOP             3
           MPYSP   .M1     A3,A5,A3          ; |62| 
           NOP             3
           MPYSP   .M1     A3,A4,A5          ; |62| 
           NOP             3
           MPYSP   .M1     A3,A5,A5          ; |62| 
           NOP             3
           MPYSP   .M1     A13,A5,A5         ; |62| 
           NOP             3
           SUBSP   .L1     A12,A5,A5         ; |62| 
           NOP             3
           MPYSP   .M1     A3,A5,A5          ; |62| 
           NOP             3
   [ A0]   MV      .L1     A15,A5            ; |65| 

           STW     .D2T1   A5,*B4            ; |177| 
||         MVC     .S2     TSCL,B8           ; |128| 

           MVC     .S2     TSCH,B9           ; |128| 

           MVKL    .S1     t_offset,A3
||         MVKL    .S2     cycle_counts+24,B4
||         SUB     .L1     A11,1,A0          ; |171| 

           MVKH    .S1     t_offset,A3
||         MVKH    .S2     cycle_counts+24,B4

           LDDW    .D1T1   *A3,A5:A4         ; |130| 
||         LDDW    .D2T2   *B4,B5:B4         ; |130| 
||         MVKL    .S1     cycle_counts+24,A3

           MVKL    .S1     t_stop,A30
           MVKH    .S1     cycle_counts+24,A3
           MVKH    .S1     t_stop,A30
           STDW    .D1T2   B9:B8,*A30        ; |128| 

           ADDU    .L2X    A4,B16,B7:B6      ; |130| 
|| [ A0]   MV      .L1X    B11,A4            ; |173| 

           ADD     .S2X    B7,A5,B16         ; |130| 
||         SUBU    .L2     B8,B6,B7:B6       ; |130| 
|| [ A0]   B       .S1     $C$L12            ; |171| 

           ADD     .L2     B16,B17,B16       ; |130| 

           ADDU    .L2     B4,B6,B7:B6       ; |130| 
||         SUB     .D2     B9,B16,B4         ; |130| 
||         EXT     .S2     B7,24,24,B16      ; |130| 

           ADD     .L2     B7,B5,B4          ; |130| 
||         ADD     .S2     B4,B16,B5         ; |130| 
|| [ A0]   CALL    .S1     gimme_random      ; |173| 

           ADD     .L2     B4,B5,B7          ; |130| 
|| [ A0]   LDW     .D2T2   *+SP(12),B4       ; |173| 

           STDW    .D1T2   B7:B6,*A3         ; |130| 
||         ADD     .L2     4,B10,B10         ; |171| 
||         SUB     .L1     A11,1,A11         ; |171| 

           ; BRANCHCC OCCURS {$C$L12}        ; |171| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 6

           CALLP   .S2     __c6xabi_fltllif,B3
||         LDDW    .D1T1   *A3,A5:A4         ; |135| 

$C$RL29:   ; CALL OCCURS {__c6xabi_fltllif} {0}  ; |135| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 16
           ZERO    .L1     A11
           SET     .S1     A11,0x1a,0x1d,A11
           MPYSP   .M1     A11,A4,A3         ; |135| 
           ZERO    .L1     A13
           SET     .S1     A13,0x15,0x1d,A13
           MV      .L1X    B13,A12           ; |135| 
           SPDP    .S1     A3,A5:A4          ; |135| 
           NOP             2
           ADDDP   .L1     A13:A12,A5:A4,A5:A4 ; |135| 
           CALLP   .S2     __c6xabi_fixdlli,B3
$C$RL30:   ; CALL OCCURS {__c6xabi_fixdlli} {0}  ; |135| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 22
           MVKL    .S1     cycle_counts+24,A3
           MVKH    .S1     cycle_counts+24,A3
           MVK     .S2     24,B10
           MV      .L2X    A3,B4

           SUB     .L2X    A3,B10,B10
||         MV      .S2     B12,B5            ; |114| 
||         STDW    .D2T1   A5:A4,*B4         ; |135| 

           STDW    .D2T2   B13:B12,*B10      ; |114| 
||         MVC     .S2     B5,TSCL           ; |115| 

           MVC     .S2     TSCL,B6           ; |116| 
           MVC     .S2     TSCH,B4           ; |116| 
           MVKL    .S1     t_start,A15

           MVKH    .S1     t_start,A15
||         MV      .L2     B4,B7             ; |116| 

           STDW    .D1T2   B7:B6,*A15        ; |116| 
||         MVC     .S2     TSCL,B4           ; |117| 

           MVC     .S2     TSCH,B8           ; |117| 

           SUBU    .L2     B4,B6,B5:B4       ; |117| 
||         MVKL    .S2     t_offset,B11

           EXT     .S2     B5,24,24,B6       ; |117| 
||         SUB     .L2     B8,B7,B31         ; |117| 

           ADD     .L2     B31,B6,B5         ; |117| 
||         MVKH    .S2     t_offset,B11
||         MVKL    .S1     input,A14

           STDW    .D2T2   B5:B4,*B11        ; |117| 
||         MVKH    .S1     input,A14

           LDW     .D1T1   *A14,A3           ; |185| 
           MVK     .S2     0x80,B30
           STW     .D2T2   B30,*+SP(12)      ; |117| 
           NOP             2

           CALL    .S1     rsqrtf            ; |185| 
||         ADD     .L1     A12,A3,A3         ; |185| 

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L13:    
;          EXCLUSIVE CPU CYCLES: 5
           LDW     .D1T1   *A3,A4            ; |185| 
           ADDKPC  .S2     $C$RL31,B3,3      ; |185| 
$C$RL31:   ; CALL OCCURS {rsqrtf} {0}        ; |185| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 19
           MVKL    .S2     output,B4
           MVKH    .S2     output,B4
           LDW     .D2T2   *B4,B4            ; |185| 
           NOP             4

           ADD     .L1X    A12,B4,A3         ; |185| 
||         LDW     .D2T2   *+SP(12),B4       ; |185| 

           ADD     .L1     4,A12,A12         ; |184| 
           STW     .D1T1   A4,*A3            ; |185| 
           NOP             2

           SUB     .L1X    B4,1,A0           ; |184| 
||         SUB     .L2     B4,1,B4           ; |184| 

   [ A0]   BNOP    .S1     $C$L13,4          ; |184| 
|| [ A0]   LDW     .D1T1   *A14,A3           ; |185| 
||         STW     .D2T2   B4,*+SP(12)       ; |185| 

   [ A0]   CALL    .S1     rsqrtf            ; |185| 
||         ADD     .L1     A12,A3,A3         ; |185| 

           ; BRANCHCC OCCURS {$C$L13}        ; |184| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 17
           MVC     .S2     TSCL,B6           ; |128| 
           MVC     .S2     TSCH,B5           ; |128| 

           MV      .L2     B11,B4            ; |128| 
||         LDDW    .D1T1   *A15,A5:A4        ; |130| 

           LDDW    .D2T2   *B4,B9:B8         ; |130| 
           MV      .L2     B5,B7             ; |128| 
           LDDW    .D2T2   *B10,B5:B4        ; |130| 
           NOP             2
           ADDU    .L1X    B8,A4,A7:A6       ; |130| 
           ADD     .L1X    A7,B9,A4          ; |130| 

           ADD     .L1     A4,A5,A3          ; |130| 
||         SUBU    .L2X    B6,A6,B9:B8       ; |130| 

           CALL    .S1     __c6xabi_fltllif  ; |130| 
||         EXT     .S2     B9,24,24,B16      ; |130| 
||         ADDU    .L2     B4,B8,B9:B8       ; |130| 

           SUB     .L2X    B7,A3,B4          ; |130| 

           ADD     .L2     B9,B5,B4          ; |130| 
||         ADD     .D2     B4,B16,B5         ; |130| 
||         MV      .L1X    B8,A4             ; |130| 
||         MVKL    .S2     t_stop,B8

           ADD     .L2     B4,B5,B4          ; |130| 
||         MVKH    .S2     t_stop,B8

           STDW    .D2T2   B7:B6,*B8         ; |128| 

           MV      .L1X    B4,A5             ; |130| 
||         ADDKPC  .S2     $C$RL32,B3,0      ; |130| 

$C$RL32:   ; CALL OCCURS {__c6xabi_fltllif} {0}  ; |130| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 13
           MPYSP   .M1     A11,A4,A3         ; |130| 
           MV      .L1X    B13,A12           ; |130| 
           NOP             2
           SPDP    .S1     A3,A5:A4          ; |130| 
           NOP             1
           ADDDP   .L1     A13:A12,A5:A4,A5:A4 ; |130| 
           CALLP   .S2     __c6xabi_fixdlli,B3
$C$RL33:   ; CALL OCCURS {__c6xabi_fixdlli} {0}  ; |130| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 11

           MV      .L2     B12,B4            ; |114| 
||         STDW    .D2T2   B13:B12,*+B10(8)  ; |114| 

           MVC     .S2     B4,TSCL           ; |115| 
||         STDW    .D2T1   A5:A4,*B10        ; |130| 

           MVC     .S2     TSCL,B4           ; |116| 
           MVC     .S2     TSCH,B5           ; |116| 

           MVC     .S2     TSCL,B6           ; |117| 
||         STDW    .D1T2   B5:B4,*A15        ; |116| 

           MVC     .S2     TSCH,B8           ; |117| 

           SUBU    .L2     B6,B4,B7:B6       ; |117| 
||         MVKL    .S2     t_offset,B31

           EXT     .S2     B7,24,24,B5       ; |117| 
||         SUB     .L2     B8,B5,B4          ; |117| 

           MVK     .S2     0x80,B4
||         ADD     .L2     B4,B5,B7          ; |117| 

           MVKH    .S2     t_offset,B31
||         LDW     .D2T2   *+SP(20),B11      ; |117| 

           MV      .L1X    B4,A11            ; |117| 
||         STDW    .D2T2   B7:B6,*B31        ; |117| 

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
||         CALL    .S1     rsqrtsp           ; |193| 

           LDW     .D1T1   *A3,A4            ; |193| 
           ADDKPC  .S2     $C$RL34,B3,3      ; |193| 
$C$RL34:   ; CALL OCCURS {rsqrtsp} {0}       ; |193| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 7

           LDW     .D2T2   *B11,B4           ; |193| 
||         SUB     .L1     A11,1,A0          ; |192| 
||         SUB     .S1     A11,1,A11         ; |192| 

   [ A0]   BNOP    .S1     $C$L14,3          ; |192| 

           ADD     .L1X    A12,B4,A3         ; |193| 
||         ADD     .S1     4,A12,A12         ; |192| 

           STW     .D1T1   A4,*A3            ; |193| 
           ; BRANCHCC OCCURS {$C$L14}        ; |192| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 19
           MVC     .S2     TSCL,B8           ; |128| 
           MVC     .S2     TSCH,B5           ; |128| 

           MVKL    .S2     t_offset,B4
||         MV      .L1     A15,A11           ; |128| 

           MVKH    .S2     t_offset,B4
||         LDDW    .D1T1   *A11,A7:A6        ; |130| 

           LDDW    .D2T2   *B4,B7:B6         ; |130| 
           MV      .L2     B5,B9             ; |128| 
           LDDW    .D2T2   *+B10(8),B5:B4    ; |130| 
           MVKL    .S2     t_stop,B31
           MVKH    .S2     t_stop,B31
           ADDU    .L1X    B6,A6,A5:A4       ; |130| 
           STDW    .D2T2   B9:B8,*B31        ; |128| 

           ADD     .L1X    A5,B7,A4          ; |130| 
||         SUBU    .L2X    B8,A4,B7:B6       ; |130| 

           ADD     .L1     A4,A7,A3          ; |130| 
||         EXT     .S2     B7,24,24,B16      ; |130| 
||         ADDU    .L2     B4,B6,B7:B6       ; |130| 

           CALL    .S1     __c6xabi_fltllif  ; |130| 
||         ADD     .L2     B7,B5,B5          ; |130| 

           SUB     .L2X    B9,A3,B4          ; |130| 
||         MV      .L1X    B6,A4             ; |130| 

           ADD     .L2     B4,B16,B6         ; |130| 
           ADD     .L2     B5,B6,B4          ; |130| 
           ADDKPC  .S2     $C$RL35,B3,0      ; |130| 
           MV      .L1X    B4,A5             ; |130| 
$C$RL35:   ; CALL OCCURS {__c6xabi_fltllif} {0}  ; |130| 
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
           CALLP   .S2     __c6xabi_fixdlli,B3
$C$RL36:   ; CALL OCCURS {__c6xabi_fixdlli} {0}  ; |130| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 18
           STDW    .D2T2   B13:B12,*+B10(16) ; |114| 

           ADDAD   .D2     B10,1,B11
||         MV      .L2     B12,B4            ; |114| 

           STDW    .D2T1   A5:A4,*B11        ; |130| 
||         MVC     .S2     B4,TSCL           ; |115| 

           MVC     .S2     TSCL,B4           ; |116| 
           MVC     .S2     TSCH,B5           ; |116| 
           MV      .L1     A11,A12           ; |116| 

           STDW    .D1T2   B5:B4,*A12        ; |116| 
||         MVC     .S2     TSCL,B6           ; |117| 

           MVC     .S2     TSCH,B8           ; |117| 

           SUBU    .L2     B6,B4,B7:B6       ; |117| 
||         MVKL    .S2     t_offset,B31

           SUB     .L2     B8,B5,B4          ; |117| 
||         EXT     .S2     B7,24,24,B5       ; |117| 

           ADD     .L2     B4,B5,B7          ; |117| 
||         MVKH    .S2     t_offset,B31

           STDW    .D2T2   B7:B6,*B31        ; |117| 
           LDW     .D1T1   *A14,A3           ; |201| 
           MV      .L1X    B13,A15
           MVK     .S2     0x80,B30
           LDW     .D2T1   *+SP(24),A11      ; |117| 
           STW     .D2T2   B30,*+SP(12)      ; |117| 

           CALL    .S1     rsqrtsp_c         ; |201| 
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
$C$RL37:   ; CALL OCCURS {rsqrtsp_c} {0}     ; |201| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 18
           MV      .L2X    A11,B4            ; |201| 
           LDW     .D2T2   *B4,B4            ; |201| 
           STW     .D2T1   A11,*+SP(16)      ; |201| 
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

   [ A0]   CALL    .S1     rsqrtsp_c         ; |201| 
||         ADD     .L1     A15,A3,A3         ; |201| 

           ; BRANCHCC OCCURS {$C$L15}        ; |200| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 17
           MVC     .S2     TSCL,B6           ; |128| 
           MVC     .S2     TSCH,B7           ; |128| 

           MVKL    .S2     t_offset,B4
||         MV      .L1     A12,A11           ; |128| 
||         MV      .L2     B10,B31           ; |130| 

           MVKH    .S2     t_offset,B4
||         LDDW    .D1T1   *A11,A5:A4        ; |130| 

           LDDW    .D2T2   *B4,B9:B8         ; |130| 
           LDDW    .D2T2   *+B31(16),B17:B16 ; |130| 
           MVKL    .S2     t_stop,B30
           MVKH    .S2     t_stop,B30
           STDW    .D2T2   B7:B6,*B30        ; |128| 
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
           MV      .L1X    B10,A15           ; |130| 

           MV      .L1X    B4,A5             ; |130| 
||         ADDKPC  .S2     $C$RL38,B3,0      ; |130| 

$C$RL38:   ; CALL OCCURS {__c6xabi_fltllif} {0}  ; |130| 
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
           CALLP   .S2     __c6xabi_fixdlli,B3
$C$RL39:   ; CALL OCCURS {__c6xabi_fixdlli} {0}  ; |130| 

           ADDAD   .D2     B11,1,B10
||         MV      .L2X    A15,B4

           MV      .L2     B12,B31           ; |114| 
||         STDW    .D2T2   B13:B12,*+B4(32)  ; |114| 

           STDW    .D2T1   A5:A4,*B10        ; |130| 
||         MVC     .S2     B31,TSCL          ; |115| 

           MVC     .S2     TSCL,B4           ; |116| 
           MVC     .S2     TSCH,B5           ; |116| 

           STDW    .D1T2   B5:B4,*A11        ; |116| 
||         MVC     .S2     TSCL,B6           ; |117| 

           MVC     .S2     TSCH,B8           ; |117| 

           SUBU    .L2     B6,B4,B7:B6       ; |117| 
||         LDW     .D2T2   *+SP(16),B4       ; |117| 

           MVKL    .S1     t_offset,A3
           MVKH    .S1     t_offset,A3
           EXT     .S2     B7,24,24,B7       ; |117| 
           SUB     .L2     B8,B5,B5          ; |117| 

           LDW     .D2T2   *+B4(8),B4        ; |208| 
||         MV      .L2X    A3,B11            ; |117| 
||         ADD     .S2     B5,B7,B7          ; |117| 

           CALLP   .S2     rsqrtsp_v,B3
||         LDW     .D1T1   *A14,A4           ; |208| 
||         STDW    .D2T2   B7:B6,*B11        ; |117| 
||         MVK     .S1     0x80,A6           ; |208| 

$C$RL40:   ; CALL OCCURS {rsqrtsp_v} {0}     ; |208| 
           MVC     .S2     TSCL,B8           ; |128| 
           MVC     .S2     TSCH,B4           ; |128| 

           LDDW    .D1T1   *A11,A7:A6        ; |130| 
||         LDDW    .D2T2   *B11,B7:B6        ; |130| 

           MVK     .S1     16,A11
           ADD     .L1X    B10,A11,A11
           MVKL    .S1     t_stop,A3

           LDDW    .D1T1   *A11,A17:A16      ; |130| 
||         MVKH    .S1     t_stop,A3

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

           CALLP   .S2     __c6xabi_fltllif,B3
||         ADD     .L1     A3,A5,A5          ; |130| 
||         STDW    .D2T2   B9:B8,*B4         ; |128| 

$C$RL41:   ; CALL OCCURS {__c6xabi_fltllif} {0}  ; |130| 
           ZERO    .L1     A3
           SET     .S1     A3,0x1a,0x1d,A3
           MPYSP   .M1     A3,A4,A3          ; |130| 
           NOP             3
           SPDP    .S1     A3,A5:A4          ; |130| 
           NOP             1
           ADDDP   .L1     A13:A12,A5:A4,A5:A4 ; |130| 
           CALLP   .S2     __c6xabi_fixdlli,B3
$C$RL42:   ; CALL OCCURS {__c6xabi_fixdlli} {0}  ; |130| 
           MVKL    .S2     0x88e368f1,B6

           MVKL    .S1     output,A12
||         MVKL    .S2     0x3ee4f8b5,B7

           MVKH    .S1     output,A12
||         STDW    .D1T1   A5:A4,*A11        ; |130| 
||         MVKH    .S2     0x88e368f1,B6

           LDW     .D1T1   *A12,A4           ; |66| 
||         MVKH    .S2     0x3ee4f8b5,B7

           CALLP   .S2     isequal,B3
||         LDW     .D1T2   *+A12(4),B4       ; |66| 
||         MVK     .S1     0x80,A6           ; |66| 
||         MVK     .L1     0x1,A8            ; |66| 

$C$RL43:   ; CALL OCCURS {isequal} {0}       ; |66| 
           MVKL    .S2     0x3ee4f8b5,B7
           MVKL    .S2     0x88e368f1,B6
           MVKL    .S2     fcn_pass,B10
           MVKH    .S2     0x3ee4f8b5,B7
           MVKH    .S2     0x88e368f1,B6

           MV      .L1     A4,A3             ; |66| 
||         LDW     .D1T1   *A12,A4           ; |67| 
||         MVKH    .S2     fcn_pass,B10

           CALLP   .S2     isequal,B3
||         LDW     .D1T2   *+A12(8),B4       ; |67| 
||         STW     .D2T1   A3,*+B10(4)       ; |66| 
||         MVK     .S1     0x80,A6           ; |67| 
||         MVK     .L1     0x1,A8            ; |67| 

$C$RL44:   ; CALL OCCURS {isequal} {0}       ; |67| 
           MVKL    .S2     0x88e368f1,B6
           MVKL    .S2     0x3ee4f8b5,B7

           MV      .L1     A4,A3             ; |67| 
||         MVKH    .S2     0x88e368f1,B6

           LDW     .D1T2   *+A12(12),B4      ; |68| 
||         MVKH    .S2     0x3ee4f8b5,B7
||         STW     .D2T1   A3,*+B10(8)       ; |67| 

           CALLP   .S2     isequal,B3
||         LDW     .D1T1   *A12,A4           ; |68| 
||         MVK     .S1     0x80,A6           ; |68| 
||         MVK     .L1     0x1,A8            ; |68| 

$C$RL45:   ; CALL OCCURS {isequal} {0}       ; |68| 
           MVKL    .S2     0x3ee4f8b5,B7
           MVKL    .S2     0x88e368f1,B6
           MVKH    .S2     0x3ee4f8b5,B7

           MV      .L2X    A12,B4            ; |68| 
||         STW     .D2T1   A4,*+B10(12)      ; |68| 
||         MVKH    .S2     0x88e368f1,B6

           CALLP   .S2     isequal,B3
||         LDW     .D2T1   *B4,A4            ; |69| 
||         LDW     .D1T2   *+A12(16),B4      ; |69| 
||         MVK     .S1     0x80,A6           ; |69| 
||         MVK     .L1     0x1,A8            ; |69| 

$C$RL46:   ; CALL OCCURS {isequal} {0}       ; |69| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 16
           LDW     .D2T2   *+SP(36),B5       ; |69| 
           MV      .L2X    A4,B4             ; |69| 
           STW     .D2T2   B4,*+B10(16)      ; |69| 
           NOP             2
           LDW     .D2T2   *B5,B0            ; |72| 
           NOP             4

   [!B0]   BNOP    .S1     $C$L16,5          ; |72| 
|| [ B0]   LDW     .D1T1   *A10,A0           ; |72| 
|| [ B0]   ADD     .L1     4,A10,A3

           ; BRANCHCC OCCURS {$C$L16}        ; |72| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 15
   [ A0]   LDW     .D1T1   *A3,A3            ; |72| 
   [!A0]   MV      .L2     B12,B0            ; |72| 
           CMPEQ   .L2     B4,0,B4           ; |72| 
           XOR     .L2     1,B4,B4           ; |72| 
           NOP             1
   [ A0]   CMPEQ   .L1     A3,0,A3           ; |72| 
   [ A0]   XOR     .L1     1,A3,A3           ; |72| 
           NOP             1
   [ A0]   AND     .L2X    B4,A3,B0          ; |72| 
   [ B0]   B       .S1     $C$L17            ; |72| 
   [ B0]   CALL    .S1     print_test_results ; |214| 
           MVK     .L1     0x1,A3            ; |72| 
   [ B0]   MVKL    .S1     all_pass,A4
   [ B0]   MVKH    .S1     all_pass,A4
           NOP             1
           ; BRANCHCC OCCURS {$C$L17}        ; |72| 
;** --------------------------------------------------------------------------*
$C$L16:    
;          EXCLUSIVE CPU CYCLES: 5
           CALL    .S1     print_test_results ; |214| 
           MVKL    .S1     all_pass,A4
           MVKH    .S1     all_pass,A4
           MV      .L1X    B12,A3
           NOP             1
;** --------------------------------------------------------------------------*
$C$L17:    
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
           LDW     .D2T2   *++SP(48),B3      ; |226| 
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
$C$SL1:	.string	"rsqrtSP",0
$C$SL2:	.string	"----------------------------------------",0
$C$SL3:	.string	"----------------------------------------",10,0
;*****************************************************************************
;* UNDEFINED EXTERNAL REFERENCES                                             *
;*****************************************************************************
	.global	printf
	.global	rsqrtf
	.global	rsqrt
	.global	driver_init
	.global	print_profile_results
	.global	print_memory_results
	.global	print_test_results
	.global	gimme_random
	.global	isequal
	.global	rsqrtsp
	.global	rsqrtsp_c
	.global	rsqrtsp_v
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
