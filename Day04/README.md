# Day 04
## Debugging Code
Step line by line through the code and see what is happening
```
gcc example1.c -static -g -o example1
gdb ./example.1
```

## Fixing VSC
> https://github.com/liximomo/vscode-sftp/issues/915#issuecomment-833144280

```
c:\Users<username>.vscode\extensions\liximomo.sftp-1.12.9\node_modules\ssh2-streams\lib\sftp.js
line: 388
```
```
if (code === STATUS_CODE.OK) {
```
```
if (code === STATUS_CODE.OK || code === STATUS_CODE.NO_SUCH_FILE) {
```