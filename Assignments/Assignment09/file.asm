.data
  str: .asciz "0x%016lx%016lx + 0x%016lx%016lx = 0x%016lx%016lx\n"
  str1: .asciz "Final Carry: True\n"
  str2: .asciz "Final Carry: False\n"
 
.text

.global main

main:
  //standard start for our class
  stp x29,x30,[sp,#-16]!
  
  //loads x1
  movz x1, #0xFFFF
  movk x1, #0xFFFF, lsl #16
  movk x1, #0xFFFF, lsl #32
  movk x1, #0xFFFF, lsl #48
  
  //loads x2
  movz x2, #0xFFFF
  movk x2, #0xFFFF, lsl #16
  movk x2, #0xFFFF, lsl #32
  movk x2, #0xFFFF, lsl #48  

  //loads x3
  movz x3, #0xFFFF
  movk x3, #0xFFFF, lsl #16
  movk x3, #0xFFFF, lsl #32
  movk x3, #0xFFFF, lsl #48
  
  //loads x4
  movz x4, #0x0001
  movk x4, #0x0000, lsl #16
  movk x4, #0x0000, lsl #32
  movk x4, #0x0000, lsl #48

  //the adding portion
    ADDS x6, x2, x4
    ADCS x5, x1, x3
    mrs x9, NZCV  //loads flag info into reg 9
    str x9, [sp, #-16]! //stores it
    ldr x0, =str
    bl printf
    
    //checking for carry
    ldr x9,[sp],#16
    msr NZCV,x9
    bcs carry
    ldr x0, =str2
    bl printf
    b end
      
carry:
  ldr x0,=str1
  bl printf
  b end
 
end:
  //Normal ending sequence
  mov w0,#0
  ldp x29,x30,[sp],#16
  ret
