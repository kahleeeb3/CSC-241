.data

//str1: .asciz "Fibonacci number %li is %li\n"
str1: .asciz "Fibonacci number %li is %li.\n"

.text

.global main

main:

    stp x29, x30, [sp,#-16]!

    mov x20,#13 // This is n


    mov x21,#0 // this is i
    
    mov x22,#0 // f(n-2) value
    mov x23,#1 // f(n-1) value
    mov x24,#0 // f(n) value

    sub x25,x20,#2 // To account for the first two fibs
    // this assumes the fib sequence is 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144
    // f(13) = 144
loop:
    // x20 = 5; x22 = 0
    cmp x21,x25 // if (i>n)
    b.ge end  // if(false){do next} else{go to "end"}

    add x21, x21, #1 // i = i + 1
    
    add x24,x23,x22 // f(n) = f(n-1)+f(n-2)
    
    mov x1, x20 // x1 = n
    mov x2, x24 // x2 = f(n)
    
    mov x22, x23 // f(n-2) = f(n-1)
    mov x23, x24 // f(n-1) = f(n)

    b loop // Loops conditional

end:
    ldr x0, =str1 // load in string
    bl printf // print string

    ldp x29, x30,[sp],#16
    mov x0,#0
    ret
    