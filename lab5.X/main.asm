List p=18f4520
#include<p18f4520.inc>
CONFIG OSC = INTIO67
CONFIG WDT = OFF
org 0x00
    MOVLB 0x1
    MOVLW 0x23
    MOVWF 0x00, 1
    MOVLW 0x23
    MOVWF 0x01, 1
    MOVLW 0x12
    MOVWF 0x02, 1
    MOVLW 0x22
    MOVWF 0x03, 1
    MOVLW 0xF7
    MOVWF 0x04, 1
    MOVLW 0xFF
    MOVWF 0x05, 1
    
    MOVLW 0x00
    MOVWF 0x20
    MOVLW 0x05
    MOVWF 0x21
    
    LFSR 0, 0x100
    LFSR 1, 0x105
    _loop:
	MOVF 0x21, W
	CPFSLT 0x20, W
	    goto _end
	MOVFF 0x20, 0x22
	__lrloop:
	    MOVF 0x21, W
	    CPFSLT 0x22, W
		goto __lrend
	    
	    MOVF 0x22, W
	    MOVWF FSR0L
	    MOVWF FSR1L
	    INCF FSR1L
	    
	    MOVF INDF0, W
	    CPFSLT INDF1, W
		goto __lrskip
	    MOVFF INDF0, 0x23
	    MOVFF INDF1, INDF0
	    MOVFF 0x23, INDF1
		
	    __lrskip:
	    INCF 0x22
	    goto __lrloop
	__lrend:
	DECF 0x21
	MOVFF 0x21, 0x22
	__rlloop:
	    MOVF 0x20, W
	    CPFSGT 0x22, W
		goto __rlend

	    MOVF 0x22, W
	    MOVWF FSR1L
	    MOVWF FSR0L
	    DECF FSR0L
	    
	    MOVF INDF0, W
	    CPFSLT INDF1, W
		goto __rlskip
	    MOVFF INDF0, 0x23
	    MOVFF INDF1, INDF0
	    MOVFF 0x23, INDF1
	    
	    __rlskip:
	    DECF 0x22
	    goto __rlloop
	__rlend:
	INCF 0x20
	goto _loop
    _end:
    MOVFF 0x100, 0x110
    MOVFF 0x101, 0x111
    MOVFF 0x102, 0x112
    MOVFF 0x103, 0x113
    MOVFF 0x104, 0x114
    MOVFF 0x105, 0x115
NOP
end