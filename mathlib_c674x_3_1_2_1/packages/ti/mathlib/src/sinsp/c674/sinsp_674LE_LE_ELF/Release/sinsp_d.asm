;******************************************************************************
;* TMS320C6x C/C++ Codegen                                          PC v7.4.2 *
;* Date/Time created: Mon May 16 23:58:15 2016                                *
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
	.word	0418cf297h		; a[0] @ 0
	.word	042344956h		; a[1] @ 32
	.word	0c29b829fh		; a[2] @ 64
	.word	0421fcd8bh		; a[3] @ 96
	.word	0c2c42d34h		; a[4] @ 128
	.word	0c21925dch		; a[5] @ 160
	.word	0c296fba2h		; a[6] @ 192
	.word	0c269a74ah		; a[7] @ 224
	.word	0426e4e13h		; a[8] @ 256
	.word	0c22c2aa7h		; a[9] @ 288

;	C:\MATHLIB_Tools\CCSV5_5_0\ccsv5\tools\compiler\c6000_7.4.2\bin\opt6x.exe C:\\Users\\gtbldadm\\AppData\\Local\\Temp\\007885 C:\\Users\\gtbldadm\\AppData\\Local\\Temp\\007887 
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
;*   Local Frame Size  : 8 Args + 56 Auto + 56 Save = 120 byte                *
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

           STW     .D2T2   B3,*SP--(72)      ; |92| 
||         CALLP   .S2     driver_init,B3
||         MVKH    .S1     $C$SL1+0,A4

$C$RL0:    ; CALL OCCURS {driver_init} {0}   ; |100| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 3

           MVK     .L2     0xa,B4
||         MVKL    .S1     a,A12

           MVKH    .S1     a,A12
||         MVKL    .S2     output,B11

           CALL    .S1     sinf              ; |109| 
||         MV      .L1     A12,A13
||         MV      .D1X    B4,A11
||         MVKH    .S2     output,B11
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
$C$RL1:    ; CALL OCCURS {sinf} {0}          ; |109| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 7

           LDW     .D2T2   *B11,B4           ; |109| 
||         SUB     .L1     A11,1,A0          ; |108| 
||         SUB     .S1     A11,1,A11         ; |108| 

   [ A0]   BNOP    .S1     $C$L1,3           ; |108| 
|| [!A0]   MVK     .L2     0xa,B5

           ADD     .L2     B10,B4,B4         ; |109| 
||         ADD     .S2     4,B10,B10         ; |108| 

   [ A0]   CALL    .S1     sinf              ; |109| 
||         STW     .D2T1   A4,*B4            ; |109| 
|| [!A0]   ADD     .L2     4,B11,B4

           ; BRANCHCC OCCURS {$C$L1}         ; |108| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 1

           CALL    .S1     sinsp             ; |112| 
||         ZERO    .L2     B10
||         MV      .L1X    B5,A11
||         MV      .D1     A12,A10
||         STW     .D2T2   B4,*+SP(44)

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L2:    
;          EXCLUSIVE CPU CYCLES: 5
           LDW     .D1T1   *A12++,A4         ; |112| 
           ADDKPC  .S2     $C$RL2,B3,3       ; |112| 
$C$RL2:    ; CALL OCCURS {sinsp} {0}         ; |112| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 12
           LDW     .D2T2   *+SP(44),B4       ; |112| 
           SUB     .L1     A11,1,A0          ; |111| 
           SUB     .L1     A11,1,A11         ; |111| 
           NOP             2
           LDW     .D2T2   *B4,B4            ; |112| 
   [ A0]   BNOP    .S1     $C$L2,3           ; |111| 

           ADD     .L2     B10,B4,B4         ; |112| 
||         ADD     .S2     4,B10,B10         ; |111| 

   [ A0]   CALL    .S1     sinsp             ; |112| 
||         STW     .D2T1   A4,*B4            ; |112| 

           ; BRANCHCC OCCURS {$C$L2}         ; |111| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 7
           LDW     .D2T2   *+SP(44),B4
           MVK     .L2     0xa,B5
           ZERO    .L2     B10
           MV      .L1     A10,A12
           MV      .L1X    B5,A11
           ADD     .L2     4,B4,B4

           STW     .D2T2   B4,*+SP(48)
||         CALL    .S1     sinsp_c           ; |115| 

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L3:    
;          EXCLUSIVE CPU CYCLES: 5
           LDW     .D1T1   *A12++,A4         ; |115| 
           ADDKPC  .S2     $C$RL3,B3,3       ; |115| 
$C$RL3:    ; CALL OCCURS {sinsp_c} {0}       ; |115| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 12
           LDW     .D2T2   *+SP(48),B4       ; |115| 
           SUB     .L1     A11,1,A0          ; |114| 
           SUB     .L1     A11,1,A11         ; |114| 
           NOP             2
           LDW     .D2T2   *B4,B4            ; |115| 
   [ A0]   BNOP    .S1     $C$L3,3           ; |114| 

           ADD     .L2     B10,B4,B4         ; |115| 
||         ADD     .S2     4,B10,B10         ; |114| 

   [ A0]   CALL    .S1     sinsp_c           ; |115| 
||         STW     .D2T1   A4,*B4            ; |115| 

           ; BRANCHCC OCCURS {$C$L3}         ; |114| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 12

           LDW     .D2T2   *+SP(48),B4
||         MVKL    .S1     0xbe2aaaa4,A4
||         ZERO    .L1     A5
||         MVKL    .S2     0x3a7daa22,B8
||         ZERO    .D1     A13
||         ZERO    .L2     B5

           MVKL    .S1     0xb94fb222,A3
||         ZERO    .L1     A14
||         MVKH    .S2     0x3a7daa22,B8
||         MVK     .D1     9,A0
||         ZERO    .L2     B24

           MVKH    .S1     0xbe2aaaa4,A4
||         MVKL    .S2     0x3ea2f983,B31
||         STW     .D2T2   B8,*+SP(12)

           MVKH    .S1     0xb94fb222,A3
||         MVKL    .S2     0x3c08873e,B6

           MVKH    .S1     0xbf800000,A5
||         MVKL    .S2     0x362e9c5b,B7
||         MV      .L1X    B8,A4
||         MV      .L2X    A4,B19

           MVKH    .S1     0x40490000,A13
||         MVKH    .S2     0x3ea2f983,B31
||         ADD     .L2     4,B4,B10
||         MV      .D2X    A3,B17

           MVKH    .S1     0x49800000,A14
||         MVKH    .S2     0x3c08873e,B6
||         LDW     .D2T2   *B10,B9
||         MV      .L2X    A5,B20

           MVKH    .S2     0x362e9c5b,B7
||         STW     .D2T1   A5,*+SP(20)
||         MV      .L2X    A13,B22

           SET     .S2     B5,0x17,0x1d,B5
||         STW     .D2T2   B6,*+SP(24)
||         MV      .L2X    A14,B23

           STW     .D2T2   B7,*+SP(28)
||         DINT                              ; interrupts off
||         MV      .L2X    A10,B8

           MV      .L2     B7,B16
||         MV      .S2     B6,B18
||         STW     .D2T2   B5,*+SP(16)

           MV      .L2     B5,B21
