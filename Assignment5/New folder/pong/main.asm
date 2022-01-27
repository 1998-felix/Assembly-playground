;
; pong.asm
;
; Created: 17/11/2021 06:21:00
; Author : gateru
;
; Replace with your application code
.INCLUDE "m328pdef.inc"
.org 0x00

setup:
	;enabling rx and tx
	ldi r16,(1<<RXEN0)|(1<<TXEN0)
	sts UCSR0B,r16
	;setting up two stop bits and 8 data bits
	ldi r16,(1<<USBS0)|(1<<UCSZ00)|(1<<UCSZ01)
	sts UCSR0C,r16
	;setting the baudrate to 9600
	ldi r16,0x06
	ldi r17,0x00
	sts UBRR0H,r17
	sts UBRR0L,r16

main:
	
	rcall receive ;calling receive function
	fivereceived:
		cpi r19,5 ; checking if five was received
		brne zeroreceived
		clz
		ldi r19,0
		rcall send ;if five was received send 0
		rjmp main
	zeroreceived:
		cpi r19,0 ;checking if zero was received
		brne fivereceived
		clz
		ldi r19,5 
		rcall send ;if zero was received sending five
		rjmp main
	
	

send:
	lds	r17,UCSR0A			; load UCSR0A into r17
	sbrs	r17,UDRE0			; wait for empty transmit buffer
	rjmp	send				; repeat loop
	sts UDR0,r19		; transmit character
	ret

receive:	
	lds	r17,UCSR0A			; load UCSR0A into r17
	sbrs	r17,UDRE0			; wait for empty transmit buffer
	rjmp	receive				; repeat loop
	lds r19,UDR0	
			; get received character
	ret

.exit


	

