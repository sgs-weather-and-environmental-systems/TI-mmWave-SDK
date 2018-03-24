;******************************************************************************
;* TMS320C6x C/C++ Codegen                                          PC v7.4.2 *
;* Date/Time created: Mon May 16 23:58:55 2016                                *
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

;	C:\MATHLIB_Tools\CCSV5_5_0\ccsv5\tools\compiler\c6000_7.4.2\bin\opt6x.exe C:\\Users\\gtbldadm\\AppData\\Local\\Temp\\012323 C:\\Users\\gtbldadm\\AppData\\Local\\Temp\\012325 
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
           STW     .D2T1   A11,*SP--(8)      ; |91| 
           STW     .D2T1   A10,*SP--(8)      ; |91| 
           STDW    .D2T2   B13:B12,*SP--     ; |91| 
           STDW    .D2T2   B11:B10,*SP--     ; |91| 
           STDW    .D2T1   A15:A14,*SP--     ; |91| 

           STDW    .D2T1   A13:A12,*SP--     ; |91| 
||         MVKL    .S1     $C$SL1+0,A4

           STW     .D2T2   B3,*SP--(48)      ; |91| 
||         CALLP   .S2     driver_init,B3
||         MVKH    .S1     $C$SL1+0,A4

$C$RL0:    ; CALL OCCURS {driver_init} {0}   ; |99| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 7

           MVKL    .S1     a,A14
||         MVKL    .S2     output,B4

           MVKH    .S1     a,A14
||         MVKH    .S2     output,B4

           MV      .L1     A14,A12
||         CALL    .S1     sqrt              ; |108| 
||         LDW     .D2T1   *B4,A11

           LDDW    .D1T1   *A12++,A5:A4      ; |108| 
           MVK     .L2     0xa,B4
           NOP             1
           MV      .L1X    B4,A10
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L1:    
;          EXCLUSIVE CPU CYCLES: 1
           ADDKPC  .S2     $C$RL1,B3,0       ; |108| 
$C$RL1:    ; CALL OCCURS {sqrt} {0}          ; |108| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 7

           SUB     .L1     A10,1,A0          ; |107| 
||         STDW    .D1T1   A5:A4,*A11++      ; |108| 
||         SUB     .S1     A10,1,A10         ; |107| 

   [!A0]   ZERO    .L2     B10
|| [ A0]   B       .S1     $C$L1             ; |107| 
|| [!A0]   MVKL    .S2     output,B4
|| [ A0]   LDDW    .D1T1   *A12++,A5:A4      ; |108| 

   [ A0]   CALL    .S1     sqrt              ; |108| 
|| [!A0]   MVKH    .S2     output,B4

   [!A0]   ADD     .L2     4,B4,B11
   [!A0]   MVK     .L2     0xa,B4
   [!A0]   MV      .L1     A14,A10
   [!A0]   MV      .L1X    B4,A11
           ; BRANCHCC OCCURS {$C$L1}         ; |107| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 1
           CALL    .S1     sqrtdp            ; |111| 
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L2:    
;          EXCLUSIVE CPU CYCLES: 5
           LDDW    .D1T1   *A10++,A5:A4      ; |111| 
           ADDKPC  .S2     $C$RL2,B3,3       ; |111| 
$C$RL2:    ; CALL OCCURS {sqrtdp} {0}        ; |111| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 7

           LDW     .D2T2   *B11,B4           ; |111| 
||         SUB     .L1     A11,1,A0          ; |110| 
||         SUB     .S1     A11,1,A11         ; |110| 

   [ A0]   BNOP    .S1     $C$L2,3           ; |110| 

           ADD     .L2     B10,B4,B4         ; |111| 
||         ADD     .S2     8,B10,B10         ; |110| 

   [ A0]   CALL    .S1     sqrtdp            ; |111| 
||         STDW    .D2T1   A5:A4,*B4         ; |111| 
|| [!A0]   MVK     .L2     0xa,B4

           ; BRANCHCC OCCURS {$C$L2}         ; |110| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 2

           ZERO    .L2     B10
||         MV      .L1     A14,A10
||         ADD     .S2     4,B11,B11

           MV      .L1X    B4,A11
||         CALL    .S1     sqrtdp_c          ; |114| 

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L3:    
;          EXCLUSIVE CPU CYCLES: 5
           LDDW    .D1T1   *A10++,A5:A4      ; |114| 
           ADDKPC  .S2     $C$RL3,B3,3       ; |114| 
$C$RL3:    ; CALL OCCURS {sqrtdp_c} {0}      ; |114| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 7

           LDW     .D2T2   *B11,B4           ; |114| 
||         SUB     .L1     A11,1,A0          ; |113| 
||         SUB     .S1     A11,1,A11         ; |113| 

   [ A0]   BNOP    .S1     $C$L3,2           ; |113| 
|| [!A0]   ADD     .L1X    4,B11,A3
|| [!A0]   ZERO    .D1     A7                ; |68| 

   [!A0]   STW     .D2T1   A3,*+SP(16)

           ADD     .L2     B10,B4,B4         ; |114| 
||         ADD     .S2     8,B10,B10         ; |113| 

   [ A0]   CALL    .S1     sqrtdp_c          ; |114| 
||         STDW    .D2T1   A5:A4,*B4         ; |114| 

           ; BRANCHCC OCCURS {$C$L3}         ; |113| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 2

           MVK     .L2     0xa,B1            ; |116| 
||         LDW     .D1T1   *A3,A3
||         SUB     .L1     A14,8,A6
||         ZERO    .S1     A10               ; |68| 

           MV      .L1     A7,A18
||         MVK     .S1     0xffffffff,A12    ; |75| 

;** --------------------------------------------------------------------------*
;**   BEGIN LOOP $C$L4
;** --------------------------------------------------------------------------*
$C$L4:    
;          EXCLUSIVE CPU CYCLES: 7

           ZERO    .L1     A11
||         LDDW    .D1T1   *++A6,A9:A8       ; |117| 

           ZERO    .L1     A4
           SET     .S1     A4,0x13,0x1d,A4
           SET     .S1     A11,0x15,0x1d,A11
           STW     .D2T1   A4,*+SP(24)       ; |68| 
           RSQRDP  .S1     A9:A8,A5:A4       ; |64| 
           MVK     .L2     0x3,B0            ; |67| 
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*
;*      Loop found in file               : C:/nightlybuilds/mathlib/ti/mathlib/src/sqrtdp/sqrtdp_d.c
;*      Loop inlined from                : ../../../../../../../ti/mathlib/src/sqrtdp/c674/sqrtdp_i.h
;*      Loop source line                 : 67
;*      Loop opening brace source line   : 67
;*      Loop closing brace source line   : 69
;*      Known Minimum Trip Count         : 3                    
;*      Known Maximum Trip Count         : 3                    
;*      Known Max Trip Count Factor      : 3
;*      Loop Carried Dependency Bound(^) : 50
;*      Unpartitioned Resource Bound     : 8
;*      Partitioned Resource Bound(*)    : 8
;*      Resource Partition:
;*                                A-side   B-side
;*      .L units                     0        0     
;*      .S units                     0        0     
;*      .D units                     0        0     
;*      .M units                     8*       8*    
;*      .X cross paths               4        2     
;*      .T address paths             0        0     
;*      Long read paths              0        0     
;*      Long write paths             0        0     
;*      Logical  ops (.LS)           2        0     (.L or .S unit)
;*      Addition ops (.LSD)          0        2     (.L or .S or .D unit)
;*      Bound(.L .S .LS)             1        0     
;*      Bound(.L .S .D .LS .LSD)     1        1     
;*
;*      Disqualified loop: Loop carried dependency bound too large
;*----------------------------------------------------------------------------*
$C$L5:    
;          EXCLUSIVE CPU CYCLES: 47
           MPYDP   .M1     A5:A4,A9:A8,A17:A16 ; |68| 
           LDW     .D2T1   *+SP(24),A19
           SUB     .L2     B0,1,B0           ; |67| 
           NOP             7
           MPYDP   .M1     A5:A4,A17:A16,A17:A16 ; |68| 
           NOP             9
           MPYDP   .M1     A11:A10,A17:A16,A17:A16 ; |68| 
           NOP             9
           SUBDP   .L1     A19:A18,A17:A16,A17:A16 ; |68| 
           NOP             6
           MPYDP   .M1     A17:A16,A5:A4,A5:A4 ; |68| 
           NOP             3
   [ B0]   BNOP    .S1     $C$L5,5           ; |67| 
           ; BRANCHCC OCCURS {$C$L5}         ; |67| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 13

           MVKL    .S1     0x7fefffff,A13
||         ZERO    .L2     B5:B4             ; |72| 
||         MPYDP   .M1     A5:A4,A9:A8,A5:A4 ; |70| 

           SUB     .L2     B1,1,B1           ; |116| 
           CMPGTDP .S2X    A9:A8,B5:B4,B0    ; |72| 
           MVKH    .S1     0x7fefffff,A13
   [!B1]   MVKL    .S1     output,A10
   [!B1]   MVKH    .S1     output,A10
           CMPGTDP .S1     A9:A8,A13:A12,A0  ; |75| 
   [ B1]   BNOP    .S2     $C$L4,2           ; |116| 
   [!B0]   ZERO    .L1     A5:A4             ; |73| 

   [ A0]   MV      .L1     A13,A5            ; |76| 
|| [ A0]   MV      .S1     A12,A4            ; |73| 

   [!B1]   CALL    .S1     sqrtdp_v          ; |119| 
