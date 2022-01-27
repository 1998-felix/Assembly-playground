;
; AssemblerApplication2.asm
;
; Created: 17/11/2021 23:28:44
; Author : Innocent S. Namuye
;


; Replace with your application code

.INCLUDE "m328pdef.inc"

.ORG $0

RJMP MAIN

MAIN:  ;setup code
	clr r17 ; clear register 17
	ldi r16,6
	sts UBRR0H, r17
	sts UBRR0L, r16 ;set baud rate to 9600
	;enable receiver and transmitter
	ldi r16, (1<<RXEN0)|(1<<TXEN0)
	sts UCSR0B,r16
	;ste frame format: 8data, 2stop bit
	ldi r16, (1<<USBS0)|(3<<UCSZ00)
	sts UCSR0C,r16

LOOP:
	ldi r17, $00
	ldi r16, UCSR0A
	CP r17,r16
	brne STOP
	RJMP LOOP

SEND:
	ldi r16, 0b00100101
	sts UDR0,r16
	RJMP LOOP

STOP:
	RJMP LOOP