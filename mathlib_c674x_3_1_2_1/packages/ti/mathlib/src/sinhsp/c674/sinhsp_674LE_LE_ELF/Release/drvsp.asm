;******************************************************************************
;* TMS320C6x C/C++ Codegen                                          PC v7.4.2 *
;* Date/Time created: Mon May 16 23:57:34 2016                                *
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

	.global	a_ext
a_ext:	.usect	".far",8000,8
	.global	b_ext
b_ext:	.usect	".far",8000,8
	.global	a_sc
a_sc:	.usect	".far",400,8
	.global	b_sc
b_sc:	.usect	".far",400,8
	.global	output_data
output_data:	.usect	".far",40000,8
	.global	output
	.sect	".fardata:output", RW
	.clink
	.align	8
	.elfsym	output,SYM_SIZE(20)
output:
	.field	output_data,32		; output[0] @ 0
	.field	output_data+8000,32		; output[1] @ 32
	.field	output_data+16000,32		; output[2] @ 64
	.field	output_data+24000,32		; output[3] @ 96
	.field	output_data+32000,32		; output[4] @ 128

	.global	input_data
input_data:	.usect	".far",16000,8
	.global	input
	.sect	".fardata:input", RW
	.clink
	.align	8
	.elfsym	input,SYM_SIZE(8)
input:
	.field	input_data,32		; input[0] @ 0
	.field	input_data+8000,32		; input[1] @ 32

;	C:\MATHLIB_Tools\CCSV5_5_0\ccsv5\tools\compiler\c6000_7.4.2\bin\opt6x.exe C:\\Users\\gtbldadm\\AppData\\Local\\Temp\\020565 C:\\Users\\gtbldadm\\AppData\\Local\\Temp\\020567 
	.sect	".text"
	.clink

;******************************************************************************
;* FUNCTION NAME: __c6xabi_isnanf                                             *
;*                                                                            *
;*   Regs Modified     : A4,B4,B5,SP                                          *
;*   Regs Used         : A4,B3,B4,B5,SP                                       *
;*   Local Frame Size  : 0 Args + 4 Auto + 0 Save = 4 byte                    *
;******************************************************************************
__c6xabi_isnanf:
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 11
           SUB     .L2     SP,8,SP           ; |293| 
           STW     .D2T1   A4,*+SP(4)        ; |293| 
           LDW     .D2T2   *+SP(4),B5        ; |294| 
           LDW     .D2T2   *+SP(4),B4        ; |294| 
           ADD     .L2     8,SP,SP           ; |295| 
           RETNOP  .S2     B3,2              ; |295| 
           CMPEQSP .S2     B4,B5,B4          ; |294| 
           NOP             1
           XOR     .L1X    1,B4,A4           ; |294| 
           ; BRANCH OCCURS {B3}              ; |295| 
	.sect	".text"
	.clink
	.global	isequal

;******************************************************************************
;* FUNCTION NAME: isequal                                                     *
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
;*   Local Frame Size  : 0 Args + 32 Auto + 56 Save = 88 byte                 *
;******************************************************************************
isequal:
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 13

           STW     .D2T1   A11,*SP--(8)      ; |80| 
||         CMPGT   .L1     A6,0,A0           ; |93| 
||         SHR     .S1     A8,1,A5
||         MV      .L2     B7,B5             ; |80| 

           STW     .D2T1   A10,*SP--(8)      ; |80| 
||         EXTU    .S1     A8,29,31,A3       ; |90| 

           STDW    .D2T2   B13:B12,*SP--     ; |80| 
||         MVK     .L2     0x1,B12           ; |82| 

           STDW    .D2T2   B11:B10,*SP--     ; |80| 
||         SUB     .L2X    A4,4,B10
||         EXTU    .S1     A8,28,31,A4       ; |91| 

           STDW    .D2T1   A15:A14,*SP--     ; |80| 
||         SUB     .L1X    B4,4,A14
||         MV      .L2     B6,B4             ; |80| 
||         MVK     .S2     1,B6

           STDW    .D2T1   A13:A12,*SP--     ; |80| 
||         ANDN    .L2X    B6,A5,B13
||         MVKL    .S1     0x3831039d,A5

           STW     .D2T2   B3,*SP--(40)      ; |80| 
