;******************************************************************************
;* TMS320C6x C/C++ Codegen                                          PC v7.4.2 *
;* Date/Time created: Mon May 16 23:54:58 2016                                *
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
	.word	095a29414h,0408edcdbh		; a[0] @ 0
	.word	061e77ba5h,04076a092h		; a[1] @ 64
	.word	0ab72dff1h,040728016h		; a[2] @ 128
	.word	0f59bf8efh,04063cf4eh		; a[3] @ 192
	.word	0355f5d5eh,0408c4ef0h		; a[4] @ 256
	.word	09acf23bfh,040867644h		; a[5] @ 320
	.word	0244e93e2h,0408181a8h		; a[6] @ 384
	.word	0018bf13ah,040809528h		; a[7] @ 448
	.word	08806ca1fh,04067b738h		; a[8] @ 512
	.word	05fdb31eah,040856c97h		; a[9] @ 576

;	C:\MATHLIB_Tools\CCSV5_5_0\ccsv5\tools\compiler\c6000_7.4.2\bin\opt6x.exe C:\\Users\\gtbldadm\\AppData\\Local\\Temp\\023007 C:\\Users\\gtbldadm\\AppData\\Local\\Temp\\023009 
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
||         MVKL    .S2     output,B11

           CALL    .S1     rsqrt             ; |109| 
||         MV      .L1     A11,A10
||         MV      .D1X    B4,A12
||         MVKH    .S2     output,B11
||         ZERO    .L2     B10

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L1:    
;          EXCLUSIVE CPU CYCLES: 5
           LDDW    .D1T1   *A10++,A5:A4      ; |109| 
           ADDKPC  .S2     $C$RL1,B3,3       ; |109| 
$C$RL1:    ; CALL OCCURS {rsqrt} {0}         ; |109| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 7

           LDW     .D2T2   *B11,B4           ; |109| 
||         SUB     .L1     A12,1,A0          ; |108| 
||         SUB     .S1     A12,1,A12         ; |108| 

   [ A0]   BNOP    .S1     $C$L1,3           ; |108| 

           ADD     .L2     B10,B4,B4         ; |109| 
||         ADD     .S2     8,B10,B10         ; |108| 

   [ A0]   CALL    .S1     rsqrt             ; |109| 
||         STDW    .D2T1   A5:A4,*B4         ; |109| 
|| [!A0]   MVK     .L2     0xa,B4

           ; BRANCHCC OCCURS {$C$L1}         ; |108| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 2

           ZERO    .L2     B10
||         MV      .L1     A11,A10
||         ADD     .S2     4,B11,B13

           MV      .L1X    B4,A12
||         CALL    .S1     rsqrtdp           ; |112| 

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L2:    
;          EXCLUSIVE CPU CYCLES: 5
           LDDW    .D1T1   *A11++,A5:A4      ; |112| 
           ADDKPC  .S2     $C$RL2,B3,3       ; |112| 
$C$RL2:    ; CALL OCCURS {rsqrtdp} {0}       ; |112| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 7

           LDW     .D2T2   *B13,B4           ; |112| 
||         SUB     .L1     A12,1,A0          ; |111| 
||         SUB     .S1     A12,1,A12         ; |111| 

   [ A0]   BNOP    .S1     $C$L2,3           ; |111| 

           ADD     .L2     B10,B4,B4         ; |112| 
||         ADD     .S2     8,B10,B10         ; |111| 

   [ A0]   CALL    .S1     rsqrtdp           ; |112| 
||         STDW    .D2T1   A5:A4,*B4         ; |112| 
|| [!A0]   MVK     .L2     0xa,B4

           ; BRANCHCC OCCURS {$C$L2}         ; |111| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 2

           ZERO    .L2     B10
||         MV      .L1     A10,A12
||         ADD     .S2     4,B13,B12

           MV      .L1X    B4,A11
||         CALL    .S1     rsqrtdp_c         ; |115| 

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L3:    
;          EXCLUSIVE CPU CYCLES: 5
           LDDW    .D1T1   *A12++,A5:A4      ; |115| 
           ADDKPC  .S2     $C$RL3,B3,3       ; |115| 
$C$RL3:    ; CALL OCCURS {rsqrtdp_c} {0}     ; |115| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 7

           LDW     .D2T2   *B12,B4           ; |115| 
||         SUB     .L1     A11,1,A0          ; |114| 
||         SUB     .S1     A11,1,A11         ; |114| 

   [ A0]   BNOP    .S1     $C$L3,1           ; |114| 
|| [!A0]   ZERO    .L2     B17
|| [!A0]   ZERO    .S2     B19
|| [!A0]   MV      .L1X    B11,A14

   [!A0]   SET     .S2     B19,0x13,0x1d,B19
   [!A0]   SET     .S2     B17,0x15,0x1d,B17

           ADD     .L2     B10,B4,B4         ; |115| 
||         ADD     .S2     8,B10,B10         ; |114| 

   [ A0]   CALL    .S1     rsqrtdp_c         ; |115| 
||         STDW    .D2T1   A5:A4,*B4         ; |115| 

           ; BRANCHCC OCCURS {$C$L3}         ; |114| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 3

           MVK     .L2     0xa,B1
||         ZERO    .S2     B16               ; |60| 
||         ZERO    .D2     B6                ; |60| 
||         LDW     .D1T2   *+A14(12),B20
||         ZERO    .L1     A18               ; |60| 
||         ZERO    .S1     A8                ; |60| 

           ZERO    .L2     B8                ; |60| 
||         ZERO    .S2     B18               ; |60| 
||         MVK     .L1     0xffffffff,A3
||         MV      .D2     B17,B7            ; |60| 
||         MV      .S1X    B19,A9            ; |60| 
||         MV      .D1     A10,A20

           MV      .L2     B17,B9            ; |60| 
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*
;*      Loop found in file               : C:/nightlybuilds/mathlib/ti/mathlib/src/rsqrtdp/rsqrtdp_d.c
;*      Loop source line                 : 117
;*      Loop opening brace source line   : 117
;*      Loop closing brace source line   : 119
;*      Known Minimum Trip Count         : 10                    
;*      Known Maximum Trip Count         : 10                    
;*      Known Max Trip Count Factor      : 10
;*      Loop Carried Dependency Bound(^) : 122
;*      Unpartitioned Resource Bound     : 24
;*      Partitioned Resource Bound(*)    : 24
;*      Resource Partition:
;*                                A-side   B-side
;*      .L units                     1        0     
;*      .S units                     2        3     
;*      .D units                     1        1     
;*      .M units                    24*      24*    
;*      .X cross paths              19        4     
;*      .T address paths             1        1     
;*      Long read paths              0        0     
;*      Long write paths             0        0     
;*      Logical  ops (.LS)           4        2     (.L or .S unit)
;*      Addition ops (.LSD)          5        0     (.L or .S or .D unit)
;*      Bound(.L .S .LS)             4        3     
;*      Bound(.L .S .D .LS .LSD)     5        2     
;*
;*      Searching for software pipeline schedule at ...
;*         ii = 122 Did not find schedule
;*         ii = 123 Did not find schedule
;*      Disqualified loop: Did not find schedule
;*----------------------------------------------------------------------------*
$C$L4:    
;          EXCLUSIVE CPU CYCLES: 5
           LDDW    .D1T1   *A20++,A7:A6      ; |60| 
           NOP             4
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 119
           RSQRDP  .S1     A7:A6,A5:A4       ; |60| 
           MV      .L1     A9,A19            ; |60| 
           MPYDP   .M1     A5:A4,A7:A6,A17:A16 ; |60| 
           MPYDP   .M2X    B17:B16,A5:A4,B5:B4 ; |60| 
           MVKL    .S1     0x7fefffff,A31
           MVKH    .S1     0x7fefffff,A31
           SUB     .L2     B1,1,B1           ; |117| 
           NOP             6
           MPYDP   .M2X    B5:B4,A17:A16,B5:B4 ; |60| 
           NOP             9
           SUBDP   .L2     B19:B18,B5:B4,B5:B4 ; |60| 
           NOP             7
           MPYDP   .M1X    A5:A4,B5:B4,A5:A4 ; |60| 
           NOP             9
           NOP             1
           MPYDP   .M2X    B9:B8,A5:A4,B5:B4 ; |60| 
           MPYDP   .M1     A5:A4,A7:A6,A17:A16 ; |60| 
           NOP             9
           MPYDP   .M1X    B5:B4,A17:A16,A17:A16 ; |60| 
           NOP             9
           SUBDP   .L1     A9:A8,A17:A16,A17:A16 ; |60| 
           ZERO    .L2     B5:B4             ; |60| 
           CMPLTDP .S2X    A7:A6,B5:B4,B0    ; |60| 
           NOP             4
           MPYDP   .M1     A5:A4,A17:A16,A5:A4 ; |60| 
   [ B0]   MV      .L2X    A31,B5            ; |60| 
   [ B0]   MV      .L2X    A3,B4             ; |60| 
           NOP             7
   [!B0]   MPYDP   .M1     A5:A4,A7:A6,A7:A6 ; |60| 
   [!B0]   MPYDP   .M2X    B7:B6,A5:A4,B5:B4 ; |60| 
           NOP             9
   [!B0]   MPYDP   .M2X    B5:B4,A7:A6,B5:B4 ; |60| 
           NOP             9
   [!B0]   SUBDP   .L2X    A19:A18,B5:B4,B5:B4 ; |60| 
           NOP             6
   [!B0]   MPYDP   .M2X    A5:A4,B5:B4,B5:B4 ; |60| 
           NOP             4
   [ B1]   BNOP    .S1     $C$L4,4           ; |117| 

   [!B1]   CALL    .S1     rsqrtdp_v         ; |120| 
