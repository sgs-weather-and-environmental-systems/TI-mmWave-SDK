;******************************************************************************
;* TMS320C6x C/C++ Codegen                                          PC v7.4.2 *
;* Date/Time created: Mon May 16 23:53:40 2016                                *
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
	.elfsym	a,SYM_SIZE(80)
a:
	.word	01585a343h,0c04f87b8h		; a[0] @ 0
	.word	08467d92dh,0c055e6edh		; a[1] @ 64
	.word	02fb27533h,0c04cf934h		; a[2] @ 128
	.word	0463065f9h,0404ac024h		; a[3] @ 192
	.word	03bfd0650h,0c0535d11h		; a[4] @ 256
	.word	0ec41dd1ah,04036714ch		; a[5] @ 320
	.word	044127e88h,0404bee82h		; a[6] @ 384
	.word	0d9d3458dh,0404b5cc9h		; a[7] @ 448
	.word	08867422eh,0c0456019h		; a[8] @ 512
	.word	0cb31c21ah,0404f249eh		; a[9] @ 576

;	C:\MATHLIB_Tools\CCSV5_5_0\ccsv5\tools\compiler\c6000_7.4.2\bin\opt6x.exe C:\\Users\\gtbldadm\\AppData\\Local\\Temp\\027524 C:\\Users\\gtbldadm\\AppData\\Local\\Temp\\027526 
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
;*   Local Frame Size  : 8 Args + 48 Auto + 56 Save = 112 byte                *
;******************************************************************************
main:
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 12
           STW     .D2T1   A11,*SP--(8)      ; |93| 
           STW     .D2T1   A10,*SP--(8)      ; |93| 
           STDW    .D2T2   B13:B12,*SP--     ; |93| 
           STDW    .D2T2   B11:B10,*SP--     ; |93| 
           STDW    .D2T1   A15:A14,*SP--     ; |93| 

           STDW    .D2T1   A13:A12,*SP--     ; |93| 
||         MVKL    .S1     $C$SL1+0,A4

           STW     .D2T2   B3,*SP--(64)      ; |93| 
||         CALLP   .S2     driver_init,B3
||         MVKH    .S1     $C$SL1+0,A4

$C$RL0:    ; CALL OCCURS {driver_init} {0}   ; |101| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 8
           MVKL    .S1     a,A13

           MVKH    .S1     a,A13
||         MVKL    .S2     output,B13

           MVK     .L2     0xa,B4
||         MVKH    .S2     output,B13

           MV      .L2X    A13,B10
||         CALL    .S1     __c6xabi_divd     ; |110| 
||         LDW     .D2T1   *B13,A11

           MV      .L1X    B4,A10
||         LDDW    .D2T2   *B10++,B5:B4      ; |110| 

           ZERO    .L1     A5
           SET     .S1     A5,0x14,0x1d,A5
           ZERO    .L1     A4                ; |110| 
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L1:    
;          EXCLUSIVE CPU CYCLES: 1
           ADDKPC  .S2     $C$RL1,B3,0       ; |110| 
$C$RL1:    ; CALL OCCURS {__c6xabi_divd} {0}  ; |110| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 7

           SUB     .L1     A10,1,A0          ; |109| 
||         STDW    .D1T1   A5:A4,*A11++      ; |110| 
||         SUB     .S1     A10,1,A10         ; |109| 

   [ A0]   B       .S1     $C$L1             ; |109| 
|| [ A0]   LDDW    .D2T2   *B10++,B5:B4      ; |110| 
|| [!A0]   MVK     .L2     0xa,B4
|| [ A0]   ZERO    .L1     A5
|| [!A0]   ADD     .S2     4,B13,B5
|| [ A0]   ZERO    .D1     A4                ; |110| 

   [!A0]   MV      .L1     A13,A10
|| [!A0]   MV      .S1     A13,A11
|| [ A0]   CALL    .S2     __c6xabi_divd     ; |110| 

   [!A0]   ZERO    .L2     B10
   [!A0]   STW     .D2T2   B5,*+SP(16)
   [ A0]   SET     .S1     A5,0x14,0x1d,A5
   [!A0]   MV      .L1X    B4,A12
           ; BRANCHCC OCCURS {$C$L1}         ; |109| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 1
           CALL    .S1     recipdp           ; |113| 
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L2:    
;          EXCLUSIVE CPU CYCLES: 5
           LDDW    .D1T1   *A11++,A5:A4      ; |113| 
           ADDKPC  .S2     $C$RL2,B3,3       ; |113| 
$C$RL2:    ; CALL OCCURS {recipdp} {0}       ; |113| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 12
           LDW     .D2T2   *+SP(16),B4       ; |113| 
           SUB     .L1     A12,1,A0          ; |112| 
           SUB     .L1     A12,1,A12         ; |112| 
           NOP             2
           LDW     .D2T2   *B4,B4            ; |113| 
   [ A0]   BNOP    .S1     $C$L2,3           ; |112| 

           ADD     .L2     B10,B4,B4         ; |113| 
||         ADD     .S2     8,B10,B10         ; |112| 

   [ A0]   CALL    .S1     recipdp           ; |113| 
||         STDW    .D2T1   A5:A4,*B4         ; |113| 

           ; BRANCHCC OCCURS {$C$L2}         ; |112| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 8
           LDW     .D2T2   *+SP(16),B4
           ZERO    .L2     B10
           MV      .L1     A10,A11
           NOP             2

           ADD     .L2     4,B4,B5
||         MVK     .S2     0xa,B4

           STW     .D2T2   B5,*+SP(20)

           MV      .L1X    B4,A12
||         CALL    .S1     recipdp_c         ; |116| 

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L3:    
;          EXCLUSIVE CPU CYCLES: 5
           LDDW    .D1T1   *A11++,A5:A4      ; |116| 
           ADDKPC  .S2     $C$RL3,B3,3       ; |116| 
$C$RL3:    ; CALL OCCURS {recipdp_c} {0}     ; |116| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 12
           LDW     .D2T2   *+SP(20),B4       ; |116| 
           SUB     .L1     A12,1,A0          ; |115| 
           SUB     .L1     A12,1,A12         ; |115| 
           NOP             2
           LDW     .D2T2   *B4,B4            ; |116| 
   [ A0]   BNOP    .S1     $C$L3,3           ; |115| 

           ADD     .L2     B10,B4,B4         ; |116| 
||         ADD     .S2     8,B10,B10         ; |115| 

   [ A0]   CALL    .S1     recipdp_c         ; |116| 
|| [!A0]   MVKL    .S2     0x7fefffff,B10
||         STDW    .D2T1   A5:A4,*B4         ; |116| 
|| [!A0]   ZERO    .L2     B4

           ; BRANCHCC OCCURS {$C$L3}         ; |115| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 4

           MVKH    .S2     0x7fefffff,B10
||         MVK     .L1     9,A0
||         LDW     .D2T2   *+B13(12),B25
||         ZERO    .L2     B20               ; |61| 

           SET     .S2     B4,0x1e,0x1e,B4
||         MV      .L2     B10,B19
||         ZERO    .D2     B16               ; |61| 

           MV      .L2     B4,B23
||         MV      .S2     B4,B21            ; |61| 
||         ZERO    .D2     B22               ; |61| 

           DINT                              ; interrupts off