||         MVKH    .S1     0x3831039d,A5

           STW     .D2T1   A4,*+SP(32)
|| [!A0]   B       .S2     $C$L14            ; |93| 
||         MVKL    .S1     0x428a8b8f,A4

           AND     .L1     1,A8,A3           ; |88| 
||         MVKH    .S1     0x428a8b8f,A4
||         STW     .D2T1   A3,*+SP(28)       ; |90| 
|| [ A0]   CALL    .S2     __c6xabi_divd

           STW     .D2T1   A3,*+SP(24)
           STW     .D2T1   A6,*+SP(4)        ; |80| 
           STW     .D2T2   B4,*+SP(8)        ; |80| 
           STW     .D2T2   B5,*+SP(12)       ; |80| 
           ; BRANCHCC OCCURS {$C$L14}        ; |93| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 1
           ADDKPC  .S2     $C$RL0,B3,0
$C$RL0:    ; CALL OCCURS {__c6xabi_divd} {0} 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5

           LDW     .D2T2   *++B10,B11        ; |95| 
||         CALL    .S1     __c6xabi_isinff   ; |97| 

           LDW     .D1T1   *++A14,A12        ; |95| 
           MV      .L1     A5,A11
           MV      .L1     A4,A10
           NOP             1
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains control code
;*----------------------------------------------------------------------------*
$C$L1:    
;          EXCLUSIVE CPU CYCLES: 1

           ADDKPC  .S2     $C$RL1,B3,0       ; |97| 
||         MV      .L1X    B11,A4            ; |97| 

$C$RL1:    ; CALL OCCURS {__c6xabi_isinff} {0}  ; |97| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 7

           MV      .S1     A4,A0             ; |97| 
||         SUBSP   .L1X    B11,A12,A3        ; |95| 

   [ A0]   B       .S1     $C$L2             ; |97| 
|| [!A0]   LDW     .D2T2   *B10,B6           ; |97| 

   [!A0]   CALL    .S1     __c6xabi_isnanf   ; |97| 
   [ A0]   CALL    .S1     __c6xabi_isinff   ; |97| 
   [ A0]   LDW     .D1T1   *A14,A4           ; |97| 
           ABSSP   .S1     A3,A3             ; |95| 
           SPDP    .S1     A3,A13:A12        ; |95| 
           ; BRANCHCC OCCURS {$C$L2}         ; |97| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 1

           MV      .L1X    B6,A4             ; |97| 
||         ADDKPC  .S2     $C$RL2,B3,0       ; |97| 

$C$RL2:    ; CALL OCCURS {__c6xabi_isnanf} {0}  ; |97| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 15

           ABSSP   .S2     B6,B4             ; |97| 
||         MV      .L1     A4,A0             ; |97| 

   [!A0]   SPDP    .S2     B4,B5:B4          ; |97| 
   [ A0]   ZERO    .L2     B0                ; |97| 
   [!A0]   MVKL    .S2     0x47c2ced3,B9
   [!A0]   MVKL    .S2     0x2a16a1b1,B8
   [!A0]   MVKH    .S2     0x47c2ced3,B9
   [!A0]   MVKH    .S2     0x2a16a1b1,B8
   [!A0]   CMPLTDP .S2     B5:B4,B9:B8,B0    ; |97| 
           NOP             1

   [ B0]   B       .S1     $C$L6             ; |97| 
|| [ B0]   LDW     .D2T1   *B10,A6

   [ B0]   BNOP    .S1     $C$L9,3           ; |97| 
   [ B0]   ABSSP   .S1     A6,A3
           ; BRANCHCC OCCURS {$C$L6}         ; |97| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 4
           CALL    .S1     __c6xabi_isinff   ; |97| 
           LDW     .D1T1   *A14,A4           ; |97| 
           NOP             2
;** --------------------------------------------------------------------------*
$C$L2:    
;          EXCLUSIVE CPU CYCLES: 2
           ADDKPC  .S2     $C$RL3,B3,1       ; |97| 
$C$RL3:    ; CALL OCCURS {__c6xabi_isinff} {0}  ; |97| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 7
           MV      .L1     A4,A0             ; |97| 

   [ A0]   B       .S1     $C$L4             ; |97| 
|| [!A0]   LDW     .D1T1   *A14,A3           ; |97| 

   [!A0]   CALL    .S1     __c6xabi_isnanf   ; |97| 