||         STDW    .D2T2   B5:B4,*B20++      ; |60| 

           ; BRANCHCC OCCURS {$C$L4}         ; |117| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           LDW     .D2T2   *+B11(16),B4      ; |120| 
           MV      .L1     A10,A4            ; |120| 
           MVK     .L1     0xa,A6            ; |120| 
           ADDKPC  .S2     $C$RL4,B3,1       ; |120| 
$C$RL4:    ; CALL OCCURS {rsqrtdp_v} {0}     ; |120| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 42
           MVKL    .S2     0x3ddb7cdf,B7
           MVKL    .S2     0xd9d7bdbb,B6
           MVKH    .S2     0x3ddb7cdf,B7

           LDW     .D2T1   *B11,A4           ; |66| 
||         MVKH    .S2     0xd9d7bdbb,B6

           CALLP   .S2     isequal,B3
||         LDW     .D2T2   *+B11(4),B4       ; |66| 
||         MVK     .L1     0xa,A6            ; |66| 
||         MVK     .S1     0x1,A8            ; |66| 

$C$RL5:    ; CALL OCCURS {isequal} {0}       ; |66| 
           MVKL    .S2     fcn_pass,B10
           MVKL    .S2     0x3ddb7cdf,B7
           MVKH    .S2     fcn_pass,B10
           MVKL    .S2     0xd9d7bdbb,B6

           LDW     .D2T2   *+B11(8),B4       ; |67| 
||         MVKH    .S2     0x3ddb7cdf,B7

           STW     .D2T1   A4,*+B10(4)       ; |66| 
||         MVKH    .S2     0xd9d7bdbb,B6

           CALLP   .S2     isequal,B3
||         LDW     .D2T1   *B11,A4           ; |67| 
||         MVK     .L1     0xa,A6            ; |67| 
||         MVK     .S1     0x1,A8            ; |67| 

$C$RL6:    ; CALL OCCURS {isequal} {0}       ; |67| 
           MVKL    .S2     0x3ddb7cdf,B7
           MVKL    .S2     0xd9d7bdbb,B6
           MVKH    .S2     0x3ddb7cdf,B7

           STW     .D2T1   A4,*+B10(8)       ; |67| 
||         MVKH    .S2     0xd9d7bdbb,B6

           CALLP   .S2     isequal,B3
||         LDW     .D2T2   *+B11(12),B4      ; |68| 
||         LDW     .D1T1   *A14,A4           ; |68| 
||         MVK     .L1     0xa,A6            ; |68| 
||         MVK     .S1     0x1,A8            ; |68| 

$C$RL7:    ; CALL OCCURS {isequal} {0}       ; |68| 
           MVKL    .S2     0x3ddb7cdf,B7
           MVKL    .S2     0xd9d7bdbb,B6

           ADDAD   .D2     B12,1,B4
||         MVKH    .S2     0x3ddb7cdf,B7

           STW     .D2T1   A4,*+B10(12)      ; |68| 
||         MVKH    .S2     0xd9d7bdbb,B6

           CALLP   .S2     isequal,B3
||         LDW     .D2T2   *B4,B4            ; |69| 
||         LDW     .D1T1   *A14,A4           ; |69| 
||         MVK     .L1     0xa,A6            ; |69| 
||         MVK     .S1     0x1,A8            ; |69| 

$C$RL8:    ; CALL OCCURS {isequal} {0}       ; |69| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 12
           ADD     .L2     4,B10,B4
           LDW     .D2T2   *B4,B0            ; |72| 
           STW     .D2T1   A4,*+B10(16)      ; |69| 
           ADD     .L1X    8,B10,A10
           STW     .D2T2   B4,*+SP(24)
           NOP             1

   [!B0]   B       .S1     $C$L5             ; |72| 
|| [ B0]   LDW     .D1T1   *A10,A0           ; |72| 

   [!B0]   CALL    .S1     print_test_results ; |124| 
   [!B0]   ZERO    .L2     B4                ; |72| 
   [ B0]   ADD     .L1     4,A10,A3
   [!B0]   MVKL    .S1     all_pass,A3
   [!B0]   MVKH    .S1     all_pass,A3
           ; BRANCHCC OCCURS {$C$L5}         ; |72| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 9
   [ A0]   LDW     .D1T1   *A3,A3            ; |72| 
           CMPEQ   .L1     A4,0,A4           ; |72| 
           XOR     .L1     1,A4,A4           ; |72| 
           MVK     .L2     0x1,B4            ; |72| 
           NOP             1
   [ A0]   CMPEQ   .L1     A3,0,A3           ; |72| 
   [ A0]   XOR     .L1     1,A3,A3           ; |72| 

   [ A0]   AND     .L1     A4,A3,A0          ; |72| 
|| [!A0]   ZERO    .S1     A0                ; |72| 

   [!A0]   ZERO    .L2     B4                ; |72| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           CALL    .S1     print_test_results ; |124| 
           MVKL    .S1     all_pass,A3
           MVKH    .S1     all_pass,A3
           NOP             2
;** --------------------------------------------------------------------------*
$C$L5:    
;          EXCLUSIVE CPU CYCLES: 1

           MVK     .L1     0x1,A4            ; |124| 
||         STW     .D1T2   B4,*A3            ; |72| 
||         ADDKPC  .S2     $C$RL9,B3,0       ; |124| 

$C$RL9:    ; CALL OCCURS {print_test_results} {0}  ; |124| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 11
           MVKL    .S1     a_sc,A3
           MVKH    .S1     a_sc,A3
           MVK     .L2     0xffffffff,B9     ; |137| 

           MV      .L2X    A3,B5             ; |131| 
||         MV      .S2     B9,B8             ; |137| 
||         ZERO    .L1     A7

           STDW    .D2T2   B9:B8,*+B5(48)    ; |137| 
||         MVKH    .S1     0xfff00000,A7
||         ZERO    .L2     B17
||         ZERO    .L1     A6                ; |134| 

           STDW    .D2T1   A7:A6,*+B5(24)    ; |134| 
||         SET     .S2     B17,0x14,0x1d,B17
||         ZERO    .L1     A5
||         ZERO    .L2     B16               ; |135| 

           STDW    .D2T2   B17:B16,*+B5(32)  ; |135| 
||         MVKH    .S1     0xbff00000,A5
||         MVKL    .S2     0x7fefffff,B4
||         ZERO    .L1     A4                ; |136| 

           STDW    .D2T1   A5:A4,*+B5(40)    ; |136| 
||         MVKH    .S2     0x7fefffff,B4
||         ZERO    .L2     B7
||         ZERO    .L1     A9:A8             ; |131| 

           STDW    .D2T1   A9:A8,*B5         ; |131| 
||         MVKH    .S2     0x80000000,B7
||         ZERO    .L2     B6                ; |132| 

           ADD     .L2     1,B4,B9
||         ZERO    .S2     B8                ; |133| 
||         STDW    .D2T2   B7:B6,*+B5(8)     ; |132| 

           CALL    .S2     rsqrt             ; |139| 
||         STDW    .D2T2   B9:B8,*+B5(16)    ; |133| 
||         MV      .L1     A3,A11            ; |132| 
||         ADD     .L2X    4,A14,B11
||         MVK     .S1     0x7,A12
||         ZERO    .D1     A13

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains control code
;*----------------------------------------------------------------------------*
$C$L6:    
;          EXCLUSIVE CPU CYCLES: 5
           LDDW    .D1T1   *A11,A5:A4        ; |139| 
           ADDKPC  .S2     $C$RL10,B3,3      ; |139| 
$C$RL10:   ; CALL OCCURS {rsqrt} {0}         ; |139| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 21
           MV      .L1     A14,A3            ; |139| 
           LDW     .D1T1   *A3,A3            ; |139| 
           ZERO    .L2     B5:B4             ; |140| 
           NOP             3
           ADD     .L1     A13,A3,A3         ; |139| 
           STDW    .D1T1   A5:A4,*A3         ; |139| 
           LDDW    .D1T1   *A11,A5:A4        ; |140| 
           NOP             4
           CMPGTDP .S2X    A5:A4,B5:B4,B0    ; |140| 
           NOP             1
   [!B0]   B       .S1     $C$L7             ; |140| 
   [ B0]   CALL    .S1     rsqrtdp           ; |140| 
   [!B0]   CALL    .S1     rsqrt             ; |140| 
           NOP             3
           ; BRANCHCC OCCURS {$C$L7}         ; |140| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 1
           ADDKPC  .S2     $C$RL11,B3,0      ; |140| 
$C$RL11:   ; CALL OCCURS {rsqrtdp} {0}       ; |140| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 6

           BNOP    .S1     $C$L8,3           ; |140| 
||         LDW     .D2T2   *B11,B6           ; |140| 
||         MV      .L2X    A4,B4             ; |140| 

           MV      .L2X    A5,B5             ; |140| 
           ADD     .L2X    A13,B6,B6         ; |140| 
           ; BRANCH OCCURS {$C$L8}           ; |140| 
