# CSC-241 Commands
An assembly aarch64 .s file
```
gcc file.c -S -o file.s
```
An assembly aarch64 .lst listing file
```
as -a file.s > file.lst
```
aarch64 executable
```
gcc filename.c -S -o filename.s
as filename.s -o filename.o
gcc filename.o -o filename
./filename
```

---
## Cross Compiling for ARM
```
aarch64-linux-gnu-gcc hello.c -S -o hello-cross.s
aarch64-linux-gnu-as hello-cross.s -o hello-cross.o
aarch64-linux-gnu-gcc hello-cross.o -static -o hello-cross
qemu-aarch64 ./hello-cross
aarch64-linux-gnu-as -a hello-cross.s > hello-cross.lst
```

---
## Additional Stuff

Zipping a file
```
zip -r archivename.zip directory_name
```
Shell Script Permissions
```
chmod +x files.sh
```