;******************************************************************************
;* TMS320C6x C/C++ Codegen                                          PC v7.4.2 *
;* Date/Time created: Mon May 16 23:55:36 2016                                *
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

	.global	seed
seed:	.usect	".far",4,4
	.global	||fp||
||fp||:	.usect	".far",4,4
	.global	t_start
t_start:	.usect	".far",8,8
	.global	t_stop
t_stop:	.usect	".far",8,8
	.global	t_offset
t_offset:	.usect	".far",8,8
	.global	cycle_counts
cycle_counts:	.usect	".far",40,8
	.global	fcn_pass
fcn_pass:	.usect	".far",20,8
	.global	all_pass
all_pass:	.usect	".far",4,4
;	C:\MATHLIB_Tools\CCSV5_5_0\ccsv5\tools\compiler\c6000_7.4.2\bin\opt6x.exe C:\\Users\\gtbldadm\\AppData\\Local\\Temp\\030564 C:\\Users\\gtbldadm\\AppData\\Local\\Temp\\030566 
	.sect	".text"
	.clink
	.global	print_test_results

;******************************************************************************
;* FUNCTION NAME: print_test_results                                          *
;*                                                                            *
;*   Regs Modified     : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,B0,B1, *
;*                           B2,B3,B4,B5,B6,B7,B8,B9,B10,B11,B13,SP,A16,A17,  *
;*                           A18,A19,A20,A21,A22,A23,A24,A25,A26,A27,A28,A29, *
;*                           A30,A31,B16,B17,B18,B19,B20,B21,B22,B23,B24,B25, *
;*                           B26,B27,B28,B29,B30,B31                          *
;*   Regs Used         : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,B0,B1, *
;*                           B2,B3,B4,B5,B6,B7,B8,B9,B10,B11,B13,DP,SP,A16,   *
;*                           A17,A18,A19,A20,A21,A22,A23,A24,A25,A26,A27,A28, *
;*                           A29,A30,A31,B16,B17,B18,B19,B20,B21,B22,B23,B24, *
;*                           B25,B26,B27,B28,B29,B30,B31                      *
;*   Local Frame Size  : 8 Args + 0 Auto + 32 Save = 40 byte                  *
;******************************************************************************
print_test_results:
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 7

           CMPEQ   .L2X    A4,1,B0           ; |118| 
||         CMPEQ   .L1     A4,2,A0           ; |121| 
||         STW     .D2T2   B13,*SP--(8)      ; |114| 
||         MVKL    .S1     $C$SL5+0,A3
||         MV      .S2     B3,B13            ; |114| 

   [ B0]   B       .S1     $C$L4             ; |118| 
|| [ B0]   ZERO    .D1     A0                ; |124| nullify predicate
||         STDW    .D2T2   B11:B10,*SP--     ; |114| 
|| [!B0]   MVKL    .S2     $C$SL4+0,B4
|| [!B0]   CMPEQ   .L1     A4,3,A1           ; |124| 

   [ A0]   B       .S2     $C$L3             ; |121| 
||         STDW    .D2T1   A13:A12,*SP--     ; |114| 
||         MVKL    .S1     seed,A12

   [ B0]   CALL    .S2     printf            ; |119| 
||         STDW    .D2T1   A11:A10,*SP--     ; |114| 
||         MVKH    .S1     seed,A12
||         ZERO    .L1     A11               ; |115| 

           MVKH    .S1     $C$SL5+0,A3
|| [!B0]   LDW     .D1T1   *A12,A3           ; |121| 

   [!B0]   MVKH    .S2     $C$SL4+0,B4
           SUB     .L2     SP,8,SP           ; |114| 
           ; BRANCHCC OCCURS {$C$L4}         ; |118| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 1
   [ A0]   CALL    .S1     printf            ; |122| 
           ; BRANCHCC OCCURS {$C$L3}         ; |121| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 6

           CMPEQ   .L1     A4,4,A0           ; |127| 
|| [ A1]   B       .S1     $C$L2             ; |124| 
||         MVKL    .S2     $C$SL3+0,B4

   [ A1]   ZERO    .L1     A0                ; nullify predicate
||         MVKH    .S2     $C$SL3+0,B4

   [ A0]   B       .S1     $C$L1             ; |127| 
   [ A1]   CALL    .S1     printf            ; |125| 
   [!A1]   MVKL    .S2     $C$SL1+0,B4
   [!A1]   MVKH    .S2     $C$SL1+0,B4
           ; BRANCHCC OCCURS {$C$L2}         ; |124| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 2
   [!A0]   CALL    .S1     printf            ; |131| 
   [ A0]   CALL    .S1     printf            ; |128| 
           ; BRANCHCC OCCURS {$C$L1}         ; |127| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 4
;***	; the preceding call never returns
           STW     .D2T1   A4,*+SP(8)        ; |131| 
           ADDKPC  .S2     $C$RL0,B3,1       ; |131| 
           STW     .D2T2   B4,*+SP(4)        ; |131| 
