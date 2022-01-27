;
; ENM221-0241-2017 Innocent Namuye Proj5.asm
;
; Created: 18/11/2021 00:24:27
; Author : Innocent S. Namuye
;


.INCLUDE "m328pdef.inc"
.org 0x00

setup:
	;enable receive and transmit
	ldi r16,(1<<RXEN0)|(1<<TXEN0)
	sts UCSR0B, r16

	;setting 8data bits and 2stop bits
	ldi r16,(1<<USBS0)|(1<<UCSZ00)|(1<<UCSZ01)
	sts UCSR0C, r16

	;setting baud rate
	ldi r16,6
	sts UBRR0H, r17
	sts UBRR0L, r16
	
main:
rcall receive
	datareceived1:
		cpi r30,'p'
		breq datareceived1
		clz
		ldi r30,'p'
		rcall send
		rjmp main
	
	datareceived2:
		cpi r30,'o'
		breq datareceived2
		clz
		ldi r30,'o'
		rcall send
		rjmp main
		
send:
		lds	r17,UCSR0A			;load to r16
		sbrs r17,UDRE0		; wait for empty transmit buffer
		rjmp send				
		sts	UDR0,r30			; transmit message

receive:	
	lds	r17,UCSR0A			; load into r17
	sbrs	r17,UDRE0	 ; wait for empty transmit buffer
	rjmp	receive				

	lds	r30,UDR0			; fetch received message

	ret

.exit