||         STDW    .D1T1   A5:A4,*A3++       ; |117| 

           ; BRANCHCC OCCURS {$C$L4}         ; |116| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           LDW     .D1T2   *+A10(16),B4      ; |119| 
           MV      .L1     A14,A4            ; |119| 
           MVK     .L1     0xa,A6            ; |119| 
           ADDKPC  .S2     $C$RL4,B3,1       ; |119| 
$C$RL4:    ; CALL OCCURS {sqrtdp_v} {0}      ; |119| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 48
           MVKL    .S2     0x3d3c25c2,B7
           MVKL    .S2     0x68497682,B6
           MVKH    .S2     0x3d3c25c2,B7

           LDW     .D1T1   *A10,A4           ; |66| 
||         MVKH    .S2     0x68497682,B6

           CALLP   .S2     isequal,B3
||         LDW     .D1T2   *+A10(4),B4       ; |66| 
||         MVK     .L1     0xa,A6            ; |66| 
||         MVK     .S1     0x1,A8            ; |66| 

$C$RL5:    ; CALL OCCURS {isequal} {0}       ; |66| 
           MVKL    .S2     fcn_pass,B4
           MVKL    .S2     0x68497682,B6
           MVKL    .S2     0x3d3c25c2,B7
           MVKH    .S2     fcn_pass,B4
           MVKH    .S2     0x68497682,B6

           MV      .L1     A4,A3             ; |66| 
||         LDW     .D1T1   *A10,A4           ; |67| 
||         MVKH    .S2     0x3d3c25c2,B7

           CALLP   .S2     isequal,B3
||         STW     .D2T1   A3,*+B4(4)        ; |66| 
||         LDW     .D1T2   *+A10(8),B4       ; |67| 
||         MVK     .L1     0xa,A6            ; |67| 
||         MVK     .S1     0x1,A8            ; |67| 

$C$RL6:    ; CALL OCCURS {isequal} {0}       ; |67| 
           MVKL    .S2     fcn_pass,B4
           MVKL    .S2     0x68497682,B6
           MVKL    .S2     0x3d3c25c2,B7
           MVKH    .S2     fcn_pass,B4
           MVKH    .S2     0x68497682,B6

           MV      .L1     A10,A3            ; |67| 
||         STW     .D2T1   A4,*+B4(8)        ; |67| 
||         LDW     .D1T2   *+A10(12),B4      ; |68| 
||         MVKH    .S2     0x3d3c25c2,B7

           CALLP   .S2     isequal,B3
||         LDW     .D1T1   *A3,A4            ; |68| 
||         MVK     .L1     0xa,A6            ; |68| 
||         MVK     .S1     0x1,A8            ; |68| 

$C$RL7:    ; CALL OCCURS {isequal} {0}       ; |68| 
           LDW     .D2T1   *+SP(16),A3       ; |68| 
           MVKL    .S2     fcn_pass,B5
           MVKL    .S2     0x68497682,B6
           MVKH    .S2     fcn_pass,B5
           STW     .D2T1   A4,*+B5(12)       ; |68| 

           MVKL    .S2     0x3d3c25c2,B7
||         ADD     .L2X    4,A3,B4

           MV      .L2X    A10,B5            ; |69| 
||         STW     .D2T2   B4,*+SP(28)
||         MVKH    .S2     0x68497682,B6

           LDW     .D2T1   *B5,A4            ; |69| 
||         MVKH    .S2     0x3d3c25c2,B7

           CALLP   .S2     isequal,B3
||         LDW     .D2T2   *B4,B4            ; |69| 
||         MVK     .L1     0xa,A6            ; |69| 
||         MVK     .S1     0x1,A8            ; |69| 

$C$RL8:    ; CALL OCCURS {isequal} {0}       ; |69| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 15
           MVKL    .S1     fcn_pass,A3
           MVKH    .S1     fcn_pass,A3
           NOP             1
           ADD     .L2X    4,A3,B11
           LDW     .D2T2   *B11,B0           ; |72| 
           ADD     .L2X    8,A3,B10
           MV      .L2X    A3,B4             ; |72| 
           STW     .D2T1   A4,*+B4(16)       ; |69| 
           NOP             1

   [!B0]   B       .S2     $C$L6             ; |72| 
|| [!B0]   MVKL    .S1     all_pass,A3
||         MV      .L2     B0,B1             ; guard predicate rewrite
|| [!B0]   ZERO    .D2     B4                ; |72| 

   [!B0]   CALL    .S2     print_test_results ; |123| 
|| [!B0]   MVKH    .S1     all_pass,A3
|| [ B0]   LDW     .D2T2   *B10,B0           ; |72| 

   [ B1]   ADD     .L2     4,B10,B4
           NOP             3
           ; BRANCHCC OCCURS {$C$L6}         ; |72| 
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
||         MVK     .L2     0x1,B4            ; |72| 

   [!A0]   ZERO    .L2     B4                ; |72| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           CALL    .S1     print_test_results ; |123| 
           MVKL    .S1     all_pass,A3
           MVKH    .S1     all_pass,A3
           NOP             2
;** --------------------------------------------------------------------------*
$C$L6:    
;          EXCLUSIVE CPU CYCLES: 1

           MVK     .L1     0x1,A4            ; |123| 
||         STW     .D1T2   B4,*A3            ; |72| 
||         ADDKPC  .S2     $C$RL9,B3,0       ; |123| 

$C$RL9:    ; CALL OCCURS {print_test_results} {0}  ; |123| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 12

           MVKL    .S2     a_sc,B4
||         MV      .L2X    A12,B7            ; |131| 

           MVKH    .S2     a_sc,B4
||         ZERO    .L2     B13
||         MV      .D2X    A12,B6            ; |131| 

           ZERO    .L1     A7
||         STDW    .D2T2   B7:B6,*+B4(56)    ; |137| 
||         MVKH    .S2     0xbff00000,B13
||         ZERO    .L2     B12               ; |135| 

           ZERO    .L2     B9
||         SET     .S1     A7,0x14,0x1d,A7
||         ZERO    .L1     A6                ; |134| 
||         STDW    .D2T2   B13:B12,*+B4(40)  ; |135| 

           ZERO    .L1     A5
||         MVKH    .S2     0xfff00000,B9
||         ZERO    .L2     B8                ; |133| 
||         STDW    .D2T1   A7:A6,*+B4(32)    ; |134| 

           MVKH    .S1     0x80000000,A5
||         ZERO    .L1     A4                ; |131| 
||         STDW    .D2T2   B9:B8,*+B4(24)    ; |133| 

           ADD     .L1     -1,A5,A9
||         MV      .S1     A12,A8
||         STDW    .D2T1   A5:A4,*+B4(8)     ; |131| 

           STDW    .D2T1   A9:A8,*+B4(48)    ; |136| 
||         ADD     .L1     1,A13,A9
||         ZERO    .S1     A8                ; |132| 

           ZERO    .L2     B7:B6             ; |130| 
||         STDW    .D2T1   A9:A8,*+B4(16)    ; |132| 

           SUB     .L1X    B4,8,A15
||         STDW    .D2T2   B7:B6,*B4         ; |130| 
||         MVK     .L2     0x8,B4            ; |139| 

           ZERO    .L1     A14

           ZERO    .L1     A10               ; |68| 
||         CALL    .S1     sqrt              ; |140| 
||         MV      .D1X    B4,A12            ; |131| 

;** --------------------------------------------------------------------------*
;**   BEGIN LOOP $C$L7
;** --------------------------------------------------------------------------*
$C$L7:    
;          EXCLUSIVE CPU CYCLES: 5
           LDDW    .D1T1   *++A15,A5:A4      ; |140| 
           ADDKPC  .S2     $C$RL10,B3,3      ; |140| 
$C$RL10:   ; CALL OCCURS {sqrt} {0}          ; |140| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 22
           MVKL    .S2     output,B4
           MVKH    .S2     output,B4
           LDW     .D2T2   *B4,B4            ; |140| 
           ZERO    .L1     A7:A6             ; |141| 
           NOP             3
           ADD     .L1X    A14,B4,A3         ; |140| 
           STDW    .D1T1   A5:A4,*A3         ; |140| 
           LDDW    .D1T1   *A15,A5:A4        ; |141| 
           NOP             4
           CMPGTDP .S1     A5:A4,A7:A6,A0    ; |141| 
           NOP             1
   [!A0]   B       .S1     $C$L8             ; |141| 
   [ A0]   CALL    .S1     sqrtdp            ; |141| 
   [!A0]   CALL    .S1     sqrt              ; |141| 
           NOP             3
           ; BRANCHCC OCCURS {$C$L8}         ; |141| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 1
           ADDKPC  .S2     $C$RL11,B3,0      ; |141| 
$C$RL11:   ; CALL OCCURS {sqrtdp} {0}        ; |141| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 6

           B       .S1     $C$L9             ; |141| 
||         MVKL    .S2     output,B12

           MVKH    .S2     output,B12
           LDW     .D2T2   *+B12(4),B6       ; |141| 
           MV      .L2X    A4,B4             ; |141| 
           MV      .L2X    A5,B5             ; |141| 
           NOP             1
           ; BRANCH OCCURS {$C$L9}           ; |141| 
;** --------------------------------------------------------------------------*
$C$L8:    
;          EXCLUSIVE CPU CYCLES: 2
           ADDKPC  .S2     $C$RL12,B3,1      ; |141| 
$C$RL12:   ; CALL OCCURS {sqrt} {0}          ; |141| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 6
           MVKL    .S2     output,B12
           MVKH    .S2     output,B12
           LDW     .D2T2   *+B12(4),B6       ; |141| 
           MV      .L2X    A4,B4             ; |141| 
           MV      .L2X    A5,B5             ; |141| 
           NOP             1