$C$RL0:    ; CALL OCCURS {printf} {0}        ; |131| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 7

           CALLP   .S2     exit,B3
||         MVK     .L1     0x2,A4            ; |132| 

$C$RL1:    ; CALL OCCURS {exit} {0}          ; |132| 
           CALL    .S1     printf            ; |128| 
;** --------------------------------------------------------------------------*
$C$L1:    
;          EXCLUSIVE CPU CYCLES: 5
           MVKL    .S2     $C$SL2+0,B4
           MVKH    .S2     $C$SL2+0,B4
           STW     .D2T2   B4,*+SP(4)        ; |128| 
           ADDKPC  .S2     $C$RL2,B3,1       ; |128| 
$C$RL2:    ; CALL OCCURS {printf} {0}        ; |128| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 6

           MVKL    .S2     all_pass,B4
||         B       .S1     $C$L5             ; |129| 

           MVKH    .S2     all_pass,B4
||         MVKL    .S1     $C$SL15+0,A13

           LDW     .D2T2   *B4,B0            ; |136| 
||         MVKH    .S1     $C$SL15+0,A13
||         MVKL    .S2     ||fp||,B11

           MVKL    .S2     fcn_pass+4,B10
||         MVKL    .S1     $C$SL13+0,A4
||         MV      .L1     A13,A10           ; |141| 

           MVKL    .S1     $C$SL6+0,A3
||         MVKH    .S2     ||fp||,B11

           MVKH    .S2     fcn_pass+4,B10
||         MVKH    .S1     $C$SL6+0,A3

           ; BRANCH OCCURS {$C$L5}           ; |129| 
;** --------------------------------------------------------------------------*
$C$L2:    
;          EXCLUSIVE CPU CYCLES: 3
           STW     .D2T2   B4,*+SP(4)        ; |125| 
           ADDKPC  .S2     $C$RL3,B3,1       ; |125| 
$C$RL3:    ; CALL OCCURS {printf} {0}        ; |125| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 6

           MVKL    .S2     all_pass,B4
||         B       .S1     $C$L5             ; |126| 

           MVKH    .S2     all_pass,B4
||         MVKL    .S1     $C$SL15+0,A13

           LDW     .D2T2   *B4,B0            ; |136| 
||         MVKH    .S1     $C$SL15+0,A13
||         MVKL    .S2     ||fp||,B11

           MVKL    .S2     fcn_pass+4,B10
||         MVKL    .S1     $C$SL13+0,A4
||         MV      .L1     A13,A10           ; |141| 

           MVKL    .S1     $C$SL6+0,A3
||         MVKH    .S2     ||fp||,B11

           MVKH    .S2     fcn_pass+4,B10
||         MVKH    .S1     $C$SL6+0,A3

           ; BRANCH OCCURS {$C$L5}           ; |126| 
;** --------------------------------------------------------------------------*
$C$L3:    
;          EXCLUSIVE CPU CYCLES: 5
           STW     .D2T2   B4,*+SP(4)        ; |122| 
           STW     .D2T1   A3,*+SP(8)        ; |122| 
           ADDKPC  .S2     $C$RL4,B3,2       ; |122| 
$C$RL4:    ; CALL OCCURS {printf} {0}        ; |122| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 6

           MVKL    .S2     all_pass,B4
||         B       .S1     $C$L5             ; |123| 

           MVKH    .S2     all_pass,B4
||         MVKL    .S1     $C$SL15+0,A13

           LDW     .D2T2   *B4,B0            ; |136| 
||         MVKH    .S1     $C$SL15+0,A13
||         MVKL    .S2     fcn_pass+4,B10

           MVKL    .S2     ||fp||,B11
||         MVKL    .S1     $C$SL6+0,A3
||         MV      .L1     A13,A10           ; |141| 

           MVKL    .S1     $C$SL13+0,A4
||         MVKH    .S2     fcn_pass+4,B10

           MVKH    .S2     ||fp||,B11
||         MVKH    .S1     $C$SL6+0,A3

           ; BRANCH OCCURS {$C$L5}           ; |123| 
;** --------------------------------------------------------------------------*
$C$L4:    
;          EXCLUSIVE CPU CYCLES: 8
           ADDKPC  .S2     $C$RL5,B3,0       ; |119| 
           STW     .D2T1   A3,*+SP(4)        ; |119| 
$C$RL5:    ; CALL OCCURS {printf} {0}        ; |119| 

           MVKL    .S2     all_pass,B4
||         MVKL    .S1     $C$SL15+0,A13

           MVKH    .S2     all_pass,B4
||         MVKH    .S1     $C$SL15+0,A13

           LDW     .D2T2   *B4,B0            ; |136| 
||         MVKL    .S1     $C$SL6+0,A3
||         MVKL    .S2     fcn_pass+4,B10
||         MV      .L1     A13,A10           ; |141| 

           MVKL    .S2     ||fp||,B11
||         MVKH    .S1     $C$SL6+0,A3

           MVKH    .S2     fcn_pass+4,B10
||         MVKL    .S1     $C$SL13+0,A4

           MVKH    .S2     ||fp||,B11
