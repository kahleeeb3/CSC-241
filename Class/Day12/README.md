```armasm
stp x29, x30, [sp,#-16]!
/*
Pre-Decrementing the Stack Pointer
- Must be a multiple of 16 on pi
- Stack grows downward 
- pulling out of memory and then shrinking the stack
- stack must end where it starteds
*/
ldp x29, x30,[sp],#16
/* 
Load Pair:
- un-expand by 16 bytes
- 16 byte change happends after you do the stuff
*/
```