||         MV      .L2X    A10,B24
||         MVK     .D2     0xffffffff,B18    ; |61| 

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*
;*      Loop found in file               : C:/nightlybuilds/mathlib/ti/mathlib/src/recipdp/recipdp_d.c
;*      Loop source line                 : 118
;*      Loop opening brace source line   : 118
;*      Loop closing brace source line   : 120
;*      Known Minimum Trip Count         : 10                    
;*      Known Maximum Trip Count         : 10                    
;*      Known Max Trip Count Factor      : 10
;*      Loop Carried Dependency Bound(^) : 89
;*      Unpartitioned Resource Bound     : 12
;*      Partitioned Resource Bound(*)    : 24
;*      Resource Partition:
;*                                A-side   B-side
;*      .L units                     0        1     
;*      .S units                     1        5     
;*      .D units                     0        2     
;*      .M units                     0       24*    
;*      .X cross paths               0        0     
;*      .T address paths             0        2     
;*      Long read paths              0        0     
;*      Long write paths             0        0     
;*      Logical  ops (.LS)           0        6     (.L or .S unit)
;*      Addition ops (.LSD)          0        1     (.L or .S or .D unit)
;*      Bound(.L .S .LS)             1        6     
;*      Bound(.L .S .D .LS .LSD)     1        5     
;*
;*      Searching for software pipeline schedule at ...
;*         ii = 89 Schedule found with 1 iterations in parallel
;*
;*      Register Usage Table:
;*          +-----------------------------------------------------------------+
;*          |AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA|BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB|
;*          |00000000001111111111222222222233|00000000001111111111222222222233|
;*          |01234567890123456789012345678901|01234567890123456789012345678901|
;*          |--------------------------------+--------------------------------|
;*       0: |*                               |                * ********      |
;*       1: |*                               |                * ********      |
;*       2: |*                               |                * ********      |
;*       3: |*                               |                * ********      |
;*       4: |*                               |                * ********      |
;*       5: |*                               |        **      * ********      |
;*       6: |*                               |        **      * ********      |
;*       7: |*                               |      ****      * ********      |
;*       8: |*                               |      ****      * ********      |
;*       9: |*                               |    ******      * ********      |
;*      10: |*                               |    ******      * ********      |
;*      11: |*                               |*     ****      * ********      |
;*      12: |*                               |*     ****      * ********      |
;*      13: |*                               |*     ****      * ********      |
;*      14: |*                               |*     ****      * ********      |
;*      15: |*                               |*     ****      * ********      |
;*      16: |*                               |*     ****      * ********      |
;*      17: |*                               |*   ******      * ********      |
;*      18: |*                               |*   ******      * ********      |
;*      19: |*                               |*     ****      * ********      |
;*      20: |*                               |*     ****      * ********      |
;*      21: |*                               |*     ****      * ********      |
;*      22: |*                               |*     ****      * ********      |
;*      23: |*                               |*     ****      * ********      |
;*      24: |*                               |*   ******      * ********      |
;*      25: |*                               |*   ******      * ********      |
;*      26: |*                               |*   ******      * ********      |
;*      27: |*                               |*   ******      * ********      |
;*      28: |*                               |*       **      * ********      |
;*      29: |*                               |*       **      * ********      |
;*      30: |*                               |*       **      * ********      |
;*      31: |*                               |*       **      * ********      |
;*      32: |*                               |*       **      * ********      |
;*      33: |*                               |*       **      * ********      |
;*      34: |*                               |*     ****      * ********      |
;*      35: |*                               |*     ****      * ********      |
;*      36: |*                               |*     ****      * ********      |
;*      37: |*                               |*     ****      * ********      |
;*      38: |*                               |*     ****      * ********      |
;*      39: |*                               |*     ****      * ********      |
;*      40: |*                               |*     ****      * ********      |
;*      41: |*                               |*     ****      * ********      |
;*      42: |*                               |*     ****      * ********      |
;*      43: |*                               |*     ****      * ********      |
;*      44: |*                               |*   ******      * ********      |
;*      45: |*                               |*   ******      * ********      |
;*      46: |*                               |*     ****      * ********      |
;*      47: |*                               |*     ****      * ********      |
;*      48: |*                               |*     ****      * ********      |
;*      49: |*                               |*     ****      * ********      |
;*      50: |*                               |*     ****      * ********      |
;*      51: |*                               |*   ******      * ********      |
;*      52: |*                               |*   ******      * ********      |
;*      53: |*                               |*   ******      * ********      |
;*      54: |*                               |*   ******      * ********      |
;*      55: |*                               |*       **      * ********      |
;*      56: |*                               |*       **      * ********      |
;*      57: |*                               |*       **      * ********      |
;*      58: |*                               |*       **      * ********      |
;*      59: |*                               |*       **      * ********      |
;*      60: |*                               |*       **      * ********      |
;*      61: |*                               |*   **  **      * ********      |
;*      62: |*                               |*   **  **      * ********      |
;*      63: |*                               |*   **  **      * ********      |
;*      64: |*                               |*   **  **      * ********      |
;*      65: |*                               |*   **          * ********      |
;*      66: |*                               |*   **          * ********      |
;*      67: |*                               |*   **          * ********      |
;*      68: |*                               |*   **          * ********      |
;*      69: |*                               |*   **          * ********      |
;*      70: |*                               |*   **          * ********      |
;*      71: |*                               |*   ****        **********      |
;*      72: |*                               |*   ****        **********      |
;*      73: |*                               |*   **          * ********      |
;*      74: |*                               |*   **          * ********      |
;*      75: |*                               |*   **          * ********      |
;*      76: |*                               |*   **          * ********      |
;*      77: |*                               |*   **          * ********      |
;*      78: |*                               |*   ****        * ********      |
;*      79: |*                               |*   ****        * ********      |
;*      80: |*                               |*   ****        * ********      |
;*      81: |*                               |*   ****        * ********      |
;*      82: |*                               |*               * ********      |
;*      83: |*                               |*               * ********      |
;*      84: |*                               |*               * ********      |
;*      85: |*                               |*               * ********      |
;*      86: |*                               |*               * ********      |
;*      87: |*                               |*               * ********      |
;*      88: |*                               |    **          * ********      |
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
;*      Total cycles (est.)         : 0 + min_trip_cnt * 89 = 890        
;*----------------------------------------------------------------------------*
;*       SETUP CODE
;*
;*                  SUB             A0,1,A0
;*
;*        SINGLE SCHEDULED ITERATION
;*
;*        $C$C85:
;*   0              LDDW    .D2T2   *B24++,B9:B8      ; |61|  ^ 
;*   1              NOP             4
;*   5              RCPDP   .S2     B9:B8,B7:B6       ; |61|  ^ 
;*   6              NOP             1
;*   7              MPYDP   .M2     B7:B6,B9:B8,B5:B4 ; |61|  ^ 
;*     ||           ABSDP   .S2     B9:B8,B5:B4       ; |61| 
;*   8              NOP             1
;*   9              CMPGTDP .S2     B5:B4,B19:B18,B0  ; |61| 
;*  10              NOP             7
;*  17              SUBDP   .L2     B23:B22,B5:B4,B5:B4 ; |61|  ^ 
;*  18              NOP             6
;*  24              MPYDP   .M2     B7:B6,B5:B4,B7:B6 ; |61|  ^ 
;*  25              NOP             9
;*  34              MPYDP   .M2     B7:B6,B9:B8,B5:B4 ; |61|  ^ 
;*  35              NOP             9
;*  44              SUBDP   .L2     B21:B20,B5:B4,B5:B4 ; |61|  ^ 
;*  45              NOP             6
;*  51              MPYDP   .M2     B7:B6,B5:B4,B5:B4 ; |61|  ^ 
;*  52              NOP             9
;*  61              MPYDP   .M2     B5:B4,B9:B8,B7:B6 ; |61|  ^ 
;*  62              NOP             8
;*  70              MV      .L2     B21,B17           ; |61| 
;*  71              SUBDP   .L2     B17:B16,B7:B6,B7:B6 ; |61|  ^ 
;*  72              NOP             6
;*  78      [!B0]   MPYDP   .M2     B5:B4,B7:B6,B5:B4 ; |61|  ^ 
;*  79              NOP             4
;*  83      [ A0]   BDEC    .S1     $C$C85,A0         ; |118| 
;*  84              NOP             3
;*  87      [ B0]   ZERO    .L2     B5:B4             ; |61| 
;*  88              STDW    .D2T2   B5:B4,*B25++      ; |61|  ^ 
;*  89              ; BRANCHCC OCCURS {$C$C85}        ; |118| 
;*----------------------------------------------------------------------------*
$C$L4:    ; PIPED LOOP PROLOG
;** --------------------------------------------------------------------------*
$C$L5:    ; PIPED LOOP KERNEL
;          EXCLUSIVE CPU CYCLES: 89
           LDDW    .D2T2   *B24++,B9:B8      ; |61| <0,0>  ^ 
           NOP             4
           RCPDP   .S2     B9:B8,B7:B6       ; |61| <0,5>  ^ 
           NOP             1

           ABSDP   .S2     B9:B8,B5:B4       ; |61| <0,7> 
||         MPYDP   .M2     B7:B6,B9:B8,B5:B4 ; |61| <0,7>  ^ 

           NOP             1
           CMPGTDP .S2     B5:B4,B19:B18,B0  ; |61| <0,9> 
           NOP             7
           SUBDP   .L2     B23:B22,B5:B4,B5:B4 ; |61| <0,17>  ^ 
           NOP             6
           MPYDP   .M2     B7:B6,B5:B4,B7:B6 ; |61| <0,24>  ^ 
           NOP             9
           MPYDP   .M2     B7:B6,B9:B8,B5:B4 ; |61| <0,34>  ^ 
           NOP             9
           SUBDP   .L2     B21:B20,B5:B4,B5:B4 ; |61| <0,44>  ^ 
           NOP             6
           MPYDP   .M2     B7:B6,B5:B4,B5:B4 ; |61| <0,51>  ^ 
           NOP             9
           MPYDP   .M2     B5:B4,B9:B8,B7:B6 ; |61| <0,61>  ^ 
           NOP             8
           MV      .L2     B21,B17           ; |61| <0,70> 
           SUBDP   .L2     B17:B16,B7:B6,B7:B6 ; |61| <0,71>  ^ 
           NOP             6
   [!B0]   MPYDP   .M2     B5:B4,B7:B6,B5:B4 ; |61| <0,78>  ^ 
           NOP             4
   [ A0]   BDEC    .S1     $C$L5,A0          ; |118| <0,83> 
           NOP             3
   [ B0]   ZERO    .L2     B5:B4             ; |61| <0,87> 
           STDW    .D2T2   B5:B4,*B25++      ; |61| <0,88>  ^ 
;** --------------------------------------------------------------------------*
$C$L6:    ; PIPED LOOP EPILOG
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 7

           MV      .L1X    B13,A11
||         RINT                              ; interrupts on
||         MV      .S1     A10,A4            ; |121| 

           CALLP   .S2     recipdp_v,B3
||         LDW     .D1T2   *+A11(16),B4      ; |121| 
||         MVK     .L1     0xa,A6            ; |121| 
||         MV      .L2     B19,B10
||         MV      .S1X    B21,A14
||         MV      .D2     B23,B12

