;
; Assignment 2.asm
;
; Created: 11/10/2021 04:05:56
; Author : gateru
;


; Replace with your application code
.include "m328pdef.inc"

.org 0x00
setup:
	ldi r16,0x00
	ldi r17,0xFF
	ldi r19,0xFF
	out DDRD,r16 ;setting port d as input
	out DDRB,r17 ; setting port b as output
	out PORTD,r17; setting input pull up

main:
	in r18,PIND ;receiving input
	AND r18,r19;performing and operation
	COM r18 ; performing complement operation to get NAND
	out PORTB,r18 ;outputing to port b
	rjmp main ; executing the loop