;** --------------------------------------------------------------------------*
$C$L5:    
;          EXCLUSIVE CPU CYCLES: 7
           MVKH    .S1     $C$SL13+0,A4
   [ B0]   B       .S1     $C$L13            ; |136| 
   [!B0]   CALL    .S1     printf            ; |149| 
   [ B0]   CALL    .S1     printf            ; |137| 
           NOP             3
           ; BRANCHCC OCCURS {$C$L13}        ; |136| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 1

           STW     .D2T1   A3,*+SP(4)        ; |149| 
||         ADDKPC  .S2     $C$RL6,B3,0       ; |149| 

$C$RL6:    ; CALL OCCURS {printf} {0}        ; |149| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 11
           LDW     .D2T2   *B10,B0           ; |151| 
           MVKL    .S2     $C$SL7+0,B4
           MVKH    .S2     $C$SL7+0,B4
           NOP             2

   [ B0]   ADD     .L1X    4,B10,A10
|| [ B0]   B       .S1     $C$L6             ; |151| 

   [!B0]   CALL    .S1     printf            ; |152| 
|| [ B0]   LDW     .D1T1   *A10,A0           ; |155| 

           NOP             4
           ; BRANCHCC OCCURS {$C$L6}         ; |151| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 1

           STW     .D2T2   B4,*+SP(4)        ; |152| 
||         ADDKPC  .S2     $C$RL7,B3,0       ; |152| 

$C$RL7:    ; CALL OCCURS {printf} {0}        ; |152| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 6
           ADD     .L1X    4,B10,A10
           LDW     .D1T1   *A10,A0           ; |155| 
           MVK     .L2     0x1,B4            ; |153| 
           NOP             2
           MV      .L1X    B4,A11            ; |153| 
;** --------------------------------------------------------------------------*
$C$L6:    
;          EXCLUSIVE CPU CYCLES: 6

           MV      .L1     A0,A1             ; guard predicate rewrite
|| [ A0]   B       .S2     $C$L8             ; |155| 
||         MV      .S1     A0,A2             ; branch predicate copy
||         MV      .D1     A11,A0            ; |156| 

   [ A1]   MVK     .L1     0x1,A0            ; |156| nullify predicate
|| [ A2]   ADD     .S1     4,A10,A10
||         MVKL    .S2     $C$SL8+0,B4

   [!A0]   BNOP    .S1     $C$L7,3           ; |156| 
|| [ A2]   LDW     .D1T1   *A10,A0           ; |160| 
||         MVKH    .S2     $C$SL8+0,B4

           ; BRANCHCC OCCURS {$C$L8}         ; |155| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 2
           NOP             2
           ; BRANCHCC OCCURS {$C$L7}         ; |156| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 6

           CALLP   .S2     printf,B3
||         STW     .D2T2   B4,*+SP(4)        ; |156| 

$C$RL8:    ; CALL OCCURS {printf} {0}        ; |156| 
;** --------------------------------------------------------------------------*
$C$L7:    
;          EXCLUSIVE CPU CYCLES: 8
           MVKL    .S2     $C$SL9+0,B4
           MVKH    .S2     $C$SL9+0,B4

           CALLP   .S2     printf,B3
||         STW     .D2T2   B4,*+SP(4)        ; |157| 

$C$RL9:    ; CALL OCCURS {printf} {0}        ; |157| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           ADD     .L1     4,A10,A10
           LDW     .D1T1   *A10,A0           ; |160| 
           MVK     .L2     0x1,B4            ; |158| 
           NOP             1
           MV      .L1X    B4,A11            ; |158| 
;** --------------------------------------------------------------------------*
$C$L8:    
;          EXCLUSIVE CPU CYCLES: 7

           ADD     .L1     4,A10,A3
||         MVKL    .S2     $C$SL8+0,B4

           MV      .L1     A0,A1             ; guard predicate rewrite
|| [ A0]   B       .S2     $C$L10            ; |160| 
||         MV      .S1     A0,A2             ; branch predicate copy
||         MV      .D1     A11,A0            ; |161| 

   [ A1]   MVK     .L1     0x1,A0            ; |161| nullify predicate
||         MVKH    .S2     $C$SL8+0,B4

   [!A0]   BNOP    .S1     $C$L9,3           ; |161| 
|| [ A2]   LDW     .D1T1   *A3,A0            ; |165| 

           ; BRANCHCC OCCURS {$C$L10}        ; |160| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 2
           NOP             2
           ; BRANCHCC OCCURS {$C$L9}         ; |161| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 6

           CALLP   .S2     printf,B3
||         STW     .D2T2   B4,*+SP(4)        ; |161| 

$C$RL10:   ; CALL OCCURS {printf} {0}        ; |161| 
;** --------------------------------------------------------------------------*
$C$L9:    
;          EXCLUSIVE CPU CYCLES: 8
           MVKL    .S2     $C$SL10+0,B4
           MVKH    .S2     $C$SL10+0,B4

           CALLP   .S2     printf,B3
||         STW     .D2T2   B4,*+SP(4)        ; |162| 