$C$RL4:    ; CALL OCCURS {recipdp_v} {0}     ; |121| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 48
           MVKL    .S2     0x3ddb7cdf,B7
           MVKL    .S2     0xd9d7bdbb,B6
           MVKH    .S2     0x3ddb7cdf,B7

           LDW     .D1T1   *A11,A4           ; |66| 
||         MVKH    .S2     0xd9d7bdbb,B6

           CALLP   .S2     isequal,B3
||         LDW     .D1T2   *+A11(4),B4       ; |66| 
||         MVK     .L1     0xa,A6            ; |66| 
||         MVK     .S1     0x1,A8            ; |66| 

$C$RL5:    ; CALL OCCURS {isequal} {0}       ; |66| 
           MVKL    .S2     fcn_pass,B4
           MVKL    .S2     0xd9d7bdbb,B6
           MVKL    .S2     0x3ddb7cdf,B7
           MVKH    .S2     fcn_pass,B4
           MVKH    .S2     0xd9d7bdbb,B6

           MV      .L1     A4,A3             ; |66| 
||         LDW     .D1T1   *A11,A4           ; |67| 
||         MVKH    .S2     0x3ddb7cdf,B7

           CALLP   .S2     isequal,B3
||         STW     .D2T1   A3,*+B4(4)        ; |66| 
||         LDW     .D1T2   *+A11(8),B4       ; |67| 
||         MVK     .L1     0xa,A6            ; |67| 
||         MVK     .S1     0x1,A8            ; |67| 

$C$RL6:    ; CALL OCCURS {isequal} {0}       ; |67| 
           MVKL    .S2     fcn_pass,B4
           MVKL    .S2     0xd9d7bdbb,B6
           MVKL    .S2     0x3ddb7cdf,B7
           MVKH    .S2     fcn_pass,B4
           MVKH    .S2     0xd9d7bdbb,B6

           MV      .L1X    B13,A3
||         STW     .D2T1   A4,*+B4(8)        ; |67| 
||         LDW     .D1T2   *+A11(12),B4      ; |68| 
||         MVKH    .S2     0x3ddb7cdf,B7

           CALLP   .S2     isequal,B3
||         LDW     .D1T1   *A3,A4            ; |68| 
||         MVK     .L1     0xa,A6            ; |68| 
||         MVK     .S1     0x1,A8            ; |68| 

$C$RL7:    ; CALL OCCURS {isequal} {0}       ; |68| 
           MVKL    .S2     0xd9d7bdbb,B6

           LDW     .D2T2   *+SP(20),B5
||         MVKL    .S2     fcn_pass,B31

           MVKL    .S2     0x3ddb7cdf,B7
           MVKH    .S2     fcn_pass,B31
           MVKH    .S2     0xd9d7bdbb,B6

           STW     .D2T1   A4,*+B31(12)      ; |68| 
||         MVKH    .S2     0x3ddb7cdf,B7

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
           ADD     .L1     4,A3,A3
           LDW     .D1T1   *A3,A0            ; |72| 
           MVKH    .S2     fcn_pass,B5
           STW     .D2T1   A4,*+B5(16)       ; |69| 
           ADD     .L2     8,B5,B11
           STW     .D2T1   A3,*+SP(24)

   [!A0]   B       .S1     $C$L7             ; |72| 
|| [ A0]   LDW     .D2T2   *B11,B0           ; |72| 

   [!A0]   CALL    .S1     print_test_results ; |125| 
   [!A0]   ZERO    .L1     A3                ; |72| 
   [ A0]   ADD     .L2     4,B11,B4
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
           CALL    .S1     print_test_results ; |125| 
           MVKL    .S1     all_pass,A4
           MVKH    .S1     all_pass,A4
           NOP             2
;** --------------------------------------------------------------------------*
$C$L7:    
;          EXCLUSIVE CPU CYCLES: 1

           STW     .D1T1   A3,*A4            ; |72| 
||         MVK     .L1     0x1,A4            ; |125| 
||         ADDKPC  .S2     $C$RL9,B3,0       ; |125| 

$C$RL9:    ; CALL OCCURS {print_test_results} {0}  ; |125| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 14
           LDW     .D2T2   *+SP(20),B30      ; |132| 
           STW     .D2T2   B12,*+SP(44)      ; |61| 

           STW     .D2T2   B12,*+SP(36)      ; |61| 
||         ZERO    .L1     A31               ; |61| 

           STW     .D2T1   A31,*+SP(40)      ; |133| 
||         MVK     .L2     0x6,B31

           STW     .D2T2   B31,*+SP(12)      ; |135| 
||         MVKL    .S2     a_sc,B4
||         ZERO    .L1     A3                ; |61| 

           STW     .D2T1   A3,*+SP(32)       ; |135| 
||         MVKH    .S2     a_sc,B4
||         ZERO    .S1     A6
||         ZERO    .L1     A5:A4             ; |132| 

           STDW    .D2T1   A5:A4,*B4         ; |132| 
||         SET     .S1     A6,0x14,0x1d,A6
||         ZERO    .L1     A9

           STW     .D2T1   A6,*+SP(28)       ; |136| 
||         MVKH    .S1     0xbff00000,A9
||         ZERO    .L2     B6                ; |135| 
||         ZERO    .S2     B7
||         ZERO    .L1     A8                ; |137| 

           STDW    .D2T1   A9:A8,*+B4(40)    ; |137| 
||         MVKH    .S2     0xfff00000,B7
||         ADD     .L2     1,B10,B9

           STDW    .D2T2   B7:B6,*+B4(24)    ; |135| 
||         ZERO    .L2     B5
||         ZERO    .S2     B8                ; |134| 

           MV      .L1     A6,A5             ; |137| 
||         ZERO    .S1     A4                ; |136| 
||         STDW    .D2T2   B9:B8,*+B4(16)    ; |134| 
||         MVKH    .S2     0x80000000,B5

           ZERO    .L2     B4                ; |133| 
||         STDW    .D2T1   A5:A4,*+B4(32)    ; |136| 
||         MV      .S2     B4,B7             ; |132| 
||         MV      .L1X    B4,A15            ; |132| 

           ADD     .L2     4,B30,B4
||         STDW    .D2T2   B5:B4,*+B7(8)     ; |133| 
||         MV      .L1X    B12,A13           ; |61| 

           STW     .D2T2   B4,*+SP(48)       ; |133| 
||         ZERO    .L2     B12
||         MV      .L1X    B10,A11           ; |63| 
||         MVK     .S1     0xffffffff,A10    ; |63| 
||         ZERO    .D1     A12               ; |61| 

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
           LDDW    .D1T1   *A15,A7:A6        ; |139| 
           CALL    .S1     __c6xabi_divd     ; |139| 
           ZERO    .L1     A5
           SET     .S1     A5,0x14,0x1d,A5
           ADDKPC  .S2     $C$RL10,B3,0      ; |139| 
           MV      .L2X    A7,B5             ; |139| 

           MV      .L1     A12,A4            ; |139| 
||         MV      .L2X    A6,B4             ; |139| 

$C$RL10:   ; CALL OCCURS {__c6xabi_divd} {0}  ; |139| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 26
           LDW     .D2T2   *B13,B4           ; |139| 
           NOP             4
           ADD     .L2     B12,B4,B4         ; |139| 
           STDW    .D2T1   A5:A4,*B4         ; |139| 

           CALLP   .S2     recipdp,B3
||         LDDW    .D1T1   *A15,A5:A4        ; |140| 

$C$RL11:   ; CALL OCCURS {recipdp} {0}       ; |140| 
           LDW     .D2T2   *+B13(4),B4       ; |140| 
           NOP             4
           ADD     .L2     B12,B4,B4         ; |140| 
           STDW    .D2T1   A5:A4,*B4         ; |140| 

           CALLP   .S2     recipdp_c,B3
||         LDDW    .D1T1   *A15,A5:A4        ; |141| 

$C$RL12:   ; CALL OCCURS {recipdp_c} {0}     ; |141| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 97
           LDW     .D2T2   *+B13(8),B4       ; |141| 
           LDW     .D2T2   *+SP(12),B6       ; |64| 
           NOP             3
           ADD     .L2     B12,B4,B4         ; |141| 
           STDW    .D2T1   A5:A4,*B4         ; |141| 
           LDDW    .D1T1   *A15++,A7:A6      ; |61| 
           MV      .L1     A12,A4            ; |61| 
           MV      .L1     A13,A5            ; |61| 
           LDW     .D2T2   *+SP(48),B4
           SUB     .L2     B6,1,B31          ; |138| 
           RCPDP   .S1     A7:A6,A9:A8       ; |61| 
           SUB     .L1X    B6,1,A2           ; |138| 
           MPYDP   .M1     A9:A8,A7:A6,A17:A16 ; |61| 
           LDW     .D2T2   *B4,B5            ; |142| 
           STW     .D2T2   B31,*+SP(12)      ; |142| 
           NOP             7
           SUBDP   .L1     A5:A4,A17:A16,A5:A4 ; |61| 
           ADD     .L2     B12,B5,B5         ; |142| 
           ADD     .L2     8,B12,B12         ; |138| 
           NOP             4
           MPYDP   .M1     A9:A8,A5:A4,A9:A8 ; |61| 
           NOP             9
           MPYDP   .M1     A9:A8,A7:A6,A17:A16 ; |61| 
           MV      .L1     A12,A4            ; |61| 
           MV      .L1     A13,A5            ; |61| 
           NOP             7
           SUBDP   .L1     A5:A4,A17:A16,A5:A4 ; |61| 
           NOP             6
           MPYDP   .M1     A9:A8,A5:A4,A5:A4 ; |61| 
           NOP             9
           MPYDP   .M1     A5:A4,A7:A6,A9:A8 ; |61| 
           NOP             9
           SUBDP   .L1     A13:A12,A9:A8,A9:A8 ; |61| 
           ABSDP   .S1     A7:A6,A7:A6       ; |63| 
           NOP             5
           MPYDP   .M1     A5:A4,A9:A8,A5:A4 ; |61| 
           CMPGTDP .S1     A7:A6,A11:A10,A0  ; |63| 
           NOP             4
   [ A2]   BNOP    .S1     $C$L8,3           ; |138| 
   [ A0]   ZERO    .L1     A5:A4             ; |64| 

   [!A2]   CALL    .S1     recipdp_v         ; |144| 
