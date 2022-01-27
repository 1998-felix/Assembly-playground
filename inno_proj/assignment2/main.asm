;
; assignment2.asm
;
; Created: 13/10/2021 13:46:28
; Author : innocent_namuye
;


; Replace with your application code
.include "m328pdef.inc"

.org 0x00
setup:

START:
	LDI R16,0 ; Load 0 to register R16
	OUT DDRD, R16 ; Set all port D pins (PORTD) as inputs due to the 0 value
	LDI R19, 255 ; Load 255 to register R19
	OUT DDRD, R19 ; Set all port B pins (PORTB) as outputs

LOOP:
IN R17 , PIND ; Store all input from PORTD in register R17
LDI R18 , 255 ; Load 255 onto register R18
AND R17, R18 ; Apply AND operation to registers R17 and R18 and store the resulting data
COM R17 ; Complement data in register R17
OUT PORTB, R17 ; Output the contents of register R17 to port B (PORTB)
RJMP LOOP ; Repeat the loop

.EXIT 