$C$RL11:   ; CALL OCCURS {printf} {0}        ; |162| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           ADD     .L1     4,A10,A3
           LDW     .D1T1   *A3,A0            ; |165| 
           MVK     .L2     0x1,B4            ; |163| 
           NOP             1
           MV      .L1X    B4,A11            ; |163| 
;** --------------------------------------------------------------------------*
$C$L10:    
;          EXCLUSIVE CPU CYCLES: 7
           MVKL    .S2     $C$SL8+0,B4

           MV      .L1     A0,A1             ; guard predicate rewrite
|| [ A0]   B       .S1     $C$L12            ; |165| 
||         MV      .D1     A11,A0            ; |166| 
||         MVKH    .S2     $C$SL8+0,B4

   [ A1]   MVK     .L1     0x1,A0            ; |166| nullify predicate
   [!A0]   BNOP    .S1     $C$L11,3          ; |166| 
           ; BRANCHCC OCCURS {$C$L12}        ; |165| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 2
   [ A0]   CALL    .S1     printf            ; |166| 
   [!A0]   CALL    .S1     printf            ; |167| 
           ; BRANCHCC OCCURS {$C$L11}        ; |166| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           STW     .D2T2   B4,*+SP(4)        ; |166| 
           ADDKPC  .S2     $C$RL12,B3,2      ; |166| 
$C$RL12:   ; CALL OCCURS {printf} {0}        ; |166| 
           CALL    .S1     printf            ; |167| 
;** --------------------------------------------------------------------------*
$C$L11:    
;          EXCLUSIVE CPU CYCLES: 5
           MVKL    .S2     $C$SL11+0,B4
           MVKH    .S2     $C$SL11+0,B4
           STW     .D2T2   B4,*+SP(4)        ; |167| 
           ADDKPC  .S2     $C$RL13,B3,1      ; |167| 
$C$RL13:   ; CALL OCCURS {printf} {0}        ; |167| 
;** --------------------------------------------------------------------------*
$C$L12:    
;          EXCLUSIVE CPU CYCLES: 8
           MVKL    .S2     $C$SL12+0,B4
           MVKH    .S2     $C$SL12+0,B4

           CALLP   .S2     printf,B3
||         STW     .D2T2   B4,*+SP(4)        ; |169| 

$C$RL14:   ; CALL OCCURS {printf} {0}        ; |169| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 9
           ADD     .L2     8,SP,SP           ; |171| 
           LDDW    .D2T1   *++SP,A11:A10     ; |171| 

           LDDW    .D2T1   *++SP,A13:A12     ; |171| 
||         MV      .L2     B13,B3            ; |171| 

           LDDW    .D2T2   *++SP,B11:B10     ; |171| 
||         RET     .S2     B3                ; |171| 

           LDW     .D2T2   *++SP(8),B13      ; |171| 
           NOP             4
           ; BRANCH OCCURS {B3}              ; |171| 
;** --------------------------------------------------------------------------*
$C$L13:    
;          EXCLUSIVE CPU CYCLES: 2
           STW     .D2T1   A4,*+SP(4)        ; |137| 
           ADDKPC  .S2     $C$RL15,B3,0      ; |137| 
$C$RL15:   ; CALL OCCURS {printf} {0}        ; |137| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 14
           CALLP   .S2     rand,B3
$C$RL16:   ; CALL OCCURS {rand} {0}          ; |140| 
           MVKL    .S2     $C$SL14+0,B4
           MVKH    .S2     $C$SL14+0,B4

           CALLP   .S2     fopen,B3
||         STW     .D1T1   A4,*A12           ; |140| 
||         MV      .L1     A10,A4            ; |141| 

$C$RL17:   ; CALL OCCURS {fopen} {0}         ; |141| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 7

           MV      .L1     A4,A0             ; |141| 
||         MVKL    .S1     $C$SL16+0,A3
||         MV      .D1     A4,A10            ; |141| 

   [ A0]   B       .S2     $C$L14            ; |141| 
||         MVKH    .S1     $C$SL16+0,A3
|| [ A0]   LDW     .D1T1   *A12,A3           ; |145| 

           STW     .D2T1   A0,*B11           ; |141| 
   [!A0]   CALL    .S1     printf            ; |142| 
   [ A0]   CALL    .S1     fprintf           ; |145| 
   [ A0]   MVKL    .S2     $C$SL17+0,B4
   [ A0]   MVKH    .S2     $C$SL17+0,B4
           ; BRANCHCC OCCURS {$C$L14}        ; |141| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 2
;***	; the preceding call never returns
           STW     .D2T1   A3,*+SP(4)        ; |142| 

           STW     .D2T1   A13,*+SP(8)       ; |142| 
||         ADDKPC  .S2     $C$RL18,B3,0      ; |142| 

$C$RL18:   ; CALL OCCURS {printf} {0}        ; |142| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 10

           CALLP   .S2     exit,B3
||         MVK     .L1     0x1,A4            ; |143| 

