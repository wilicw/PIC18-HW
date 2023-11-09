List p=18f4520
#include<p18f4520.inc>
CONFIG OSC = INTIO67
CONFIG WDT = OFF
org 0x00
    
    MOVLW 0x76
    MOVWF 0x00
    MOVLW 0x12
    MOVWF 0x01
    
    MOVLW 0x44
    MOVWF 0x10
    MOVLW 0x93
    MOVWF 0x11
    
    MOVFF 0x11, 0x21
    MOVF 0x01, W
    ADDWF 0x21
    
    CLRF 0x20
    BTFSC STATUS, C
	INCF 0x20

    MOVF 0x00, W
    ADDWF 0x20
    MOVF 0x10, W
    ADDWF 0x20

NOP

end