;** --------------------------------------------------------------------------*
$C$L9:    
;          EXCLUSIVE CPU CYCLES: 8
           NOP             1
           ADD     .L2X    A14,B6,B6         ; |141| 

           STDW    .D2T2   B5:B4,*B6         ; |141| 
||         CALL    .S1     sqrtdp_c          ; |142| 

           LDDW    .D1T1   *A15,A5:A4        ; |142| 
           ADDKPC  .S2     $C$RL13,B3,3      ; |142| 
$C$RL13:   ; CALL OCCURS {sqrtdp_c} {0}      ; |142| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 14
           LDW     .D2T2   *+B12(8),B4       ; |142| 
           LDW     .D2T1   *+SP(24),A31
           MVK     .L2     0x3,B0            ; |67| 
           NOP             2
           ADD     .L1X    A14,B4,A3         ; |142| 
           STDW    .D1T1   A5:A4,*A3         ; |142| 
           LDDW    .D1T1   *A15,A7:A6        ; |143| 
           ZERO    .L1     A3                ; |68| 
           MV      .L1     A3,A16
           STW     .D2T1   A31,*+SP(20)      ; |68| 
           NOP             1
           RSQRDP  .S1     A7:A6,A5:A4       ; |64| 
           NOP             1
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*
;*      Loop found in file               : C:/nightlybuilds/mathlib/ti/mathlib/src/sqrtdp/sqrtdp_d.c
;*      Loop inlined from                : ../../../../../../../ti/mathlib/src/sqrtdp/c674/sqrtdp_i.h
;*      Loop source line                 : 67
;*      Loop opening brace source line   : 67
;*      Loop closing brace source line   : 69
;*      Known Minimum Trip Count         : 3                    
;*      Known Maximum Trip Count         : 3                    
;*      Known Max Trip Count Factor      : 3
;*      Loop Carried Dependency Bound(^) : 50
;*      Unpartitioned Resource Bound     : 8
;*      Partitioned Resource Bound(*)    : 8
;*      Resource Partition:
;*                                A-side   B-side
;*      .L units                     0        0     
;*      .S units                     0        0     
;*      .D units                     0        0     
;*      .M units                     8*       8*    
;*      .X cross paths               4        2     
;*      .T address paths             0        0     
;*      Long read paths              0        0     
;*      Long write paths             0        0     
;*      Logical  ops (.LS)           2        0     (.L or .S unit)
;*      Addition ops (.LSD)          0        2     (.L or .S or .D unit)
;*      Bound(.L .S .LS)             1        0     
;*      Bound(.L .S .D .LS .LSD)     1        1     
;*
;*      Disqualified loop: Loop carried dependency bound too large
;*----------------------------------------------------------------------------*
$C$L10:    
;          EXCLUSIVE CPU CYCLES: 47
           MPYDP   .M1     A5:A4,A7:A6,A9:A8 ; |68| 
           LDW     .D2T1   *+SP(20),A17
           SUB     .L2     B0,1,B0           ; |67| 
           NOP             7
           MPYDP   .M1     A5:A4,A9:A8,A9:A8 ; |68| 
           NOP             9
           MPYDP   .M1     A11:A10,A9:A8,A9:A8 ; |68| 
           NOP             9
           SUBDP   .L1     A17:A16,A9:A8,A9:A8 ; |68| 
           NOP             6
           MPYDP   .M1     A9:A8,A5:A4,A5:A4 ; |68| 
           NOP             3
   [ B0]   BNOP    .S1     $C$L10,5          ; |67| 
           ; BRANCHCC OCCURS {$C$L10}        ; |67| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 13

           SUB     .L1     A12,1,A12         ; |139| 
||         MPYDP   .M1     A5:A4,A7:A6,A9:A8 ; |70| 
||         LDW     .D2T1   *+SP(16),A3
||         SUB     .S1     A12,1,A2          ; |139| 

           ZERO    .L2     B5:B4             ; |72| 
           CMPGTDP .S2X    A7:A6,B5:B4,B0    ; |72| 
           MVK     .L1     0xffffffff,A4     ; |75| 
           MV      .L1     A13,A5            ; |75| 
           LDW     .D1T1   *A3,A3            ; |143| 
           CMPGTDP .S1     A7:A6,A5:A4,A0    ; |75| 
   [ A2]   BNOP    .S2     $C$L7,2           ; |139| 

   [!B0]   ZERO    .L1     A9:A8             ; |73| 
||         ADD     .S1     A14,A3,A3         ; |143| 
||         ADD     .D1     8,A14,A14         ; |139| 

   [ A0]   MV      .L1     A5,A9             ; |76| 
|| [ A0]   MV      .S1     A4,A8             ; |73| 

   [ A2]   CALL    .S1     sqrt              ; |140| 
||         STDW    .D1T1   A9:A8,*A3         ; |143| 

           ; BRANCHCC OCCURS {$C$L7}         ; |139| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 6
           CALL    .S1     sqrtdp_v          ; |145| 
           LDW     .D2T2   *+B12(16),B4      ; |145| 
           MVKL    .S1     a_sc,A4
           MVKH    .S1     a_sc,A4
           ADDKPC  .S2     $C$RL14,B3,0      ; |145| 
           MVK     .L1     0x8,A6            ; |145| 
$C$RL14:   ; CALL OCCURS {sqrtdp_v} {0}      ; |145| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 46
           MVKL    .S2     0x3d3c25c2,B7
           MVKL    .S2     0x68497682,B6
           MVKH    .S2     0x3d3c25c2,B7

           LDW     .D2T1   *B12,A4           ; |66| 
||         MVKH    .S2     0x68497682,B6

           CALLP   .S2     isequal,B3
||         LDW     .D2T2   *+B12(4),B4       ; |66| 
||         MVK     .L1     0x8,A6            ; |66| 
||         MVK     .S1     0x1,A8            ; |66| 

$C$RL15:   ; CALL OCCURS {isequal} {0}       ; |66| 
           MVKL    .S2     fcn_pass,B5
           MVKL    .S2     0x3d3c25c2,B7
           MVKH    .S2     fcn_pass,B5
           MVKL    .S2     0x68497682,B6

           LDW     .D2T2   *+B12(8),B4       ; |67| 
||         MVKH    .S2     0x3d3c25c2,B7

           STW     .D2T1   A4,*+B5(4)        ; |66| 
||         MVKH    .S2     0x68497682,B6

           CALLP   .S2     isequal,B3
||         LDW     .D2T1   *B12,A4           ; |67| 
||         MVK     .L1     0x8,A6            ; |67| 
||         MVK     .S1     0x1,A8            ; |67| 

$C$RL16:   ; CALL OCCURS {isequal} {0}       ; |67| 
           MVKL    .S2     fcn_pass,B5
           MVKL    .S2     0x3d3c25c2,B7
           MVKL    .S2     0x68497682,B6
           MVKH    .S2     fcn_pass,B5
           MVKH    .S2     0x3d3c25c2,B7

           MV      .L1X    B12,A3            ; |145| 
||         STW     .D2T1   A4,*+B5(8)        ; |67| 
||         MVKH    .S2     0x68497682,B6

           CALLP   .S2     isequal,B3
||         LDW     .D1T1   *A3,A4            ; |68| 
||         LDW     .D2T2   *+B12(12),B4      ; |68| 
||         MVK     .L1     0x8,A6            ; |68| 
||         MVK     .S1     0x1,A8            ; |68| 

$C$RL17:   ; CALL OCCURS {isequal} {0}       ; |68| 

           LDW     .D2T1   *+SP(28),A3       ; |68| 
||         MVKL    .S2     fcn_pass,B4

           MVKL    .S2     0x68497682,B6
           MVKL    .S2     0x3d3c25c2,B7
           MVKH    .S2     fcn_pass,B4

           STW     .D2T1   A4,*+B4(12)       ; |68| 
||         MVKH    .S2     0x68497682,B6

           STW     .D2T1   A3,*+SP(32)       ; |68| 
||         MVKH    .S2     0x3d3c25c2,B7

           CALLP   .S2     isequal,B3
||         LDW     .D1T2   *A3,B4            ; |69| 
||         LDW     .D2T1   *B12,A4           ; |69| 
||         MVK     .L1     0x8,A6            ; |69| 
||         MVK     .S1     0x1,A8            ; |69| 

$C$RL18:   ; CALL OCCURS {isequal} {0}       ; |69| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 12
           MV      .L1X    B11,A3            ; |69| 
           LDW     .D1T1   *A3,A0            ; |72| 
           STW     .D2T2   B11,*+SP(36)      ; |69| 
           MVKL    .S2     fcn_pass,B4
           MVKH    .S2     fcn_pass,B4
           STW     .D2T1   A4,*+B4(16)       ; |69| 

   [!A0]   B       .S1     $C$L11            ; |72| 
|| [ A0]   LDW     .D2T2   *B10,B0           ; |72| 

   [!A0]   CALL    .S1     print_test_results ; |149| 
   [ A0]   ADD     .L2     4,B10,B4
   [!A0]   MVKL    .S2     all_pass,B5
   [!A0]   MV      .L2X    A10,B4
   [!A0]   MVKH    .S2     all_pass,B5
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
           CALL    .S1     print_test_results ; |149| 
           MVKL    .S2     all_pass,B5
           MVKH    .S2     all_pass,B5
           NOP             2
;** --------------------------------------------------------------------------*
$C$L11:    
;          EXCLUSIVE CPU CYCLES: 1

           MVK     .L1     0x3,A4            ; |149| 
||         STW     .D2T2   B4,*B5            ; |72| 
||         ADDKPC  .S2     $C$RL19,B3,0      ; |149| 

$C$RL19:   ; CALL OCCURS {print_test_results} {0}  ; |149| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           MVKL    .S1     a_ext,A3
           MVKH    .S1     a_ext,A3

           MVK     .S2     0x777,B31         ; |153| 