$C$RL19:   ; CALL OCCURS {exit} {0}          ; |143| 
           LDW     .D1T1   *A12,A3           ; |145| 
           CALL    .S1     fprintf           ; |145| 
           MVKL    .S2     $C$SL17+0,B4
           MVKH    .S2     $C$SL17+0,B4
;** --------------------------------------------------------------------------*
$C$L14:    
;          EXCLUSIVE CPU CYCLES: 3
           ADDKPC  .S2     $C$RL20,B3,0      ; |145| 
           STW     .D2T1   A3,*+SP(8)        ; |145| 

           MV      .L1     A10,A4            ; |145| 
||         STW     .D2T2   B4,*+SP(4)        ; |145| 

$C$RL20:   ; CALL OCCURS {fprintf} {0}       ; |145| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 6

           CALLP   .S2     fclose,B3
||         MV      .L1     A10,A4            ; |146| 

$C$RL21:   ; CALL OCCURS {fclose} {0}        ; |146| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 9
           ADD     .L2     8,SP,SP           ; |171| 
           LDDW    .D2T1   *++SP,A11:A10     ; |171| 

           LDDW    .D2T1   *++SP,A13:A12     ; |171| 
||         MV      .L2     B13,B3            ; |171| 

           LDDW    .D2T2   *++SP,B11:B10     ; |171| 
||         RET     .S2     B3                ; |171| 

           LDW     .D2T2   *++SP(8),B13      ; |171| 
           NOP             4
           ; BRANCH OCCURS {B3}              ; |171| 
	.sect	".text"
	.clink
	.global	print_profile_results

;******************************************************************************
;* FUNCTION NAME: print_profile_results                                       *
;*                                                                            *
;*   Regs Modified     : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,B0,B1,B2,B3,B4,*
;*                           B5,B6,B7,B8,B9,B10,B11,SP,A16,A17,A18,A19,A20,   *
;*                           A21,A22,A23,A24,A25,A26,A27,A28,A29,A30,A31,B16, *
;*                           B17,B18,B19,B20,B21,B22,B23,B24,B25,B26,B27,B28, *
;*                           B29,B30,B31                                      *
;*   Regs Used         : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,B0,B1,B2,B3,B4,*
;*                           B5,B6,B7,B8,B9,B10,B11,DP,SP,A16,A17,A18,A19,A20,*
;*                           A21,A22,A23,A24,A25,A26,A27,A28,A29,A30,A31,B16, *
;*                           B17,B18,B19,B20,B21,B22,B23,B24,B25,B26,B27,B28, *
;*                           B29,B30,B31                                      *
;*   Local Frame Size  : 8 Args + 0 Auto + 24 Save = 32 byte                  *
;******************************************************************************
print_profile_results:
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 10
           STW     .D2T1   A11,*SP--(8)      ; |84| 
           STDW    .D2T2   B11:B10,*SP--     ; |84| 

           STW     .D2T1   A10,*SP--(8)      ; |84| 
||         MVKL    .S2     $C$SL18+0,B4

           SUB     .L2     SP,8,SP           ; |84| 
||         MVKH    .S2     $C$SL18+0,B4

           MV      .L1X    B3,A11            ; |84| 
||         CALLP   .S2     printf,B3
||         STW     .D2T2   B4,*+SP(4)        ; |85| 
||         MV      .S1     A4,A10            ; |84| 

$C$RL22:   ; CALL OCCURS {printf} {0}        ; |85| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 93
           MVKL    .S2     $C$SL19+0,B11
           MVKH    .S2     $C$SL19+0,B11

           CALLP   .S2     printf,B3
||         STW     .D2T2   B11,*+SP(4)       ; |86| 

$C$RL23:   ; CALL OCCURS {printf} {0}        ; |86| 
           MVKL    .S2     $C$SL20+0,B10
           MVKH    .S2     $C$SL20+0,B10

           CALLP   .S2     printf,B3
||         STW     .D2T2   B10,*+SP(4)       ; |86| 

$C$RL24:   ; CALL OCCURS {printf} {0}        ; |86| 
           MVKL    .S2     $C$SL21+0,B4

           MVKH    .S2     $C$SL21+0,B4
||         STW     .D2T1   A10,*+SP(8)       ; |87| 

           CALLP   .S2     printf,B3
||         STW     .D2T2   B4,*+SP(4)        ; |87| 

$C$RL25:   ; CALL OCCURS {printf} {0}        ; |87| 

           CALLP   .S2     printf,B3
||         STW     .D2T2   B11,*+SP(4)       ; |88| 

$C$RL26:   ; CALL OCCURS {printf} {0}        ; |88| 

           CALLP   .S2     printf,B3
||         STW     .D2T2   B10,*+SP(4)       ; |88| 

$C$RL27:   ; CALL OCCURS {printf} {0}        ; |88| 
           MVKL    .S1     cycle_counts,A10
           MVKH    .S1     cycle_counts,A10
           LDW     .D1T1   *A10,A3           ; |89| 
           MVKL    .S2     $C$SL22+0,B4
           MVKH    .S2     $C$SL22+0,B4
           STW     .D2T2   B4,*+SP(4)        ; |89| 
           NOP             1

           CALLP   .S2     printf,B3