||         MV      .S2     B31,B25

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*
;*      Loop found in file               : C:/nightlybuilds/mathlib/ti/mathlib/src/sinsp/sinsp_d.c
;*      Loop source line                 : 117
;*      Loop opening brace source line   : 117
;*      Loop closing brace source line   : 119
;*      Known Minimum Trip Count         : 10                    
;*      Known Maximum Trip Count         : 10                    
;*      Known Max Trip Count Factor      : 10
;*      Loop Carried Dependency Bound(^) : 77
;*      Unpartitioned Resource Bound     : 5
;*      Partitioned Resource Bound(*)    : 9
;*      Resource Partition:
;*                                A-side   B-side
;*      .L units                     0        3     
;*      .S units                     1        3     
;*      .D units                     0        2     
;*      .M units                     1        9*    
;*      .X cross paths               1        1     
;*      .T address paths             0        2     
;*      Long read paths              0        0     
;*      Long write paths             0        0     
;*      Logical  ops (.LS)           0        6     (.L or .S unit)
;*      Addition ops (.LSD)          0        5     (.L or .S or .D unit)
;*      Bound(.L .S .LS)             1        6     
;*      Bound(.L .S .D .LS .LSD)     1        7     
;*
;*      Searching for software pipeline schedule at ...
;*         ii = 77 Schedule found with 1 iterations in parallel
;*
;*      Register Usage Table:
;*          +-----------------------------------------------------------------+
;*          |AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA|BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB|
;*          |00000000001111111111222222222233|00000000001111111111222222222233|
;*          |01234567890123456789012345678901|01234567890123456789012345678901|
;*          |--------------------------------+--------------------------------|
;*       0: |*   *                           |        **      **********      |
;*       1: |*   *                           |        **      **********      |
;*       2: |*   *                           |        **      **********      |
;*       3: |*   *                           |        **      **********      |
;*       4: |*   *                           |        **      **********      |
;*       5: |*   *                           |    *   **      **********      |
;*       6: |*   *                           |    **  **      **********      |
;*       7: |*   *                           |*   *   **      **********      |
;*       8: |*   *                           |    *   **      **********      |
;*       9: |*   *                           |    *   **      **********      |
;*      10: |*   *                           |    *   **      **********      |
;*      11: |*   *                           |    *   **      **********      |
;*      12: |*   *                           |    **  **      **********      |
;*      13: |*   *                           |    *   **      **********      |
;*      14: |*   *                           |    *   **      **********      |
;*      15: |*   *                           |    *   **      **********      |
;*      16: |*   *                           |    **  **      **********      |
;*      17: |*   *                           |    **  **      **********      |
;*      18: |*   *                           |    *   **      **********      |
;*      19: |*   *                           |    *   **      **********      |
;*      20: |*   *                           |    **  **      **********      |
;*      21: |*   *                           |    *** **      **********      |
;*      22: |*   *                           |    * * **      **********      |
;*      23: |*   *                           |    * * **      **********      |
;*      24: |*   *                           |    *** **      **********      |
;*      25: |*  **                           |      * **      **********      |
;*      26: |*  **                           |      * **      **********      |
;*      27: |*  **                           |      * **      **********      |
;*      28: |*  **                           |    * * **      **********      |
;*      29: |*   *                           |      * **      **********      |
;*      30: |*   *                           |      * **      **********      |
;*      31: |*   *                           |      * **      **********      |
;*      32: |*   *                           |     ** **      **********      |
;*      33: |*   *                           |     ** **      **********      |
;*      34: |*   *                           |     ** **      **********      |
;*      35: |*   *                           |     ** **      **********      |
;*      36: |*   *                           |     *****      **********      |
;*      37: |*   *                           |     *****      **********      |
;*      38: |*   *                           |     *****      **********      |
;*      39: |*   *                           |     *****      **********      |
;*      40: |*   *                           |    ******      **********      |
;*      41: |*   *                           |     *****      **********      |
;*      42: |*   *                           |     *****      **********      |
;*      43: |*   *                           |     *****      **********      |
;*      44: |*   *                           |    ******      **********      |
;*      45: |*   *                           |     *****      **********      |
;*      46: |*   *                           |     *****      **********      |
;*      47: |*   *                           |     *****      **********      |
;*      48: |*   *                           |    ******      **********      |
;*      49: |*   *                           |     *****      **********      |
;*      50: |*   *                           |     *****      **********      |
;*      51: |*   *                           |     *****      **********      |
;*      52: |*   *                           |    ******      **********      |
;*      53: |*   *                           |     *****      **********      |
;*      54: |*   *                           |     *****      **********      |
;*      55: |*   *                           |     *****      **********      |
;*      56: |*   *                           |    ******      **********      |
;*      57: |*   *                           |     *****      **********      |
;*      58: |*   *                           |     *****      **********      |
;*      59: |*   *                           |     *****      **********      |
;*      60: |*   *                           |    ******      **********      |
;*      61: |*   *                           |     ** **      **********      |
;*      62: |*   *                           |     ** **      **********      |
;*      63: |*   *                           |     ** **      **********      |
;*      64: |*   *                           |    *** **      **********      |
;*      65: |*   *                           |     ** **      **********      |
;*      66: |*   *                           |     ** **      **********      |
;*      67: |*   *                           |     ** **      **********      |
;*      68: |*   *                           |    *** **      **********      |
;*      69: |*   *                           |      * **      **********      |
;*      70: |*   *                           |      * **      **********      |
;*      71: |*   *                           |*       **      **********      |
;*      72: |*   *                           |    **  **      **********      |
;*      73: |*   *                           |        **      **********      |
;*      74: |*   *                           |        **      **********      |
;*      75: |*   *                           |        **      **********      |
;*      76: |*   *                           |    *   **      **********      |
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
;*      Total cycles (est.)         : 0 + min_trip_cnt * 77 = 770        
;*----------------------------------------------------------------------------*
;*       SETUP CODE
;*
;*                  SUB             A0,1,A0
;*
;*        SINGLE SCHEDULED ITERATION
;*
;*        $C$C97:
;*   0              LDW     .D2T2   *B8++,B4          ; |82|  ^ 
;*   1              NOP             4
;*   5              ABSSP   .S2     B4,B5             ; |82|  ^ 
;*   6              CMPGTSP .S2     B5,B23,B0         ; |82|  ^ 
;*   7      [ B0]   MV      .L2     B24,B4            ; |82|  ^ 
;*   8              MPYSP   .M2     B25,B4,B5         ; |82|  ^ 
;*   9              NOP             3
;*  12              SPINT   .L2     B5,B5             ; |82|  ^ 
;*  13              NOP             3
;*  16              INTSP   .L2     B5,B5             ; |82|  ^ 
;*     ||           AND     .S2     1,B5,B5           ; |118| 
;*  17              INTSP   .L2     B5,B6             ; |118| 
;*  18              NOP             2
;*  20              MPYSP   .M2     B22,B5,B5         ; |82|  ^ 
;*  21              MPYSP   .M1X    A4,B5,A3          ; |82| 
;*  22              NOP             2
;*  24              SUBSP   .L2     B4,B5,B4          ; |82|  ^ 
;*  25              NOP             3
;*  28              SUBSP   .L2X    B4,A3,B5          ; |82|  ^ 
;*  29              NOP             3
;*  32              MPYSP   .M2     B5,B5,B7          ; |82|  ^ 
;*  33              NOP             3
;*  36              MPYSP   .M2     B16,B7,B4         ; |118|  ^ 
;*  37              NOP             3
;*  40              ADDSP   .L2     B17,B4,B4         ; |118|  ^ 
;*  41              NOP             3
;*  44              MPYSP   .M2     B7,B4,B4          ; |118|  ^ 
;*  45              NOP             3
;*  48              ADDSP   .L2     B18,B4,B4         ; |118|  ^ 
;*  49              NOP             3
;*  52              MPYSP   .M2     B7,B4,B4          ; |118|  ^ 
;*  53              NOP             3
;*  56              ADDSP   .L2     B19,B4,B4         ; |118|  ^ 
;*  57              NOP             3
;*  60              MPYSP   .M2     B7,B4,B4          ; |118|  ^ 
;*  61              NOP             3
;*  64              MPYSP   .M2     B5,B4,B4          ; |118|  ^ 
;*  65              NOP             3
;*  68              ADDSP   .L2     B4,B5,B4          ; |118|  ^ 
;*  69              NOP             1
;*  70              CMPEQSP .S2     B6,B24,B0         ; |118| 
;*  71      [!B0]   MV      .S2     B20,B5            ; |118| 
;*     ||   [ B0]   MV      .D2     B21,B5            ; |118| 
;*     ||   [ A0]   BDEC    .S1     $C$C97,A0         ; |117| 
;*  72              MPYSP   .M2     B5,B4,B4          ; |118|  ^ 
;*  73              NOP             3
;*  76              STW     .D2T2   B4,*B9++          ; |118|  ^ 
;*  77              ; BRANCHCC OCCURS {$C$C97}        ; |117| 
;*----------------------------------------------------------------------------*
$C$L4:    ; PIPED LOOP PROLOG
;** --------------------------------------------------------------------------*
$C$L5:    ; PIPED LOOP KERNEL
;          EXCLUSIVE CPU CYCLES: 77
           LDW     .D2T2   *B8++,B4          ; |82| <0,0>  ^ 
           NOP             4
           ABSSP   .S2     B4,B5             ; |82| <0,5>  ^ 
           CMPGTSP .S2     B5,B23,B0         ; |82| <0,6>  ^ 
   [ B0]   MV      .L2     B24,B4            ; |82| <0,7>  ^ 
           MPYSP   .M2     B25,B4,B5         ; |82| <0,8>  ^ 
           NOP             3
           SPINT   .L2     B5,B5             ; |82| <0,12>  ^ 
           NOP             3

           AND     .S2     1,B5,B5           ; |118| <0,16> 
||         INTSP   .L2     B5,B5             ; |82| <0,16>  ^ 

           INTSP   .L2     B5,B6             ; |118| <0,17> 
           NOP             2
           MPYSP   .M2     B22,B5,B5         ; |82| <0,20>  ^ 
           MPYSP   .M1X    A4,B5,A3          ; |82| <0,21> 
           NOP             2
           SUBSP   .L2     B4,B5,B4          ; |82| <0,24>  ^ 
           NOP             3
           SUBSP   .L2X    B4,A3,B5          ; |82| <0,28>  ^ 
           NOP             3
           MPYSP   .M2     B5,B5,B7          ; |82| <0,32>  ^ 
           NOP             3
           MPYSP   .M2     B16,B7,B4         ; |118| <0,36>  ^ 
           NOP             3
           ADDSP   .L2     B17,B4,B4         ; |118| <0,40>  ^ 
           NOP             3
           MPYSP   .M2     B7,B4,B4          ; |118| <0,44>  ^ 
           NOP             3
           ADDSP   .L2     B18,B4,B4         ; |118| <0,48>  ^ 
           NOP             3
           MPYSP   .M2     B7,B4,B4          ; |118| <0,52>  ^ 
           NOP             3
           ADDSP   .L2     B19,B4,B4         ; |118| <0,56>  ^ 
           NOP             3
           MPYSP   .M2     B7,B4,B4          ; |118| <0,60>  ^ 
           NOP             3
           MPYSP   .M2     B5,B4,B4          ; |118| <0,64>  ^ 
           NOP             3
           ADDSP   .L2     B4,B5,B4          ; |118| <0,68>  ^ 
           NOP             1
           CMPEQSP .S2     B6,B24,B0         ; |118| <0,70> 

   [!B0]   MV      .S2     B20,B5            ; |118| <0,71> 
