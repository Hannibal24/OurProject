.include "m2560def.inc"


ldi r16, low(12)
ldi r17, high(12)
ldi r18, low(8)
ldi r19, high(8)

Loop:

cp r17, r19; Checking if register pairs have same value
brne Next; if equal, gcd found
cp r16, r18
breq Halt
; if false trickles onto next
Next:
cp r17, r19 ; always sub lower from higher
brlo Lt
cp r19, r17
brlo Gt

cp r16, r18 ; If the higher registers are equal
brlo Lt
cp r18, r16
brlo Gt

Gt:
sub r17, r19
sub r16, r18  
rjmp Loop

Lt:
sub r19, r17
sub r18, r16
rjmp Loop

// r17 is GCD
Halt:
rjmp Halt
