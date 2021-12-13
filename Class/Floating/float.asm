.data

    mynumber: .word 0x4020A3D7
	mystring: .asciz "My number is %f\n"
    // %i for 32 bit int %li for 64 bit int
    // you always print a 64 bit float, but we are 32 bits :(
.text

.global main

main:
    stp x29,x30,[sp,#-16]!
    /********************************/
    // using fmov

    //fmov s0,#2.5 // floating point mov
    //fcvt d0, s0 // take a 32 bit float and expand it to a 64 bit float
    /********************************/
    // load value from .data
    
    ldr x0,=mynumber
    ldr s0, [x0]
    fcvt d0, s0
    /********************************/
    ldr x0,=mystring
    bl printf
    ldp x29,x30,[sp],#16
    mov w0, #0
    ret