|| [ A0]   LDW     .D2T1   *+SP(32),A0

           NOP             4
           ; BRANCHCC OCCURS {$C$L4}         ; |97| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 1

           MV      .L1     A3,A4             ; |97| 
||         ADDKPC  .S2     $C$RL4,B3,0       ; |97| 

$C$RL4:    ; CALL OCCURS {__c6xabi_isnanf} {0}  ; |97| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 7

           MV      .L1     A4,A0             ; |97| 
||         LDW     .D2T1   *+SP(32),A31      ; |97| 

   [ A0]   B       .S1     $C$L3             ; |97| 
|| [!A0]   MVKL    .S2     0x47c2ced3,B5

   [!A0]   MVKL    .S2     0x2a16a1b1,B4
|| [!A0]   ABSSP   .S1     A3,A3             ; |97| 

   [!A0]   SPDP    .S1     A3,A5:A4          ; |97| 
|| [!A0]   MVKH    .S2     0x47c2ced3,B5

   [!A0]   MVKH    .S2     0x2a16a1b1,B4
           CMPEQ   .L1     A31,0,A3          ; |97| 

   [!A0]   CMPLTDP .S1X    A5:A4,B5:B4,A4    ; |97| 
|| [ A0]   LDW     .D2T1   *+SP(32),A0

           ; BRANCHCC OCCURS {$C$L3}         ; |97| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 8
           NOP             1
           OR      .L1     A4,A3,A0

   [ A0]   B       .S1     $C$L5             ; |97| 
|| [ A0]   LDW     .D2T1   *B10,A6

   [!A0]   BNOP    .S1     $C$L7,4           ; |97| 
           ; BRANCHCC OCCURS {$C$L5}         ; |97| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 1
           LDW     .D2T1   *B10,A6
           ; BRANCH OCCURS {$C$L7}           ; |97| 
;** --------------------------------------------------------------------------*
$C$L3:    
;          EXCLUSIVE CPU CYCLES: 4
           NOP             4
;** --------------------------------------------------------------------------*
$C$L4:    
;          EXCLUSIVE CPU CYCLES: 6

   [ A0]   BNOP    .S1     $C$L8,4           ; |97| 
|| [ A0]   LDW     .D2T1   *B10,A6

           ABSSP   .S1     A6,A3
|| [!A0]   LDW     .D2T1   *B10,A6

           ; BRANCHCC OCCURS {$C$L8}         ; |97| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 4
           NOP             4
;** --------------------------------------------------------------------------*
$C$L5:    
;          EXCLUSIVE CPU CYCLES: 5

           BNOP    .S2     $C$L9,4           ; |97| 
||         ABSSP   .S1     A6,A3

;** --------------------------------------------------------------------------*
$C$L6:    
;          EXCLUSIVE CPU CYCLES: 1

           ZERO    .L2     B4                ; |97| 
||         SPDP    .S1     A3,A5:A4

           ; BRANCH OCCURS {$C$L9}           ; |97| 
;** --------------------------------------------------------------------------*
$C$L7:    
;          EXCLUSIVE CPU CYCLES: 5
           NOP             4
           ABSSP   .S1     A6,A3
;** --------------------------------------------------------------------------*
$C$L8:    
;          EXCLUSIVE CPU CYCLES: 1

           MVK     .L2     0x1,B4            ; |97| 
||         SPDP    .S1     A3,A5:A4

;** --------------------------------------------------------------------------*
$C$L9:    
;          EXCLUSIVE CPU CYCLES: 14
           MV      .L2     B4,B6             ; |97| 
           CMPLTDP .S1     A5:A4,A11:A10,A0  ; |101| 
           NOP             1
   [ A0]   LDW     .D1T1   *A14,A4           ; |101| 
           NOP             4

   [ A0]   ABSSP   .S1     A4,A4             ; |101| 
||         CALL    .S2     __c6xabi_isnanf   ; |112| 

   [ A0]   SPDP    .S1     A4,A5:A4          ; |101| 
           ADDKPC  .S2     $C$RL5,B3,0       ; |112| 

   [ A0]   CMPLTDP .S1     A5:A4,A11:A10,A0  ; |101| 