||         ZERO    .L1     A5

           MV      .L2X    A3,B4             ; |152| 
||         STW     .D2T2   B31,*+SP(12)      ; |152| 
||         SET     .S1     A5,0x14,0x14,A5
||         MV      .L1     A10,A4            ; |149| 

           CALL    .S2     sqrt              ; |154| 
||         STDW    .D2T1   A5:A4,*B4         ; |152| 
||         MV      .L1     A3,A10            ; |152| 
||         MVK     .S1     0xffffffff,A12    ; |75| 
||         MV      .D1     A10,A14           ; |149| 

;** --------------------------------------------------------------------------*
;**   BEGIN LOOP $C$L12
;** --------------------------------------------------------------------------*
$C$L12:    
;          EXCLUSIVE CPU CYCLES: 5
           LDDW    .D1T1   *A10,A5:A4        ; |154| 
           ADDKPC  .S2     $C$RL20,B3,3      ; |154| 
$C$RL20:   ; CALL OCCURS {sqrt} {0}          ; |154| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 21
           MV      .L2     B12,B4            ; |154| 
           LDW     .D2T2   *B4,B4            ; |154| 
           ZERO    .L1     A7:A6             ; |155| 
           NOP             3
           ADD     .L1X    A14,B4,A3         ; |154| 
           STDW    .D1T1   A5:A4,*A3         ; |154| 
           LDDW    .D1T1   *A10,A5:A4        ; |155| 
           NOP             4
           CMPGTDP .S1     A5:A4,A7:A6,A0    ; |155| 
           NOP             1
   [!A0]   B       .S1     $C$L13            ; |155| 
   [ A0]   CALL    .S1     sqrtdp            ; |155| 
   [!A0]   CALL    .S1     sqrt              ; |155| 
           NOP             3
           ; BRANCHCC OCCURS {$C$L13}        ; |155| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 1
           ADDKPC  .S2     $C$RL21,B3,0      ; |155| 
$C$RL21:   ; CALL OCCURS {sqrtdp} {0}        ; |155| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 6

           BNOP    .S1     $C$L14,3          ; |155| 
||         LDW     .D2T2   *+B12(4),B6       ; |155| 
||         MV      .L2X    A4,B4             ; |155| 

           MV      .L2X    A5,B5             ; |155| 
           ADD     .L2X    A14,B6,B6         ; |155| 
           ; BRANCH OCCURS {$C$L14}          ; |155| 
;** --------------------------------------------------------------------------*
$C$L13:    
;          EXCLUSIVE CPU CYCLES: 2
           ADDKPC  .S2     $C$RL22,B3,1      ; |155| 
$C$RL22:   ; CALL OCCURS {sqrt} {0}          ; |155| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 6
           LDW     .D2T2   *+B12(4),B6       ; |155| 
           MV      .L2X    A5,B5             ; |155| 
           MV      .L2X    A4,B4             ; |155| 
           NOP             2
           ADD     .L2X    A14,B6,B6         ; |155| 
;** --------------------------------------------------------------------------*
$C$L14:    
;          EXCLUSIVE CPU CYCLES: 6

           CALL    .S1     sqrtdp_c          ; |156| 
||         STDW    .D2T2   B5:B4,*B6         ; |155| 

           LDDW    .D1T1   *A10,A5:A4        ; |156| 
           ADDKPC  .S2     $C$RL23,B3,3      ; |156| 
$C$RL23:   ; CALL OCCURS {sqrtdp_c} {0}      ; |156| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 15
           LDW     .D2T2   *+B12(8),B4       ; |156| 
           LDW     .D2T1   *+SP(20),A17
           MVK     .L2     0x3,B0            ; |67| 
           MV      .L1     A11,A19           ; |68| 
           ZERO    .L1     A16               ; |68| 
           ADD     .L1X    A14,B4,A3         ; |156| 
           STDW    .D1T1   A5:A4,*A3         ; |156| 
           LDDW    .D1T1   *A10,A7:A6        ; |157| 
           ZERO    .L1     A18               ; |68| 
           NOP             3
           RSQRDP  .S1     A7:A6,A5:A4       ; |64| 
           NOP             2
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*
;*      Loop found in file               : C:/nightlybuilds/mathlib/ti/mathlib/src/sqrtdp/sqrtdp_d.c
;*      Loop inlined from                : ../../../../../../../ti/mathlib/src/sqrtdp/c674/sqrtdp_i.h
;*      Loop source line                 : 67
;*      Loop opening brace source line   : 67
;*      Loop closing brace source line   : 69
;*      Known Minimum Trip Count         : 3                    
;*      Known Maximum Trip Count         : 3                    
;*      Known Max Trip Count Factor      : 3
;*      Loop Carried Dependency Bound(^) : 50
;*      Unpartitioned Resource Bound     : 8
;*      Partitioned Resource Bound(*)    : 8
;*      Resource Partition:
;*                                A-side   B-side
;*      .L units                     0        0     
;*      .S units                     0        0     
;*      .D units                     0        0     
;*      .M units                     8*       8*    
;*      .X cross paths               4        2     
;*      .T address paths             0        0     
;*      Long read paths              0        0     
;*      Long write paths             0        0     
;*      Logical  ops (.LS)           2        0     (.L or .S unit)
;*      Addition ops (.LSD)          0        2     (.L or .S or .D unit)
;*      Bound(.L .S .LS)             1        0     
;*      Bound(.L .S .D .LS .LSD)     1        1     
;*
;*      Disqualified loop: Loop carried dependency bound too large
;*----------------------------------------------------------------------------*
$C$L15:    
;          EXCLUSIVE CPU CYCLES: 47
           MPYDP   .M1     A5:A4,A7:A6,A9:A8 ; |68| 
           SUB     .L2     B0,1,B0           ; |67| 
           NOP             8
           MPYDP   .M1     A5:A4,A9:A8,A9:A8 ; |68| 
           NOP             9
           MPYDP   .M1     A19:A18,A9:A8,A9:A8 ; |68| 
           NOP             9
           SUBDP   .L1     A17:A16,A9:A8,A9:A8 ; |68| 
           NOP             6
           MPYDP   .M1     A9:A8,A5:A4,A5:A4 ; |68| 
           NOP             3
   [ B0]   BNOP    .S1     $C$L15,5          ; |67| 
           ; BRANCHCC OCCURS {$C$L15}        ; |67| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 29

           MPYDP   .M1     A5:A4,A7:A6,A5:A4 ; |70| 
||         LDW     .D2T1   *+SP(16),A15

           CMPGTDP .S1     A7:A6,A13:A12,A0  ; |75| 
           ZERO    .L2     B5:B4             ; |72| 
           CMPGTDP .S2X    A7:A6,B5:B4,B0    ; |72| 
           LDW     .D2T2   *+SP(12),B4
           LDW     .D1T1   *A15,A3           ; |157| 
           MVKL    .S1     0xc000cccc,A7
           MVKL    .S1     0xcccccccd,A6
           MVKH    .S1     0xc000cccc,A7
           MVKH    .S1     0xcccccccd,A6

   [!B0]   ZERO    .L1     A5:A4             ; |73| 
||         ADD     .S1     A14,A3,A3         ; |157| 

   [ A0]   MV      .L1     A13,A5            ; |76| 
|| [ A0]   MV      .S1     A12,A4            ; |73| 

           STDW    .D1T1   A5:A4,*A3         ; |157| 
           LDDW    .D1T1   *A10,A5:A4        ; |158| 
           SUB     .L2     B4,1,B31          ; |153| 
           SUB     .L1X    B4,1,A2           ; |153| 
           ADD     .L1     8,A14,A14         ; |153| 
           NOP             1
           MPYDP   .M1     A7:A6,A5:A4,A5:A4 ; |158| 
           NOP             4
   [ A2]   BNOP    .S1     $C$L12,4          ; |153| 

   [ A2]   CALL    .S1     sqrt              ; |154| 
||         STDW    .D1T1   A5:A4,*++A10      ; |158| 
||         STW     .D2T2   B31,*+SP(12)      ; |158| 

           ; BRANCHCC OCCURS {$C$L12}        ; |153| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 6
           CALL    .S1     sqrtdp_v          ; |160| 
           LDW     .D2T2   *+B12(16),B4      ; |160| 
           MVKL    .S1     a_ext,A4
           MVKH    .S1     a_ext,A4
           ADDKPC  .S2     $C$RL24,B3,0      ; |160| 
           MVK     .S1     0x777,A6          ; |160| 
$C$RL24:   ; CALL OCCURS {sqrtdp_v} {0}      ; |160| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 47
           LDW     .D2T2   *B12,B5           ; |66| 
           MVKL    .S2     0x3d3c25c2,B7
           MVKL    .S2     0x68497682,B6
           MVKH    .S2     0x3d3c25c2,B7
           MVKH    .S2     0x68497682,B6

           CALLP   .S2     isequal,B3
||         LDW     .D2T2   *+B12(4),B4       ; |66| 
||         MV      .L1X    B5,A4             ; |66| 
||         MVK     .S1     0x777,A6          ; |66| 
||         MVK     .D1     0x1,A8            ; |66| 

$C$RL25:   ; CALL OCCURS {isequal} {0}       ; |66| 
           MVKL    .S2     fcn_pass,B5
           MVKL    .S2     0x3d3c25c2,B7
           MVKL    .S2     0x68497682,B6
           MVKH    .S2     fcn_pass,B5

           LDW     .D2T2   *+B12(8),B4       ; |67| 
||         MVKH    .S2     0x3d3c25c2,B7

           STW     .D2T1   A4,*+B5(4)        ; |66| 
