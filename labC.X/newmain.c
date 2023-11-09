/*
 * File:   newmain.c
 * Author: Wilicw
 *
 * Created on October 15, 2023, 12:41 PM
 */

#include <xc.h>

extern unsigned char is_squared(unsigned int a);

void main(void) {
    volatile unsigned char ans = is_squared(9);
    while(1);
    return;
}
