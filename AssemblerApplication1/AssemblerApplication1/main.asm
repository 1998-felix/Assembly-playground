;
; AssemblerApplication1.asm
;
; Created: 03/11/2021 17:44:48
; Author : gater
;

.INCLUDE "m328pdef.inc"

.org 0x00
	jmp reset

reset:
ldi r16, (1<<PIND5) ; set pin5 as output
out DDRD,r16

ldi r16, (1<<WGM11) | (1<<COM1A1) | (1<<COM1A0) ; setting WGM and Inverted Mode
sts TCCR1A, r16

clr r16

ldi r16,(1<<WGM12) | (1<<WGM13) | (1<<CS10)
sts TCCR1B, r16

clr r16

ldi r17, $4e
sts ICR1H, r17 ; load period

ldi r16, $1f
sts ICR1L, r16


clr r16
clr r17

ldi r17,$27
sts OCR1AH,r17

ldi r16,$0f
sts OCR1AL,r16


main:
	rjmp main