||         MVKH    .S2     0x68497682,B6

           CALLP   .S2     isequal,B3
||         LDW     .D2T1   *B12,A4           ; |67| 
||         MVK     .S1     0x777,A6          ; |67| 
||         MVK     .L1     0x1,A8            ; |67| 

$C$RL26:   ; CALL OCCURS {isequal} {0}       ; |67| 
           MVKL    .S2     fcn_pass,B5
           MVKL    .S2     0x3d3c25c2,B7
           MVKL    .S2     0x68497682,B6
           MVKH    .S2     fcn_pass,B5
           MVKH    .S2     0x3d3c25c2,B7

           MV      .L1X    B12,A3            ; |160| 
||         STW     .D2T1   A4,*+B5(8)        ; |67| 
||         MVKH    .S2     0x68497682,B6

           CALLP   .S2     isequal,B3
||         LDW     .D1T1   *A3,A4            ; |68| 
||         LDW     .D2T2   *+B12(12),B4      ; |68| 
||         MVK     .S1     0x777,A6          ; |68| 
||         MVK     .L1     0x1,A8            ; |68| 

$C$RL27:   ; CALL OCCURS {isequal} {0}       ; |68| 
           MVKL    .S2     fcn_pass,B4

           LDW     .D2T1   *+SP(32),A3       ; |68| 
||         MVKL    .S2     0x3d3c25c2,B7

           MVKL    .S2     0x68497682,B6
           MVKH    .S2     fcn_pass,B4
           MVKH    .S2     0x3d3c25c2,B7

           STW     .D2T1   A4,*+B4(12)       ; |68| 
||         MVKH    .S2     0x68497682,B6

           CALLP   .S2     isequal,B3
||         LDW     .D1T2   *A3,B4            ; |69| 
||         LDW     .D2T1   *B12,A4           ; |69| 
||         MVK     .S1     0x777,A6          ; |69| 
||         MVK     .L1     0x1,A8            ; |69| 

$C$RL28:   ; CALL OCCURS {isequal} {0}       ; |69| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 12
           MV      .L1X    B11,A3            ; |69| 
           LDW     .D1T1   *A3,A0            ; |72| 
           MVKL    .S2     fcn_pass,B4
           MV      .L2     B10,B5            ; |72| 
           MVKH    .S2     fcn_pass,B4
           STW     .D2T1   A4,*+B4(16)       ; |69| 

   [ A0]   ADD     .L2     4,B5,B4
|| [!A0]   B       .S1     $C$L16            ; |72| 
|| [ A0]   LDW     .D2T2   *B5,B0            ; |72| 

   [!A0]   CALL    .S1     print_test_results ; |164| 
   [!A0]   MVKL    .S1     all_pass,A3
   [!A0]   MVKH    .S1     all_pass,A3
   [!A0]   ZERO    .L2     B4                ; |72| 
   [!A0]   MV      .L2X    A3,B5
           ; BRANCHCC OCCURS {$C$L16}        ; |72| 
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
||         MVK     .L2     0x1,B4            ; |72| 

   [!A0]   ZERO    .L2     B4                ; |72| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           CALL    .S1     print_test_results ; |164| 
           MVKL    .S1     all_pass,A3
           MVKH    .S1     all_pass,A3
           NOP             1
           MV      .L2X    A3,B5
;** --------------------------------------------------------------------------*
$C$L16:    
;          EXCLUSIVE CPU CYCLES: 1

           MVK     .L1     0x4,A4            ; |164| 
||         STW     .D2T2   B4,*B5            ; |72| 
||         ADDKPC  .S2     $C$RL29,B3,0      ; |164| 

$C$RL29:   ; CALL OCCURS {print_test_results} {0}  ; |164| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 19
           ZERO    .L1     A3                ; |114| 

           MVKL    .S2     cycle_counts+24,B4
||         ZERO    .L1     A4                ; |114| 
||         STW     .D2T1   A3,*+SP(16)       ; |114| 

           MVKH    .S2     cycle_counts+24,B4
||         ZERO    .L1     A5                ; |114| 
||         ZERO    .L2     B5                ; |114| 
||         STW     .D2T1   A4,*+SP(12)       ; |114| 

           STDW    .D2T1   A5:A4,*B4         ; |114| 
||         MVC     .S2     B5,TSCL           ; |115| 

           MVC     .S2     TSCL,B6           ; |116| 
           MVC     .S2     TSCH,B5           ; |116| 
           MVKL    .S2     t_start,B4

           MVKH    .S2     t_start,B4
||         MV      .L2     B5,B7             ; |116| 

           STDW    .D2T2   B7:B6,*B4         ; |116| 
||         MVC     .S2     TSCL,B4           ; |117| 

           MVC     .S2     TSCH,B8           ; |117| 
           MVKL    .S1     t_offset,A12

           SUBU    .L2     B4,B6,B5:B4       ; |117| 
||         MVK     .S1     0x80,A3           ; |172| 

           EXT     .S2     B5,24,24,B6       ; |117| 
||         SUB     .L2     B8,B7,B31         ; |117| 
||         MVKH    .S1     t_offset,A12

           ADD     .L2     B31,B6,B5         ; |117| 
||         STW     .D2T1   A3,*+SP(20)       ; |117| 
||         MVKL    .S1     input,A3

           STDW    .D1T2   B5:B4,*A12        ; |117| 
||         MVKH    .S1     input,A3
||         CALL    .S2     gimme_random      ; |174| 

           LDW     .D1T1   *A3,A10           ; |174| 
           MVKL    .S1     0x408f4800,A5
           ZERO    .L2     B4                ; |174| 

           MV      .L2     B13,B5            ; |174| 
||         MVKH    .S1     0x408f4800,A5
||         MV      .L1     A4,A14            ; |117| 
||         ZERO    .D1     A4                ; |174| 

;** --------------------------------------------------------------------------*
;**   BEGIN LOOP $C$L17
;** --------------------------------------------------------------------------*
$C$L17:    
;          EXCLUSIVE CPU CYCLES: 1
           ADDKPC  .S2     $C$RL30,B3,0      ; |174| 
$C$RL30:   ; CALL OCCURS {gimme_random} {0}  ; |174| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 13
           ADD     .L1     A10,A14,A3        ; |174| 

           STDW    .D1T1   A5:A4,*A3         ; |174| 
||         MVC     .S2     TSCL,B4           ; |122| 

           NOP             1

           MV      .L1X    B4,A8             ; |122| Define a twin register
||         MVC     .S2     TSCH,B4           ; |122| 

           ADD     .L1     A10,A14,A3        ; |64| 
           LDDW    .D1T1   *A3,A7:A6         ; |64| 
           MV      .L2X    A10,B12           ; |64| 
           MVK     .L2     0x3,B0            ; |67| 
           LDW     .D2T1   *+SP(24),A17      ; |64| 
           MV      .L1X    B4,A9             ; |122| 
           RSQRDP  .S1     A7:A6,A7:A6       ; |64| 
           ZERO    .L1     A10               ; |68| 
           ZERO    .L1     A16               ; |68| 
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*
;*      Loop found in file               : C:/nightlybuilds/mathlib/ti/mathlib/src/sqrtdp/sqrtdp_d.c
;*      Loop inlined from                : ../../../../../../../ti/mathlib/src/sqrtdp/c674/sqrtdp_i.h
;*      Loop source line                 : 67
;*      Loop opening brace source line   : 67
;*      Loop closing brace source line   : 69
;*      Known Minimum Trip Count         : 3                    
;*      Known Maximum Trip Count         : 3                    
;*      Known Max Trip Count Factor      : 3
;*      Loop Carried Dependency Bound(^) : 50
;*      Unpartitioned Resource Bound     : 8
;*      Partitioned Resource Bound(*)    : 8
;*      Resource Partition:
;*                                A-side   B-side
;*      .L units                     0        0     
;*      .S units                     0        0     
;*      .D units                     0        0     
;*      .M units                     8*       8*    
;*      .X cross paths               4        2     
;*      .T address paths             0        0     
;*      Long read paths              0        0     
;*      Long write paths             0        0     
;*      Logical  ops (.LS)           2        0     (.L or .S unit)
;*      Addition ops (.LSD)          0        2     (.L or .S or .D unit)
;*      Bound(.L .S .LS)             1        0     
;*      Bound(.L .S .D .LS .LSD)     1        1     
;*
;*      Disqualified loop: Loop carried dependency bound too large
;*----------------------------------------------------------------------------*
$C$L18:    
;          EXCLUSIVE CPU CYCLES: 47
           MPYDP   .M1     A7:A6,A5:A4,A19:A18 ; |68| 
           SUB     .L2     B0,1,B0           ; |67| 
           NOP             8
           MPYDP   .M1     A7:A6,A19:A18,A19:A18 ; |68| 
           NOP             9
           MPYDP   .M1     A11:A10,A19:A18,A19:A18 ; |68| 
           NOP             9
           SUBDP   .L1     A17:A16,A19:A18,A19:A18 ; |68| 
           NOP             6
           MPYDP   .M1     A19:A18,A7:A6,A7:A6 ; |68| 
           NOP             3
   [ B0]   BNOP    .S1     $C$L18,5          ; |67| 
           ; BRANCHCC OCCURS {$C$L18}        ; |67| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 29

           MVKL    .S2     t_start,B4
||         MPYDP   .M1     A7:A6,A5:A4,A7:A6 ; |70| 

           MV      .L1     A13,A17           ; |75| 
           MVK     .L1     0xffffffff,A16    ; |75| 
           ZERO    .L2     B7:B6             ; |72| 
           LDW     .D1T1   *A15,A3           ; |178| 
           CMPGTDP .S2X    A5:A4,B7:B6,B0    ; |72| 
           CMPGTDP .S1     A5:A4,A17:A16,A0  ; |75| 
           MVKH    .S2     t_start,B4
           STDW    .D2T1   A9:A8,*B4
           ADD     .L1     A14,A3,A3         ; |178| 
   [!B0]   ZERO    .L1     A7:A6             ; |73| 

   [ A0]   MV      .L1     A17,A7            ; |76| 
