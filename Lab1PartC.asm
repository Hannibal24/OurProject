.include "m2560def.inc"
.def i=r16 ;one byte is enough for i
.def n=r17 ;assume n is 10
ldi r17, 10
.def sum1=r18
.def sum2=r19
.dseg     
.org 0x100    ; origin of the data segment !? not sure why needed
A_start: .byte 20     ;allocate 10 * 2 bytes to A

.cseg
.org 0x100   ; origin of the code segment !?

ldi ZL, low(a_start<<1) 
ldi ZH, high(A_start<<1)

clr i
Loop1: ;Stores array values of A[i] = i*200

cp i, n
brge Main

ldi r20, 200
mul r20, i
st Z+, r0
st Z+, r1

inc i
rjmp Loop1

Main:
ldi ZL, low(A_start<<1) ; Sets Z back to the starting address of A_start
ldi ZH, high(A_start<<1)
clr i



Loop2: ; Loads the stored array values and adds them to sum

cp i, n
brge Halt

ld r21, Z+
ld r22, Z+
add sum1, r21
