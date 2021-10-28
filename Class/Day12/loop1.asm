main:
    stp x29, x30, [sp,#-16]!
    mov x20,#0
    mov x21,#1
    mov x22,#5

loop:
    cmp x20,x22
    b.ge end
    ldr x0, =str1
    bl printf
    add x20,x20,x21
    b loop

end:
    ldp x29, x30, [sp],#16
    mov w0,#0
    ret