;
; assignment 1.asm
;
; Created: 10/10/2021 17:54:53
; Author : gateru
;


; Replace with your application code
.include "m328pdef.inc"

.org $0
setup:
	ldi R16,0x00 ;setting up required registers
	ldi R17,0x00 ; ''
	ldi R18,0xF9 ; ''
	ldi R19,0x00 ; ''
	ldi R20,0xFF ; ''
	out DDRC, R20 ; setting up port B as output port


main:
	out PORTC,R17 ; ouputting value to port be
	cp R17,R18 ; comparing contents or r17 with 249
	breq reset ; branch to reset if equal
	inc R17 ; incrementif not equal
	rjmp main ;jmp to main

reset: ; reset subroutine to reset r17 to either 5 or 0
	com R16 ;complements r16 to create change in reset value
	clr R17 ; clears r17
	cp R16,R19 ;compares if r16 and r19 are equal
	breq main ; branches to main with r17 as 0 if the two are equal
	ldi R17,5 ; sets r17 as 5
	jmp main ;jumps to main with r17 as 5 if two registers are unequal