;** --------------------------------------------------------------------------*
$C$L7:    
;          EXCLUSIVE CPU CYCLES: 2
           ADDKPC  .S2     $C$RL12,B3,1      ; |140| 
$C$RL12:   ; CALL OCCURS {rsqrt} {0}         ; |140| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 6
           LDW     .D2T2   *B11,B6           ; |140| 
           MV      .L2X    A5,B5             ; |140| 
           MV      .L2X    A4,B4             ; |140| 
           NOP             2
           ADD     .L2X    A13,B6,B6         ; |140| 
;** --------------------------------------------------------------------------*
$C$L8:    
;          EXCLUSIVE CPU CYCLES: 6

           CALL    .S1     rsqrtdp_c         ; |141| 
||         STDW    .D2T2   B5:B4,*B6         ; |140| 

           LDDW    .D1T1   *A11,A5:A4        ; |141| 
           ADDKPC  .S2     $C$RL13,B3,3      ; |141| 
$C$RL13:   ; CALL OCCURS {rsqrtdp_c} {0}     ; |141| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 133
           LDW     .D2T2   *+B11(4),B4       ; |141| 
           ZERO    .L2     B5
           SET     .S2     B5,0x15,0x1d,B5
           ZERO    .L1     A31
           ZERO    .L2     B31
           ADD     .L1X    A13,B4,A3         ; |141| 
           STDW    .D1T1   A5:A4,*A3         ; |141| 
           LDDW    .D1T1   *A11++,A7:A6      ; |60| 
           ZERO    .L2     B4                ; |60| 
           ZERO    .L1     A30
           ZERO    .L2     B6                ; |60| 
           ZERO    .L2     B7
           RSQRDP  .S1     A7:A6,A5:A4       ; |60| 
           SET     .S2     B7,0x15,0x1d,B7
           MPYDP   .M1     A5:A4,A7:A6,A9:A8 ; |60| 
           MPYDP   .M2X    B5:B4,A5:A4,B5:B4 ; |60| 
           SUB     .L1     A12,1,A2          ; |138| 
           SUB     .L1     A12,1,A12         ; |138| 
           MVK     .L1     0xffffffff,A29
           MVKL    .S1     0x7fefffff,A28
           MVKH    .S1     0x7fefffff,A28
           NOP             5
           MPYDP   .M1X    B5:B4,A9:A8,A17:A16 ; |60| 
           NOP             7
           ZERO    .L1     A8                ; |60| 
           SET     .S1     A31,0x13,0x1d,A9
           SUBDP   .L1     A9:A8,A17:A16,A9:A8 ; |60| 
           ZERO    .L2     B4                ; |60| 
           SET     .S2     B31,0x15,0x1d,B5
           NOP             4
           MPYDP   .M1     A5:A4,A9:A8,A5:A4 ; |60| 
           NOP             9
           MPYDP   .M1     A5:A4,A7:A6,A9:A8 ; |60| 
           MPYDP   .M2X    B5:B4,A5:A4,B5:B4 ; |60| 
           NOP             9
           MPYDP   .M2X    B5:B4,A9:A8,B5:B4 ; |60| 
           NOP             6
           ZERO    .L1     A8                ; |60| 
           SET     .S1     A30,0x13,0x1d,A9
           NOP             1
           SUBDP   .L2X    A9:A8,B5:B4,B5:B4 ; |60| 
           NOP             6
           MPYDP   .M2X    A5:A4,B5:B4,B5:B4 ; |60| 
           NOP             9
           MPYDP   .M2     B7:B6,B5:B4,B7:B6 ; |60| 
           MPYDP   .M1X    B5:B4,A7:A6,A5:A4 ; |60| 
           NOP             9
           MPYDP   .M1X    B7:B6,A5:A4,A5:A4 ; |60| 
           NOP             8
           MV      .L2X    A9,B7             ; |60| 
           MV      .L2X    A8,B6             ; |60| 
           SUBDP   .L2X    B7:B6,A5:A4,B7:B6 ; |60| 
           ADDAW   .D1     A14,3,A4
           LDW     .D1T1   *A4,A3            ; |142| 
           ZERO    .L1     A9:A8             ; |62| 
           CMPLTDP .S1     A7:A6,A9:A8,A0    ; |62| 
           NOP             2
           MPYDP   .M2     B5:B4,B7:B6,B5:B4 ; |60| 
           ADD     .L1     A13,A3,A5         ; |142| 
           ADD     .L1     8,A13,A13         ; |138| 
           NOP             4
   [ A2]   BNOP    .S1     $C$L6,2           ; |138| 
   [ A0]   MV      .L2X    A29,B4            ; |63| 
   [ A0]   MV      .L2X    A28,B5            ; |63| 

   [ A2]   CALL    .S1     rsqrt             ; |139| 
||         STDW    .D1T2   B5:B4,*A5         ; |142| 

           ; BRANCHCC OCCURS {$C$L6}         ; |138| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 6
           CALL    .S1     rsqrtdp_v         ; |144| 
           LDW     .D1T2   *+A4(4),B4        ; |144| 
           MVKL    .S1     a_sc,A4
           MVKH    .S1     a_sc,A4
           ADDKPC  .S2     $C$RL14,B3,0      ; |144| 
           MVK     .L1     0x7,A6            ; |144| 
$C$RL14:   ; CALL OCCURS {rsqrtdp_v} {0}     ; |144| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 40
           MVKL    .S2     0x3ddb7cdf,B7
           MVKL    .S2     0xd9d7bdbb,B6

           MV      .L1     A14,A11           ; |144| 
||         MVKH    .S2     0x3ddb7cdf,B7

           LDW     .D1T1   *A11,A4           ; |66| 
||         MVKH    .S2     0xd9d7bdbb,B6

           CALLP   .S2     isequal,B3
||         LDW     .D1T2   *+A11(4),B4       ; |66| 
||         MVK     .L1     0x7,A6            ; |66| 
||         MVK     .S1     0x1,A8            ; |66| 

$C$RL15:   ; CALL OCCURS {isequal} {0}       ; |66| 
           MVKL    .S2     0xd9d7bdbb,B6
           MVKL    .S2     0x3ddb7cdf,B7
           MVKH    .S2     0xd9d7bdbb,B6

           MV      .L1     A4,A3             ; |66| 
||         MV      .L2     B10,B4            ; |67| 
||         LDW     .D1T1   *A11,A4           ; |67| 
||         MVKH    .S2     0x3ddb7cdf,B7

           CALLP   .S2     isequal,B3
||         STW     .D2T1   A3,*+B4(4)        ; |66| 
||         LDW     .D1T2   *+A11(8),B4       ; |67| 
||         MVK     .L1     0x7,A6            ; |67| 
||         MVK     .S1     0x1,A8            ; |67| 

$C$RL16:   ; CALL OCCURS {isequal} {0}       ; |67| 
           MVKL    .S2     0xd9d7bdbb,B6
           MVKL    .S2     0x3ddb7cdf,B7
           MVKH    .S2     0xd9d7bdbb,B6

           MV      .L1     A4,A3             ; |67| 
||         MV      .L2     B10,B4            ; |68| 
||         LDW     .D1T1   *A11,A4           ; |68| 
||         MVKH    .S2     0x3ddb7cdf,B7

           CALLP   .S2     isequal,B3
||         STW     .D2T1   A3,*+B4(8)        ; |67| 
||         LDW     .D1T2   *+A11(12),B4      ; |68| 
||         MVK     .L1     0x7,A6            ; |68| 
||         MVK     .S1     0x1,A8            ; |68| 

$C$RL17:   ; CALL OCCURS {isequal} {0}       ; |68| 
           MVKL    .S2     0xd9d7bdbb,B6

           MV      .L2     B10,B4            ; |68| 
||         MVKL    .S2     0x3ddb7cdf,B7

           STW     .D2T1   A4,*+B4(12)       ; |68| 
||         MVKH    .S2     0xd9d7bdbb,B6

           LDW     .D1T1   *A14,A4           ; |69| 
||         MVKH    .S2     0x3ddb7cdf,B7

           CALLP   .S2     isequal,B3
||         LDW     .D1T2   *+A11(16),B4      ; |69| 
||         MVK     .L1     0x7,A6            ; |69| 
||         MVK     .S1     0x1,A8            ; |69| 

$C$RL18:   ; CALL OCCURS {isequal} {0}       ; |69| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 16
           LDW     .D2T2   *+SP(24),B11      ; |69| 
           MV      .L2X    A10,B10           ; |72| 
           MVKL    .S2     fcn_pass,B4
           MVKH    .S2     fcn_pass,B4
           STW     .D2T1   A4,*+B4(16)       ; |69| 
           LDW     .D2T2   *B11,B0           ; |72| 
           NOP             4

   [!B0]   MVKL    .S1     all_pass,A15
|| [!B0]   B       .S2     $C$L9             ; |72| 
||         MV      .L2     B0,B1             ; guard predicate rewrite
|| [!B0]   ZERO    .L1     A3                ; |72| 

   [!B0]   CALL    .S2     print_test_results ; |148| 
|| [!B0]   MVKH    .S1     all_pass,A15
|| [ B0]   LDW     .D2T2   *B10,B0           ; |72| 

   [ B1]   ADD     .L2     4,B10,B4
           NOP             3
           ; BRANCHCC OCCURS {$C$L9}         ; |72| 
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
           MVKL    .S1     all_pass,A15
           MVKH    .S1     all_pass,A15
           NOP             2
