List p=18f4520
#include<p18f4520.inc>
CONFIG OSC = INTIO67
CONFIG WDT = OFF
org 0x00
    
    Add_Mul macro xh, xl, yh, yl
	MOVLW xl
	MOVWF 0x01
	MOVLW yl
	ADDWF 0x01
	MOVLW xh
	MOVWF 0x00
	MOVLW yh
	ADDWFC 0x00
	
	MOVF 0x00, W
	MULWF 0x01
	
	BTFSC 0x01, 7
	    SUBWF PRODH
	MOVF 0x01, W
	BTFSC 0x00, 7
	    SUBWF PRODH
	    
	MOVFF PRODH, 0x10
	MOVFF PRODL, 0x11
    endm
    
    Add_Mul 0xFF, 0xEB, 0x00, 0x0F

NOP
end