|| [ B0]   MV      .D2     B21,B5            ; |118| <0,71> 
|| [ A0]   BDEC    .S1     $C$L5,A0          ; |117| <0,71> 

           MPYSP   .M2     B5,B4,B4          ; |118| <0,72>  ^ 
           NOP             3
           STW     .D2T2   B4,*B9++          ; |118| <0,76>  ^ 
;** --------------------------------------------------------------------------*
$C$L6:    ; PIPED LOOP EPILOG
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 11
           STW     .D2T1   A4,*+SP(12)
           STW     .D2T2   B20,*+SP(20)

           MV      .L1X    B22,A13
||         STW     .D2T2   B18,*+SP(24)

           MV      .L1X    B23,A14
||         STW     .D2T2   B16,*+SP(28)

           MV      .L2     B17,B12
||         STW     .D2T2   B21,*+SP(16)
||         MV      .L1X    B24,A11
||         RINT                              ; interrupts on

           CALLP   .S2     sinsp_v,B3
||         LDW     .D2T2   *+B11(16),B4      ; |120| 
||         MV      .L1     A10,A4            ; |120| 
||         MVK     .S1     0xa,A6            ; |120| 
||         MV      .L2     B19,B13
||         MV      .D1X    B25,A15

$C$RL4:    ; CALL OCCURS {sinsp_v} {0}       ; |120| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 48
           MVKL    .S2     0x3f1a36e2,B7
           MVKL    .S2     0xeb1c432d,B6
           MVKH    .S2     0x3f1a36e2,B7

           LDW     .D2T1   *B11,A4           ; |66| 
||         MVKH    .S2     0xeb1c432d,B6

           CALLP   .S2     isequal,B3
||         LDW     .D2T2   *+B11(4),B4       ; |66| 
||         MVK     .L1     0xa,A6            ; |66| 
||         MVK     .S1     0x1,A8            ; |66| 

$C$RL5:    ; CALL OCCURS {isequal} {0}       ; |66| 
           MVKL    .S2     fcn_pass,B6
           MVKL    .S2     0x3f1a36e2,B7
           MVKH    .S2     fcn_pass,B6
           MVKH    .S2     0x3f1a36e2,B7

           STW     .D2T1   A4,*+B6(4)        ; |66| 
||         MVKL    .S2     0xeb1c432d,B6

           LDW     .D2T2   *+B11(8),B4       ; |67| 
||         MVKH    .S2     0xeb1c432d,B6

           CALLP   .S2     isequal,B3
||         LDW     .D2T1   *B11,A4           ; |67| 
||         MVK     .L1     0xa,A6            ; |67| 
||         MVK     .S1     0x1,A8            ; |67| 

$C$RL6:    ; CALL OCCURS {isequal} {0}       ; |67| 
           MVKL    .S2     fcn_pass,B6
           MVKL    .S2     0x3f1a36e2,B7
           MVKH    .S2     fcn_pass,B6
           MVKH    .S2     0x3f1a36e2,B7

           STW     .D2T1   A4,*+B6(8)        ; |67| 
||         MVKL    .S2     0xeb1c432d,B6

           MV      .L2     B11,B5
||         LDW     .D2T2   *+B11(12),B4      ; |68| 
||         MVKH    .S2     0xeb1c432d,B6

           CALLP   .S2     isequal,B3
||         LDW     .D2T1   *B5,A4            ; |68| 
||         MVK     .L1     0xa,A6            ; |68| 
||         MVK     .S1     0x1,A8            ; |68| 

$C$RL7:    ; CALL OCCURS {isequal} {0}       ; |68| 
           MVKL    .S2     fcn_pass,B4
           MVKL    .S2     0x3f1a36e2,B7
           MVKL    .S2     output,B31
           MVKL    .S2     0xeb1c432d,B6
           MVKH    .S2     fcn_pass,B4
           MVKH    .S2     output,B31
           MVKH    .S2     0x3f1a36e2,B7

           ADD     .L1X    4,B10,A10
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
||         MVKH    .S2     fcn_pass,B5

           ADD     .L1     4,A3,A3
           LDW     .D1T1   *A3,A0            ; |72| 
           STW     .D2T1   A4,*+B5(16)       ; |69| 
           ADD     .L2     8,B5,B4
           STW     .D2T2   B4,*+SP(40)       ; |69| 
           STW     .D2T1   A3,*+SP(36)

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
;          EXCLUSIVE CPU CYCLES: 7

           LDW     .D2T2   *+SP(16),B4       ; |136| 
||         MVKL    .S2     a_sc,B8

           LDW     .D2T2   *+SP(20),B5       ; |132| 
||         ZERO    .L2     B7
||         MVK     .S2     -1,B9             ; |137| 
||         MVK     .L1     0x7,A3

           STW     .D2T1   A3,*+SP(32)       ; |134| 
||         MVKH    .S2     a_sc,B8
||         MV      .L2X    A11,B6            ; |132| 
||         ZERO    .L1     A4

           STW     .D2T2   B9,*+B8(24)       ; |137| 
||         MV      .L2     B8,B31            ; |136| 
||         SET     .S1     A4,0x17,0x1e,A4
||         MVKH    .S2     0x80000000,B7
||         ZERO    .L1     A5

           STDW    .D2T2   B7:B6,*B31        ; |132| 
||         MVKH    .S1     0xff800000,A5

           STDW    .D2T1   A5:A4,*+B31(8)    ; |134| 

           STDW    .D2T2   B5:B4,*+B8(16)    ; |136| 
||         MV      .L1X    B8,A12            ; |132| 
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
;          EXCLUSIVE CPU CYCLES: 7
           LDW     .D1T1   *A12,A3           ; |139| 
           CALL    .S1     sin               ; |139| 
           ADDKPC  .S2     $C$RL10,B3,2      ; |139| 
           SPDP    .S1     A3,A5:A4          ; |139| 
           NOP             1
$C$RL10:   ; CALL OCCURS {sin} {0}           ; |139| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 30
           MVKL    .S2     output,B4
           MVKH    .S2     output,B4
           LDW     .D2T2   *B4,B4            ; |139| 
           DPSP    .L1     A5:A4,A3          ; |139| 
           NOP             3
           ADD     .L2     B11,B4,B4         ; |139| 
           STW     .D2T1   A3,*B4            ; |139| 

           CALLP   .S2     sinsp,B3
||         LDW     .D1T1   *A12,A4           ; |140| 

$C$RL11:   ; CALL OCCURS {sinsp} {0}         ; |140| 
           MVKL    .S2     output,B4
           MVKH    .S2     output,B4
           LDW     .D2T2   *+B4(4),B4        ; |140| 
           NOP             4
           ADD     .L2     B11,B4,B4         ; |140| 
           STW     .D2T1   A4,*B4            ; |140| 

           CALLP   .S2     sinsp_c,B3
||         LDW     .D1T1   *A12,A4           ; |141| 

$C$RL12:   ; CALL OCCURS {sinsp_c} {0}       ; |141| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 89
           MVKL    .S2     output,B4
           MVKH    .S2     output,B4
           LDW     .D2T2   *+B4(8),B4        ; |141| 
           LDW     .D2T2   *+SP(12),B31      ; |142| 
           LDW     .D2T2   *+SP(28),B30
           LDW     .D2T2   *+SP(24),B29
           LDW     .D2T1   *+SP(32),A30      ; |142| 
           ADD     .L2     B11,B4,B4         ; |141| 
           STW     .D2T1   A4,*B4            ; |141| 
           LDW     .D1T1   *A12++,A3         ; |67| 
           LDW     .D2T2   *B10,B28          ; |142| 
           SUB     .L1     A30,1,A2          ; |138| 
           STW     .D2T1   A2,*+SP(32)       ; |142| 
           NOP             1
           ABSSP   .S2X    A3,B4             ; |69| 
           CMPGTSP .S2X    B4,A14,B0         ; |69| 
   [ B0]   MV      .L1     A11,A3            ; |70| 
           MPYSP   .M1     A15,A3,A4         ; |75| 
           NOP             3
           SPINT   .L1     A4,A5             ; |75| 
           NOP             3
           INTSP   .L1     A5,A4             ; |75| 
           AND     .L1     1,A5,A31          ; |78| 
           NOP             2
           MPYSP   .M1     A13,A4,A6         ; |142| 
           MPYSP   .M2X    B31,A4,B4         ; |142| 
           NOP             2
           SUBSP   .L1     A3,A6,A3          ; |142| 
           NOP             4
           SUBSP   .L2X    A3,B4,B6          ; |142| 
           INTSP   .L1     A31,A3            ; |78| 
           NOP             2
           MPYSP   .M2     B6,B6,B5          ; |142| 
           CMPEQSP .S1     A3,A11,A0         ; |78| 
           NOP             2
           MPYSP   .M2     B30,B5,B4         ; |142| 
           NOP             3
           ADDSP   .L2     B12,B4,B4         ; |142| 
           NOP             3
           MPYSP   .M2     B5,B4,B7          ; |142| 
           NOP             3
           ADDSP   .L2     B29,B7,B4         ; |142| 
           NOP             3
           MPYSP   .M2     B5,B4,B4          ; |142| 
           NOP             3
           ADDSP   .L2     B13,B4,B4         ; |142| 
           NOP             3
           MPYSP   .M2     B5,B4,B4          ; |142| 
           NOP             3
           MPYSP   .M2     B6,B4,B4          ; |142| 
           NOP             3

           ADDSP   .L2     B4,B6,B5          ; |142| 
