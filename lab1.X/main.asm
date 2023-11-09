List p=18f4520
#include<p18f4520.inc>
CONFIG OSC = INTIO67
CONFIG WDT = OFF
org 0x00

    MOVLW b'00001010'
    MOVWF 0x00
    MOVWF 0x01
    
    MOVLW 0x10
    MoVWF 0x02
    
    _loop:
	BTFSC 0x00, 0
	GOTO __odd
	INCF 0x02
	INCF 0x02
	__odd:
	DECF 0x02
	
	RRNCF 0x00, W
	MOVWF 0x00
	CPFSEQ 0x01
	GOTO _loop
    _end:

NOP
end
