List p=18f4520
#include<p18f4520.inc>
CONFIG OSC = INTIO67
CONFIG WDT = OFF
org 0x00

    MOVLW 0x7
    MOVWF 0x0

    MOVLW 0x8
    MOVWF 0x1

    MOVLW 0xD
    MOVWF 0x2

    MOVLW 0xC
    MOVWF 0x3

    MOVF 0x0, W
    ADDWF 0x1, 0
    MOVWF 0x10

    MOVF 0x3, W
    SUBWF 0x2, 0
    MOVWF 0x11

    MOVLW 0x01
    MOVWF 0x20
    MOVF 0x11, W
    CPFSEQ 0x10, W
    GOTO _end
    MOVLW 0xFF
    MOVWF 0x20

    _end:
 
NOP
end