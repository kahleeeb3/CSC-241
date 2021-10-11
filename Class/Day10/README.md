# Day 10 Notes

## mathandstuff.asm
``` assembly
.data

hellostr: .asciz "The number is: %i\n"

.text

.global main

main:
  stp x29,x30,[sp,#-16]! //Store Pair

  mov w2,2
  mov w3,3
  add w1,w2,w3 //add w3 and w2 then store the result in w1
  ldr x0,=hellostr //printf("The numbes are: %i\n, ", 5, 1832) // in C
  mov w2, 1832
  bl printf

  mov w0,#0 //Moving zero into register w0
  ldp x29,x30,[sp],16
  ret
```
## Termnial Commands
```
as mathandstuff.asm -g -o mathandstuff.o
gcc -static -g mathandstuff.o -o mathandstuff
./mathandstuff
```