List p=18f4520
#include<p18f4520.inc>
CONFIG OSC = INTIO67
CONFIG WDT = OFF
org 0x00
    
    MOVLW b'11110000'
    MOVWF TRISA
    
    ANDLW 0x80
    
    RRNCF TRISA
    BCF TRISA, 7
    IORWF TRISA
    
    
    RRNCF TRISA
    BCF TRISA, 7
    
    NOP

end