;** --------------------------------------------------------------------------*
$C$L9:    
;          EXCLUSIVE CPU CYCLES: 1

           MVK     .L1     0x3,A4            ; |148| 
||         STW     .D1T1   A3,*A15           ; |72| 
||         ADDKPC  .S2     $C$RL19,B3,0      ; |148| 

$C$RL19:   ; CALL OCCURS {print_test_results} {0}  ; |148| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 6
           MVKL    .S1     a_ext,A3
           MVKH    .S1     a_ext,A3

           MVK     .S2     0x777,B31
||         ZERO    .L1     A5

           MV      .L2X    A3,B4             ; |151| 
||         STW     .D2T2   B31,*+SP(12)      ; |151| 
||         SET     .S1     A5,0x14,0x14,A5
||         ZERO    .L1     A4                ; |151| 

           CALL    .S1     rsqrt             ; |153| 
||         STDW    .D2T1   A5:A4,*B4         ; |151| 
||         MV      .L1     A3,A11            ; |151| 

           LDDW    .D1T1   *A11,A5:A4        ; |153| 
||         ADD     .L1     4,A14,A13
||         ZERO    .S1     A12               ; |151| 

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains control code
;*----------------------------------------------------------------------------*
$C$L10:    
;          EXCLUSIVE CPU CYCLES: 4
           ADDKPC  .S2     $C$RL20,B3,3      ; |153| 
$C$RL20:   ; CALL OCCURS {rsqrt} {0}         ; |153| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 21
           MV      .L1     A14,A3            ; |153| 
           LDW     .D1T1   *A3,A3            ; |153| 
           ZERO    .L2     B5:B4             ; |154| 
           NOP             3
           ADD     .L1     A12,A3,A3         ; |153| 
           STDW    .D1T1   A5:A4,*A3         ; |153| 
           LDDW    .D1T1   *A11,A5:A4        ; |154| 
           NOP             4
           CMPGTDP .S2X    A5:A4,B5:B4,B0    ; |154| 
           NOP             1
   [!B0]   B       .S1     $C$L11            ; |154| 
   [ B0]   CALL    .S1     rsqrtdp           ; |154| 
   [!B0]   CALL    .S1     rsqrt             ; |154| 
           NOP             3
           ; BRANCHCC OCCURS {$C$L11}        ; |154| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 1
           ADDKPC  .S2     $C$RL21,B3,0      ; |154| 
$C$RL21:   ; CALL OCCURS {rsqrtdp} {0}       ; |154| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 6

           BNOP    .S1     $C$L12,3          ; |154| 
||         LDW     .D1T2   *A13,B6           ; |154| 
||         MV      .L2X    A4,B4             ; |154| 

           MV      .L2X    A5,B5             ; |154| 
           ADD     .L2X    A12,B6,B6         ; |154| 
           ; BRANCH OCCURS {$C$L12}          ; |154| 
;** --------------------------------------------------------------------------*
$C$L11:    
;          EXCLUSIVE CPU CYCLES: 2
           ADDKPC  .S2     $C$RL22,B3,1      ; |154| 
$C$RL22:   ; CALL OCCURS {rsqrt} {0}         ; |154| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 6
           LDW     .D1T2   *A13,B6           ; |154| 
           MV      .L2X    A5,B5             ; |154| 
           MV      .L2X    A4,B4             ; |154| 
           NOP             2
           ADD     .L2X    A12,B6,B6         ; |154| 
;** --------------------------------------------------------------------------*
$C$L12:    
;          EXCLUSIVE CPU CYCLES: 6

           CALL    .S1     rsqrtdp_c         ; |155| 
||         STDW    .D2T2   B5:B4,*B6         ; |154| 

           LDDW    .D1T1   *A11,A5:A4        ; |155| 
           ADDKPC  .S2     $C$RL23,B3,3      ; |155| 
$C$RL23:   ; CALL OCCURS {rsqrtdp_c} {0}     ; |155| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 150
           LDW     .D1T1   *+A13(4),A3       ; |155| 
           ZERO    .L2     B4                ; |60| 
           ZERO    .L2     B5
           SET     .S2     B5,0x15,0x1d,B5
           ZERO    .L1     A31
           ADD     .L1     A12,A3,A3         ; |155| 
           STDW    .D1T1   A5:A4,*A3         ; |155| 
           LDDW    .D1T1   *A11,A9:A8        ; |60| 
           ZERO    .L2     B31
           ZERO    .L1     A30
           ZERO    .L2     B6                ; |60| 
           ZERO    .L2     B7
           RSQRDP  .S1     A9:A8,A5:A4       ; |60| 
           SET     .S2     B7,0x15,0x1d,B7
           MPYDP   .M1     A5:A4,A9:A8,A7:A6 ; |60| 
           MPYDP   .M2X    B5:B4,A5:A4,B5:B4 ; |60| 
           MVK     .L1     0xffffffff,A28
           MVKL    .S1     0x7fefffff,A29
           MVKH    .S1     0x7fefffff,A29
           NOP             7
           MPYDP   .M1X    B5:B4,A7:A6,A17:A16 ; |60| 
           NOP             7
           ZERO    .L1     A6                ; |60| 
           SET     .S1     A31,0x13,0x1d,A7
           SUBDP   .L1     A7:A6,A17:A16,A7:A6 ; |60| 
           ZERO    .L2     B4                ; |60| 
           SET     .S2     B31,0x15,0x1d,B5
           NOP             4
           MPYDP   .M1     A5:A4,A7:A6,A5:A4 ; |60| 
           NOP             9
           MPYDP   .M1     A5:A4,A9:A8,A7:A6 ; |60| 
           MPYDP   .M2X    B5:B4,A5:A4,B5:B4 ; |60| 
           NOP             9
           MPYDP   .M2X    B5:B4,A7:A6,B5:B4 ; |60| 
           NOP             6
           ZERO    .L1     A6                ; |60| 
           SET     .S1     A30,0x13,0x1d,A7
           NOP             1
           SUBDP   .L2X    A7:A6,B5:B4,B5:B4 ; |60| 
           NOP             6
           MPYDP   .M2X    A5:A4,B5:B4,B5:B4 ; |60| 
           NOP             9
           MPYDP   .M2     B7:B6,B5:B4,B7:B6 ; |60| 
           MPYDP   .M1X    B5:B4,A9:A8,A5:A4 ; |60| 
           NOP             9
           MPYDP   .M1X    B7:B6,A5:A4,A5:A4 ; |60| 
           NOP             8
           MV      .L2X    A7,B7             ; |60| 
           MV      .L2X    A6,B6             ; |60| 
           SUBDP   .L2X    B7:B6,A5:A4,B7:B6 ; |60| 
           ADDAD   .D1     A13,1,A4
           LDW     .D1T1   *A4,A3            ; |156| 
           ZERO    .L1     A7:A6             ; |62| 
           CMPLTDP .S1     A9:A8,A7:A6,A0    ; |62| 
           NOP             2
           MPYDP   .M2     B5:B4,B7:B6,B7:B6 ; |60| 
           ADD     .L1     A12,A3,A5         ; |156| 
           ADD     .L1     8,A12,A12         ; |152| 
           MVKL    .S2     0xcccccccd,B4
           MVKL    .S2     0xc000cccc,B5
           MVKH    .S2     0xcccccccd,B4
           MVKH    .S2     0xc000cccc,B5
           NOP             3
   [ A0]   MV      .L2X    A29,B7            ; |63| 
   [ A0]   MV      .L2X    A28,B6            ; |63| 
           STDW    .D1T2   B7:B6,*A5         ; |156| 
           LDDW    .D1T1   *A11,A7:A6        ; |157| 
           NOP             4

           MPYDP   .M1X    B5:B4,A7:A6,A7:A6 ; |157| 
||         LDW     .D2T2   *+SP(12),B4

           NOP             4

           SUB     .L1X    B4,1,A0           ; |152| 
||         SUB     .L2     B4,1,B4           ; |152| 

   [ A0]   BNOP    .S1     $C$L10,3          ; |152| 

   [ A0]   CALL    .S1     rsqrt             ; |153| 
||         STDW    .D1T1   A7:A6,*++A11      ; |157| 
||         STW     .D2T2   B4,*+SP(12)       ; |157| 

   [!A0]   CALL    .S1     rsqrtdp_v         ; |159| 
|| [ A0]   LDDW    .D1T1   *A11,A5:A4        ; |153| 

           ; BRANCHCC OCCURS {$C$L10}        ; |152| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           LDW     .D1T2   *+A4(4),B4        ; |159| 
           MVKL    .S1     a_ext,A4
           MVKH    .S1     a_ext,A4
           MVK     .S1     0x777,A6          ; |159| 
           ADDKPC  .S2     $C$RL24,B3,0      ; |159| 
$C$RL24:   ; CALL OCCURS {rsqrtdp_v} {0}     ; |159| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 46
           MVKL    .S2     0x3ddb7cdf,B7
           MVKL    .S2     0xd9d7bdbb,B6
           MVKH    .S2     0x3ddb7cdf,B7

           LDW     .D1T1   *A14,A4           ; |66| 
||         MVKH    .S2     0xd9d7bdbb,B6

           CALLP   .S2     isequal,B3