|| [ A0]   MV      .S1     A16,A6            ; |73| 

           STDW    .D1T1   A7:A6,*A3         ; |178| 
||         MVC     .S2     TSCL,B6           ; |128| 

           MVC     .S2     TSCH,B4           ; |128| 

           LDDW    .D1T1   *A12,A7:A6        ; |130| 
||         MVKL    .S1     cycle_counts+24,A3
||         MV      .L2     B4,B7             ; |128| 
||         MVKL    .S2     t_stop,B16
||         ADD     .L1     8,A14,A14         ; |172| 

           MVKH    .S1     cycle_counts+24,A3
||         LDW     .D2T1   *+SP(20),A31      ; |114| 
||         MVKH    .S2     t_stop,B16

           STDW    .D2T2   B7:B6,*B16        ; |128| 
           MV      .L2X    A3,B5             ; |130| 
           LDDW    .D2T2   *B5,B9:B8         ; |130| 
           ADDU    .L1     A6,A8,A5:A4       ; |130| 

           ADD     .L1     A5,A7,A3          ; |130| 
||         SUB     .S1     A31,1,A0          ; |172| 

           SUBU    .L2X    B6,A4,B5:B4       ; |130| 
||         ADD     .L1     A3,A9,A4          ; |130| 
||         SUB     .D1     A31,1,A3          ; |172| 
|| [ A0]   MVKL    .S1     0x408f4800,A5

           STW     .D2T1   A3,*+SP(20)       ; |130| 
|| [ A0]   MVKL    .S1     input,A3
||         EXT     .S2     B5,24,24,B17      ; |130| 

   [ A0]   B       .S2     $C$L17            ; |172| 
|| [ A0]   MVKH    .S1     input,A3
||         ADDU    .L2     B8,B4,B5:B4       ; |130| 

   [ A0]   CALL    .S1     gimme_random      ; |174| 
||         SUB     .L2X    B7,A4,B18         ; |130| 
||         MV      .S2     B4,B8             ; |130| 
||         ADD     .D2     B5,B9,B4          ; |130| 
|| [ A0]   LDW     .D1T1   *A3,A10           ; |174| 
|| [ A0]   ZERO    .L1     A4                ; |174| 

           ADD     .L2     B18,B17,B5        ; |130| 
|| [ A0]   MVKH    .S1     0x408f4800,A5

           ADD     .L2     B4,B5,B9          ; |130| 
||         MVKL    .S2     cycle_counts+24,B4
|| [ A0]   MV      .D2     B13,B5            ; |174| 

           MVKH    .S2     cycle_counts+24,B4

   [!A0]   CALL    .S1     __c6xabi_fltllif  ; |135| 
||         STDW    .D2T2   B9:B8,*B4         ; |130| 
|| [ A0]   ZERO    .L2     B4                ; |174| 

           ; BRANCHCC OCCURS {$C$L17}        ; |172| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           LDDW    .D2T1   *B4,A5:A4         ; |135| 
           ADDKPC  .S2     $C$RL31,B3,3      ; |135| 
$C$RL31:   ; CALL OCCURS {__c6xabi_fltllif} {0}  ; |135| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 15
           ZERO    .L1     A14
           SET     .S1     A14,0x1a,0x1d,A14
           MPYSP   .M1     A14,A4,A3         ; |135| 
           NOP             3
           SPDP    .S1     A3,A5:A4          ; |135| 
           NOP             1
           ADDDP   .L1     A11:A10,A5:A4,A5:A4 ; |135| 
           CALLP   .S2     __c6xabi_fixdlli,B3
$C$RL32:   ; CALL OCCURS {__c6xabi_fixdlli} {0}  ; |135| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 15
           MVKL    .S1     cycle_counts+24,A3
           MVKH    .S1     cycle_counts+24,A3
           MVK     .S1     24,A31
           MV      .L2X    A3,B4
           MV      .L1     A10,A7

           MV      .L1     A10,A6
||         MV      .L2X    A10,B5            ; |114| 
||         STDW    .D2T1   A5:A4,*B4         ; |135| 
||         SUB     .S1X    B4,A31,A3

           STDW    .D1T1   A7:A6,*A3         ; |114| 
||         MVC     .S2     B5,TSCL           ; |115| 

           MVC     .S2     TSCL,B5           ; |116| 
           MVC     .S2     TSCH,B4           ; |116| 
           MVC     .S2     TSCL,B6           ; |117| 
           MVC     .S2     TSCH,B8           ; |117| 

           SUBU    .L2     B6,B5,B7:B6       ; |117| 
||         MVKL    .S1     output,A3

           EXT     .S2     B7,24,24,B5       ; |117| 
||         SUB     .L2     B8,B4,B4          ; |117| 
||         MVKH    .S1     output,A3

           ADD     .L2     B4,B5,B7          ; |117| 
||         LDW     .D1T1   *A3,A13

           STDW    .D1T2   B7:B6,*A12        ; |117| 
||         MVK     .S1     0x80,A12
||         MV      .L1X    B12,A10

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
;          EXCLUSIVE CPU CYCLES: 8
           MVC     .S2     TSCL,B4           ; |122| 
           MVC     .S2     TSCH,B5           ; |122| 
           CALL    .S1     sqrt              ; |187| 
           LDDW    .D1T1   *A10++,A5:A4      ; |187| 
           MVKL    .S2     t_start,B6
           MVKH    .S2     t_start,B6
           STDW    .D2T2   B5:B4,*B6         ; |122| 
           ADDKPC  .S2     $C$RL33,B3,0      ; |187| 
$C$RL33:   ; CALL OCCURS {sqrt} {0}          ; |187| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 20

           STDW    .D1T1   A5:A4,*A13++      ; |187| 
||         MVC     .S2     TSCL,B16          ; |128| 

           MVC     .S2     TSCH,B4           ; |128| 

           MVKL    .S1     t_start,A3
||         MVKL    .S2     t_offset,B12
||         SUB     .L1     A12,1,A0          ; |185| 
||         MV      .L2     B4,B17            ; |128| 
||         SUB     .D1     A12,1,A12         ; |185| 

           MVKH    .S1     t_start,A3
||         MVKH    .S2     t_offset,B12

           LDDW    .D1T1   *A3,A7:A6         ; |130| 
||         LDDW    .D2T2   *B12,B7:B6        ; |130| 
||         MVKL    .S1     cycle_counts,A31
||         MVKL    .S2     cycle_counts,B4

           MVKH    .S1     cycle_counts,A31
||         MVKH    .S2     cycle_counts,B4

           MVKL    .S1     t_stop,A30

           MVKH    .S1     t_stop,A30
|| [!A0]   MV      .L1X    B4,A12

           STDW    .D1T2   B17:B16,*A30      ; |128| 
           ADDU    .L1X    B6,A6,A5:A4       ; |130| 
           ADD     .L1X    A5,B7,A6          ; |130| 

           SUBU    .L2X    B16,A4,B7:B6      ; |130| 
||         LDDW    .D1T1   *A31,A5:A4        ; |130| 
||         ADD     .L1     A6,A7,A6          ; |130| 

           MV      .L2     B6,B5             ; |130| 
||         EXT     .S2     B7,24,24,B6       ; |130| 

           SUB     .L2X    B17,A6,B31        ; |130| 

   [ A0]   BNOP    .S1     $C$L19,1          ; |185| 
||         ADD     .L2     B31,B6,B6         ; |130| 

           ADDU    .L2X    A4,B5,B9:B8       ; |130| 
           ADD     .L2X    B9,A5,B5          ; |130| 
           ADD     .L2     B5,B6,B9          ; |130| 

   [!A0]   CALL    .S1     __c6xabi_fltllif  ; |135| 
||         STDW    .D2T2   B9:B8,*B4         ; |130| 

           ; BRANCHCC OCCURS {$C$L19}        ; |185| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           LDDW    .D1T1   *A12,A5:A4        ; |135| 
           ADDKPC  .S2     $C$RL34,B3,3      ; |135| 
$C$RL34:   ; CALL OCCURS {__c6xabi_fltllif} {0}  ; |135| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 13
           MPYSP   .M1     A14,A4,A3         ; |135| 
           ZERO    .L1     A10               ; |135| 
           NOP             2
           SPDP    .S1     A3,A5:A4          ; |135| 
           NOP             1
           ADDDP   .L1     A11:A10,A5:A4,A5:A4 ; |135| 
           CALLP   .S2     __c6xabi_fixdlli,B3
$C$RL35:   ; CALL OCCURS {__c6xabi_fixdlli} {0}  ; |135| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 10

           MV      .L1     A10,A7            ; |135| 
||         STDW    .D1T1   A5:A4,*A12        ; |135| 
||         MV      .L2X    A10,B4            ; |114| 
||         MV      .S1     A10,A6            ; |135| 

           MVC     .S2     B4,TSCL           ; |115| 
||         STDW    .D1T1   A7:A6,*+A12(8)    ; |114| 

           MVC     .S2     TSCL,B5           ; |116| 
           MVC     .S2     TSCH,B4           ; |116| 
           MVC     .S2     TSCL,B6           ; |117| 
           MVC     .S2     TSCH,B8           ; |117| 
           SUBU    .L2     B6,B5,B7:B6       ; |117| 

           EXT     .S2     B7,24,24,B5       ; |117| 