||         STDW    .D2T1   A5:A4,*B5         ; |142| 

           ; BRANCHCC OCCURS {$C$L8}         ; |138| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           LDW     .D2T2   *+B4(4),B4        ; |144| 
           MVKL    .S1     a_sc,A4
           MVKH    .S1     a_sc,A4
           MVK     .L1     0x6,A6            ; |144| 
           ADDKPC  .S2     $C$RL13,B3,0      ; |144| 
$C$RL13:   ; CALL OCCURS {recipdp_v} {0}     ; |144| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 46
           MVKL    .S2     0x3ddb7cdf,B7
           MVKL    .S2     0xd9d7bdbb,B6
           MVKH    .S2     0x3ddb7cdf,B7

           LDW     .D2T1   *B13,A4           ; |66| 
||         MVKH    .S2     0xd9d7bdbb,B6

           CALLP   .S2     isequal,B3
||         LDW     .D2T2   *+B13(4),B4       ; |66| 
||         MVK     .L1     0x6,A6            ; |66| 
||         MVK     .S1     0x1,A8            ; |66| 

$C$RL14:   ; CALL OCCURS {isequal} {0}       ; |66| 
           MVKL    .S2     fcn_pass,B5
           MVKL    .S2     0x3ddb7cdf,B7
           MVKH    .S2     fcn_pass,B5
           MVKL    .S2     0xd9d7bdbb,B6

           LDW     .D2T2   *+B13(8),B4       ; |67| 
||         MVKH    .S2     0x3ddb7cdf,B7

           STW     .D2T1   A4,*+B5(4)        ; |66| 
||         MVKH    .S2     0xd9d7bdbb,B6

           CALLP   .S2     isequal,B3
||         LDW     .D2T1   *B13,A4           ; |67| 
||         MVK     .L1     0x6,A6            ; |67| 
||         MVK     .S1     0x1,A8            ; |67| 

$C$RL15:   ; CALL OCCURS {isequal} {0}       ; |67| 
           MVKL    .S2     fcn_pass,B5
           MVKL    .S2     0x3ddb7cdf,B7
           MVKL    .S2     0xd9d7bdbb,B6
           MVKH    .S2     fcn_pass,B5

           LDW     .D2T2   *+B13(12),B4      ; |68| 
||         MVKH    .S2     0x3ddb7cdf,B7

           STW     .D2T1   A4,*+B5(8)        ; |67| 
||         MVKH    .S2     0xd9d7bdbb,B6

           CALLP   .S2     isequal,B3
||         LDW     .D2T1   *B13,A4           ; |68| 
||         MVK     .L1     0x6,A6            ; |68| 
||         MVK     .S1     0x1,A8            ; |68| 

$C$RL16:   ; CALL OCCURS {isequal} {0}       ; |68| 
           MVKL    .S2     fcn_pass,B5
           MVKL    .S2     0x3ddb7cdf,B7
           MVKL    .S2     0xd9d7bdbb,B6
           MVKH    .S2     fcn_pass,B5

           MVKL    .S1     output,A3
||         MVKH    .S2     0x3ddb7cdf,B7

           MVKH    .S1     output,A3
||         STW     .D2T1   A4,*+B5(12)       ; |68| 
||         MVKH    .S2     0xd9d7bdbb,B6

           CALLP   .S2     isequal,B3
||         LDW     .D1T1   *A3,A4            ; |69| 
||         LDW     .D2T2   *+B13(16),B4      ; |69| 
||         MVK     .L1     0x6,A6            ; |69| 
||         MVK     .S1     0x1,A8            ; |69| 

$C$RL17:   ; CALL OCCURS {isequal} {0}       ; |69| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 16
           LDW     .D2T1   *+SP(24),A3       ; |69| 
           MVKL    .S2     fcn_pass,B4
           STW     .D2T2   B11,*+SP(36)      ; |72| 
           MVKH    .S2     fcn_pass,B4
           STW     .D2T1   A4,*+B4(16)       ; |69| 
           LDW     .D1T1   *A3,A0            ; |72| 
           STW     .D2T1   A3,*+SP(32)       ; |69| 
           NOP             3

   [!A0]   B       .S1     $C$L9             ; |72| 
|| [ A0]   MV      .L2     B11,B4

   [!A0]   CALL    .S1     print_test_results ; |148| 
|| [ A0]   LDW     .D2T2   *B4,B0            ; |72| 

   [!A0]   MV      .L1     A12,A4
   [!A0]   MVKL    .S1     all_pass,A3
   [ A0]   ADD     .L2     4,B4,B4
   [!A0]   MVKH    .S1     all_pass,A3
           ; BRANCHCC OCCURS {$C$L9}         ; |72| 
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
;          EXCLUSIVE CPU CYCLES: 8
           LDW     .D2T1   *+SP(48),A3       ; |157| 

           STW     .D2T1   A14,*+SP(52)      ; |61| 
||         MVK     .S2     0x777,B31

           STW     .D2T1   A14,*+SP(44)      ; |61| 
||         MVKL    .S2     a_ext,B4

           STW     .D2T2   B31,*+SP(12)      ; |151| 
||         MVKL    .S2     0xc000cccc,B13
||         MV      .L1     A12,A31           ; |61| 

           STW     .D2T1   A31,*+SP(48)      ; |151| 
||         MVKH    .S2     a_ext,B4
||         ZERO    .L1     A5

           STW     .D2T1   A3,*+SP(56)       ; |63| 
||         SET     .S1     A5,0x14,0x14,A5
||         MVKL    .S2     0xcccccccd,B12
||         MV      .L1     A12,A4            ; |61| 

           ZERO    .L1     A5
||         STDW    .D2T1   A5:A4,*B4         ; |151| 
||         MV      .S1X    B4,A15            ; |151| 
||         MVKH    .S2     0xc000cccc,B13
||         MV      .D1     A14,A13           ; |61| 

           LDDW    .D1T1   *A15,A7:A6        ; |153| 
||         SET     .S1     A5,0x14,0x1d,A5
||         MV      .L1     A12,A4            ; |153| 
||         MVKH    .S2     0xcccccccd,B12
||         MV      .L2X    A12,B10

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
;          EXCLUSIVE CPU CYCLES: 6
           CALL    .S1     __c6xabi_divd     ; |153| 
           ADDKPC  .S2     $C$RL19,B3,2      ; |153| 
           MV      .L2X    A7,B5             ; |153| 
           MV      .L2X    A6,B4             ; |153| 
$C$RL19:   ; CALL OCCURS {__c6xabi_divd} {0}  ; |153| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 30
           MVKL    .S2     output,B4
           MVKH    .S2     output,B4
           LDW     .D2T2   *B4,B4            ; |153| 
           NOP             4
           ADD     .L2     B10,B4,B4         ; |153| 
           STDW    .D2T1   A5:A4,*B4         ; |153| 

           CALLP   .S2     recipdp,B3
||         LDDW    .D1T1   *A15,A5:A4        ; |154| 

$C$RL20:   ; CALL OCCURS {recipdp} {0}       ; |154| 
           MVKL    .S2     output,B4
           MVKH    .S2     output,B4
           LDW     .D2T2   *+B4(4),B4        ; |154| 
           NOP             4
           ADD     .L2     B10,B4,B4         ; |154| 
           STDW    .D2T1   A5:A4,*B4         ; |154| 

           CALLP   .S2     recipdp_c,B3
||         LDDW    .D1T1   *A15,A5:A4        ; |155| 

