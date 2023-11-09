#include <xc.inc>
    
GLOBAL _is_squared
    
PSECT mytext, local, class=CODE, reloc=2

_is_squared:
    _loop:
	MOVF 0x10, W
	MOVFF 0x10, 0x00
	MULWF 0x00
	MOVFF PRODL, WREG
	XORWF 0x01
	BZ __squared
	XORWF 0x01
	INCF 0x10
	MOVLW 0x10
	CPFSEQ 0x10
	    goto _loop
    _end:
    
    MOVLW 0xFF
    RETURN
    
    __squared:
	MOVLW 0x01
	RETURN