||         SUB     .L2     B8,B4,B4          ; |117| 

           ADD     .L2     B4,B5,B7          ; |117| 

           STDW    .D2T2   B7:B6,*B12        ; |117| 
||         MV      .L1     A7,A13            ; |117| 
||         MVK     .S1     0x80,A14

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
           MVKL    .S1     input,A3
           MVKH    .S1     input,A3
           LDW     .D1T1   *A3,A3            ; |196| 
           MVKL    .S2     t_start,B6
           MVKH    .S2     t_start,B6
           STDW    .D2T2   B5:B4,*B6         ; |122| 
           NOP             1

           ADD     .L1     A13,A3,A3         ; |196| 
||         CALL    .S1     sqrtdp            ; |196| 

           LDDW    .D1T1   *A3,A5:A4         ; |196| 
           ADDKPC  .S2     $C$RL36,B3,3      ; |196| 
$C$RL36:   ; CALL OCCURS {sqrtdp} {0}        ; |196| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 24
           MVKL    .S2     output+4,B4
           MVKH    .S2     output+4,B4
           LDW     .D2T2   *B4,B4            ; |196| 
           NOP             4
           ADD     .L1X    A13,B4,A3         ; |196| 

           STDW    .D1T1   A5:A4,*A3         ; |196| 
||         MVC     .S2     TSCL,B8           ; |128| 

           MVC     .S2     TSCH,B4           ; |128| 

           MVKL    .S1     t_offset,A10
||         MVKL    .S2     t_start,B5
||         ADDAD   .D1     A12,1,A3
||         SUB     .L1     A14,1,A0          ; |194| 
||         MV      .L2     B4,B9             ; |128| 

           MVKH    .S1     t_offset,A10
||         MVKH    .S2     t_start,B5
||         LDDW    .D1T1   *A3,A7:A6         ; |130| 
||         SUB     .L1     A14,1,A14         ; |194| 

           MVKL    .S1     t_stop,A31
|| [!A0]   MV      .L1     A12,A14
||         LDDW    .D1T1   *A10,A5:A4        ; |130| 
||         LDDW    .D2T2   *B5,B7:B6         ; |130| 

           MVK     .S2     8,B12
           MVKH    .S1     t_stop,A31
           ADD     .L2X    A12,B12,B12
           STDW    .D1T2   B9:B8,*A31        ; |128| 
           ADDU    .L2X    A4,B6,B17:B16     ; |130| 

           ADD     .S2X    B17,A5,B6         ; |130| 
|| [ A0]   B       .S1     $C$L20            ; |194| 
||         SUBU    .L2     B8,B16,B5:B4      ; |130| 

           ADD     .D2     B6,B7,B6          ; |130| 
||         EXT     .S2     B5,24,24,B7       ; |130| 
||         ADDU    .L2X    A6,B4,B5:B4       ; |130| 

           SUB     .L2     B9,B6,B6          ; |130| 
||         ADD     .S2X    B5,A7,B5          ; |130| 

           ADD     .L2     B6,B7,B6          ; |130| 
           ADD     .L2     B5,B6,B5          ; |130| 

   [!A0]   CALL    .S1     __c6xabi_fltllif  ; |135| 
||         STDW    .D2T2   B5:B4,*B12        ; |130| 
||         ADD     .L1     8,A13,A13         ; |194| 

           ; BRANCHCC OCCURS {$C$L20}        ; |194| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           LDDW    .D1T1   *+A14(8),A5:A4    ; |135| 
           ADDKPC  .S2     $C$RL37,B3,3      ; |135| 
$C$RL37:   ; CALL OCCURS {__c6xabi_fltllif} {0}  ; |135| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 15
           ZERO    .L1     A3
           SET     .S1     A3,0x1a,0x1d,A3
           MPYSP   .M1     A3,A4,A3          ; |135| 
           MV      .L1     A11,A13           ; |135| 
           ZERO    .L1     A12               ; |135| 
           NOP             1
           SPDP    .S1     A3,A5:A4          ; |135| 
           NOP             1
           ADDDP   .L1     A13:A12,A5:A4,A5:A4 ; |135| 
           CALLP   .S2     __c6xabi_fixdlli,B3
$C$RL38:   ; CALL OCCURS {__c6xabi_fixdlli} {0}  ; |135| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 10

           MV      .L1     A12,A7            ; |135| 
||         STDW    .D2T1   A5:A4,*B12        ; |135| 
||         MV      .L2X    A12,B4            ; |114| 
||         MV      .S1     A12,A6            ; |135| 

           MVC     .S2     B4,TSCL           ; |115| 
||         STDW    .D1T1   A7:A6,*+A14(16)   ; |114| 

           MVC     .S2     TSCL,B5           ; |116| 
           MVC     .S2     TSCH,B4           ; |116| 
           MVC     .S2     TSCL,B6           ; |117| 
           MVC     .S2     TSCH,B8           ; |117| 
           SUBU    .L2     B6,B5,B7:B6       ; |117| 

           EXT     .S2     B7,24,24,B5       ; |117| 
||         SUB     .L2     B8,B4,B4          ; |117| 

           ADD     .L2     B4,B5,B7          ; |117| 
||         MVK     .S1     0x80,A3

           STDW    .D1T2   B7:B6,*A10        ; |117| 
||         STW     .D2T1   A3,*+SP(20)       ; |117| 

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
           MVKL    .S1     input,A15
           MVKH    .S1     input,A15
           LDW     .D1T1   *A15,A3           ; |205| 
           MVKL    .S2     t_start,B6
           MVKH    .S2     t_start,B6
           STDW    .D2T2   B5:B4,*B6         ; |122| 
           NOP             1

           ADD     .L1     A12,A3,A3         ; |205| 
||         CALL    .S1     sqrtdp_c          ; |205| 

           LDDW    .D1T1   *A3,A5:A4         ; |205| 
           ADDKPC  .S2     $C$RL39,B3,3      ; |205| 
$C$RL39:   ; CALL OCCURS {sqrtdp_c} {0}      ; |205| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 24
           MVKL    .S2     output+8,B4
           MVKH    .S2     output+8,B4
           LDW     .D2T2   *B4,B4            ; |205| 
           NOP             4
           ADD     .L1X    A12,B4,A3         ; |205| 

           STDW    .D1T1   A5:A4,*A3         ; |205| 
||         MVC     .S2     TSCL,B8           ; |128| 

           MVC     .S2     TSCH,B4           ; |128| 

           MVKL    .S2     t_start,B12
||         LDW     .D2T1   *+SP(20),A31      ; |128| 
||         ADDAD   .D1     A14,2,A3
||         MV      .L2     B4,B9             ; |128| 
||         MVKL    .S1     t_stop,A11
||         ADD     .L1     8,A12,A12         ; |203| 

           MVKH    .S2     t_start,B12
||         LDDW    .D1T1   *A10,A5:A4        ; |130| 
||         MVKH    .S1     t_stop,A11

           MV      .L2X    A3,B13            ; |128| 
||         LDDW    .D2T2   *B12,B17:B16      ; |130| 

           LDDW    .D1T1   *A3,A7:A6         ; |130| 
           STDW    .D1T2   B9:B8,*A11        ; |128| 

           SUB     .L1     A31,1,A0          ; |203| 
||         SUB     .S1     A31,1,A3          ; |203| 

           STW     .D2T1   A3,*+SP(20)       ; |130| 
           ADDU    .L2X    A4,B16,B7:B6      ; |130| 

           SUBU    .L2     B8,B6,B5:B4       ; |130| 
||         ADD     .S2X    B7,A5,B6          ; |130| 
|| [ A0]   B       .S1     $C$L21            ; |203| 

           ADD     .D2     B6,B17,B6         ; |130| 
||         EXT     .S2     B5,24,24,B7       ; |130| 
||         ADDU    .L2X    A6,B4,B5:B4       ; |130| 

           SUB     .L2     B9,B6,B6          ; |130| 
||         ADD     .S2X    B5,A7,B5          ; |130| 

           ADD     .L2     B6,B7,B6          ; |130| 
           ADD     .L2     B5,B6,B5          ; |130| 

   [!A0]   CALL    .S1     __c6xabi_fltllif  ; |135| 
||         STDW    .D2T2   B5:B4,*B13        ; |130| 

           ; BRANCHCC OCCURS {$C$L21}        ; |203| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           LDDW    .D1T1   *+A14(16),A5:A4   ; |135| 
           ADDKPC  .S2     $C$RL40,B3,3      ; |135| 
$C$RL40:   ; CALL OCCURS {__c6xabi_fltllif} {0}  ; |135| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 114
           ZERO    .L1     A3
           SET     .S1     A3,0x1a,0x1d,A3
           MPYSP   .M1     A3,A4,A3          ; |135| 
           ZERO    .L1     A12               ; |135| 
           NOP             2
           SPDP    .S1     A3,A5:A4          ; |135| 
           NOP             1
           ADDDP   .L1     A13:A12,A5:A4,A5:A4 ; |135| 
           CALLP   .S2     __c6xabi_fixdlli,B3
$C$RL41:   ; CALL OCCURS {__c6xabi_fixdlli} {0}  ; |135| 
           LDW     .D2T1   *+SP(12),A6       ; |135| 
           MV      .L1X    B13,A12           ; |135| 
           STDW    .D1T1   A5:A4,*A12        ; |135| 
           NOP             2

           MV      .L1     A6,A7             ; |135| 
||         MV      .L2X    A6,B4             ; |114| 

           STDW    .D1T1   A7:A6,*+A14(32)   ; |114| 
||         MVC     .S2     B4,TSCL           ; |115| 

           MVC     .S2     TSCL,B4           ; |116| 
           MVC     .S2     TSCH,B5           ; |116| 

           STDW    .D2T2   B5:B4,*B12        ; |116| 
