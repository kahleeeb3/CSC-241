.data

str1: .asciz "The square of %li is %li\n"


.text

.global main

main:
    stp x29, x30, [sp,#-16]!

    mov x0, #5
    bl square
    mov x1,#5
    mov x2,#0
    mov x2,x0

    ldr x0, =str1
    bl printf

    ldp x29, x30,[sp],#16
    mov w0,#0
    ret

square:
    mul x0,x0,x0
    ret
    
    