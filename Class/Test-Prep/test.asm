.data

plzstr1: .asciz "Input X.\n"
plzstr2: .asciz "Input Y.\n"
instr:   .asciz "%lli"
badstr:  .asciz "Bad values!\n"
goodstr: .asciz "Output is %f\n"
badval:  .dword 0xFFFFFFFFFFFFFFFF

.text

.global main

main:
  stp x29, x30, [sp, #-16]!
  sub sp, sp, #16
promptuser:
  ldr x0, =plzstr1
  bl  printf
  ldr x0, =instr
  mov x1, sp
  bl  scanf
  ldr x0, =plzstr2
  bl  printf
  ldr x0, =instr
  mov x1, sp
  add x1, x1, #8 // why do this?
  bl  scanf
  ldr x0, [sp]
  ldr x1, [sp, #8]
 // bl  foo
 // fmov x0, d0
 // ldr x2, =badval
 // ldr x1,[x2]
 // cmp x0, x1
 // b.eq error
 // ldr x0, =goodstr
 // bl  printf
  add sp, sp, #16
  mov w0, #0
  ldp x29, x30, [sp], #16
  ret

error:
  ldr x0, =badstr
  bl  printf
  b   promptuser