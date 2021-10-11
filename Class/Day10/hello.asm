.data

hellostr: .asciz "Caleb Powell\n"

.text

.global main

main:
  stp x29,x30,[sp,#-16]! ;Store Pair (x29 -> Frame Pointer, x30 -> Link Register)
  ldr x0,=hellostr
  bl  printf
  mov w0,#0
  mov w1, w0 ;Moving zero into register w0
  ldp x29,x30,[sp],16 ;Move what's in w0 to w1 (copy)
  ret