$C$RL21:   ; CALL OCCURS {recipdp_c} {0}     ; |155| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 116
           MVKL    .S2     output,B4
           MVKH    .S2     output,B4
           LDW     .D2T2   *+B4(8),B4        ; |155| 
           LDW     .D2T2   *+SP(56),B7
           LDW     .D2T2   *+SP(12),B6
           NOP             2
           ADD     .L2     B10,B4,B4         ; |155| 
           STDW    .D2T1   A5:A4,*B4         ; |155| 
           LDDW    .D1T1   *A15,A7:A6        ; |61| 
           MV      .L1     A12,A4            ; |61| 
           MV      .L1     A13,A5            ; |61| 
           LDW     .D2T2   *B7,B31           ; |156| 
           SUB     .L2     B6,1,B30          ; |152| 
           RCPDP   .S1     A7:A6,A9:A8       ; |61| 
           SUB     .L1X    B6,1,A2           ; |152| 
           MPYDP   .M1     A9:A8,A7:A6,A17:A16 ; |61| 
           ADD     .L2     B10,B31,B4        ; |156| 
           ADD     .L2     8,B10,B10         ; |152| 
           NOP             7
           SUBDP   .L1     A5:A4,A17:A16,A5:A4 ; |61| 
           NOP             6
           MPYDP   .M1     A9:A8,A5:A4,A9:A8 ; |61| 
           NOP             9
           MPYDP   .M1     A9:A8,A7:A6,A17:A16 ; |61| 
           MV      .L1     A12,A4            ; |61| 
           MV      .L1     A13,A5            ; |61| 
           NOP             7
           SUBDP   .L1     A5:A4,A17:A16,A5:A4 ; |61| 
           NOP             6
           MPYDP   .M1     A9:A8,A5:A4,A5:A4 ; |61| 
           NOP             9
           MPYDP   .M1     A5:A4,A7:A6,A9:A8 ; |61| 
           NOP             9
           SUBDP   .L1     A13:A12,A9:A8,A9:A8 ; |61| 
           ABSDP   .S1     A7:A6,A7:A6       ; |63| 
           NOP             5
           MPYDP   .M1     A5:A4,A9:A8,A5:A4 ; |61| 
           CMPGTDP .S1     A7:A6,A11:A10,A0  ; |63| 
           NOP             8
   [ A0]   ZERO    .L1     A5:A4             ; |64| 
           STDW    .D2T1   A5:A4,*B4         ; |156| 
           LDDW    .D1T1   *A15,A5:A4        ; |157| 
           NOP             4
           MPYDP   .M2X    B13:B12,A5:A4,B5:B4 ; |157| 
           NOP             2
   [ A2]   MV      .L1     A12,A4            ; |153| 
   [ A2]   ZERO    .L1     A5
   [ A2]   SET     .S1     A5,0x14,0x1d,A5
   [ A2]   BNOP    .S1     $C$L10,3          ; |152| 
           STDW    .D1T2   B5:B4,*++A15      ; |157| 

   [!A2]   CALL    .S1     recipdp_v         ; |159| 
|| [ A2]   LDDW    .D1T1   *A15,A7:A6        ; |153| 
||         STW     .D2T2   B30,*+SP(12)      ; |157| 

           ; BRANCHCC OCCURS {$C$L10}        ; |152| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           LDW     .D2T2   *+B7(4),B4        ; |159| 
           MVKL    .S1     a_ext,A4
           MVKH    .S1     a_ext,A4
           MVK     .S1     0x777,A6          ; |159| 
           ADDKPC  .S2     $C$RL22,B3,0      ; |159| 
$C$RL22:   ; CALL OCCURS {recipdp_v} {0}     ; |159| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 44
           MVKL    .S2     output,B10
           MVKL    .S2     0xd9d7bdbb,B6
           MVKL    .S2     0x3ddb7cdf,B7
           MVKH    .S2     output,B10
           MVKH    .S2     0xd9d7bdbb,B6

           LDW     .D2T1   *B10,A4           ; |66| 
||         MVKH    .S2     0x3ddb7cdf,B7

           CALLP   .S2     isequal,B3
||         LDW     .D2T2   *+B10(4),B4       ; |66| 
||         MVK     .S1     0x777,A6          ; |66| 
||         MVK     .L1     0x1,A8            ; |66| 

$C$RL23:   ; CALL OCCURS {isequal} {0}       ; |66| 
           MVKL    .S2     fcn_pass,B12
           MVKH    .S2     fcn_pass,B12
           MVKL    .S2     0xd9d7bdbb,B6
           MVKL    .S2     0x3ddb7cdf,B7

           STW     .D2T1   A4,*+B12(4)       ; |66| 
||         MVKH    .S2     0xd9d7bdbb,B6

           LDW     .D2T2   *+B10(8),B4       ; |67| 
||         MVKH    .S2     0x3ddb7cdf,B7

           CALLP   .S2     isequal,B3
||         LDW     .D2T1   *B10,A4           ; |67| 
||         MVK     .S1     0x777,A6          ; |67| 
||         MVK     .L1     0x1,A8            ; |67| 

$C$RL24:   ; CALL OCCURS {isequal} {0}       ; |67| 
           MVKL    .S2     0xd9d7bdbb,B6
           MVKL    .S2     0x3ddb7cdf,B7

           STW     .D2T1   A4,*+B12(8)       ; |67| 
||         MVKH    .S2     0xd9d7bdbb,B6

           LDW     .D2T2   *+B10(12),B4      ; |68| 
||         MVKH    .S2     0x3ddb7cdf,B7

           CALLP   .S2     isequal,B3
||         LDW     .D2T1   *B10,A4           ; |68| 
||         MVK     .S1     0x777,A6          ; |68| 
||         MVK     .L1     0x1,A8            ; |68| 

$C$RL25:   ; CALL OCCURS {isequal} {0}       ; |68| 
           MVKL    .S2     0x3ddb7cdf,B7
           MVKL    .S2     0xd9d7bdbb,B6
           MVKH    .S2     0x3ddb7cdf,B7

           MV      .L1X    B10,A3            ; |68| 
||         STW     .D2T1   A4,*+B12(12)      ; |68| 
||         MVKH    .S2     0xd9d7bdbb,B6

           CALLP   .S2     isequal,B3
||         LDW     .D2T2   *+B10(16),B4      ; |69| 
||         LDW     .D1T1   *A3,A4            ; |69| 
||         MVK     .S1     0x777,A6          ; |69| 
||         MVK     .L1     0x1,A8            ; |69| 

$C$RL26:   ; CALL OCCURS {isequal} {0}       ; |69| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 16
           LDW     .D2T1   *+SP(24),A3       ; |69| 
           STW     .D2T1   A4,*+B12(16)      ; |69| 
           NOP             3
           LDW     .D1T1   *A3,A0            ; |72| 
           NOP             4

   [!A0]   B       .S1     $C$L11            ; |72| 
|| [ A0]   LDW     .D2T2   *B11,B0           ; |72| 

   [!A0]   CALL    .S1     print_test_results ; |163| 
   [ A0]   ADD     .L2     4,B11,B4
   [!A0]   MV      .L1     A12,A4
   [!A0]   MVKL    .S1     all_pass,A3
   [!A0]   MVKH    .S1     all_pass,A3
           ; BRANCHCC OCCURS {$C$L11}        ; |72| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 10
   [ B0]   LDW     .D2T2   *B4,B4            ; |72| 
           CMPEQ   .L1     A4,0,A3           ; |72| 
           XOR     .L1     1,A3,A3           ; |72| 
   [!B0]   MV      .L1     A12,A0            ; |72| 
           MVK     .L1     0x1,A4            ; |72| 
   [ B0]   CMPEQ   .L2     B4,0,B4           ; |72| 
   [ B0]   XOR     .L2     1,B4,B4           ; |72| 
           NOP             1
   [ B0]   AND     .L1X    A3,B4,A0          ; |72| 
   [!A0]   MV      .L1     A12,A4
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
;          EXCLUSIVE CPU CYCLES: 17
           MV      .L2X    A12,B12           ; |114| 

           MV      .L2X    A12,B13           ; |114| 
||         MVKL    .S1     cycle_counts+24,A3

           MVKH    .S1     cycle_counts+24,A3
||         MV      .L2X    A12,B4            ; |114| 

           MVC     .S2     B4,TSCL           ; |115| 
||         STDW    .D1T2   B13:B12,*A3       ; |114| 

           MVC     .S2     TSCL,B6           ; |116| 
           MVC     .S2     TSCH,B4           ; |116| 
           MVKL    .S1     t_start,A3

           MVKH    .S1     t_start,A3
||         MV      .L2     B4,B7             ; |116| 

           MVC     .S2     TSCL,B4           ; |117| 
||         STDW    .D1T2   B7:B6,*A3         ; |116| 

           MVC     .S2     TSCH,B8           ; |117| 
           SUBU    .L2     B4,B6,B5:B4       ; |117| 

           SUB     .L2     B8,B7,B6          ; |117| 
||         EXT     .S2     B5,24,24,B5       ; |117| 
||         MVKL    .S1     t_offset,A3

           ADD     .L2     B6,B5,B5          ; |117| 
||         MVKH    .S1     t_offset,A3

           MVKL    .S2     input,B4
||         STDW    .D1T2   B5:B4,*A3         ; |117| 

           CALL    .S1     gimme_random      ; |173| 
||         MVKH    .S2     input,B4

           LDW     .D2T2   *B4,B11           ; |173| 
||         ZERO    .L2     B5
||         MV      .L1     A12,A10           ; |117| 

           MV      .L2     B12,B4            ; |173| 
||         MVKH    .S2     0xc0590000,B5
||         MV      .L1X    B13,A4            ; |173| 
||         ZERO    .D1     A5
||         MVK     .S1     0x80,A11

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
           ADDKPC  .S2     $C$RL28,B3,1      ; |173| 
           MVKH    .S1     0x40690000,A5
$C$RL28:   ; CALL OCCURS {gimme_random} {0}  ; |173| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 107
           ADD     .L1X    B11,A10,A3        ; |173| 

           STDW    .D1T1   A5:A4,*A3         ; |173| 