||         LDW     .D1T2   *+A14(4),B4       ; |66| 
||         MVK     .S1     0x777,A6          ; |66| 
||         MVK     .L1     0x1,A8            ; |66| 

$C$RL25:   ; CALL OCCURS {isequal} {0}       ; |66| 
           MVKL    .S2     fcn_pass,B4
           MVKL    .S2     0xd9d7bdbb,B6
           MVKL    .S2     0x3ddb7cdf,B7
           MVKH    .S2     fcn_pass,B4
           MVKH    .S2     0xd9d7bdbb,B6

           MV      .L1     A4,A5             ; |66| 
||         LDW     .D1T1   *A14,A4           ; |67| 
||         MVKH    .S2     0x3ddb7cdf,B7

           CALLP   .S2     isequal,B3
||         STW     .D2T1   A5,*+B4(4)        ; |66| 
||         LDW     .D1T2   *+A14(8),B4       ; |67| 
||         MVK     .S1     0x777,A6          ; |67| 
||         MVK     .L1     0x1,A8            ; |67| 

$C$RL26:   ; CALL OCCURS {isequal} {0}       ; |67| 
           MVKL    .S2     fcn_pass,B4
           MVKL    .S2     0xd9d7bdbb,B6
           MVKL    .S2     0x3ddb7cdf,B7
           MVKH    .S2     fcn_pass,B4
           MVKH    .S2     0xd9d7bdbb,B6

           MV      .L1     A4,A3             ; |67| 
||         LDW     .D1T1   *A14,A4           ; |68| 
||         MVKH    .S2     0x3ddb7cdf,B7

           CALLP   .S2     isequal,B3
||         STW     .D2T1   A3,*+B4(8)        ; |67| 
||         LDW     .D1T2   *+A14(12),B4      ; |68| 
||         MVK     .S1     0x777,A6          ; |68| 
||         MVK     .L1     0x1,A8            ; |68| 

$C$RL27:   ; CALL OCCURS {isequal} {0}       ; |68| 
           MVKL    .S2     fcn_pass,B4
           MVKL    .S2     0xd9d7bdbb,B6
           MVKL    .S2     0x3ddb7cdf,B7
           MVKH    .S2     fcn_pass,B4
           MVKH    .S2     0xd9d7bdbb,B6

           MV      .L1     A14,A5            ; |159| 
||         STW     .D2T1   A4,*+B4(12)       ; |68| 
||         LDW     .D1T2   *+A14(16),B4      ; |69| 
||         MVKH    .S2     0x3ddb7cdf,B7

           CALLP   .S2     isequal,B3
||         LDW     .D1T1   *A5,A4            ; |69| 
||         MVK     .S1     0x777,A6          ; |69| 
||         MVK     .L1     0x1,A8            ; |69| 

$C$RL28:   ; CALL OCCURS {isequal} {0}       ; |69| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 11
           LDW     .D2T2   *B11,B0           ; |72| 
           MVKL    .S2     fcn_pass,B4
           MVKH    .S2     fcn_pass,B4
           STW     .D2T1   A4,*+B4(16)       ; |69| 
           NOP             1

   [!B0]   B       .S1     $C$L13            ; |72| 
||         MV      .L2     B0,B1             ; guard predicate rewrite
|| [!B0]   ZERO    .L1     A3                ; |72| 

   [!B0]   CALL    .S1     print_test_results ; |163| 
|| [ B0]   LDW     .D2T2   *B10,B0           ; |72| 

   [ B1]   ADD     .L2     4,B10,B4
           NOP             3
           ; BRANCHCC OCCURS {$C$L13}        ; |72| 
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
           NOP             4
;** --------------------------------------------------------------------------*
$C$L13:    
;          EXCLUSIVE CPU CYCLES: 1

           MVK     .L1     0x4,A4            ; |163| 
||         STW     .D1T1   A3,*A15           ; |72| 
||         ADDKPC  .S2     $C$RL29,B3,0      ; |163| 

$C$RL29:   ; CALL OCCURS {print_test_results} {0}  ; |163| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 16
           ZERO    .L2     B4                ; |114| 

           STW     .D2T2   B4,*+SP(16)       ; |114| 
||         ZERO    .L2     B6                ; |114| 
||         MVKL    .S1     cycle_counts+24,A3

           MVKH    .S1     cycle_counts+24,A3
||         STW     .D2T2   B6,*+SP(12)       ; |114| 
||         ZERO    .L2     B5                ; |114| 
||         ZERO    .S2     B7                ; |114| 

           MVC     .S2     B5,TSCL           ; |115| 
||         STDW    .D1T2   B7:B6,*A3         ; |114| 

           MVC     .S2     TSCL,B6           ; |116| 
           MVC     .S2     TSCH,B7           ; |116| 
           MVKL    .S1     t_start,A3
           MVKH    .S1     t_start,A3

           MVC     .S2     TSCL,B4           ; |117| 
||         STDW    .D1T2   B7:B6,*A3         ; |116| 

           MVC     .S2     TSCH,B8           ; |117| 

           SUBU    .L2     B4,B6,B5:B4       ; |117| 
||         MVKL    .S1     t_offset,A3

           CALL    .S1     gimme_random      ; |173| 
||         EXT     .S2     B5,24,24,B6       ; |117| 
||         SUB     .L2     B8,B7,B31         ; |117| 

           ADD     .L2     B31,B6,B5         ; |117| 
||         MVKH    .S1     t_offset,A3

           MVK     .S2     0x80,B4
||         STDW    .D1T2   B5:B4,*A3         ; |117| 

           ZERO    .L2     B5
||         ZERO    .L1     A12
||         MVKL    .S1     0x408f4800,A5

           ZERO    .L2     B4                ; |173| 
||         MV      .L1X    B4,A11            ; |117| 
||         MVKH    .S2     0xbff00000,B5
||         MVKH    .S1     0x408f4800,A5
||         ZERO    .D1     A4                ; |173| 

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L14:    
;          EXCLUSIVE CPU CYCLES: 1
           ADDKPC  .S2     $C$RL30,B3,0      ; |173| 
$C$RL30:   ; CALL OCCURS {gimme_random} {0}  ; |173| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 147
           MVKL    .S1     input,A14
           MVKH    .S1     input,A14
           LDW     .D1T1   *A14,A3           ; |173| 
           NOP             4
           ADD     .L1     A12,A3,A3         ; |173| 

           STDW    .D1T1   A5:A4,*A3         ; |173| 
||         MVC     .S2     TSCL,B6           ; |122| 

           MVC     .S2     TSCH,B7           ; |122| 

           RSQRDP  .S1     A5:A4,A7:A6       ; |59| 
||         ZERO    .L2     B5
||         ZERO    .S2     B4                ; |59| 
||         ZERO    .L1     A31
||         ZERO    .D2     B31
||         ZERO    .D1     A30

           SET     .S2     B5,0x15,0x1d,B5
||         ZERO    .L2     B30
||         ZERO    .D2     B11
||         ADDAD   .D1     A13,1,A3
||         MVK     .L1     0xffffffff,A28

           MPYDP   .M1     A7:A6,A5:A4,A9:A8 ; |59| 
||         SET     .S2     B11,0x15,0x1d,B11
||         ZERO    .L2     B10               ; |60| 
||         LDW     .D1T1   *A3,A3            ; |177| 
||         MVKL    .S1     0x7fefffff,A27

           MPYDP   .M2X    B5:B4,A7:A6,B5:B4 ; |59| 
||         MVKH    .S1     0x7fefffff,A27
||         MVKL    .S2     t_start,B29

           MVKH    .S2     t_start,B29
           STDW    .D2T2   B7:B6,*B29
           NOP             1
           ADD     .L1     A12,A3,A29        ; |177| 
           NOP             6
           MPYDP   .M1X    B5:B4,A9:A8,A17:A16 ; |59| 
           NOP             2

           ZERO    .L1     A8                ; |59| 
||         SET     .S1     A31,0x13,0x1d,A9
||         ZERO    .L2     B4                ; |59| 
||         SET     .S2     B31,0x15,0x1d,B5

           NOP             6
           SUBDP   .L1     A9:A8,A17:A16,A9:A8 ; |59| 
           NOP             6
           MPYDP   .M1     A7:A6,A9:A8,A7:A6 ; |59| 
           NOP             9
           MPYDP   .M1     A7:A6,A5:A4,A9:A8 ; |59| 
           MPYDP   .M2X    B5:B4,A7:A6,B5:B4 ; |59| 
           NOP             9
           MPYDP   .M2X    B5:B4,A9:A8,B9:B8 ; |59| 
           NOP             2

           ZERO    .L2     B4                ; |59| 
||         SET     .S2     B30,0x13,0x1d,B5

           NOP             6
           SUBDP   .L2     B5:B4,B9:B8,B5:B4 ; |59| 
           NOP             7
           MPYDP   .M1X    A7:A6,B5:B4,A7:A6 ; |59| 
           NOP             9
           MPYDP   .M1     A7:A6,A5:A4,A9:A8 ; |60| 
           MPYDP   .M2X    B11:B10,A7:A6,B5:B4 ; |60| 
           NOP             9
           MPYDP   .M2X    B5:B4,A9:A8,B5:B4 ; |60| 
           NOP             2

           MV      .L1X    B10,A8            ; |60| 
