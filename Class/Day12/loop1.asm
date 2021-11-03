.data

str1: .asciz "This is a string\n"


.text

.global main

main:
    stp x29, x30, [sp,#-16]!
    mov x1,#0
    mov x2,#1
    mov x3,#5

loop:
    cmp x1,x3
    b.ge end
    ldr x0, =str1

    stp x1, x2, [sp,#-16]!
    mrs x4,NZCV // takes value from register
    stp x3,x4, [sp,#-16]!

    bl printf

    ldp x3,x4,[sp],#16
    msr NZCV, x4
    ldp x1,x2,[sp],#16

    add x1,x1,x2
    b loop

end:
    ldp x29, x30,[sp],#16
    mov w0,#0
    ret
    