||         MVC     .S2     TSCL,B6           ; |122| 

           MVC     .S2     TSCH,B7           ; |122| 
           RCPDP   .S1     A5:A4,A7:A6       ; |61| 
           MV      .L1X    B13,A16           ; |61| 
           MPYDP   .M1     A7:A6,A5:A4,A9:A8 ; |61| 
           ZERO    .L1     A17
           SET     .S1     A17,0x1e,0x1e,A17
           MV      .L2     B12,B4            ; |61| 
           MV      .L2X    A17,B5            ; |61| 
           MV      .L2     B12,B16           ; |61| 
           MV      .L2X    A17,B17           ; |61| 
           ADD     .L2X    B11,A10,B18       ; |63| 
           MVKL    .S2     0x7fefffff,B19
           MVKH    .S2     0x7fefffff,B19
           SUBDP   .L1     A17:A16,A9:A8,A9:A8 ; |61| 
           MVKL    .S2     t_start,B31
           MVK     .S1     12,A3
           MVKH    .S2     t_start,B31
           ADD     .L1X    B10,A3,A3
           LDW     .D1T1   *A3,A3            ; |177| 
           STDW    .D2T2   B7:B6,*B31
           MPYDP   .M1     A7:A6,A9:A8,A7:A6 ; |61| 
           NOP             9
           MPYDP   .M1     A7:A6,A5:A4,A9:A8 ; |61| 
           ADD     .L1     A10,A3,A3         ; |177| 
           NOP             9
           SUBDP   .L2X    B5:B4,A9:A8,B5:B4 ; |61| 
           NOP             6
           MPYDP   .M2X    A7:A6,B5:B4,B5:B4 ; |61| 
           NOP             9
           MPYDP   .M2X    B5:B4,A5:A4,B9:B8 ; |61| 
           NOP             9
           SUBDP   .L2     B17:B16,B9:B8,B9:B8 ; |61| 
           NOP             6
           MPYDP   .M2     B5:B4,B9:B8,B17:B16 ; |61| 
           LDDW    .D2T2   *B18,B9:B8        ; |63| 
           MVK     .L2     0xffffffff,B18    ; |63| 
           NOP             3
           ABSDP   .S2     B9:B8,B5:B4       ; |63| 
           NOP             1
           CMPGTDP .S2     B5:B4,B19:B18,B0  ; |63| 
           NOP             1
   [ B0]   ZERO    .L2     B17:B16           ; |64| 

           STDW    .D1T2   B17:B16,*A3       ; |177| 
||         MVC     .S2     TSCL,B8           ; |128| 

           MVC     .S2     TSCH,B4           ; |128| 

           MVKL    .S1     t_offset,A3
||         SUB     .L1     A11,1,A0          ; |171| 
||         MV      .L2     B4,B9             ; |128| 
||         ADD     .D1     8,A10,A10         ; |171| 

           MVKH    .S1     t_offset,A3
||         SUB     .L1     A11,1,A11         ; |171| 

           LDDW    .D1T1   *A3,A7:A6         ; |130| 
||         MVKL    .S1     cycle_counts+24,A8

           MVKH    .S1     cycle_counts+24,A8

           MVKL    .S1     t_stop,A31
||         MV      .L1     A8,A12            ; |130| 

           MVKH    .S1     t_stop,A31
           STDW    .D1T2   B9:B8,*A31        ; |128| 
           ADDU    .L1X    A6,B6,A5:A4       ; |130| 

           ADD     .L1     A5,A7,A3          ; |130| 
||         LDDW    .D1T1   *A8,A7:A6         ; |130| 

           ADD     .L1X    A3,B7,A3          ; |130| 
||         SUBU    .L2X    B8,A4,B5:B4       ; |130| 

           EXT     .S2     B5,24,24,B6       ; |130| 

   [ A0]   B       .S1     $C$L12            ; |171| 
||         SUB     .L2X    B9,A3,B5          ; |130| 

           ADD     .L2     B5,B6,B30         ; |130| 
|| [ A0]   ZERO    .S2     B5

           ADDU    .L1X    A6,B4,A5:A4       ; |130| 
|| [ A0]   MVKL    .S2     input,B4

   [ A0]   CALL    .S1     gimme_random      ; |173| 
|| [ A0]   MVKH    .S2     input,B4
||         ADD     .L1     A5,A7,A5          ; |130| 

   [ A0]   LDW     .D2T2   *B4,B11           ; |173| 
||         ADD     .L1X    A5,B30,A5         ; |130| 
|| [ A0]   MV      .L2     B12,B4            ; |173| 
|| [ A0]   MVKH    .S2     0xc0590000,B5

   [!A0]   CALL    .S2     __c6xabi_fltllif  ; |135| 
||         STDW    .D1T1   A5:A4,*A12        ; |130| 
|| [ A0]   ZERO    .L1     A5
|| [ A0]   MV      .S1X    B13,A4            ; |173| 

           ; BRANCHCC OCCURS {$C$L12}        ; |171| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           LDDW    .D1T1   *A12,A5:A4        ; |135| 
           ADDKPC  .S2     $C$RL29,B3,3      ; |135| 
$C$RL29:   ; CALL OCCURS {__c6xabi_fltllif} {0}  ; |135| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 16
           ZERO    .L1     A3
           SET     .S1     A3,0x1a,0x1d,A3
           MPYSP   .M1     A3,A4,A3          ; |135| 
           ZERO    .L1     A11
           SET     .S1     A11,0x15,0x1d,A11
           MV      .L1X    B13,A10           ; |135| 
           SPDP    .S1     A3,A5:A4          ; |135| 
           NOP             2
           ADDDP   .L1     A11:A10,A5:A4,A5:A4 ; |135| 
           CALLP   .S2     __c6xabi_fixdlli,B3
$C$RL30:   ; CALL OCCURS {__c6xabi_fixdlli} {0}  ; |135| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 14

           MVK     .S2     24,B10
||         MV      .L2X    A12,B4

           SUB     .L2X    A12,B10,B10
||         STDW    .D2T1   A5:A4,*B4         ; |135| 
||         MV      .S2     B12,B5            ; |114| 

           MVC     .S2     B5,TSCL           ; |115| 
||         STDW    .D2T2   B13:B12,*B10      ; |114| 

           MVC     .S2     TSCL,B4           ; |116| 
           MVC     .S2     TSCH,B5           ; |116| 
           MV      .L1X    B4,A13            ; |116| 

           MVC     .S2     TSCL,B5           ; |117| 
||         MV      .L1X    B5,A12            ; |116| 

           MVC     .S2     TSCH,B4           ; |117| 

           SUBU    .L2X    B5,A13,B7:B6      ; |117| 
||         MVK     .S2     0x80,B31

           EXT     .S2     B7,24,24,B4       ; |117| 
||         SUB     .L1X    B4,A12,A4         ; |117| 
||         LDW     .D2T1   *+SP(28),A5
||         MVKL    .S1     output,A3

           CALL    .S2     __c6xabi_divd     ; |185| 
||         MVKH    .S1     output,A3
||         STW     .D2T2   B31,*+SP(12)      ; |117| 

           LDDW    .D2T2   *B11++,B5:B4      ; |185| 
||         ADD     .L1X    A4,B4,A15         ; |117| 
||         LDW     .D1T1   *A3,A10

           MV      .L1X    B6,A14            ; |117| 
           MV      .L1X    B13,A4
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L13:    
;          EXCLUSIVE CPU CYCLES: 2
           ADDKPC  .S2     $C$RL31,B3,1      ; |185| 
$C$RL31:   ; CALL OCCURS {__c6xabi_divd} {0}  ; |185| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 12
           LDW     .D2T2   *+SP(12),B4       ; |185| 
           STDW    .D1T1   A5:A4,*A10++      ; |185| 
           NOP             3

           SUB     .L1X    B4,1,A0           ; |184| 
||         SUB     .L2     B4,1,B4           ; |184| 

   [ A0]   B       .S1     $C$L13            ; |184| 
||         STW     .D2T2   B4,*+SP(12)       ; |185| 

   [ A0]   LDDW    .D2T2   *B11++,B5:B4      ; |185| 
   [ A0]   CALL    .S1     __c6xabi_divd     ; |185| 
   [ A0]   LDW     .D2T1   *+SP(28),A5
   [ A0]   MV      .L1X    B13,A4
           NOP             1
           ; BRANCHCC OCCURS {$C$L13}        ; |184| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 11
           MVC     .S2     TSCL,B6           ; |128| 
           MVC     .S2     TSCH,B4           ; |128| 

           MV      .L2     B4,B7             ; |128| 
||         LDDW    .D2T2   *B10,B5:B4        ; |130| 
||         ADDU    .L1     A14,A13,A5:A4     ; |130| 

           ADD     .S1     A5,A15,A3         ; |130| 
||         SUBU    .L1X    B6,A4,A5:A4       ; |130| 

           ADD     .L1     A3,A12,A3         ; |130| 
||         EXT     .S1     A5,24,24,A31      ; |130| 

           CALL    .S1     __c6xabi_fltllif  ; |130| 
||         SUB     .L1X    B7,A3,A3          ; |130| 

           ADD     .L1     A3,A31,A3         ; |130| 

           ADDU    .L2X    B4,A4,B9:B8       ; |130| 
