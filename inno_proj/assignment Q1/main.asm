;
; inno_proj.asm
;
; Created: 13/10/2021 13:03:13
; Author : innocent_namuye
;


; Replace with your application code
.include "m328pdef.inc"

.org $0
ldi r16,0
ldi r17,0
ldi r18,249
ldi r19,0
ldi r20,255
out DDRC, r20


main:
	out PORTC,r17
	cp r17,r18
	breq reset
	inc r17
	rjmp main

reset:
	com r16
	clr r17
	cp r16,r19
	breq main
	ldi r17,5
	jmp main
