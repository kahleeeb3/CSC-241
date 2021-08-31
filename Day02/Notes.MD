# Day 02 Notes
Working on the Pi remotely.
## Virtualization Toolset
- Compiled Code will not run on two different machines. Only the compiled one.
- Ubuntu App on PC in Root. Basically a striped down version of linux.
- Version of gcc that spits out arm architecture code

**Cross Compile:**
```
aarch64-linux-gnu-gcc hello.c -S -o hello-arm.s
```
- can automate this process of command typing using a "make file"
- linux can hit tab and auto-complete

## Executing
```
aarch64-linux-gnu-as hello-arm.s -o hello-arm.o
aarch64-linux-gnu-gcc hello-arm.o -o hello-arm
./hello-arm
```
- We get an error because it can compile arm code on an intel processor
- So we use qemu
```
qemu-aarch64 ./hello-arm
```
- This is an emulator that translates arm code to Intel line by line

**hello.c from Day 01**
```C
#include <stdio.h> //Load in package

int main(void){ // Returns int, takes in nothing
    printf("Hello, world!\n");
    return 0;
}
```