|| [!A0]   ZERO    .L1     A0                ; |101| 

           MV      .L1     A6,A4             ; |112| 

   [ A0]   MVK     .L1     0x1,A15           ; |101| 
|| [!A0]   ZERO    .S1     A15               ; |101| 

$C$RL5:    ; CALL OCCURS {__c6xabi_isnanf} {0}  ; |112| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 20
           LDW     .D2T1   *+SP(24),A0       ; |101| 
           MV      .L2X    A4,B0             ; |112| 
           ZERO    .L1     A4
           CMPEQSP .S1     A6,A4,A4          ; |109| 
           XOR     .L1     1,A4,A6           ; |109| 
   [ A0]   LDW     .D2T1   *+SP(8),A4        ; |101| 
   [ A0]   LDW     .D2T1   *+SP(12),A5       ; |101| 
           OR      .L2X    B13,A6,B7         ; |109| 
           NOP             3
   [ A0]   MPYSPDP .M1     A3,A5:A4,A5:A4    ; |105| 
           NOP             2
   [ B0]   BNOP    .S1     $C$L10,3          ; |112| 
   [ A0]   STW     .D2T1   A4,*+SP(16)       ; |109| 

   [!B0]   CALL    .S1     __c6xabi_isnanf   ; |112| 
|| [ A0]   STW     .D2T1   A5,*+SP(20)       ; |109| 

           ; BRANCHCC OCCURS {$C$L10}        ; |112| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           LDW     .D1T1   *A14,A4           ; |112| 
           ADDKPC  .S2     $C$RL6,B3,3       ; |112| 
$C$RL6:    ; CALL OCCURS {__c6xabi_isnanf} {0}  ; |112| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 7
           MV      .L1     A4,A0             ; |112| 

   [!A0]   B       .S1     $C$L11            ; |112| 
|| [!A0]   ZERO    .L1     A3                ; |112| 

   [!A0]   BNOP    .S1     $C$L12,4          ; |112| 
           ; BRANCHCC OCCURS {$C$L11}        ; |112| 
;** --------------------------------------------------------------------------*
$C$L10:    
;          EXCLUSIVE CPU CYCLES: 11
           LDW     .D2T1   *+SP(28),A0
           LDW     .D2T1   *+SP(20),A5
           LDW     .D2T1   *+SP(16),A4
           NOP             2

   [ A0]   BNOP    .S1     $C$L13,2          ; |112| 
|| [ A0]   CMPEQ   .L1     A15,0,A31         ; |114| 
|| [ A0]   CMPEQ   .L2     B6,0,B4           ; |114| 
|| [ A0]   LDW     .D2T1   *+SP(4),A30       ; |114| 
|| [ A0]   MVK     .D1     0x1,A3            ; |112| 

           CMPGTDP .S1     A13:A12,A5:A4,A4  ; |114| 
   [ A0]   CMPEQ   .L2     B7,0,B5           ; |114| 
           AND     .L1     A31,A4,A4         ; |114| 
           ; BRANCHCC OCCURS {$C$L13}        ; |112| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5

           BNOP    .S1     $C$L12,4          ; |112| 
||         ZERO    .L1     A3                ; |112| 

;** --------------------------------------------------------------------------*
$C$L11:    
;          EXCLUSIVE CPU CYCLES: 1

           LDW     .D2T1   *+SP(16),A4
||         CMPEQ   .L1     A15,0,A31         ; |114| 
||         CMPEQ   .L2     B6,0,B4           ; |114| 

           ; BRANCH OCCURS {$C$L12}          ; |112| 
;** --------------------------------------------------------------------------*
$C$L12:    
;          EXCLUSIVE CPU CYCLES: 8
           LDW     .D2T1   *+SP(20),A5
           CMPEQ   .L2     B7,0,B5           ; |114| 
           LDW     .D2T1   *+SP(4),A30       ; |114| 
           NOP             2
           CMPGTDP .S1     A13:A12,A5:A4,A4  ; |114| 
           NOP             1
           AND     .L1     A31,A4,A4         ; |114| 
;** --------------------------------------------------------------------------*
$C$L13:    
;          EXCLUSIVE CPU CYCLES: 12
           XOR     .L2     1,B5,B5           ; |114| 
           AND     .L2X    B4,A4,B4          ; |114| 
           AND     .L2     B5,B4,B4          ; |114| 
           CMPEQ   .L1     A3,0,A3           ; |114| 
           AND     .L1X    A3,B4,A0          ; |114| 

   [ A0]   ZERO    .L2     B12               ; |115| 