||         STW     .D2T1   A3,*+SP(8)        ; |89| 

$C$RL28:   ; CALL OCCURS {printf} {0}        ; |89| 
           LDW     .D1T1   *+A10(8),A3       ; |90| 
           MVKL    .S2     $C$SL23+0,B4
           MVKH    .S2     $C$SL23+0,B4
           STW     .D2T2   B4,*+SP(4)        ; |90| 
           NOP             1

           CALLP   .S2     printf,B3
||         STW     .D2T1   A3,*+SP(8)        ; |90| 

$C$RL29:   ; CALL OCCURS {printf} {0}        ; |90| 
           LDW     .D1T1   *+A10(16),A3      ; |91| 
           MVKL    .S2     $C$SL24+0,B4
           MVKH    .S2     $C$SL24+0,B4
           STW     .D2T2   B4,*+SP(4)        ; |91| 
           NOP             1

           CALLP   .S2     printf,B3
||         STW     .D2T1   A3,*+SP(8)        ; |91| 

$C$RL30:   ; CALL OCCURS {printf} {0}        ; |91| 
           LDW     .D1T1   *+A10(24),A3      ; |92| 
           MVKL    .S2     $C$SL25+0,B4
           MVKH    .S2     $C$SL25+0,B4
           STW     .D2T2   B4,*+SP(4)        ; |92| 
           NOP             1

           CALLP   .S2     printf,B3
||         STW     .D2T1   A3,*+SP(8)        ; |92| 

$C$RL31:   ; CALL OCCURS {printf} {0}        ; |92| 
           LDW     .D1T1   *+A10(32),A3      ; |93| 
           MVKL    .S2     $C$SL26+0,B4
           MVKH    .S2     $C$SL26+0,B4
           STW     .D2T2   B4,*+SP(4)        ; |93| 
           NOP             1

           CALLP   .S2     printf,B3
||         STW     .D2T1   A3,*+SP(8)        ; |93| 

$C$RL32:   ; CALL OCCURS {printf} {0}        ; |93| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 6

           CALLP   .S2     printf,B3
||         STW     .D2T2   B11,*+SP(4)       ; |94| 

$C$RL33:   ; CALL OCCURS {printf} {0}        ; |94| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 6

           CALLP   .S2     printf,B3
||         STW     .D2T2   B10,*+SP(4)       ; |94| 

$C$RL34:   ; CALL OCCURS {printf} {0}        ; |94| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 8
           ADD     .L2     8,SP,SP           ; |95| 

           LDW     .D2T1   *++SP(8),A10      ; |95| 
||         MV      .L2X    A11,B3            ; |95| 

           LDDW    .D2T2   *++SP,B11:B10     ; |95| 
||         RET     .S2     B3                ; |95| 

           LDW     .D2T1   *++SP(8),A11      ; |95| 
           NOP             4
           ; BRANCH OCCURS {B3}              ; |95| 
	.sect	".text"
	.clink
	.global	print_memory_results

;******************************************************************************
;* FUNCTION NAME: print_memory_results                                        *
;*                                                                            *
;*   Regs Modified     : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,B0,B1,B2,B3,B4,*
;*                           B5,B6,B7,B8,B9,B10,B11,SP,A16,A17,A18,A19,A20,   *
;*                           A21,A22,A23,A24,A25,A26,A27,A28,A29,A30,A31,B16, *
;*                           B17,B18,B19,B20,B21,B22,B23,B24,B25,B26,B27,B28, *
;*                           B29,B30,B31                                      *
;*   Regs Used         : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,B0,B1,B2,B3,B4,*
;*                           B5,B6,B7,B8,B9,B10,B11,DP,SP,A16,A17,A18,A19,A20,*
;*                           A21,A22,A23,A24,A25,A26,A27,A28,A29,A30,A31,B16, *
;*                           B17,B18,B19,B20,B21,B22,B23,B24,B25,B26,B27,B28, *
;*                           B29,B30,B31                                      *
;*   Local Frame Size  : 8 Args + 0 Auto + 24 Save = 32 byte                  *
;******************************************************************************
print_memory_results:
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 10
           STW     .D2T1   A11,*SP--(8)      ; |100| 
           STDW    .D2T2   B11:B10,*SP--     ; |100| 

           STW     .D2T1   A10,*SP--(8)      ; |100| 
||         MVKL    .S1     $C$SL18+0,A3

           SUB     .L2     SP,8,SP           ; |100| 
||         MVKH    .S1     $C$SL18+0,A3

           MV      .L2     B3,B11            ; |100| 
||         CALLP   .S2     printf,B3
||         STW     .D2T1   A3,*+SP(4)        ; |101| 
||         MV      .L1     A4,A10            ; |100| 

$C$RL35:   ; CALL OCCURS {printf} {0}        ; |101| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 75
           MVKL    .S1     $C$SL19+0,A11
           MVKH    .S1     $C$SL19+0,A11

           CALLP   .S2     printf,B3
