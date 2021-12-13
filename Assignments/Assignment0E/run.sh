filename="int2string"
as -g $filename.asm -o $filename.o
gcc -g -static $filename.o -o $filename
rm ${filename}.o
as -a ${filename}.asm > ${filename}.lst
rm a.out
./$filename

# run this in terminal
#chmod +x run.sh