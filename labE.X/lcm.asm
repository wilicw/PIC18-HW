#include <xc.inc>
    
GLOBAL _lcm
    
PSECT mytext, local, class=CODE, reloc=2

_div:
    CLRF 0x01
    CLRF 0x02
    _calc_div:
	CLRF STATUS
	INCF 0x01
	BTFSC STATUS, 0
	    INCF 0x02
	MOVF 0x10, W
	CLRF STATUS
	SUBWF PRODL
	BTFSS STATUS, 0
	    DECF PRODH
	MOVFF PRODL, 0x22
	MOVF PRODH, W
	IORWF 0x22
	BNZ _calc_div
    RETURN

_gcd:
    MOVF 0x10, W
    CPFSGT 0x11
	goto _gcd_loop
    MOVFF 0x11, 0x12
    MOVWF 0x11
    MOVFF 0x12, 0x10
    MOVLW 0x00
    CPFSGT 0x11
	RETURN
    _gcd_loop:
	MOVF 0x10, W
	CPFSGT 0x11
	    goto _gcd_sub
	goto _gcd_end
	_gcd_sub:
	MOVF 0x11, W
	SUBWF 0x10
	goto _gcd_loop
    _gcd_end:
    CALL _gcd
    RETURN
    
    
_lcm:
    MOVFF 0x01, 0x10
    MOVWF 0x11
    MULWF 0x01
    CALL _gcd
    CALL _div
    RETURN