||         SET     .S1     A30,0x13,0x1d,A9

           NOP             7
           SUBDP   .L1X    A9:A8,B5:B4,A9:A8 ; |60| 
           NOP             6
           MPYDP   .M1     A7:A6,A9:A8,A7:A6 ; |60| 
           NOP             2
           ZERO    .L1     A9:A8             ; |62| 
           CMPLTDP .S1     A5:A4,A9:A8,A0    ; |62| 
           NOP             5

   [ A0]   MV      .L1     A27,A7            ; |63| 
|| [ A0]   MV      .S1     A28,A6            ; |63| 

           STDW    .D1T1   A7:A6,*A29        ; |177| 
||         MVC     .S2     TSCL,B8           ; |128| 

           MVC     .S2     TSCH,B9           ; |128| 

           MVKL    .S2     t_offset,B4
||         MVKL    .S1     cycle_counts+24,A3
||         SUB     .L1     A11,1,A0          ; |171| 

           MVKH    .S2     t_offset,B4
||         MVKH    .S1     cycle_counts+24,A3

           LDDW    .D2T2   *B4,B17:B16       ; |130| 
||         LDDW    .D1T1   *A3,A5:A4         ; |130| 
||         MVKL    .S2     t_stop,B28
||         MV      .L1     A3,A15            ; |130| 

           MVKH    .S2     t_stop,B28
           STDW    .D2T2   B9:B8,*B28        ; |128| 
           NOP             2
           ADDU    .L2     B16,B6,B5:B4      ; |130| 
           MV      .L2     B4,B6             ; |130| 

           ADD     .S2     B5,B17,B6         ; |130| 
||         SUBU    .L2     B8,B6,B5:B4       ; |130| 
|| [ A0]   B       .S1     $C$L14            ; |171| 

           ADD     .D2     B6,B7,B6          ; |130| 
|| [ A0]   CALL    .S1     gimme_random      ; |173| 
||         EXT     .S2     B5,24,24,B16      ; |130| 
||         ADDU    .L2X    A4,B4,B5:B4       ; |130| 
|| [ A0]   ZERO    .L1     A4                ; |173| 

           SUB     .L2     B9,B6,B7          ; |130| 
||         ADD     .S2X    B5,A5,B5          ; |130| 
||         MV      .D2     B4,B6             ; |130| 
|| [ A0]   MVKL    .S1     0x408f4800,A5

           ADD     .L2     B7,B16,B7         ; |130| 
|| [ A0]   MVKH    .S1     0x408f4800,A5
|| [ A0]   ZERO    .S2     B4                ; |173| 

           ADD     .L2     B5,B7,B7          ; |130| 
|| [ A0]   ZERO    .S2     B5

           STDW    .D1T2   B7:B6,*A15        ; |130| 
||         ADD     .L1     8,A12,A12         ; |171| 
||         SUB     .S1     A11,1,A11         ; |171| 
|| [ A0]   MVKH    .S2     0xbff00000,B5

           ; BRANCHCC OCCURS {$C$L14}        ; |171| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 6

           CALLP   .S2     __c6xabi_fltllif,B3
||         LDDW    .D1T1   *A15,A5:A4        ; |135| 

$C$RL31:   ; CALL OCCURS {__c6xabi_fltllif} {0}  ; |135| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 15
           ZERO    .L1     A11
           SET     .S1     A11,0x1a,0x1d,A11
           MPYSP   .M1     A11,A4,A3         ; |135| 
           MV      .L1X    B11,A13           ; |135| 
           ZERO    .L1     A12               ; |135| 
           NOP             1
           SPDP    .S1     A3,A5:A4          ; |135| 
           NOP             1
           ADDDP   .L1     A13:A12,A5:A4,A5:A4 ; |135| 
           CALLP   .S2     __c6xabi_fixdlli,B3
$C$RL32:   ; CALL OCCURS {__c6xabi_fixdlli} {0}  ; |135| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 21
           MV      .L2X    A15,B4
           MV      .L2X    A12,B6

           MVK     .S2     24,B10
||         MV      .L2X    A12,B7

           SUB     .L2X    A15,B10,B10
||         ZERO    .S2     B5                ; |115| 
||         STDW    .D2T1   A5:A4,*B4         ; |135| 

           STDW    .D2T2   B7:B6,*B10        ; |114| 
||         MVC     .S2     B5,TSCL           ; |115| 

           MVC     .S2     TSCL,B8           ; |116| 
           MVC     .S2     TSCH,B4           ; |116| 
           MVKL    .S1     t_start,A15

           MVKH    .S1     t_start,A15
||         MV      .L2     B4,B9             ; |116| 

           STDW    .D1T2   B9:B8,*A15        ; |116| 
||         MVC     .S2     TSCL,B4           ; |117| 

           MVC     .S2     TSCH,B6           ; |117| 

           SUBU    .L2     B4,B8,B5:B4       ; |117| 
||         MVKL    .S2     t_offset,B11

           EXT     .S2     B5,24,24,B6       ; |117| 
||         SUB     .L2     B6,B9,B5          ; |117| 

           ADD     .L2     B5,B6,B5          ; |117| 
||         MVKH    .S2     t_offset,B11

           STDW    .D2T2   B5:B4,*B11        ; |117| 
           LDW     .D1T1   *A14,A3           ; |185| 
           MVK     .S2     0x80,B31
           ZERO    .L1     A12
           STW     .D2T2   B31,*+SP(20)      ; |117| 
           NOP             1

           CALL    .S1     rsqrt             ; |185| 
||         ADD     .L1     A12,A3,A3         ; |185| 

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L15:    
;          EXCLUSIVE CPU CYCLES: 5
           LDDW    .D1T1   *A3,A5:A4         ; |185| 
           ADDKPC  .S2     $C$RL33,B3,3      ; |185| 
$C$RL33:   ; CALL OCCURS {rsqrt} {0}         ; |185| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 19
           MVKL    .S2     output,B4
           MVKH    .S2     output,B4
           LDW     .D2T2   *B4,B4            ; |185| 
           NOP             4

           ADD     .L1X    A12,B4,A3         ; |185| 
||         LDW     .D2T2   *+SP(20),B4       ; |185| 

           ADD     .L1     8,A12,A12         ; |184| 
           STDW    .D1T1   A5:A4,*A3         ; |185| 
           NOP             2

           SUB     .L1X    B4,1,A0           ; |184| 
||         SUB     .L2     B4,1,B4           ; |184| 

   [ A0]   BNOP    .S1     $C$L15,4          ; |184| 
|| [ A0]   LDW     .D1T1   *A14,A3           ; |185| 
||         STW     .D2T2   B4,*+SP(20)       ; |185| 

   [ A0]   CALL    .S1     rsqrt             ; |185| 
||         ADD     .L1     A12,A3,A3         ; |185| 

           ; BRANCHCC OCCURS {$C$L15}        ; |184| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 18
           MVC     .S2     TSCL,B8           ; |128| 
           MVC     .S2     TSCH,B4           ; |128| 

           LDDW    .D1T1   *A15,A5:A4        ; |130| 
||         LDDW    .D2T2   *B11,B7:B6        ; |130| 

           MVKL    .S2     t_stop,B30
           MV      .L2     B4,B9             ; |128| 
           MVKH    .S2     t_stop,B30
           NOP             1
           ADDU    .L1X    B6,A4,A7:A6       ; |130| 

           ADD     .L1X    A7,B7,A4          ; |130| 
||         LDDW    .D2T2   *B10,B7:B6        ; |130| 

           ADD     .L1     A4,A5,A3          ; |130| 
||         SUBU    .L2X    B8,A6,B5:B4       ; |130| 

           EXT     .S2     B5,24,24,B16      ; |130| 
           SUB     .L2X    B9,A3,B31         ; |130| 
           CALL    .S1     __c6xabi_fltllif  ; |130| 

           ADDU    .L2     B6,B4,B5:B4       ; |130| 
||         ADD     .S2     B31,B16,B6        ; |130| 

           ADD     .L2     B5,B7,B5          ; |130| 

           MV      .L1X    B4,A4             ; |130| 
||         ADD     .L2     B5,B6,B4          ; |130| 

           STDW    .D2T2   B9:B8,*B30        ; |128| 

           MV      .L1X    B4,A5             ; |130| 
||         ADDKPC  .S2     $C$RL34,B3,0      ; |130| 

$C$RL34:   ; CALL OCCURS {__c6xabi_fltllif} {0}  ; |130| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 13
           MPYSP   .M1     A11,A4,A3         ; |130| 
           ZERO    .L1     A12               ; |130| 
           NOP             2
           SPDP    .S1     A3,A5:A4          ; |130| 
           NOP             1
           ADDDP   .L1     A13:A12,A5:A4,A5:A4 ; |130| 
           CALLP   .S2     __c6xabi_fixdlli,B3
$C$RL35:   ; CALL OCCURS {__c6xabi_fixdlli} {0}  ; |130| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 17
           MV      .L2X    A12,B4            ; |130| 

           MV      .L2X    A12,B5            ; |130| 
||         STDW    .D2T1   A5:A4,*B10        ; |130| 

           STDW    .D2T2   B5:B4,*+B10(8)    ; |114| 
||         MVC     .S2     B4,TSCL           ; |115| 

           MVC     .S2     TSCL,B4           ; |116| 
           MVC     .S2     TSCH,B5           ; |116| 

           STDW    .D1T2   B5:B4,*A15        ; |116| 
