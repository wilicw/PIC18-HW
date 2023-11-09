List p=18f4520
#include<p18f4520.inc>
CONFIG OSC = INTIO67
CONFIG WDT = OFF
org 0x00
    
    MOVLB 0x01

    MOVLW 0x15
    MOVWF 0x00, 1
    
    MOVLW 0x12
    MOVWF 0x01, 1

    LFSR 0, 0x100
    LFSR 1, 0x101
    LFSR 2, 0x102
    MOVLW 0x02
    MOVWF 0x09, 1
    _loop:
	MOVF POSTINC1, W
	MOVWF INDF2
	MOVF POSTINC0, W
	BTFSS 0x09, 0, 1
	    ADDWF POSTINC2
	BTFSC 0x09, 0, 1
	    SUBWF POSTINC2
	MOVLW 0x09
	INCF 0x09, 1, 1
	CPFSEQ 0x09, 1
	    goto _loop
    _end:
    
NOP
end