|| [!A0]   LDW     .D2T2   *+SP(20),B4       ; |78| 

   [ A0]   LDW     .D2T2   *+SP(16),B4       ; |78| 
           NOP             3
   [ A2]   B       .S1     $C$L8             ; |138| 

           MPYSP   .M2     B4,B5,B4          ; |142| 
||         ADD     .L2     B11,B28,B5        ; |142| 

           ADD     .L2     4,B11,B11         ; |138| 
   [!A2]   MVKL    .S2     output,B11
   [!A2]   MVKH    .S2     output,B11

   [!A2]   CALL    .S1     sinsp_v           ; |144| 
||         STW     .D2T2   B4,*B5            ; |142| 

           ; BRANCHCC OCCURS {$C$L8}         ; |138| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           LDW     .D2T2   *+B11(16),B4      ; |144| 
           MVKL    .S1     a_sc,A4
           MVKH    .S1     a_sc,A4
           MVK     .L1     0x7,A6            ; |144| 
           ADDKPC  .S2     $C$RL13,B3,0      ; |144| 
$C$RL13:   ; CALL OCCURS {sinsp_v} {0}       ; |144| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 46
           MVKL    .S2     0x3f1a36e2,B7
           MVKL    .S2     0xeb1c432d,B6
           MVKH    .S2     0x3f1a36e2,B7

           LDW     .D2T1   *B11,A4           ; |66| 
||         MVKH    .S2     0xeb1c432d,B6

           CALLP   .S2     isequal,B3
||         LDW     .D2T2   *+B11(4),B4       ; |66| 
||         MVK     .L1     0x7,A6            ; |66| 
||         MVK     .S1     0x1,A8            ; |66| 

$C$RL14:   ; CALL OCCURS {isequal} {0}       ; |66| 
           MVKL    .S2     fcn_pass,B5
           MVKL    .S2     0x3f1a36e2,B7
           MVKH    .S2     fcn_pass,B5
           MVKL    .S2     0xeb1c432d,B6

           LDW     .D2T2   *+B11(8),B4       ; |67| 
||         MVKH    .S2     0x3f1a36e2,B7

           STW     .D2T1   A4,*+B5(4)        ; |66| 
||         MVKH    .S2     0xeb1c432d,B6

           CALLP   .S2     isequal,B3
||         LDW     .D2T1   *B11,A4           ; |67| 
||         MVK     .L1     0x7,A6            ; |67| 
||         MVK     .S1     0x1,A8            ; |67| 

$C$RL15:   ; CALL OCCURS {isequal} {0}       ; |67| 
           MVKL    .S2     fcn_pass,B5
           MVKL    .S2     0x3f1a36e2,B7
           MVKL    .S2     0xeb1c432d,B6
           MVKH    .S2     fcn_pass,B5
           MVKH    .S2     0x3f1a36e2,B7

           MV      .L1X    B11,A3            ; |67| 
||         STW     .D2T1   A4,*+B5(8)        ; |67| 
||         MVKH    .S2     0xeb1c432d,B6

           CALLP   .S2     isequal,B3
||         LDW     .D1T1   *A3,A4            ; |68| 
||         LDW     .D2T2   *+B11(12),B4      ; |68| 
||         MVK     .L1     0x7,A6            ; |68| 
||         MVK     .S1     0x1,A8            ; |68| 

$C$RL16:   ; CALL OCCURS {isequal} {0}       ; |68| 
           MVKL    .S2     fcn_pass,B4
           MVKL    .S2     0x3f1a36e2,B7
           MVKL    .S2     0xeb1c432d,B6
           MVKH    .S2     fcn_pass,B4
           MVKH    .S2     0x3f1a36e2,B7

           MV      .L2     B11,B31           ; |69| 
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
           LDW     .D2T1   *+SP(36),A3       ; |69| 
           MVKL    .S2     fcn_pass,B31
           MVKH    .S2     fcn_pass,B31
           STW     .D2T1   A4,*+B31(16)      ; |69| 
           NOP             1

           MV      .L2X    A3,B4             ; |69| 
||         STW     .D2T1   A3,*+SP(52)       ; |69| 

           LDW     .D2T2   *B4,B0            ; |72| 
           LDW     .D2T1   *+SP(40),A3
           NOP             3

   [!B0]   B       .S1     $C$L9             ; |72| 
|| [!B0]   ZERO    .L1     A4                ; |72| 
||         MV      .L2     B0,B1             ; guard predicate rewrite

   [!B0]   CALL    .S2     print_test_results ; |148| 
|| [ B0]   MV      .L2X    A3,B4
||         STW     .D2T1   A3,*+SP(56)       ; |72| 
|| [!B0]   MVKL    .S1     all_pass,A3

   [!B0]   MVKH    .S1     all_pass,A3
|| [ B0]   LDW     .D2T2   *B4,B0            ; |72| 

   [ B1]   ADD     .L2     4,B4,B4
           NOP             2
           ; BRANCHCC OCCURS {$C$L9}         ; |72| 
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
;          EXCLUSIVE CPU CYCLES: 10
           MVKL    .S2     0xc000cccc,B4
           MVKL    .S2     0xcccccccd,B31
           MVKL    .S2     a_ext,B5

           MVKH    .S2     0xc000cccc,B4
||         MVK     .S1     0x81,A3

           STW     .D2T1   A3,*+SP(32)       ; |151| 
||         MVKH    .S2     0xcccccccd,B31

           STW     .D2T2   B4,*+SP(64)       ; |157| 
||         MVKH    .S2     a_ext,B5
||         ZERO    .L1     A4

           STW     .D2T2   B31,*+SP(60)      ; |157| 
||         MV      .L2     B5,B30            ; |151| 
||         SET     .S1     A4,0x17,0x17,A4

           STW     .D2T1   A4,*B30           ; |151| 
||         MV      .L1X    B5,A12            ; |151| 

           LDW     .D1T1   *A12,A3           ; |153| 

           CALL    .S1     sin               ; |153| 
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
$C$L10:    
;          EXCLUSIVE CPU CYCLES: 5
           ADDKPC  .S2     $C$RL19,B3,2      ; |153| 
           SPDP    .S1     A3,A5:A4          ; |153| 
           NOP             1
$C$RL19:   ; CALL OCCURS {sin} {0}           ; |153| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 30
           MVKL    .S2     output,B4
           MVKH    .S2     output,B4
           LDW     .D2T2   *B4,B4            ; |153| 
           DPSP    .L1     A5:A4,A3          ; |153| 
           NOP             3
           ADD     .L2     B11,B4,B4         ; |153| 
           STW     .D2T1   A3,*B4            ; |153| 

           CALLP   .S2     sinsp,B3
||         LDW     .D1T1   *A12,A4           ; |154| 

$C$RL20:   ; CALL OCCURS {sinsp} {0}         ; |154| 
           MVKL    .S2     output,B4
           MVKH    .S2     output,B4
           LDW     .D2T2   *+B4(4),B4        ; |154| 
           NOP             4
           ADD     .L2     B11,B4,B4         ; |154| 
           STW     .D2T1   A4,*B4            ; |154| 

           CALLP   .S2     sinsp_c,B3
||         LDW     .D1T1   *A12,A4           ; |155| 

