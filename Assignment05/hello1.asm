.data

hellostr: .asciz "Caleb Powell\n"

.text

.global main

main:
  stp x29,x30,[sp,#-16]!
  ldr x0,=hellostr
  bl  printf
  mov w0,#0
  ldp x29,x30,[sp],16
  ret