||         SUB     .L1     A30,1,A0          ; |93| 

   [ A0]   B       .S1     $C$L1             ; |93| 
||         STW     .D2T1   A0,*+SP(4)        ; |115| 

   [ A0]   CALL    .S1     __c6xabi_isinff   ; |97| 
|| [ A0]   LDW     .D2T2   *++B10,B11        ; |95| 

   [ A0]   LDW     .D1T1   *++A14,A12        ; |95| 
           NOP             3
           ; BRANCHCC OCCURS {$C$L1}         ; |93| 
;** --------------------------------------------------------------------------*
$C$L14:    
;          EXCLUSIVE CPU CYCLES: 11
           LDW     .D2T2   *++SP(40),B3      ; |120| 
           LDDW    .D2T1   *++SP,A13:A12     ; |120| 
           LDDW    .D2T1   *++SP,A15:A14     ; |120| 
           LDDW    .D2T2   *++SP,B11:B10     ; |120| 

           MV      .L1X    B12,A4            ; |119| 
||         LDDW    .D2T2   *++SP,B13:B12     ; |120| 

           LDW     .D2T1   *++SP(8),A10      ; |120| 
||         RET     .S2     B3                ; |120| 

           LDW     .D2T1   *++SP(8),A11      ; |120| 
           NOP             4
           ; BRANCH OCCURS {B3}              ; |120| 
	.sect	".text"
	.clink
	.global	gimme_random

;******************************************************************************
;* FUNCTION NAME: gimme_random                                                *
;*                                                                            *
;*   Regs Modified     : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,B0,B1,B2,B3,B4,*
;*                           B5,B6,B7,B8,B9,B13,SP,A16,A17,A18,A19,A20,A21,   *
;*                           A22,A23,A24,A25,A26,A27,A28,A29,A30,A31,B16,B17, *
;*                           B18,B19,B20,B21,B22,B23,B24,B25,B26,B27,B28,B29, *
;*                           B30,B31                                          *
;*   Regs Used         : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,B0,B1,B2,B3,B4,*
;*                           B5,B6,B7,B8,B9,B13,DP,SP,A16,A17,A18,A19,A20,A21,*
;*                           A22,A23,A24,A25,A26,A27,A28,A29,A30,A31,B16,B17, *
;*                           B18,B19,B20,B21,B22,B23,B24,B25,B26,B27,B28,B29, *
;*                           B30,B31                                          *
;*   Local Frame Size  : 0 Args + 0 Auto + 16 Save = 16 byte                  *
;******************************************************************************
gimme_random:
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 7
           STW     .D2T2   B13,*SP--(8)      ; |73| 

           MV      .L2     B3,B13            ; |73| 
||         CALLP   .S2     rand,B3
||         STDW    .D2T1   A11:A10,*SP--     ; |73| 
||         MV      .L1     A4,A10            ; |73| 
||         MV      .S1X    B4,A11            ; |73| 

$C$RL7:    ; CALL OCCURS {rand} {0}          ; |74| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 8
           MVKL    .S2     0x46fffe00,B4
           MVKH    .S2     0x46fffe00,B4

           CALLP   .S2     __c6xabi_divf,B3
||         INTSP   .L1     A4,A4             ; |74| 

$C$RL8:    ; CALL OCCURS {__c6xabi_divf} {0}  ; |74| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 10
           MPYSP   .M1     A10,A4,A3         ; |74| 
           MV      .L2     B13,B3            ; |75| 
           NOP             2

           ADDSP   .L1     A11,A3,A4         ; |74| 
||         LDDW    .D2T1   *++SP,A11:A10     ; |75| 
||         RET     .S2     B3                ; |75| 

           LDW     .D2T2   *++SP(8),B13      ; |75| 
           NOP             4
           ; BRANCH OCCURS {B3}              ; |75| 
;*****************************************************************************
;* UNDEFINED EXTERNAL REFERENCES                                             *
;*****************************************************************************
	.global	__c6xabi_isinff
	.global	rand
	.global	__c6xabi_divd
	.global	__c6xabi_divf

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
