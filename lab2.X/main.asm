List p=18f4520
#include<p18f4520.inc>
CONFIG OSC = INTIO67
CONFIG WDT = OFF
org 0x00

    MOVLW b'01100010'
    MOVWF 0x00
    MOVWF 0x01
    MOVWF 0x02
    RRNCF 0x01
    MOVFF 0x01, 0x03
    COMF 0x01
    COMF 0x02
    MOVF 0x00, W
    ANDWF 0x01
    MOVF 0x02, W
    ANDWF 0x03
    MOVF 0x03, W
    IORWF 0x01
    
    BCF 0x01, 7
    BTFSC 0x00, 7
    BSF 0x01, 7

NOP
end
