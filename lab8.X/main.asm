List p=18f4520
#include<p18f4520.inc>
CONFIG OSC = INTIO67
CONFIG WDT = OFF
org 0x00
    
    MOVLW 0x03
    MOVWF TRISA
    MOVLW 0x0F
    MOVWF TRISB
    MOVWF TRISC
    
    MOVLW 0x04
    MOVWF 0x00
    
    MOVFF TRISA, 0x01
    RLNCF 0x01
    RLNCF 0x01
    RLNCF 0x01
    RLNCF 0x01
    
    _loop:
	MOVF 0x01, W
	BTFSC TRISC, 0
	    ADDWF TRISC
	BCF STATUS, C
	RRCF TRISC
	DECF 0x00
	BNZ _loop
    _end:

NOP
end