||         STW     .D2T1   A11,*+SP(4)       ; |102| 

$C$RL36:   ; CALL OCCURS {printf} {0}        ; |102| 
           MVKL    .S2     $C$SL20+0,B10
           MVKH    .S2     $C$SL20+0,B10

           CALLP   .S2     printf,B3
||         STW     .D2T2   B10,*+SP(4)       ; |102| 

$C$RL37:   ; CALL OCCURS {printf} {0}        ; |102| 
           MVKL    .S2     $C$SL27+0,B4

           MVKH    .S2     $C$SL27+0,B4
||         STW     .D2T1   A10,*+SP(8)       ; |103| 

           CALLP   .S2     printf,B3
||         STW     .D2T2   B4,*+SP(4)        ; |103| 

$C$RL38:   ; CALL OCCURS {printf} {0}        ; |103| 

           CALLP   .S2     printf,B3
||         STW     .D2T1   A11,*+SP(4)       ; |104| 

$C$RL39:   ; CALL OCCURS {printf} {0}        ; |104| 

           CALLP   .S2     printf,B3
||         STW     .D2T2   B10,*+SP(4)       ; |104| 

$C$RL40:   ; CALL OCCURS {printf} {0}        ; |104| 
           MVKL    .S2     _kernel_asm_size,B4

           MVKL    .S1     $C$SL28+0,A3
||         MVKH    .S2     _kernel_asm_size,B4

           MVKH    .S1     $C$SL28+0,A3
||         STW     .D2T2   B4,*+SP(8)        ; |105| 

           CALLP   .S2     printf,B3
||         STW     .D2T1   A3,*+SP(4)        ; |105| 

$C$RL41:   ; CALL OCCURS {printf} {0}        ; |105| 
           MVKL    .S1     $C$SL29+0,A3

           MVKL    .S2     _kernel_ci_size,B4
||         MVKH    .S1     $C$SL29+0,A3

           MVKH    .S2     _kernel_ci_size,B4
||         STW     .D2T1   A3,*+SP(4)        ; |106| 

           CALLP   .S2     printf,B3
||         STW     .D2T2   B4,*+SP(8)        ; |106| 

$C$RL42:   ; CALL OCCURS {printf} {0}        ; |106| 
           MVKL    .S1     $C$SL30+0,A3

           MVKL    .S2     _kernel_vec_size,B4
||         MVKH    .S1     $C$SL30+0,A3

           MVKH    .S2     _kernel_vec_size,B4
||         STW     .D2T1   A3,*+SP(4)        ; |107| 

           CALLP   .S2     printf,B3
||         STW     .D2T2   B4,*+SP(8)        ; |107| 

$C$RL43:   ; CALL OCCURS {printf} {0}        ; |107| 

           CALLP   .S2     printf,B3
||         STW     .D2T1   A11,*+SP(4)       ; |108| 

$C$RL44:   ; CALL OCCURS {printf} {0}        ; |108| 

           CALLP   .S2     printf,B3
||         STW     .D2T2   B10,*+SP(4)       ; |108| 

$C$RL45:   ; CALL OCCURS {printf} {0}        ; |108| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 8
           ADD     .L2     8,SP,SP           ; |109| 

           LDW     .D2T1   *++SP(8),A10      ; |109| 
||         MV      .L2     B11,B3            ; |109| 

           LDDW    .D2T2   *++SP,B11:B10     ; |109| 
||         RET     .S2     B3                ; |109| 

           LDW     .D2T1   *++SP(8),A11      ; |109| 
           NOP             4
           ; BRANCH OCCURS {B3}              ; |109| 
	.sect	".text"
	.clink
	.global	driver_init

;******************************************************************************
;* FUNCTION NAME: driver_init                                                 *
;*                                                                            *
;*   Regs Modified     : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,B0,B1,B2,B3,B4,*
;*                           B5,B6,B7,B8,B9,B10,B11,SP,A16,A17,A18,A19,A20,   *
;*                           A21,A22,A23,A24,A25,A26,A27,A28,A29,A30,A31,B16, *
;*                           B17,B18,B19,B20,B21,B22,B23,B24,B25,B26,B27,B28, *
;*                           B29,B30,B31                                      *
;*   Regs Used         : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,B0,B1,B2,B3,B4,*
;*                           B5,B6,B7,B8,B9,B10,B11,DP,SP,A16,A17,A18,A19,A20,*
;*                           A21,A22,A23,A24,A25,A26,A27,A28,A29,A30,A31,B16, *
;*                           B17,B18,B19,B20,B21,B22,B23,B24,B25,B26,B27,B28, *
;*                           B29,B30,B31                                      *
;*   Local Frame Size  : 8 Args + 0 Auto + 24 Save = 32 byte                  *
;******************************************************************************
driver_init:
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 10
           STW     .D2T1   A11,*SP--(8)      ; |65| 
           STDW    .D2T2   B11:B10,*SP--     ; |65| 

           STW     .D2T1   A10,*SP--(8)      ; |65| 