||         MVKL    .S2     t_stop,B4

           ADD     .L2     B9,B5,B5          ; |130| 
||         MVKH    .S2     t_stop,B4

           STDW    .D2T2   B7:B6,*B4         ; |128| 
||         MV      .L1X    B8,A4             ; |130| 

           ADD     .L1X    B5,A3,A5          ; |130| 
||         ADDKPC  .S2     $C$RL32,B3,0      ; |130| 

$C$RL32:   ; CALL OCCURS {__c6xabi_fltllif} {0}  ; |130| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 15
           ZERO    .L1     A3
           SET     .S1     A3,0x1a,0x1d,A3
           MPYSP   .M1     A3,A4,A3          ; |130| 
           MV      .L1X    B13,A10           ; |130| 
           NOP             2
           SPDP    .S1     A3,A5:A4          ; |130| 
           NOP             1
           ADDDP   .L1     A11:A10,A5:A4,A5:A4 ; |130| 
           CALLP   .S2     __c6xabi_fixdlli,B3
$C$RL33:   ; CALL OCCURS {__c6xabi_fixdlli} {0}  ; |130| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 13

           ZERO    .L1     A12
||         STDW    .D2T2   B13:B12,*+B10(8)  ; |114| 
||         MV      .L2     B12,B4            ; |114| 

           MVC     .S2     B4,TSCL           ; |115| 
||         SET     .S1     A12,0x1a,0x1d,A12
||         STDW    .D2T1   A5:A4,*B10        ; |130| 

           MVC     .S2     TSCL,B8           ; |116| 
           MVC     .S2     TSCH,B4           ; |116| 
           MVKL    .S1     t_start,A14

           MVKH    .S1     t_start,A14
||         MV      .L2     B4,B9             ; |116| 

           MVC     .S2     TSCL,B5           ; |117| 
||         STDW    .D1T2   B9:B8,*A14        ; |116| 

           MVC     .S2     TSCH,B4           ; |117| 

           SUBU    .L2     B5,B8,B7:B6       ; |117| 
||         MVKL    .S2     t_offset,B31

           EXT     .S2     B7,24,24,B4       ; |117| 
||         SUB     .L2     B4,B9,B5          ; |117| 

           MVK     .S2     0x80,B4
||         ADD     .L2     B5,B4,B7          ; |117| 

           MVKH    .S2     t_offset,B31
||         LDW     .D2T2   *+SP(16),B11      ; |117| 
||         MVKL    .S1     input,A13

           MV      .L1X    B4,A10            ; |117| 
||         STDW    .D2T2   B7:B6,*B31        ; |117| 
||         MVKH    .S1     input,A13
||         MV      .D1     A10,A15

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L14:    
;          EXCLUSIVE CPU CYCLES: 11
           LDW     .D1T1   *A13,A3           ; |193| 
           NOP             4

           ADD     .L1     A15,A3,A3         ; |193| 
||         CALL    .S1     recipdp           ; |193| 

           LDDW    .D1T1   *A3,A5:A4         ; |193| 
           ADDKPC  .S2     $C$RL34,B3,3      ; |193| 
$C$RL34:   ; CALL OCCURS {recipdp} {0}       ; |193| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 7

           LDW     .D2T2   *B11,B4           ; |193| 
||         SUB     .L1     A10,1,A0          ; |192| 
||         SUB     .S1     A10,1,A10         ; |192| 

   [ A0]   BNOP    .S1     $C$L14,3          ; |192| 

           ADD     .L1X    A15,B4,A3         ; |193| 
||         ADD     .S1     8,A15,A15         ; |192| 

           STDW    .D1T1   A5:A4,*A3         ; |193| 
           ; BRANCHCC OCCURS {$C$L14}        ; |192| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 18
           MVC     .S2     TSCL,B6           ; |128| 
           MVC     .S2     TSCH,B5           ; |128| 

           MVKL    .S2     t_offset,B4
||         LDDW    .D1T1   *A14,A5:A4        ; |130| 

           MVKH    .S2     t_offset,B4
           LDDW    .D2T2   *B4,B9:B8         ; |130| 
           MV      .L2     B5,B7             ; |128| 
           MVKL    .S2     t_stop,B31
           LDDW    .D2T2   *+B10(8),B5:B4    ; |130| 
           MVKH    .S2     t_stop,B31
           ADDU    .L1X    B8,A4,A7:A6       ; |130| 
           ADD     .L1X    A7,B9,A4          ; |130| 

           ADD     .L1     A4,A5,A3          ; |130| 
||         SUBU    .L2X    B6,A6,B9:B8       ; |130| 

           EXT     .S2     B9,24,24,B16      ; |130| 
||         ADDU    .L2     B4,B8,B9:B8       ; |130| 
||         CALL    .S1     __c6xabi_fltllif  ; |130| 

           SUB     .L2X    B7,A3,B4          ; |130| 
||         ADD     .S2     B9,B5,B5          ; |130| 

           MV      .L1X    B8,A4             ; |130| 
||         ADD     .L2     B4,B16,B8         ; |130| 

           ADD     .L2     B5,B8,B4          ; |130| 
           STDW    .D2T2   B7:B6,*B31        ; |128| 

           MV      .L1X    B4,A5             ; |130| 
||         ADDKPC  .S2     $C$RL35,B3,0      ; |130| 

$C$RL35:   ; CALL OCCURS {__c6xabi_fltllif} {0}  ; |130| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 13
           MPYSP   .M1     A12,A4,A3         ; |130| 
           MV      .L1X    B13,A10           ; |130| 
           NOP             2
           SPDP    .S1     A3,A5:A4          ; |130| 
           NOP             1
           ADDDP   .L1     A11:A10,A5:A4,A5:A4 ; |130| 
           CALLP   .S2     __c6xabi_fixdlli,B3
$C$RL36:   ; CALL OCCURS {__c6xabi_fixdlli} {0}  ; |130| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 18
           STDW    .D2T2   B13:B12,*+B10(16) ; |114| 

           ADDAD   .D2     B10,1,B11
||         MV      .L2     B12,B4            ; |114| 

           STDW    .D2T1   A5:A4,*B11        ; |130| 
||         MVC     .S2     B4,TSCL           ; |115| 

           MVC     .S2     TSCL,B8           ; |116| 
           MVC     .S2     TSCH,B4           ; |116| 
           MV      .L2     B4,B9             ; |116| 

           STDW    .D1T2   B9:B8,*A14        ; |116| 
||         MVC     .S2     TSCL,B5           ; |117| 

           MVC     .S2     TSCH,B4           ; |117| 

           SUBU    .L2     B5,B8,B7:B6       ; |117| 
||         MVKL    .S2     t_offset,B31

           SUB     .L2     B4,B9,B5          ; |117| 
||         EXT     .S2     B7,24,24,B4       ; |117| 

           ADD     .L2     B5,B4,B7          ; |117| 
||         MVKH    .S2     t_offset,B31

           STDW    .D2T2   B7:B6,*B31        ; |117| 
           LDW     .D1T1   *A13,A3           ; |201| 
           MV      .L1X    B13,A15
           MVK     .S2     0x80,B30
           LDW     .D2T1   *+SP(20),A10      ; |117| 
           STW     .D2T2   B30,*+SP(12)      ; |117| 

           CALL    .S1     recipdp_c         ; |201| 
||         ADD     .L1     A15,A3,A3         ; |201| 

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L15:    
;          EXCLUSIVE CPU CYCLES: 5
           LDDW    .D1T1   *A3,A5:A4         ; |201| 
           ADDKPC  .S2     $C$RL37,B3,3      ; |201| 
$C$RL37:   ; CALL OCCURS {recipdp_c} {0}     ; |201| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 19
           MV      .L2X    A10,B4            ; |201| 
           STW     .D2T2   B4,*+SP(16)       ; |201| 
           LDW     .D2T2   *B4,B4            ; |201| 
           NOP             4

           ADD     .L1X    A15,B4,A3         ; |201| 
||         LDW     .D2T2   *+SP(12),B4       ; |201| 

           ADD     .L1     8,A15,A15         ; |200| 
           STDW    .D1T1   A5:A4,*A3         ; |201| 
           NOP             2

           SUB     .L1X    B4,1,A0           ; |200| 
||         SUB     .L2     B4,1,B4           ; |200| 

   [ A0]   BNOP    .S1     $C$L15,4          ; |200| 
|| [ A0]   LDW     .D1T1   *A13,A3           ; |201| 
||         STW     .D2T2   B4,*+SP(12)       ; |201| 

   [ A0]   CALL    .S1     recipdp_c         ; |201| 
||         ADD     .L1     A15,A3,A3         ; |201| 

           ; BRANCHCC OCCURS {$C$L15}        ; |200| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 17
           MVC     .S2     TSCL,B6           ; |128| 
           MVC     .S2     TSCH,B5           ; |128| 

           MVKL    .S2     t_offset,B4
||         LDDW    .D1T1   *A14,A5:A4        ; |130| 

           MVKH    .S2     t_offset,B4
           LDDW    .D2T2   *B4,B9:B8         ; |130| 
           LDDW    .D2T2   *+B10(16),B17:B16 ; |130| 
           MV      .L2     B5,B7             ; |128| 
           NOP             2
           ADDU    .L2X    B8,A4,B5:B4       ; |130| 

           ADD     .S2     B5,B9,B8          ; |130| 