||         MVC     .S2     TSCL,B6           ; |117| 

           MVC     .S2     TSCH,B7           ; |117| 
           SUBU    .L2     B6,B4,B9:B8       ; |117| 

           EXT     .S2     B9,24,24,B6       ; |117| 
||         SUB     .L2     B7,B5,B5          ; |117| 

           ADD     .L2     B5,B6,B5          ; |117| 
||         MV      .S2     B8,B4             ; |117| 

           STDW    .D2T2   B5:B4,*B11        ; |117| 
           LDW     .D1T1   *A14,A3           ; |193| 
           MVK     .S2     0x80,B31
           STW     .D2T2   B31,*+SP(20)      ; |117| 
           NOP             2

           CALL    .S1     rsqrtdp           ; |193| 
||         ADD     .L1     A12,A3,A3         ; |193| 

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L16:    
;          EXCLUSIVE CPU CYCLES: 5
           LDDW    .D1T1   *A3,A5:A4         ; |193| 
           ADDKPC  .S2     $C$RL36,B3,3      ; |193| 
$C$RL36:   ; CALL OCCURS {rsqrtdp} {0}       ; |193| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 17
           LDW     .D2T2   *B13,B4           ; |193| 
           NOP             4

           ADD     .L1X    A12,B4,A3         ; |193| 
||         LDW     .D2T2   *+SP(20),B4       ; |193| 

           ADD     .L1     8,A12,A12         ; |192| 
           STDW    .D1T1   A5:A4,*A3         ; |193| 
           NOP             2

           SUB     .L1X    B4,1,A0           ; |192| 
||         SUB     .L2     B4,1,B4           ; |192| 

   [ A0]   BNOP    .S1     $C$L16,4          ; |192| 
|| [ A0]   LDW     .D1T1   *A14,A3           ; |193| 
||         STW     .D2T2   B4,*+SP(20)       ; |193| 

   [ A0]   CALL    .S1     rsqrtdp           ; |193| 
||         ADD     .L1     A12,A3,A3         ; |193| 

           ; BRANCHCC OCCURS {$C$L16}        ; |192| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 17
           MVC     .S2     TSCL,B8           ; |128| 
           MVC     .S2     TSCH,B4           ; |128| 

           MV      .L2     B11,B13           ; |130| 
||         LDDW    .D1T1   *A15,A5:A4        ; |130| 

           LDDW    .D2T2   *B13,B7:B6        ; |130| 
           MV      .L2     B4,B9             ; |128| 
           LDDW    .D2T2   *+B10(8),B5:B4    ; |130| 
           MVKL    .S2     t_stop,B31
           MVKH    .S2     t_stop,B31
           ADDU    .L1X    B6,A4,A7:A6       ; |130| 
           ADD     .L1X    A7,B7,A4          ; |130| 

           ADD     .L1     A4,A5,A3          ; |130| 
||         SUBU    .L2X    B8,A6,B7:B6       ; |130| 

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
||         ADDKPC  .S2     $C$RL37,B3,0      ; |130| 

$C$RL37:   ; CALL OCCURS {__c6xabi_fltllif} {0}  ; |130| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 13
           MPYSP   .M1     A11,A4,A3         ; |130| 
           ZERO    .L1     A12               ; |130| 
           NOP             2
           SPDP    .S1     A3,A5:A4          ; |130| 
           NOP             1
           ADDDP   .L1     A13:A12,A5:A4,A5:A4 ; |130| 
           CALLP   .S2     __c6xabi_fixdlli,B3
$C$RL38:   ; CALL OCCURS {__c6xabi_fixdlli} {0}  ; |130| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 17

           ADDAD   .D2     B10,1,B11
||         MV      .L2X    A12,B5

           MV      .L2X    A12,B4
||         STDW    .D2T1   A5:A4,*B11        ; |130| 

           STDW    .D2T2   B5:B4,*+B10(16)   ; |114| 
||         MVC     .S2     B4,TSCL           ; |115| 

           MVC     .S2     TSCL,B4           ; |116| 
           MVC     .S2     TSCH,B5           ; |116| 

           STDW    .D1T2   B5:B4,*A15        ; |116| 
||         MVC     .S2     TSCL,B6           ; |117| 

           MVC     .S2     TSCH,B8           ; |117| 
           SUBU    .L2     B6,B4,B7:B6       ; |117| 

           SUB     .L2     B8,B5,B4          ; |117| 
||         EXT     .S2     B7,24,24,B5       ; |117| 

           ADD     .L2     B4,B5,B7          ; |117| 
           STDW    .D2T2   B7:B6,*B13        ; |117| 
           LDW     .D1T1   *A14,A3           ; |201| 
           MVK     .S2     0x80,B31
           STW     .D2T2   B31,*+SP(20)      ; |117| 
           NOP             2

           CALL    .S1     rsqrtdp_c         ; |201| 
||         ADD     .L1     A12,A3,A3         ; |201| 

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L17:    
;          EXCLUSIVE CPU CYCLES: 5
           LDDW    .D1T1   *A3,A5:A4         ; |201| 
           ADDKPC  .S2     $C$RL39,B3,3      ; |201| 
$C$RL39:   ; CALL OCCURS {rsqrtdp_c} {0}     ; |201| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 17
           LDW     .D2T2   *B12,B4           ; |201| 
           NOP             4

           ADD     .L1X    A12,B4,A3         ; |201| 
||         LDW     .D2T2   *+SP(20),B4       ; |201| 

           ADD     .L1     8,A12,A12         ; |200| 
           STDW    .D1T1   A5:A4,*A3         ; |201| 
           NOP             2

           SUB     .L1X    B4,1,A0           ; |200| 
||         SUB     .L2     B4,1,B4           ; |200| 

   [ A0]   BNOP    .S1     $C$L17,4          ; |200| 
|| [ A0]   LDW     .D1T1   *A14,A3           ; |201| 
||         STW     .D2T2   B4,*+SP(20)       ; |201| 

   [ A0]   CALL    .S1     rsqrtdp_c         ; |201| 
||         ADD     .L1     A12,A3,A3         ; |201| 

           ; BRANCHCC OCCURS {$C$L17}        ; |200| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 16
           MVC     .S2     TSCL,B8           ; |128| 
           MVC     .S2     TSCH,B5           ; |128| 

           MV      .L2     B13,B4            ; |128| 
||         LDDW    .D1T1   *A15,A5:A4        ; |130| 

           LDDW    .D2T2   *B4,B7:B6         ; |130| 
           LDDW    .D2T2   *+B10(16),B17:B16 ; |130| 
           MV      .L2     B5,B9             ; |128| 
           NOP             2
           ADDU    .L2X    B6,A4,B5:B4       ; |130| 

           ADD     .S2     B5,B7,B6          ; |130| 
||         SUBU    .L2     B8,B4,B5:B4       ; |130| 

           ADD     .D2X    B6,A5,B6          ; |130| 
||         CALL    .S1     __c6xabi_fltllif  ; |130| 
||         EXT     .S2     B5,24,24,B7       ; |130| 
||         ADDU    .L2     B16,B4,B5:B4      ; |130| 

           SUB     .L2     B9,B6,B6          ; |130| 
||         ADD     .S2     B5,B17,B31        ; |130| 

           ADD     .L2     B6,B7,B5          ; |130| 
||         MV      .L1X    B4,A4             ; |130| 
||         MVKL    .S2     t_stop,B6

           ADD     .L2     B31,B5,B4         ; |130| 
||         MVKH    .S2     t_stop,B6

           STDW    .D2T2   B9:B8,*B6         ; |128| 

           MV      .L1X    B4,A5             ; |130| 
||         ADDKPC  .S2     $C$RL40,B3,0      ; |130| 

$C$RL40:   ; CALL OCCURS {__c6xabi_fltllif} {0}  ; |130| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 105
           MPYSP   .M1     A11,A4,A3         ; |130| 
           ZERO    .L1     A12               ; |130| 
           NOP             3
           SPDP    .S2X    A3,B5:B4          ; |130| 
           NOP             2
           ADDDP   .L1X    A13:A12,B5:B4,A5:A4 ; |130| 
           CALLP   .S2     __c6xabi_fixdlli,B3
$C$RL41:   ; CALL OCCURS {__c6xabi_fixdlli} {0}  ; |130| 

           ADDAD   .D2     B11,1,B13
||         MV      .L2X    A12,B5

           MV      .L2X    A12,B4
||         STDW    .D2T1   A5:A4,*B13        ; |130| 

           STDW    .D2T2   B5:B4,*+B10(32)   ; |114| 
||         MVC     .S2     B4,TSCL           ; |115| 

           MVC     .S2     TSCL,B4           ; |116| 
           MVC     .S2     TSCH,B5           ; |116| 

           STDW    .D1T2   B5:B4,*A15        ; |116| 
||         MVC     .S2     TSCL,B6           ; |117| 

           MVC     .S2     TSCH,B8           ; |117| 

           SUBU    .L2     B6,B4,B7:B6       ; |117| 
||         MVKL    .S2     t_offset,B10

           EXT     .S2     B7,24,24,B7       ; |117| 
||         SUB     .L2     B8,B5,B5          ; |117| 

           LDW     .D2T2   *+B12(8),B4       ; |208| 
||         ADD     .L2     B5,B7,B7          ; |117| 
||         MVKH    .S2     t_offset,B10

           CALLP   .S2     rsqrtdp_v,B3
