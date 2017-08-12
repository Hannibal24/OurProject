.include "m2560def.inc"

.dseg

Cap_string: .byte 3

.cseg

.def ten=r22

Low_string: .db "444444"

start: ldi ZL, low(Low_string<<1)
       ldi ZH, high(Low_string<<1)

ldi YL, low(Cap_string)
ldi YH, high(Cap_string)

clr r16
clr r17
clr r21
ldi ten, 10 ; multiply
ldi r21, 0 ; counter
Loop:
cpi r21, 6
brge End

lpm  r20, Z+ ; loads number
subi r20, 48 ; 48 is ascii for 0

mul r18, ten; preps r17 for larger input
mov r18, r0 ; copy , r17 views r0 as high here

mul r17, ten
mov r17, r0
add r18, r1; carry

mul r16, ten
mov r16, r0
add r17, r1; carry

add r16, r20

inc r21 
rjmp Loop
End:

ST Y+, r16 ; endianess preserved
ST Y+, r17
ST Y+, r18

Halt:
rjmp Halt
