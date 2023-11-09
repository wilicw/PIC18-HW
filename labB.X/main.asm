List p=18f4520
#include<p18f4520.inc>
CONFIG OSC = INTIO67
CONFIG WDT = OFF
org 0x00
    goto main
    
    DIV:
	CLRF 0x30
	CLRF 0x31
	_calc_div:
	    INCF 0x31
	    BTFSC STATUS, C
		INCF 0x30
	    MOVF 0x11, W
	    SUBWF 0x21
	    BTFSS STATUS, C
		DECF 0x20
	    MOVFF 0x21, 0x22
	    MOVF 0x20, W
	    IORWF 0x22
	    BNZ _calc_div
	MOVFF 0x30, 0x20
	MOVFF 0x31, 0x21
	RETURN
    
    Fact:
	CLRF PRODL
	CLRF PRODH
	INCF PRODL
	
	MOVFF 0x11, 0x01
	MOVF 0x11, W
	SUBWF 0x10, W
	CPFSGT 0x01
	    goto _loop_mul
	MOVWF 0x01
	MOVFF 0x01, 0x11
	
	_loop_mul:
    	    MOVF 0x10, W
	    MOVFF PRODH, 0x00
	    MULWF PRODL
	    MOVFF PRODL, 0x21
	    MOVFF PRODH, 0x20
	    MULWF 0x00
	    MOVF PRODH, W
	    ADDWF 0x20
	    MOVF PRODL, W
	    ADDWF 0x20
	    MOVFF 0x21, PRODL
	    MOVFF 0x20, PRODH
	    
	    DECF 0x10

	    DECF 0x01
	    BNZ _loop_mul
	_end:
	_loop_div:
	    RCALL DIV
	    DECF 0x11
	    BNZ _loop_div
	__end:
	MOVFF 0x21, 0x00
	RETURN
    main:
	MOVLW 0x05
	MOVWF 0x10
	
	MOVLW 0x03
	MOVWF 0x11
	
	RCALL Fact
	
NOP
end