||         LDW     .D1T1   *A14,A4           ; |208| 
||         STDW    .D2T2   B7:B6,*B10        ; |117| 
||         MVK     .S1     0x80,A6           ; |208| 

$C$RL42:   ; CALL OCCURS {rsqrtdp_v} {0}     ; |208| 
           MVC     .S2     TSCL,B8           ; |128| 
           MVC     .S2     TSCH,B4           ; |128| 

           LDDW    .D1T1   *A15,A7:A6        ; |130| 
||         LDDW    .D2T2   *B10,B7:B6        ; |130| 

           MVK     .S1     16,A14
           ADD     .L1X    B13,A14,A14
           MVKL    .S1     t_stop,A3

           LDDW    .D1T1   *A14,A9:A8        ; |130| 
||         MVKH    .S1     t_stop,A3

           ADDU    .L1X    B6,A6,A5:A4       ; |130| 

           MV      .L2     B4,B9             ; |128| 
||         MV      .S2X    A3,B4             ; |128| 
||         ADD     .L1X    A5,B7,A3          ; |130| 

           SUBU    .L1X    B8,A4,A17:A16     ; |130| 

           ADD     .L1     A3,A7,A3          ; |130| 
||         EXT     .S1     A17,24,24,A6      ; |130| 

           SUB     .S1X    B9,A3,A3          ; |130| 
||         ADDU    .L1     A8,A16,A5:A4      ; |130| 

           ADD     .L1     A5,A9,A3          ; |130| 
||         ADD     .S1     A3,A6,A5          ; |130| 

           CALLP   .S2     __c6xabi_fltllif,B3
||         ADD     .L1     A3,A5,A5          ; |130| 
||         STDW    .D2T2   B9:B8,*B4         ; |128| 

$C$RL43:   ; CALL OCCURS {__c6xabi_fltllif} {0}  ; |130| 
           MPYSP   .M1     A11,A4,A3         ; |130| 
           NOP             3
           SPDP    .S1     A3,A5:A4          ; |130| 
           NOP             1
           ADDDP   .L1     A13:A12,A5:A4,A5:A4 ; |130| 
           CALLP   .S2     __c6xabi_fixdlli,B3
$C$RL44:   ; CALL OCCURS {__c6xabi_fixdlli} {0}  ; |130| 

           MVKL    .S1     output,A3
||         MVKL    .S2     0xd9d7bdbb,B6

           MVKH    .S1     output,A3
||         MVKL    .S2     0x3ddb7cdf,B7

           MV      .L1     A3,A11            ; |130| 
||         STDW    .D1T1   A5:A4,*A14        ; |130| 
||         MVKH    .S2     0xd9d7bdbb,B6

           LDW     .D1T1   *A11,A4           ; |66| 
||         MVKH    .S2     0x3ddb7cdf,B7

           CALLP   .S2     isequal,B3
||         LDW     .D1T2   *+A11(4),B4       ; |66| 
||         MVK     .S1     0x80,A6           ; |66| 
||         MVK     .L1     0x1,A8            ; |66| 

$C$RL45:   ; CALL OCCURS {isequal} {0}       ; |66| 
           MVKL    .S2     0x3ddb7cdf,B7
           MVKL    .S2     0xd9d7bdbb,B6
           MVKL    .S2     fcn_pass,B10
           MVKH    .S2     0x3ddb7cdf,B7
           MVKH    .S2     0xd9d7bdbb,B6

           MV      .L1     A4,A3             ; |66| 
||         LDW     .D1T1   *A11,A4           ; |67| 
||         MVKH    .S2     fcn_pass,B10

           CALLP   .S2     isequal,B3
||         LDW     .D1T2   *+A11(8),B4       ; |67| 
||         STW     .D2T1   A3,*+B10(4)       ; |66| 
||         MVK     .S1     0x80,A6           ; |67| 
||         MVK     .L1     0x1,A8            ; |67| 

$C$RL46:   ; CALL OCCURS {isequal} {0}       ; |67| 
           MVKL    .S2     0xd9d7bdbb,B6
           MVKL    .S2     0x3ddb7cdf,B7

           MV      .L1     A4,A3             ; |67| 
||         MVKH    .S2     0xd9d7bdbb,B6

           LDW     .D1T2   *+A11(12),B4      ; |68| 
||         MVKH    .S2     0x3ddb7cdf,B7
||         STW     .D2T1   A3,*+B10(8)       ; |67| 

           CALLP   .S2     isequal,B3
||         LDW     .D1T1   *A11,A4           ; |68| 
||         MVK     .S1     0x80,A6           ; |68| 
||         MVK     .L1     0x1,A8            ; |68| 

$C$RL47:   ; CALL OCCURS {isequal} {0}       ; |68| 
           MVKL    .S2     0x3ddb7cdf,B7
           MVKL    .S2     0xd9d7bdbb,B6
           MVKH    .S2     0x3ddb7cdf,B7

           MV      .L2X    A11,B4            ; |68| 
||         STW     .D2T1   A4,*+B10(12)      ; |68| 
||         MVKH    .S2     0xd9d7bdbb,B6

           CALLP   .S2     isequal,B3
||         LDW     .D2T1   *B4,A4            ; |69| 
||         LDW     .D1T2   *+A11(16),B4      ; |69| 
||         MVK     .S1     0x80,A6           ; |69| 
||         MVK     .L1     0x1,A8            ; |69| 

$C$RL48:   ; CALL OCCURS {isequal} {0}       ; |69| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 16
           LDW     .D2T2   *+SP(24),B5       ; |69| 
           MV      .L2X    A4,B4             ; |69| 
           STW     .D2T2   B4,*+B10(16)      ; |69| 
           NOP             2
           LDW     .D2T2   *B5,B0            ; |72| 
           NOP             4

   [!B0]   BNOP    .S1     $C$L18,5          ; |72| 
|| [ B0]   LDW     .D1T1   *A10,A0           ; |72| 
|| [ B0]   ADD     .L1     4,A10,A3

           ; BRANCHCC OCCURS {$C$L18}        ; |72| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 15
   [ A0]   LDW     .D1T1   *A3,A3            ; |72| 
   [!A0]   MV      .L2X    A12,B0            ; |72| 
           CMPEQ   .L2     B4,0,B4           ; |72| 
           XOR     .L2     1,B4,B4           ; |72| 
           MVK     .L1     0x1,A4            ; |72| 
   [ A0]   CMPEQ   .L1     A3,0,A3           ; |72| 
   [ A0]   XOR     .L1     1,A3,A3           ; |72| 
           NOP             1
   [ A0]   AND     .L2X    B4,A3,B0          ; |72| 
   [ B0]   B       .S1     $C$L19            ; |72| 
   [ B0]   CALL    .S1     print_test_results ; |214| 
   [ B0]   MVKL    .S1     all_pass,A3
   [ B0]   MVKH    .S1     all_pass,A3
           NOP             2
           ; BRANCHCC OCCURS {$C$L19}        ; |72| 
;** --------------------------------------------------------------------------*
$C$L18:    
;          EXCLUSIVE CPU CYCLES: 5
           CALL    .S1     print_test_results ; |214| 
           MVKL    .S1     all_pass,A3
           MVKH    .S1     all_pass,A3
           MV      .L1     A12,A4
           NOP             1
;** --------------------------------------------------------------------------*
$C$L19:    
;          EXCLUSIVE CPU CYCLES: 1

           STW     .D1T1   A4,*A3            ; |72| 
||         MVK     .L1     0x2,A4            ; |214| 
||         ADDKPC  .S2     $C$RL49,B3,0      ; |214| 

$C$RL49:   ; CALL OCCURS {print_test_results} {0}  ; |214| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 30
           MVKL    .S2     $C$SL2+0,B4
           MVKH    .S2     $C$SL2+0,B4

           CALLP   .S2     printf,B3
||         STW     .D2T2   B4,*+SP(4)        ; |215| 

$C$RL50:   ; CALL OCCURS {printf} {0}        ; |215| 
           MVKL    .S2     $C$SL3+0,B4
           MVKH    .S2     $C$SL3+0,B4

           CALLP   .S2     printf,B3
||         STW     .D2T2   B4,*+SP(4)        ; |215| 

$C$RL51:   ; CALL OCCURS {printf} {0}        ; |215| 
           MVKL    .S1     $C$SL1+0,A10
           MVKH    .S1     $C$SL1+0,A10

           CALLP   .S2     print_profile_results,B3
||         MV      .L1     A10,A4            ; |222| 

$C$RL52:   ; CALL OCCURS {print_profile_results} {0}  ; |222| 

           CALLP   .S2     print_memory_results,B3
||         MV      .L1     A10,A4            ; |225| 

$C$RL53:   ; CALL OCCURS {print_memory_results} {0}  ; |225| 
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
$C$SL1:	.string	"rsqrtDP",0
$C$SL2:	.string	"----------------------------------------",0
$C$SL3:	.string	"----------------------------------------",10,0
;*****************************************************************************
;* UNDEFINED EXTERNAL REFERENCES                                             *
;*****************************************************************************
	.global	printf
	.global	rsqrt
	.global	driver_init
	.global	print_profile_results
	.global	print_memory_results
	.global	print_test_results
	.global	gimme_random
	.global	isequal
	.global	rsqrtdp
	.global	rsqrtdp_c
	.global	rsqrtdp_v
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
