#include <xc.inc>
    
GLOBAL _multi_signed
    
PSECT mytext, local, class=CODE, reloc=2
 
_multi_signed:
    MOVFF 0x01, 0x21
    XORWF 0x21
    BTFSC WREG, 7
	NEGF WREG
    BTFSC 0x01, 7
	NEGF 0x01
    _loop:
	CLRF STATUS
	ADDWF 0x11
	BTFSC STATUS, 0
	    INCF 0x10
	DECF 0x01
	BNZ 0x01
    _end:
    MOVFF 0x10, 0x02
    MOVFF 0x11, 0x01
    BTFSS 0x21, 7
	RETURN
    COMF 0x01
    COMF 0x02
    MOVLW 0x01
    CLRF STATUS
    ADDWF 0x01
    BTFSC STATUS, 0
	INCF 0x02
    RETURN