$C$RL21:   ; CALL OCCURS {sinsp_c} {0}       ; |155| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 108
           MVKL    .S2     output,B4
           MVKH    .S2     output,B4
           LDW     .D2T2   *+B4(8),B4        ; |155| 
           MV      .L2X    A4,B5             ; |155| 
           LDW     .D2T2   *+SP(12),B31      ; |156| 
           LDW     .D2T2   *+SP(28),B30
           LDW     .D2T2   *+SP(24),B29
           ADD     .L2     B11,B4,B4         ; |155| 
           STW     .D2T2   B5,*B4            ; |155| 
           LDW     .D1T1   *A12,A3           ; |67| 
           LDW     .D2T2   *B10,B28          ; |156| 
           LDW     .D2T1   *+SP(32),A30
           NOP             2
           ABSSP   .S1     A3,A4             ; |69| 
           CMPGTSP .S1     A4,A14,A0         ; |69| 
   [ A0]   MV      .L1     A11,A3            ; |70| 
           MPYSP   .M1     A15,A3,A4         ; |75| 
           NOP             3
           SPINT   .L1     A4,A5             ; |75| 
           NOP             3
           INTSP   .L1     A5,A4             ; |75| 
           AND     .L1     1,A5,A31          ; |78| 
           NOP             2
           MPYSP   .M1     A13,A4,A6         ; |156| 
           MPYSP   .M2X    B31,A4,B4         ; |156| 
           NOP             2
           SUBSP   .L1     A3,A6,A3          ; |156| 
           NOP             4
           SUBSP   .L2X    A3,B4,B6          ; |156| 
           INTSP   .L1     A31,A3            ; |78| 
           NOP             2
           MPYSP   .M2     B6,B6,B5          ; |156| 
           CMPEQSP .S1     A3,A11,A0         ; |78| 
   [!A0]   LDW     .D2T1   *+SP(20),A3       ; |78| 
   [ A0]   LDW     .D2T1   *+SP(16),A3       ; |78| 
           MPYSP   .M2     B30,B5,B4         ; |156| 
           NOP             3
           ADDSP   .L2     B12,B4,B4         ; |156| 
           NOP             3
           MPYSP   .M2     B5,B4,B7          ; |156| 
           NOP             3
           ADDSP   .L2     B29,B7,B4         ; |156| 
           NOP             3
           MPYSP   .M2     B5,B4,B4          ; |156| 
           NOP             3
           ADDSP   .L2     B13,B4,B4         ; |156| 
           NOP             3
           MPYSP   .M2     B5,B4,B4          ; |156| 
           ADD     .L2     B11,B28,B5        ; |156| 
           ADD     .L2     4,B11,B11         ; |152| 
           NOP             1
           MPYSP   .M2     B6,B4,B4          ; |156| 
           NOP             3
           ADDSP   .L2     B4,B6,B6          ; |156| 
   [!A0]   MV      .L2X    A3,B4             ; |78| 
   [ A0]   MV      .L2X    A3,B4             ; |78| 
           SUB     .L1     A30,1,A0          ; |152| 
           MPYSP   .M2     B4,B6,B4          ; |156| 
   [!A0]   MVKL    .S2     output,B10
   [!A0]   MVKH    .S2     output,B10
           NOP             1
           STW     .D2T2   B4,*B5            ; |156| 
           LDW     .D1T2   *A12,B6           ; |157| 
           LDW     .D2T2   *+SP(60),B4
           LDW     .D2T2   *+SP(64),B5
           NOP             4
           MPYSPDP .M2     B6,B5:B4,B5:B4    ; |157| 
           NOP             6
           DPSP    .L2     B5:B4,B4          ; |157| 
   [ A0]   BNOP    .S1     $C$L10,2          ; |152| 
           STW     .D1T2   B4,*++A12         ; |157| 
   [ A0]   LDW     .D1T1   *A12,A3           ; |153| 

   [ A0]   CALL    .S1     sin               ; |153| 
||         STW     .D2T1   A0,*+SP(32)       ; |157| 

           ; BRANCHCC OCCURS {$C$L10}        ; |152| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 6
           CALL    .S1     sinsp_v           ; |159| 
           LDW     .D2T2   *+B10(16),B4      ; |159| 
           MVKL    .S1     a_ext,A4
           MVKH    .S1     a_ext,A4
           ADDKPC  .S2     $C$RL22,B3,0      ; |159| 
           MVK     .S1     0x81,A6           ; |159| 
$C$RL22:   ; CALL OCCURS {sinsp_v} {0}       ; |159| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 42
           MVKL    .S2     0x3f1a36e2,B7
           MVKL    .S2     0xeb1c432d,B6
           MVKH    .S2     0x3f1a36e2,B7

           LDW     .D2T1   *B10,A4           ; |66| 
||         MVKH    .S2     0xeb1c432d,B6

           CALLP   .S2     isequal,B3
||         LDW     .D2T2   *+B10(4),B4       ; |66| 
||         MVK     .S1     0x81,A6           ; |66| 
||         MVK     .L1     0x1,A8            ; |66| 

$C$RL23:   ; CALL OCCURS {isequal} {0}       ; |66| 
           MVKL    .S2     fcn_pass,B11
           MVKL    .S2     0x3f1a36e2,B7
           MVKH    .S2     fcn_pass,B11
           MVKL    .S2     0xeb1c432d,B6

           LDW     .D2T2   *+B10(8),B4       ; |67| 
||         MVKH    .S2     0x3f1a36e2,B7

           STW     .D2T1   A4,*+B11(4)       ; |66| 
||         MVKH    .S2     0xeb1c432d,B6

           CALLP   .S2     isequal,B3
||         LDW     .D2T1   *B10,A4           ; |67| 
||         MVK     .S1     0x81,A6           ; |67| 
||         MVK     .L1     0x1,A8            ; |67| 

$C$RL24:   ; CALL OCCURS {isequal} {0}       ; |67| 
           MVKL    .S2     0x3f1a36e2,B7
           MVKL    .S2     0xeb1c432d,B6
           MVKH    .S2     0x3f1a36e2,B7

           MV      .L1X    B10,A3            ; |67| 
||         STW     .D2T1   A4,*+B11(8)       ; |67| 
||         MVKH    .S2     0xeb1c432d,B6

           CALLP   .S2     isequal,B3
||         LDW     .D1T1   *A3,A4            ; |68| 
||         LDW     .D2T2   *+B10(12),B4      ; |68| 
||         MVK     .S1     0x81,A6           ; |68| 
||         MVK     .L1     0x1,A8            ; |68| 

$C$RL25:   ; CALL OCCURS {isequal} {0}       ; |68| 
           MVKL    .S2     0x3f1a36e2,B7
           MVKL    .S2     0xeb1c432d,B6
           MVKH    .S2     0x3f1a36e2,B7

           MV      .L1     A10,A3            ; |68| 
||         MV      .L2     B10,B4            ; |68| 
||         STW     .D2T1   A4,*+B11(12)      ; |68| 
||         MVKH    .S2     0xeb1c432d,B6

           CALLP   .S2     isequal,B3
||         LDW     .D2T1   *B4,A4            ; |69| 
||         LDW     .D1T2   *A3,B4            ; |69| 
||         MVK     .S1     0x81,A6           ; |69| 
||         MVK     .L1     0x1,A8            ; |69| 

$C$RL26:   ; CALL OCCURS {isequal} {0}       ; |69| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 16
           LDW     .D2T1   *+SP(36),A3       ; |69| 
           LDW     .D2T2   *+SP(40),B4
           STW     .D2T1   A4,*+B11(16)      ; |69| 
           NOP             2
           LDW     .D1T1   *A3,A0            ; |72| 
           NOP             4

   [!A0]   B       .S1     $C$L11            ; |72| 
|| [ A0]   LDW     .D2T2   *B4,B0            ; |72| 

   [!A0]   CALL    .S1     print_test_results ; |163| 
   [ A0]   ADD     .L2     4,B4,B4
   [!A0]   ZERO    .L1     A3                ; |72| 
   [!A0]   MVKL    .S1     all_pass,A4
   [!A0]   MVKH    .S1     all_pass,A4
           ; BRANCHCC OCCURS {$C$L11}        ; |72| 
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
           CALL    .S1     print_test_results ; |163| 
           MVKL    .S1     all_pass,A4
           MVKH    .S1     all_pass,A4
           NOP             2
;** --------------------------------------------------------------------------*
$C$L11:    
;          EXCLUSIVE CPU CYCLES: 1

           STW     .D1T1   A3,*A4            ; |72| 
||         MVK     .L1     0x4,A4            ; |163| 
||         ADDKPC  .S2     $C$RL27,B3,0      ; |163| 

$C$RL27:   ; CALL OCCURS {print_test_results} {0}  ; |163| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 15

           MVKL    .S2     cycle_counts+24,B9
||         ZERO    .L2     B5                ; |114| 
||         ZERO    .D2     B4                ; |114| 

           STW     .D2T2   B4,*+SP(36)       ; |114| 
||         ZERO    .L2     B6                ; |114| 
||         ZERO    .S2     B7                ; |114| 

           MVKH    .S2     cycle_counts+24,B9
||         STW     .D2T2   B5,*+SP(32)       ; |114| 
||         ZERO    .L2     B8                ; |114| 

           MVC     .S2     B8,TSCL           ; |115| 
||         STDW    .D2T2   B7:B6,*B9         ; |114| 

           MVC     .S2     TSCL,B6           ; |116| 
           MVC     .S2     TSCH,B7           ; |116| 
           MVKL    .S1     t_start,A3
           MVKH    .S1     t_start,A3

           MVC     .S2     TSCL,B4           ; |117| 
||         STDW    .D1T2   B7:B6,*A3         ; |116| 

           MVC     .S2     TSCH,B8           ; |117| 

           CALL    .S2     gimme_random      ; |173| 