||         MVKL    .S1     $C$SL31+0,A3

           SUB     .L2     SP,8,SP           ; |65| 
||         MVKH    .S1     $C$SL31+0,A3

           MV      .L2     B3,B11            ; |65| 
||         CALLP   .S2     printf,B3
||         STW     .D2T1   A3,*+SP(4)        ; |67| 
||         MV      .L1     A4,A10            ; |65| 

$C$RL46:   ; CALL OCCURS {printf} {0}        ; |67| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 44
           MVKL    .S1     $C$SL19+0,A11
           MVKH    .S1     $C$SL19+0,A11

           CALLP   .S2     printf,B3
||         STW     .D2T1   A11,*+SP(4)       ; |68| 

$C$RL47:   ; CALL OCCURS {printf} {0}        ; |68| 
           MVKL    .S2     $C$SL20+0,B10
           MVKH    .S2     $C$SL20+0,B10

           CALLP   .S2     printf,B3
||         STW     .D2T2   B10,*+SP(4)       ; |68| 

$C$RL48:   ; CALL OCCURS {printf} {0}        ; |68| 
           MVKL    .S2     $C$SL32+0,B4

           MVKH    .S2     $C$SL32+0,B4
||         STW     .D2T1   A10,*+SP(8)       ; |69| 

           CALLP   .S2     printf,B3
||         STW     .D2T2   B4,*+SP(4)        ; |69| 

$C$RL49:   ; CALL OCCURS {printf} {0}        ; |69| 

           CALLP   .S2     printf,B3
||         STW     .D2T1   A11,*+SP(4)       ; |70| 

$C$RL50:   ; CALL OCCURS {printf} {0}        ; |70| 

           CALLP   .S2     printf,B3
||         STW     .D2T2   B10,*+SP(4)       ; |70| 

$C$RL51:   ; CALL OCCURS {printf} {0}        ; |70| 

           MVKL    .S1     0x2a3a4a5a,A4
||         MVKL    .S2     seed,B4

           MVKH    .S1     0x2a3a4a5a,A4
||         MVKH    .S2     seed,B4

           CALLP   .S2     srand,B3
||         STW     .D2T1   A4,*B4            ; |73| 

$C$RL52:   ; CALL OCCURS {srand} {0}         ; |78| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 8
           ADD     .L2     8,SP,SP           ; |79| 

           LDW     .D2T1   *++SP(8),A10      ; |79| 
||         MV      .L2     B11,B3            ; |79| 

           LDDW    .D2T2   *++SP,B11:B10     ; |79| 
||         RET     .S2     B3                ; |79| 

           LDW     .D2T1   *++SP(8),A11      ; |79| 
           NOP             4
           ; BRANCH OCCURS {B3}              ; |79| 
;******************************************************************************
;* STRINGS                                                                    *
;******************************************************************************
	.sect	".const:.string"
$C$SL1:	.string	"Undefined test code ",34,"%d",34,10,0
$C$SL2:	.string	"Extended Range Data: ",0
$C$SL3:	.string	"Special Case Data: ",0
$C$SL4:	.string	"Random Data (seed = %d): ",0
$C$SL5:	.string	"Pre-defined Data: ",0
$C$SL6:	.string	" Failed (",0
$C$SL7:	.string	"ASM",0
$C$SL8:	.string	",",0
$C$SL9:	.string	"C",0
$C$SL10:	.string	"INL",0
$C$SL11:	.string	"VEC",0
$C$SL12:	.string	")",10,0
$C$SL13:	.string	" Passed",10,0
$C$SL14:	.string	"w",0
$C$SL15:	.string	"seedfile.txt",0
$C$SL16:	.string	"Error writing seed file ",34,"%s",34,10,0
$C$SL17:	.string	"%d",10,0
$C$SL18:	.string	10,0
$C$SL19:	.string	"----------------------------------------",0
$C$SL20:	.string	"----------------------------------------",10,0
$C$SL21:	.string	"Cycle Profile:  %s",10,0
$C$SL22:	.string	"RTS:     %d cycles",10,0
$C$SL23:	.string	"ASM:     %d cycles",10,0
$C$SL24:	.string	"C:       %d cycles",10,0
$C$SL25:	.string	"Inline:  %d cycles",10,0
$C$SL26:	.string	"Vector:  %d cycles",10,0
$C$SL27:	.string	"Memory Profile:  %s",10,0
$C$SL28:	.string	"ASM:     %d bytes",10,0
$C$SL29:	.string	"C:       %d bytes",10,0
$C$SL30:	.string	"Vector:  %d bytes",10,0
$C$SL31:	.string	10,10,10,10,0
$C$SL32:	.string	"Verification Results:  %s",10,0
;*****************************************************************************
;* UNDEFINED EXTERNAL REFERENCES                                             *
;*****************************************************************************
	.global	fclose
	.global	fopen
	.global	fprintf
	.global	printf
	.global	rand
	.global	srand
	.global	exit
	.global	_kernel_asm_size
	.global	_kernel_vec_size
	.global	_kernel_ci_size

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