||         SUBU    .L2     B6,B4,B5:B4       ; |130| 

           ADD     .D2X    B8,A5,B8          ; |130| 
||         CALL    .S1     __c6xabi_fltllif  ; |130| 
||         EXT     .S2     B5,24,24,B9       ; |130| 
||         ADDU    .L2     B16,B4,B5:B4      ; |130| 

           SUB     .L2     B7,B8,B8          ; |130| 
||         ADD     .S2     B5,B17,B31        ; |130| 

           ADD     .L2     B8,B9,B5          ; |130| 
||         MV      .L1X    B4,A4             ; |130| 
||         MVKL    .S2     t_stop,B8

           ADD     .L2     B31,B5,B4         ; |130| 
||         MVKH    .S2     t_stop,B8

           STDW    .D2T2   B7:B6,*B8         ; |128| 

           MV      .L1X    B4,A5             ; |130| 
||         ADDKPC  .S2     $C$RL38,B3,0      ; |130| 

$C$RL38:   ; CALL OCCURS {__c6xabi_fltllif} {0}  ; |130| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 108
           MPYSP   .M1     A12,A4,A3         ; |130| 
           MV      .L1X    B13,A10           ; |130| 
           NOP             3
           SPDP    .S2X    A3,B5:B4          ; |130| 
           NOP             2
           ADDDP   .L1X    A11:A10,B5:B4,A5:A4 ; |130| 
           CALLP   .S2     __c6xabi_fixdlli,B3
$C$RL39:   ; CALL OCCURS {__c6xabi_fixdlli} {0}  ; |130| 
           STDW    .D2T2   B13:B12,*+B10(32) ; |114| 

           ADDAD   .D2     B11,1,B10
||         MV      .L2     B12,B4

           STDW    .D2T1   A5:A4,*B10        ; |130| 
||         MVC     .S2     B4,TSCL           ; |115| 

           MVC     .S2     TSCL,B4           ; |116| 
           MVC     .S2     TSCH,B5           ; |116| 

           STDW    .D1T2   B5:B4,*A14        ; |116| 
||         MVC     .S2     TSCL,B6           ; |117| 

           MVC     .S2     TSCH,B8           ; |117| 

           SUBU    .L2     B6,B4,B7:B6       ; |117| 
||         LDW     .D2T2   *+SP(16),B4       ; |117| 

           MV      .L2X    A13,B9            ; |208| 
           MVKL    .S2     t_offset,B11
           LDW     .D2T1   *B9,A4            ; |208| 

           EXT     .S2     B7,24,24,B5       ; |117| 
||         SUB     .L2     B8,B5,B7          ; |117| 

           LDW     .D2T2   *+B4(8),B4        ; |208| 
||         ADD     .L2     B7,B5,B7          ; |117| 
||         MVKH    .S2     t_offset,B11

           CALLP   .S2     recipdp_v,B3
||         STDW    .D2T2   B7:B6,*B11        ; |117| 
||         MVK     .S1     0x80,A6           ; |208| 

$C$RL40:   ; CALL OCCURS {recipdp_v} {0}     ; |208| 
           MVC     .S2     TSCL,B8           ; |128| 
           MVC     .S2     TSCH,B4           ; |128| 

           LDDW    .D1T1   *A14,A9:A8        ; |130| 
||         LDDW    .D2T2   *B11,B7:B6        ; |130| 

           MVK     .S1     16,A13
           ADD     .L1X    B10,A13,A13
           MVKL    .S1     t_stop,A3

           LDDW    .D1T1   *A13,A17:A16      ; |130| 
||         MVKH    .S1     t_stop,A3

           ADDU    .L1X    B6,A8,A7:A6       ; |130| 

           MV      .L2     B4,B9             ; |128| 
||         MV      .S2X    A3,B4             ; |128| 
||         ADD     .L1X    A7,B7,A3          ; |130| 

           SUBU    .L1X    B8,A6,A5:A4       ; |130| 

           ADD     .L1     A3,A9,A5          ; |130| 
||         EXT     .S1     A5,24,24,A3       ; |130| 

           SUB     .S1X    B9,A5,A6          ; |130| 
||         ADDU    .L1     A16,A4,A5:A4      ; |130| 

           ADD     .L1     A5,A17,A3         ; |130| 
||         ADD     .S1     A6,A3,A5          ; |130| 

           CALLP   .S2     __c6xabi_fltllif,B3
||         ADD     .L1     A3,A5,A5          ; |130| 
||         STDW    .D2T2   B9:B8,*B4         ; |128| 

$C$RL41:   ; CALL OCCURS {__c6xabi_fltllif} {0}  ; |130| 
           MPYSP   .M1     A12,A4,A3         ; |130| 
           NOP             3
           SPDP    .S1     A3,A5:A4          ; |130| 
           NOP             1
           ADDDP   .L1     A11:A10,A5:A4,A5:A4 ; |130| 
           CALLP   .S2     __c6xabi_fixdlli,B3
$C$RL42:   ; CALL OCCURS {__c6xabi_fixdlli} {0}  ; |130| 

           MVKL    .S1     output,A3
||         MVKL    .S2     0xd9d7bdbb,B6

           MVKH    .S1     output,A3
||         MVKL    .S2     0x3ddb7cdf,B7

           MV      .L1     A3,A10            ; |130| 
||         STDW    .D1T1   A5:A4,*A13        ; |130| 
||         MVKH    .S2     0xd9d7bdbb,B6

           LDW     .D1T1   *A10,A4           ; |66| 
||         MVKH    .S2     0x3ddb7cdf,B7

           CALLP   .S2     isequal,B3
||         LDW     .D1T2   *+A10(4),B4       ; |66| 
||         MVK     .S1     0x80,A6           ; |66| 
||         MVK     .L1     0x1,A8            ; |66| 

$C$RL43:   ; CALL OCCURS {isequal} {0}       ; |66| 
           MVKL    .S2     0x3ddb7cdf,B7
           MVKL    .S2     0xd9d7bdbb,B6
           MVKL    .S2     fcn_pass,B10
           MVKH    .S2     0x3ddb7cdf,B7
           MVKH    .S2     0xd9d7bdbb,B6

           MV      .L1     A4,A3             ; |66| 
||         LDW     .D1T1   *A10,A4           ; |67| 
||         MVKH    .S2     fcn_pass,B10

           CALLP   .S2     isequal,B3
||         LDW     .D1T2   *+A10(8),B4       ; |67| 
||         STW     .D2T1   A3,*+B10(4)       ; |66| 
||         MVK     .S1     0x80,A6           ; |67| 
||         MVK     .L1     0x1,A8            ; |67| 

$C$RL44:   ; CALL OCCURS {isequal} {0}       ; |67| 
           MVKL    .S2     0xd9d7bdbb,B6
           MVKL    .S2     0x3ddb7cdf,B7

           MV      .L1     A4,A3             ; |67| 
||         MVKH    .S2     0xd9d7bdbb,B6

           LDW     .D1T2   *+A10(12),B4      ; |68| 
||         MVKH    .S2     0x3ddb7cdf,B7
||         STW     .D2T1   A3,*+B10(8)       ; |67| 

           CALLP   .S2     isequal,B3
||         LDW     .D1T1   *A10,A4           ; |68| 
||         MVK     .S1     0x80,A6           ; |68| 
||         MVK     .L1     0x1,A8            ; |68| 

$C$RL45:   ; CALL OCCURS {isequal} {0}       ; |68| 
           MVKL    .S2     0x3ddb7cdf,B7
           MVKL    .S2     0xd9d7bdbb,B6
           MVKH    .S2     0x3ddb7cdf,B7

           MV      .L1     A10,A3            ; |68| 
||         STW     .D2T1   A4,*+B10(12)      ; |68| 
||         LDW     .D1T2   *+A10(16),B4      ; |69| 
||         MVKH    .S2     0xd9d7bdbb,B6

           CALLP   .S2     isequal,B3
||         LDW     .D1T1   *A3,A4            ; |69| 
||         MVK     .S1     0x80,A6           ; |69| 
||         MVK     .L1     0x1,A8            ; |69| 

$C$RL46:   ; CALL OCCURS {isequal} {0}       ; |69| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 16
           LDW     .D2T1   *+SP(32),A3       ; |69| 
           LDW     .D2T2   *+SP(36),B5
           MV      .L2X    A4,B4             ; |69| 
           STW     .D2T2   B4,*+B10(16)      ; |69| 
           NOP             1
           LDW     .D1T1   *A3,A0            ; |72| 
           NOP             4

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
           LDW     .D2T2   *++SP(64),B3      ; |226| 
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
$C$SL1:	.string	"recipDP",0
$C$SL2:	.string	"----------------------------------------",0
$C$SL3:	.string	"----------------------------------------",10,0
;*****************************************************************************
;* UNDEFINED EXTERNAL REFERENCES                                             *
;*****************************************************************************
	.global	printf
	.global	driver_init
	.global	print_profile_results
	.global	print_memory_results
	.global	print_test_results
	.global	gimme_random
	.global	isequal
	.global	recipdp
	.global	recipdp_c
	.global	recipdp_v
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
	.global	__c6xabi_divd
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
