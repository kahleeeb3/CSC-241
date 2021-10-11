.data

hellostr: .asciz "The numbers %i, %i, and %i add to %i\n"

.text

.global main

main:
  stp x29,x30,[sp,#-16]! // Store Pair // Leave bread crumb

  mov w1,1 // first number
  mov w2,2 // second number
  mov w3,3 // third number

  add w4,w1,w2 //add w1 and w2 then store the result in w4
  add w4,w3,w4 //add w3 and w4 then store the result in w4

  ldr x0,=hellostr // address of format string is x0

  bl printf // Print the format string

  mov w0,#0 //Moving zero into register w0
  ldp x29,x30,[sp],16 // Pick up bread crumb
  ret