||         SUBU    .L2     B4,B6,B5:B4       ; |117| 
||         MVKL    .S1     t_offset,A4
||         ZERO    .L1     A5

           EXT     .S2     B5,24,24,B6       ; |117| 
||         MVKH    .S1     0xc2c80000,A5
||         SUB     .L2     B8,B7,B31         ; |117| 

           ADD     .L2     B31,B6,B5         ; |117| 
||         MVKH    .S1     t_offset,A4

           ZERO    .L1     A4
||         STDW    .D1T2   B5:B4,*A4         ; |117| 
||         MV      .L2X    A5,B10
||         MVK     .S1     0x80,A3

           MVKH    .S1     0x43480000,A4
||         MV      .L2     B10,B4            ; |173| 
||         STW     .D2T1   A3,*+SP(40)       ; |117| 
||         ZERO    .L1     A12

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
;          EXCLUSIVE CPU CYCLES: 1
           ADDKPC  .S2     $C$RL28,B3,0      ; |173| 
$C$RL28:   ; CALL OCCURS {gimme_random} {0}  ; |173| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 100
           MVKL    .S2     input,B4
           MVKH    .S2     input,B4
           LDW     .D2T2   *B4,B4            ; |173| 
           NOP             4
           ADD     .L1X    A12,B4,A3         ; |173| 

           STW     .D1T1   A4,*A3            ; |173| 
||         MVC     .S2     TSCL,B6           ; |122| 

           MVC     .S2     TSCH,B7           ; |122| 
           ABSSP   .S1     A4,A3             ; |69| 
           CMPGTSP .S1     A3,A14,A0         ; |69| 
   [ A0]   MV      .L1     A11,A4            ; |70| 
           MPYSP   .M1     A15,A4,A3         ; |75| 
           LDW     .D2T2   *+SP(12),B4       ; |177| 
           LDW     .D2T2   *+SP(28),B31
           LDW     .D2T2   *+SP(24),B30
           SPINT   .L1     A3,A5             ; |75| 
           MVKL    .S1     output+12,A30
           MVKH    .S1     output+12,A30
           MVKL    .S1     t_start,A29
           INTSP   .L1     A5,A3             ; |75| 
           AND     .L1     1,A5,A31          ; |78| 
           MVKH    .S1     t_start,A29
           STDW    .D1T2   B7:B6,*A29
           MPYSP   .M1     A13,A3,A6         ; |177| 
           MPYSP   .M2X    B4,A3,B4          ; |177| 
           INTSP   .L1     A31,A3            ; |78| 
           NOP             1
           SUBSP   .L1     A4,A6,A4          ; |177| 
           NOP             4
           SUBSP   .L2X    A4,B4,B8          ; |177| 
           CMPEQSP .S1     A3,A11,A0         ; |78| 
           LDW     .D1T1   *A30,A4           ; |177| 
           NOP             1
           MPYSP   .M2     B8,B8,B5          ; |177| 
           NOP             3
           MPYSP   .M2     B31,B5,B4         ; |177| 
           ADD     .L1     A12,A4,A3         ; |177| 
           NOP             2
           ADDSP   .L2     B12,B4,B4         ; |177| 
           NOP             3
           MPYSP   .M2     B5,B4,B9          ; |177| 
           NOP             3
           ADDSP   .L2     B30,B9,B4         ; |177| 
           NOP             3
           MPYSP   .M2     B5,B4,B4          ; |177| 
           NOP             3
           ADDSP   .L2     B13,B4,B4         ; |177| 
           NOP             3
           MPYSP   .M2     B5,B4,B4          ; |177| 
           NOP             3
           MPYSP   .M2     B8,B4,B4          ; |177| 
           NOP             3

           ADDSP   .L2     B4,B8,B5          ; |177| 
|| [!A0]   LDW     .D2T2   *+SP(20),B4       ; |78| 

   [ A0]   LDW     .D2T2   *+SP(16),B4       ; |78| 
           NOP             4
           MPYSP   .M2     B4,B5,B4          ; |177| 
           NOP             3

           STW     .D1T2   B4,*A3            ; |177| 
||         MVC     .S2     TSCL,B4           ; |128| 

           MVC     .S2     TSCH,B5           ; |128| 

           MVKL    .S2     t_offset,B11
||         LDW     .D2T1   *+SP(40),A4       ; |130| 
||         MVKL    .S1     t_stop,A3
||         ADD     .L1     4,A12,A12         ; |171| 

           MVKH    .S2     t_offset,B11
||         MVKH    .S1     t_stop,A3

           LDDW    .D2T2   *B11,B17:B16      ; |130| 
||         MVKL    .S2     cycle_counts+24,B8

           MVKH    .S2     cycle_counts+24,B8
||         STDW    .D1T2   B5:B4,*A3         ; |128| 
||         MVKL    .S1     cycle_counts+24,A3

           LDDW    .D2T2   *B8,B19:B18       ; |130| 
||         MVKH    .S1     cycle_counts+24,A3

           SUB     .L1     A4,1,A0           ; |171| 

   [ A0]   ZERO    .L1     A4
||         STW     .D2T1   A0,*+SP(40)       ; |130| 

           ADDU    .L2     B16,B6,B9:B8      ; |130| 
|| [ A0]   MVKH    .S1     0x43480000,A4

           ADD     .S2     B9,B17,B6         ; |130| 
|| [ A0]   B       .S1     $C$L12            ; |171| 
||         SUBU    .L2     B4,B8,B9:B8       ; |130| 
|| [ A0]   MV      .D2     B10,B4            ; |173| 

   [ A0]   CALL    .S1     gimme_random      ; |173| 
||         ADD     .L2     B6,B7,B6          ; |130| 
||         EXT     .S2     B9,24,24,B9       ; |130| 

           ADDU    .L2     B18,B8,B7:B6      ; |130| 
||         SUB     .S2     B5,B6,B8          ; |130| 

           ADD     .L2     B8,B9,B8          ; |130| 
||         ADD     .S2     B7,B19,B7         ; |130| 

           ADD     .L2     B7,B8,B7          ; |130| 

   [!A0]   CALL    .S1     __c6xabi_fltllif  ; |135| 
||         STDW    .D1T2   B7:B6,*A3         ; |130| 

           ; BRANCHCC OCCURS {$C$L12}        ; |171| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           LDDW    .D1T1   *A3,A5:A4         ; |135| 
           ADDKPC  .S2     $C$RL29,B3,3      ; |135| 
$C$RL29:   ; CALL OCCURS {__c6xabi_fltllif} {0}  ; |135| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 16
           ZERO    .L1     A11
           SET     .S1     A11,0x1a,0x1d,A11
           MPYSP   .M1     A11,A4,A3         ; |135| 
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
           MVKL    .S2     cycle_counts+24,B6
           MVKH    .S2     cycle_counts+24,B6

           STDW    .D2T1   A5:A4,*B6         ; |135| 
||         MV      .L2X    A12,B5

           SUBAW   .D2     B6,6,B10
||         MV      .L2X    A12,B4

           MVC     .S2     B4,TSCL           ; |115| 
||         STDW    .D2T2   B5:B4,*B10        ; |114| 

           MVC     .S2     TSCL,B6           ; |116| 
           MVC     .S2     TSCH,B7           ; |116| 
           MVKL    .S1     t_start,A15
           MVKH    .S1     t_start,A15

           MVC     .S2     TSCL,B4           ; |117| 
||         STDW    .D1T2   B7:B6,*A15        ; |116| 

           MVC     .S2     TSCH,B8           ; |117| 
           SUBU    .L2     B4,B6,B5:B4       ; |117| 

           EXT     .S2     B5,24,24,B6       ; |117| 
||         SUB     .L2     B8,B7,B31         ; |117| 

           ADD     .L2     B31,B6,B5         ; |117| 
||         MVKL    .S1     input,A14
||         MV      .S2     B11,B13           ; |117| 

           STDW    .D2T2   B5:B4,*B13        ; |117| 
||         MVKH    .S1     input,A14
||         MVK     .S2     0x80,B12

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L13:    
;          EXCLUSIVE CPU CYCLES: 11
           LDW     .D1T1   *A14,A3           ; |185| 
           NOP             4

           ADD     .L1     A12,A3,A3         ; |185| 
||         CALL    .S1     sinf              ; |185| 

           LDW     .D1T1   *A3,A4            ; |185| 
           ADDKPC  .S2     $C$RL31,B3,3      ; |185| 
$C$RL31:   ; CALL OCCURS {sinf} {0}          ; |185| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 9

           MVKL    .S2     output,B4
||         SUB     .L1X    B12,1,A0          ; |184| 
||         SUB     .L2     B12,1,B12         ; |184| 

           MVKH    .S2     output,B4
           LDW     .D2T2   *B4,B4            ; |185| 
   [ A0]   BNOP    .S1     $C$L13,3          ; |184| 

           ADD     .L1X    A12,B4,A3         ; |185| 
