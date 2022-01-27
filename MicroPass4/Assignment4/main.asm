;
; Assignment4.asm
;
; Created: 11/11/2021 05:05:54
; Author : gater
;




; Replace with your application code
.INCLUDE "m328pdef.inc"

.org 0x0000
jmp reset ;default address on start up  or reset

.org PCI1addr ; vector address for  PCINT1
jmp ISR ;interrupt service routine when pin change interrupt occurs
reti

reset:

	ldi r16,(1<<PCIE1) ;setting up thepinchange interupt register to pin int 1
	sts PCICR,r16
	clr r16
	
	ldi r16,(1<<PCINT8) ; setting the pin change interrupt to pcint8
	sts PCMSK1,r16
	clr r16

	ldi r16,(1<<PCIF1); resetting the pc1 flag register
	sts PCIFR, r16

	ldi r17,0xFF ;setting up port b as output
	out DDRB,r17

	sei ; setting the flag register

main:
	jmp main

ISR: ;interrupt service routine
	inc r18
	out PORTB,r18 ;output
	reti; returning to the main program
	


	
