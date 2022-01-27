;
; assignment3.asm
;
; Created: 03/11/2021 21:17:22
; Author : gater
;
.INCLUDE "m328pdef.inc"

.org 0x00
	jmp setup

setup:  ; setting up the pwm 
ldi r16,(1<<PB2)   ;setting pb2 as output
out DDRB,r16		; ''	
clr r16

	; setting up pwm of mode 10, phase correct
ldi r16,(1<<COM1B1)|(1<<COM1B0)|(1<<WGM11);  setting up TCCR1A
sts TCCR1A,r16
clr r16

ldi r16,(1<<WGM13)|(1<<WGM12)|(1<<CS11)|(1<<CS10) ; setting up TCCR1B
sts TCCR1B,r16
clr r16
 ; setting up the period to produce 2.5Hz with a prescalar of 64
ldi r16,0x0C
sts ICR1H,r16
ldi r17,0x35
sts ICR1L,r17
clr r16
clr r17
	;setting up a duty cycle of 40%
ldi r16,0x04
sts OCR1AH,r16
ldi r17,0xE2
sts OCR1AL,r17
clr r16
clr r17

main:
	rjmp main



	

