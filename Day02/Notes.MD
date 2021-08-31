# Day 02 Notes
Working on the Pi remotely.
## Virtualization Toolset
- Compiled Code will not run on two different machines. Only the compiled one.
- Ubuntu App on PC in Root. Basically a striped down version of linux.
- Version of gcc that spits out arm architecture code
Cross Compile:
```
aarch64-linux-gnu-gcc hello.c -S -o hello-arm.s
```
- can automate this process of command typing using a "make file"
- linux can hit tab and auto-complete

hello.c from Day 01
```C
#include <stdio.h> //Load in package

int main(void){ // Returns int, takes in nothing
    printf("Hello, world!\n");
    return 0;
}
```