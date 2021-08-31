# First Day
Shortcut to Home
```
cd ~/
```
Compiling -> C-code -> Assembly -> Binary Code
                    Compile     Assemble    
Binary and Assembly code look different for different machines based on machine architecture
```
gcc hello.c -o hello
```
```
gcc -S hello.c -o hello.s
as hello.s -o hello.o   
gcc hello.o -o hello
./hello
```