||         ADD     .S1     4,A12,A12         ; |184| 

           STW     .D1T1   A4,*A3            ; |185| 
           ; BRANCHCC OCCURS {$C$L13}        ; |184| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 18
           MVC     .S2     TSCL,B8           ; |128| 
           MVC     .S2     TSCH,B4           ; |128| 

           LDDW    .D1T1   *A15,A7:A6        ; |130| 
||         LDDW    .D2T2   *B13,B7:B6        ; |130| 

           MVKL    .S2     t_stop,B11
           MV      .L2     B4,B9             ; |128| 
           MVKH    .S2     t_stop,B11
           NOP             1
           ADDU    .L1X    B6,A6,A5:A4       ; |130| 

           ADD     .L1X    A5,B7,A31         ; |130| 
||         LDDW    .D2T2   *B10,B7:B6        ; |130| 
||         MV      .S1     A4,A3             ; |130| 

           STDW    .D2T2   B9:B8,*B11        ; |128| 

           SUBU    .L2X    B8,A3,B5:B4       ; |130| 
||         ADD     .L1     A31,A7,A3         ; |130| 

           EXT     .S2     B5,24,24,B16      ; |130| 
           CALL    .S1     __c6xabi_fltllif  ; |130| 

           ADDU    .L2     B6,B4,B5:B4       ; |130| 
||         SUB     .S2X    B9,A3,B6          ; |130| 

           ADD     .L2     B5,B7,B31         ; |130| 
||         ADD     .S2     B6,B16,B5         ; |130| 

           MV      .L1X    B4,A4             ; |130| 
||         ADD     .L2     B31,B5,B4         ; |130| 

           ADDKPC  .S2     $C$RL32,B3,0      ; |130| 
           MV      .L1X    B4,A5             ; |130| 
$C$RL32:   ; CALL OCCURS {__c6xabi_fltllif} {0}  ; |130| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 13
           MPYSP   .M1     A11,A4,A3         ; |130| 
           ZERO    .L1     A12               ; |130| 
           NOP             2
           SPDP    .S1     A3,A5:A4          ; |130| 
           NOP             1
           ADDDP   .L1     A13:A12,A5:A4,A5:A4 ; |130| 
           CALLP   .S2     __c6xabi_fixdlli,B3
$C$RL33:   ; CALL OCCURS {__c6xabi_fixdlli} {0}  ; |130| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 18
           MV      .L2X    A12,B4            ; |130| 

           MV      .L2X    A12,B5            ; |130| 
||         STDW    .D2T1   A5:A4,*B10        ; |130| 

           STDW    .D2T2   B5:B4,*+B10(8)    ; |114| 
||         MVC     .S2     B4,TSCL           ; |115| 

           MVC     .S2     TSCL,B6           ; |116| 
           MVC     .S2     TSCH,B4           ; |116| 
           MV      .L2     B4,B7             ; |116| 

           STDW    .D1T2   B7:B6,*A15        ; |116| 
||         MVC     .S2     TSCL,B4           ; |117| 

           MVC     .S2     TSCH,B8           ; |117| 
           SUBU    .L2     B4,B6,B5:B4       ; |117| 

           EXT     .S2     B5,24,24,B6       ; |117| 
||         SUB     .L2     B8,B7,B31         ; |117| 

           ADD     .L2     B31,B6,B5         ; |117| 
           STDW    .D2T2   B5:B4,*B13        ; |117| 
           LDW     .D1T1   *A14,A3           ; |193| 
           MVK     .S2     0x80,B30
           LDW     .D2T2   *+SP(44),B12      ; |117| 
           STW     .D2T2   B30,*+SP(12)      ; |117| 
           NOP             1

           CALL    .S1     sinsp             ; |193| 
||         ADD     .L1     A12,A3,A3         ; |193| 

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L14:    
;          EXCLUSIVE CPU CYCLES: 5
           LDW     .D1T1   *A3,A4            ; |193| 
           ADDKPC  .S2     $C$RL34,B3,3      ; |193| 
$C$RL34:   ; CALL OCCURS {sinsp} {0}         ; |193| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 17
           LDW     .D2T2   *B12,B4           ; |193| 
           NOP             4

           ADD     .L1X    A12,B4,A3         ; |193| 
||         LDW     .D2T2   *+SP(12),B4       ; |193| 

           ADD     .L1     4,A12,A12         ; |192| 
           STW     .D1T1   A4,*A3            ; |193| 
           NOP             2

           SUB     .L1X    B4,1,A0           ; |192| 
||         SUB     .L2     B4,1,B4           ; |192| 

   [ A0]   BNOP    .S1     $C$L14,4          ; |192| 
|| [ A0]   LDW     .D1T1   *A14,A3           ; |193| 
||         STW     .D2T2   B4,*+SP(12)       ; |193| 

   [ A0]   CALL    .S1     sinsp             ; |193| 
||         ADD     .L1     A12,A3,A3         ; |193| 

           ; BRANCHCC OCCURS {$C$L14}        ; |192| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 18
           MVC     .S2     TSCL,B6           ; |128| 
           MVC     .S2     TSCH,B4           ; |128| 

           LDDW    .D1T1   *A15,A7:A6        ; |130| 
||         LDDW    .D2T2   *B13,B9:B8        ; |130| 

           MV      .L2     B4,B7             ; |128| 
           MV      .L2     B11,B30           ; |130| 
           NOP             2
           ADDU    .L1X    B8,A6,A5:A4       ; |130| 

           ADD     .L1X    A5,B9,A3          ; |130| 
||         LDDW    .D2T2   *+B10(8),B9:B8    ; |130| 

           ADD     .L1     A3,A7,A3          ; |130| 
||         SUBU    .L2X    B6,A4,B5:B4       ; |130| 

           EXT     .S2     B5,24,24,B16      ; |130| 
           SUB     .L2X    B7,A3,B31         ; |130| 
           CALL    .S1     __c6xabi_fltllif  ; |130| 

           ADDU    .L2     B8,B4,B5:B4       ; |130| 
||         ADD     .S2     B31,B16,B8        ; |130| 

           ADD     .L2     B5,B9,B5          ; |130| 

           MV      .L1X    B4,A4             ; |130| 
||         ADD     .L2     B5,B8,B4          ; |130| 

           STDW    .D2T2   B7:B6,*B30        ; |128| 

           ADDKPC  .S2     $C$RL35,B3,0      ; |130| 
||         MV      .L1X    B4,A5             ; |130| 

$C$RL35:   ; CALL OCCURS {__c6xabi_fltllif} {0}  ; |130| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 13
           MPYSP   .M1     A11,A4,A3         ; |130| 
           ZERO    .L1     A12               ; |130| 
           NOP             2
           SPDP    .S1     A3,A5:A4          ; |130| 
           NOP             1
           ADDDP   .L1     A13:A12,A5:A4,A5:A4 ; |130| 
           CALLP   .S2     __c6xabi_fixdlli,B3
$C$RL36:   ; CALL OCCURS {__c6xabi_fixdlli} {0}  ; |130| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 18

           ADDAD   .D2     B10,1,B11
||         MV      .L2X    A12,B5

           MV      .L2X    A12,B4
||         STDW    .D2T1   A5:A4,*B11        ; |130| 

           STDW    .D2T2   B5:B4,*+B10(16)   ; |114| 
||         MVC     .S2     B4,TSCL           ; |115| 

           MVC     .S2     TSCL,B6           ; |116| 
           MVC     .S2     TSCH,B4           ; |116| 
           MV      .L2     B4,B7             ; |116| 

           STDW    .D1T2   B7:B6,*A15        ; |116| 
||         MVC     .S2     TSCL,B4           ; |117| 

           MVC     .S2     TSCH,B8           ; |117| 
           SUBU    .L2     B4,B6,B5:B4       ; |117| 

           EXT     .S2     B5,24,24,B6       ; |117| 
||         SUB     .L2     B8,B7,B31         ; |117| 

           ADD     .L2     B31,B6,B5         ; |117| 
           STDW    .D2T2   B5:B4,*B13        ; |117| 
           LDW     .D1T1   *A14,A3           ; |201| 
           MVK     .S2     0x80,B30
           LDW     .D2T2   *+SP(48),B12      ; |117| 
           STW     .D2T2   B30,*+SP(12)      ; |117| 
           NOP             1

           CALL    .S1     sinsp_c           ; |201| 
||         ADD     .L1     A12,A3,A3         ; |201| 

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L15:    
;          EXCLUSIVE CPU CYCLES: 5
           LDW     .D1T1   *A3,A4            ; |201| 
           ADDKPC  .S2     $C$RL37,B3,3      ; |201| 
$C$RL37:   ; CALL OCCURS {sinsp_c} {0}       ; |201| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 17
           LDW     .D2T2   *B12,B4           ; |201| 
           NOP             4

           ADD     .L1X    A12,B4,A3         ; |201| 
||         LDW     .D2T2   *+SP(12),B4       ; |201| 

           ADD     .L1     4,A12,A12         ; |200| 
           STW     .D1T1   A4,*A3            ; |201| 
           NOP             2

           SUB     .L1X    B4,1,A0           ; |200| 
||         SUB     .L2     B4,1,B4           ; |200| 

   [ A0]   BNOP    .S1     $C$L15,4          ; |200| 
