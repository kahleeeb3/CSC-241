.data

str1: .asciz "The number loaded using MOVZ and MOVK is %lx\n"
str2: .asciz "The number loaded using MOVN is %i\n"

.text

.global main

main:

    stp x29,x30,[sp,#-16]! // Store Pair // Leave bread crumb

    movz x1, #0xBEEF
    movk x1, #0xDEAD, lsl #16
    movk x1, #0xCADE, lsl #32
    movk x1, #0xFEED, lsl #48
    ldr x0,= str1 // address of format string is x0
    bl printf // Print the format string

    movn w1, #1831
    ldr x0,= str2 // address of format string is x0
    bl printf // Print the format string

    // This should be at the end of every file
    ldp x29,x30,[sp],16 // Pick up bread crumb
    mov w0,#0 //Moving zero into register w0
    ret
