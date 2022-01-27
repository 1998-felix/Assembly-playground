;
; AssemblerApplication1.asm
;
; Created: 28/10/2021 07:32:10
; Author : gater
;


; Replace with your application code

.INCLUDE "ms328pdef.inc"

.org 0x00
start:
    inc r16
    rjmp start
