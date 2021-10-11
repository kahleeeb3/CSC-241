# Assignment 06
## Terminal Commands
assemble the code to produce a .o file
```
as -g add.asm -o add.o
```

use GCC to link it and produce an executable
```
gcc -static -g add.o -o add
```

assemble it to produce a listing file
```
as -a add.asm > add.lst
```
execute your code to make sure it works
```
./hello1
```

## Understanding the code
> Printing a string:
```armasm
.data
hellostr: .asciz "The numbers %i, %i, and %i add to %i\n"
.text
.global main
main:
  ldr x0,=hellostr // address of format string is x0
  bl printf // Print the format string
```

> Returning 0. Same as `return 0;` in C:
```armasm
  mov w0,#0 //Moving zero into register w0
  ret //returning w0
```