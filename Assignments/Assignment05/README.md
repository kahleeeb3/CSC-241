assemble the code to produce a .o file
```
as -g hello1.asm -o hello1.o
```

use GCC to link it and produce an executable
```
gcc -static -g hello1.o -o hello1
```

assemble it to produce a listing file
```
as -a hello1.asm > hello1.lst
```
execute your code to make sure it works
```
./hello1
```
Then, run GDB.  Set a breakpoint for main (break main), and then step through the code line by line.
```
gdb ./hello1
break main
run
step
info register
```