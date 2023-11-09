/*
 * File:   newmain.c
 * Author: Wilicw
 *
 * Created on October 15, 2023, 3:20 PM
 */


#include <xc.h>

extern unsigned int lcm(unsigned char a, unsigned char b);

void main(void) {
    volatile unsigned int res = lcm(40, 140);
    while(1);
    return;
}