|| [ A0]   LDW     .D1T1   *A14,A3           ; |201| 
||         STW     .D2T2   B4,*+SP(12)       ; |201| 

   [ A0]   CALL    .S1     sinsp_c           ; |201| 
||         ADD     .L1     A12,A3,A3         ; |201| 

           ; BRANCHCC OCCURS {$C$L15}        ; |200| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 15
           MVC     .S2     TSCL,B6           ; |128| 
           MVC     .S2     TSCH,B4           ; |128| 

           LDDW    .D2T2   *B13,B9:B8        ; |130| 
||         LDDW    .D1T1   *A15,A5:A4        ; |130| 

           MVKL    .S2     t_stop,B31
           LDDW    .D2T2   *+B10(16),B17:B16 ; |130| 
           MV      .L2     B4,B7             ; |128| 
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
;          EXCLUSIVE CPU CYCLES: 105
           MPYSP   .M1     A11,A4,A3         ; |130| 
           ZERO    .L1     A12               ; |130| 
           NOP             3
           SPDP    .S2X    A3,B5:B4          ; |130| 
           NOP             2
           ADDDP   .L1X    A13:A12,B5:B4,A5:A4 ; |130| 
           CALLP   .S2     __c6xabi_fixdlli,B3
$C$RL39:   ; CALL OCCURS {__c6xabi_fixdlli} {0}  ; |130| 

           ADDAD   .D2     B11,1,B12
||         MV      .L2X    A12,B5

           MV      .L2X    A12,B4
||         STDW    .D2T1   A5:A4,*B12        ; |130| 

           STDW    .D2T2   B5:B4,*+B10(32)   ; |114| 
||         MVC     .S2     B4,TSCL           ; |115| 

           MVC     .S2     TSCL,B4           ; |116| 
           MVC     .S2     TSCH,B5           ; |116| 

           STDW    .D1T2   B5:B4,*A15        ; |116| 
||         MVC     .S2     TSCL,B6           ; |117| 

           MVC     .S2     TSCH,B8           ; |117| 
           SUBU    .L2     B6,B4,B7:B6       ; |117| 

           SUB     .L2     B8,B5,B4          ; |117| 
||         EXT     .S2     B7,24,24,B5       ; |117| 

           MVKL    .S1     output,A12
||         ADD     .L2     B4,B5,B7          ; |117| 

           MVKH    .S1     output,A12
||         MV      .L2X    A14,B9            ; |208| 
||         STDW    .D2T2   B7:B6,*B13        ; |117| 

           CALLP   .S2     sinsp_v,B3
||         LDW     .D1T2   *+A12(16),B4      ; |208| 
||         LDW     .D2T1   *B9,A4            ; |208| 
||         MVK     .S1     0x80,A6           ; |208| 

$C$RL40:   ; CALL OCCURS {sinsp_v} {0}       ; |208| 
           MVC     .S2     TSCL,B8           ; |128| 
           MVC     .S2     TSCH,B4           ; |128| 

           LDDW    .D1T1   *A15,A17:A16      ; |130| 
||         LDDW    .D2T2   *B13,B7:B6        ; |130| 

           MVK     .S1     16,A14
           ADD     .L1X    B12,A14,A14
           MVKL    .S1     t_stop,A3

           LDDW    .D1T1   *A14,A9:A8        ; |130| 
||         MVKH    .S1     t_stop,A3

           ADDU    .L1X    B6,A16,A5:A4      ; |130| 

           MV      .L2     B4,B9             ; |128| 
||         MV      .S2X    A3,B4             ; |128| 
||         ADD     .L1X    A5,B7,A3          ; |130| 

           SUBU    .L1X    B8,A4,A7:A6       ; |130| 

           ADD     .L1     A3,A17,A3         ; |130| 
||         EXT     .S1     A7,24,24,A7       ; |130| 

           SUB     .S1X    B9,A3,A3          ; |130| 
||         ADDU    .L1     A8,A6,A5:A4       ; |130| 

           ADD     .L1     A5,A9,A3          ; |130| 
||         ADD     .S1     A3,A7,A5          ; |130| 

           CALLP   .S2     __c6xabi_fltllif,B3
||         ADD     .L1     A3,A5,A5          ; |130| 
||         STDW    .D2T2   B9:B8,*B4         ; |128| 

$C$RL41:   ; CALL OCCURS {__c6xabi_fltllif} {0}  ; |130| 
           MPYSP   .M1     A11,A4,A3         ; |130| 
           MV      .L1     A13,A5            ; |130| 
           ZERO    .L1     A4                ; |130| 
           NOP             2
           SPDP    .S1     A3,A7:A6          ; |130| 
           NOP             1
           ADDDP   .L1     A5:A4,A7:A6,A5:A4 ; |130| 
           CALLP   .S2     __c6xabi_fixdlli,B3
$C$RL42:   ; CALL OCCURS {__c6xabi_fixdlli} {0}  ; |130| 
           MVKL    .S2     0x3f1a36e2,B7
           MVKL    .S2     0xeb1c432d,B6

           STDW    .D1T1   A5:A4,*A14        ; |130| 
||         MVKH    .S2     0x3f1a36e2,B7

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
||         MVKL    .S2     0x3f1a36e2,B7

           MVKH    .S2     0xeb1c432d,B6

           MV      .L1     A4,A5             ; |66| 
||         LDW     .D1T1   *A12,A4           ; |67| 
||         MV      .L2X    A3,B10            ; |66| 
||         MVKH    .S2     0x3f1a36e2,B7

           CALLP   .S2     isequal,B3
||         LDW     .D1T2   *+A12(8),B4       ; |67| 
||         STW     .D2T1   A5,*+B10(4)       ; |66| 
||         MVK     .S1     0x80,A6           ; |67| 
||         MVK     .L1     0x1,A8            ; |67| 

$C$RL44:   ; CALL OCCURS {isequal} {0}       ; |67| 
           MVKL    .S2     0x3f1a36e2,B7
           MVKL    .S2     0xeb1c432d,B6
           MVKH    .S2     0x3f1a36e2,B7

           STW     .D2T1   A4,*+B10(8)       ; |67| 
||         LDW     .D1T2   *+A12(12),B4      ; |68| 
||         MVKH    .S2     0xeb1c432d,B6

           CALLP   .S2     isequal,B3
||         LDW     .D1T1   *A12,A4           ; |68| 
||         MVK     .S1     0x80,A6           ; |68| 
||         MVK     .L1     0x1,A8            ; |68| 

$C$RL45:   ; CALL OCCURS {isequal} {0}       ; |68| 
           MVKL    .S2     0x3f1a36e2,B7
           MVKL    .S2     0xeb1c432d,B6
           MVKH    .S2     0x3f1a36e2,B7

           STW     .D2T1   A4,*+B10(12)      ; |68| 
||         LDW     .D1T2   *A10,B4           ; |69| 
||         MVKH    .S2     0xeb1c432d,B6

           CALLP   .S2     isequal,B3
||         LDW     .D1T1   *A12,A4           ; |69| 
||         MVK     .S1     0x80,A6           ; |69| 
||         MVK     .L1     0x1,A8            ; |69| 

$C$RL46:   ; CALL OCCURS {isequal} {0}       ; |69| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 16
           LDW     .D2T2   *+SP(52),B5       ; |69| 
           MV      .L2X    A4,B4             ; |69| 
           STW     .D2T2   B4,*+B10(16)      ; |69| 
           NOP             2
           LDW     .D2T2   *B5,B0            ; |72| 
           LDW     .D2T2   *+SP(56),B5
           NOP             3

   [!B0]   B       .S1     $C$L16            ; |72| 
||         MV      .L2     B0,B1             ; guard predicate rewrite

   [ B0]   LDW     .D2T2   *B5,B0            ; |72| 
   [ B1]   ADD     .L2     4,B5,B5
           NOP             3
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
   [ B0]   CALL    .S1     print_test_results ; |214| 
   [ B0]   MVKL    .S1     all_pass,A4
   [ B0]   MVKH    .S1     all_pass,A4
           NOP             2
           ; BRANCHCC OCCURS {$C$L17}        ; |72| 
;** --------------------------------------------------------------------------*
$C$L16:    
;          EXCLUSIVE CPU CYCLES: 5
           CALL    .S1     print_test_results ; |214| 
           MVKL    .S1     all_pass,A4
           MVKH    .S1     all_pass,A4
           ZERO    .L1     A3                ; |72| 
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
           LDW     .D2T2   *++SP(72),B3      ; |226| 
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
$C$SL1:	.string	"sinSP",0
$C$SL2:	.string	"----------------------------------------",0
$C$SL3:	.string	"----------------------------------------",10,0
;*****************************************************************************
;* UNDEFINED EXTERNAL REFERENCES                                             *
;*****************************************************************************
	.global	printf
	.global	sin
	.global	sinf
	.global	driver_init
	.global	print_profile_results
	.global	print_memory_results
	.global	print_test_results
	.global	gimme_random
	.global	isequal
	.global	sinsp
	.global	sinsp_c
	.global	sinsp_v
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