||         MVC     .S2     TSCL,B6           ; |117| 

           MVC     .S2     TSCH,B8           ; |117| 
           SUBU    .L2     B6,B4,B7:B6       ; |117| 

           EXT     .S2     B7,24,24,B7       ; |117| 
||         SUB     .L2     B8,B5,B5          ; |117| 

           MVKL    .S1     output,A14
||         ADD     .L2     B5,B7,B5          ; |117| 
||         MV      .S2     B6,B4             ; |117| 

           MVKH    .S1     output,A14
||         MV      .L2X    A15,B9            ; |212| 
||         STDW    .D1T2   B5:B4,*A10        ; |117| 

           CALLP   .S2     sqrtdp_v,B3
||         LDW     .D1T2   *+A14(16),B4      ; |212| 
||         LDW     .D2T1   *B9,A4            ; |212| 
||         MVK     .S1     0x80,A6           ; |212| 

$C$RL42:   ; CALL OCCURS {sqrtdp_v} {0}      ; |212| 
           MVC     .S2     TSCL,B16          ; |128| 
           MVC     .S2     TSCH,B4           ; |128| 

           LDDW    .D1T1   *A10,A5:A4        ; |130| 
||         LDDW    .D2T2   *B12,B9:B8        ; |130| 

           MVK     .S2     16,B12
           ADD     .L2X    A12,B12,B12
           LDDW    .D2T2   *B12,B7:B6        ; |130| 
           MV      .L2     B4,B17            ; |128| 
           ADDU    .L1X    A4,B8,A7:A6       ; |130| 
           ADD     .L1     A7,A5,A3          ; |130| 
           SUBU    .L1X    B16,A6,A5:A4      ; |130| 

           ADD     .L2X    A3,B9,B5          ; |130| 
||         EXT     .S1     A5,24,24,A3       ; |130| 

           ADDU    .L1X    B6,A4,A5:A4       ; |130| 
||         SUB     .L2     B17,B5,B5         ; |130| 
||         MV      .S2X    A11,B4            ; |128| 

           ADD     .L2X    B5,A3,B5          ; |130| 
           ADD     .L2X    A5,B7,B6          ; |130| 

           STDW    .D2T2   B17:B16,*B4       ; |128| 
||         ADD     .L2     B6,B5,B4          ; |130| 

           NOP             1

           CALLP   .S2     __c6xabi_fltllif,B3
||         MV      .L1X    B4,A5             ; |130| 

$C$RL43:   ; CALL OCCURS {__c6xabi_fltllif} {0}  ; |130| 
           ZERO    .L1     A3
           SET     .S1     A3,0x1a,0x1d,A3
           MPYSP   .M1     A3,A4,A3          ; |130| 
           ZERO    .L1     A12               ; |130| 
           NOP             2
           SPDP    .S1     A3,A5:A4          ; |130| 
           NOP             1
           ADDDP   .L1     A13:A12,A5:A4,A5:A4 ; |130| 
           CALLP   .S2     __c6xabi_fixdlli,B3
$C$RL44:   ; CALL OCCURS {__c6xabi_fixdlli} {0}  ; |130| 
           MVKL    .S2     0x3d3c25c2,B7
           MVKL    .S2     0x68497682,B6
           MVKH    .S2     0x3d3c25c2,B7

           STDW    .D2T1   A5:A4,*B12        ; |130| 
||         LDW     .D1T2   *+A14(4),B4       ; |66| 
||         MVKH    .S2     0x68497682,B6

           CALLP   .S2     isequal,B3
||         LDW     .D1T1   *A14,A4           ; |66| 
||         MVK     .L1     0x1,A8            ; |66| 
||         MVK     .S1     0x80,A6           ; |66| 

$C$RL45:   ; CALL OCCURS {isequal} {0}       ; |66| 

           MV      .L1     A4,A3             ; |66| 
||         MVKL    .S1     fcn_pass,A4
||         MVKL    .S2     0x68497682,B6

           MVKH    .S1     fcn_pass,A4
||         MVKL    .S2     0x3d3c25c2,B7

           MV      .L1     A4,A10            ; |66| 
||         LDW     .D1T2   *+A14(8),B4       ; |67| 
||         MVKH    .S2     0x68497682,B6

           STW     .D1T1   A3,*+A10(4)       ; |66| 
||         MVKH    .S2     0x3d3c25c2,B7

           CALLP   .S2     isequal,B3
||         LDW     .D1T1   *A14,A4           ; |67| 
||         MVK     .S1     0x80,A6           ; |67| 
||         MVK     .L1     0x1,A8            ; |67| 

$C$RL46:   ; CALL OCCURS {isequal} {0}       ; |67| 
           MVKL    .S2     0x3d3c25c2,B7
           MVKL    .S2     0x68497682,B6

           STW     .D1T1   A4,*+A10(8)       ; |67| 
||         MVKH    .S2     0x3d3c25c2,B7

           LDW     .D1T2   *+A14(12),B4      ; |68| 
||         MVKH    .S2     0x68497682,B6

           CALLP   .S2     isequal,B3
||         LDW     .D1T1   *A14,A4           ; |68| 
||         MVK     .S1     0x80,A6           ; |68| 
||         MVK     .L1     0x1,A8            ; |68| 

$C$RL47:   ; CALL OCCURS {isequal} {0}       ; |68| 
           LDW     .D2T2   *+SP(28),B4       ; |68| 
           MVKL    .S2     0x3d3c25c2,B7
           MVKL    .S2     0x68497682,B6
           MVKH    .S2     0x3d3c25c2,B7

           STW     .D1T1   A4,*+A10(12)      ; |68| 
||         MVKH    .S2     0x68497682,B6

           CALLP   .S2     isequal,B3
||         LDW     .D2T2   *B4,B4            ; |69| 
||         LDW     .D1T1   *A14,A4           ; |69| 
||         MVK     .S1     0x80,A6           ; |69| 
||         MVK     .L1     0x1,A8            ; |69| 

$C$RL48:   ; CALL OCCURS {isequal} {0}       ; |69| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 11
           LDW     .D2T2   *B11,B0           ; |72| 
           STW     .D1T1   A4,*+A10(16)      ; |69| 
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
   [ A0]   CALL    .S1     print_test_results ; |218| 
           MVK     .L1     0x1,A3            ; |72| 
   [ A0]   MVKL    .S1     all_pass,A4
   [ A0]   MVKH    .S1     all_pass,A4
           NOP             1
           ; BRANCHCC OCCURS {$C$L23}        ; |72| 
;** --------------------------------------------------------------------------*
$C$L22:    
;          EXCLUSIVE CPU CYCLES: 5
           CALL    .S1     print_test_results ; |218| 
           MVKL    .S1     all_pass,A4
           MVKH    .S1     all_pass,A4
           MV      .L1     A12,A3
           NOP             1
;** --------------------------------------------------------------------------*
$C$L23:    
;          EXCLUSIVE CPU CYCLES: 1

           STW     .D1T1   A3,*A4            ; |72| 
||         MVK     .L1     0x2,A4            ; |218| 
||         ADDKPC  .S2     $C$RL49,B3,0      ; |218| 

$C$RL49:   ; CALL OCCURS {print_test_results} {0}  ; |218| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 30
           MVKL    .S2     $C$SL2+0,B4
           MVKH    .S2     $C$SL2+0,B4

           CALLP   .S2     printf,B3
||         STW     .D2T2   B4,*+SP(4)        ; |219| 

$C$RL50:   ; CALL OCCURS {printf} {0}        ; |219| 
           MVKL    .S2     $C$SL3+0,B4
           MVKH    .S2     $C$SL3+0,B4

           CALLP   .S2     printf,B3
||         STW     .D2T2   B4,*+SP(4)        ; |219| 

$C$RL51:   ; CALL OCCURS {printf} {0}        ; |219| 
           MVKL    .S1     $C$SL1+0,A10
           MVKH    .S1     $C$SL1+0,A10

           CALLP   .S2     print_profile_results,B3
||         MV      .L1     A10,A4            ; |226| 

$C$RL52:   ; CALL OCCURS {print_profile_results} {0}  ; |226| 

           CALLP   .S2     print_memory_results,B3
||         MV      .L1     A10,A4            ; |229| 

$C$RL53:   ; CALL OCCURS {print_memory_results} {0}  ; |229| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 11
           LDW     .D2T2   *++SP(48),B3      ; |230| 
           LDDW    .D2T1   *++SP,A13:A12     ; |230| 
           LDDW    .D2T1   *++SP,A15:A14     ; |230| 
           LDDW    .D2T2   *++SP,B11:B10     ; |230| 
           LDDW    .D2T2   *++SP,B13:B12     ; |230| 

           LDW     .D2T1   *++SP(8),A10      ; |230| 
||         RET     .S2     B3                ; |230| 

           LDW     .D2T1   *++SP(8),A11      ; |230| 
           NOP             4
           ; BRANCH OCCURS {B3}              ; |230| 
;******************************************************************************
;* STRINGS                                                                    *
;******************************************************************************
	.sect	".const:.string"
$C$SL1:	.string	"sqrtDP",0
$C$SL2:	.string	"----------------------------------------",0
$C$SL3:	.string	"----------------------------------------",10,0
;*****************************************************************************
;* UNDEFINED EXTERNAL REFERENCES                                             *
;*****************************************************************************
	.global	printf
	.global	sqrt
	.global	driver_init
	.global	print_profile_results
	.global	print_memory_results
	.global	print_test_results
	.global	gimme_random
	.global	isequal
	.global	sqrtdp
	.global	sqrtdp_c
	.global	sqrtdp_v
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
