/*
128-bit addition of two numbers, which are originally to be stored in X1-X2 and X3-X4.

Use of some combination of 

ADDS, ADCS, ADC, and ADD.
s - set flags if carry

 Prints the two original numbers (as pairs of 64 bit numbers in hex), and the sum.  You can ignore the final carry.

Example computation: The registers would start as
    X1: 0x0000 0000 0000 0000
    X2: 0xFFFF FFFF FFFF FFFF
    X3: 0x0000 0000 0000 0000
    X4: 0x0000 0000 0000 0001
Then, the sum would be 0x0000 0000 0000 0001 0000 0000 0000 0000.
*/

.data

str1: .asciz "0x%016lx%016lx plus 0x%016lx%016lx equals 0x%016lx%016lx\n"


.text

.global main

main:

    stp x29,x30,[sp,#-16]! // Store Pair // Leave bread crumb

    //X1: 0x0000 0000 0000 0000
    movz x1, #0x0000
    movk x1, #0x0000, lsl #16
    movk x1, #0x0000, lsl #32
    movk x1, #0x0000, lsl #48

    //X2: 0xFFFF FFFF FFFF FFFF
    movz x2, #0xFFFF
    movk x2, #0xFFFF, lsl #16
    movk x2, #0xFFFF, lsl #32
    movk x2, #0xFFFF, lsl #48

    //X3: 0x0000 0000 0000 0000
    movz x3, #0x0000
    movk x3, #0x0000, lsl #16
    movk x3, #0x0000, lsl #32
    movk x3, #0x0000, lsl #48

    //X4: 0x0000 0000 0000 0001
    movz x4, #0x0001
    movk x4, #0x0000, lsl #16
    movk x4, #0x0000, lsl #32
    movk x4, #0x0000, lsl #48

    // ADDS on X2 and X4, and then ADCS X1 and X3
    ADDS x6,x2,x4
    ADCS x5,x1,x3

    ldr x0,= str1 // address of format string is x0
    bl printf // Print the format string

    // This should be at the end of every file
    ldp x29,x30,[sp],16 // Pick up bread crumb
    mov w0,#0 //Moving zero into register w0
    ret
