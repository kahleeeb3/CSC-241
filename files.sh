echo "Enter folder name in /home/pi/Desktop/CSC-241/"
read y
cd /home/pi/Desktop/CSC-241/${y}
echo ${y}
echo "Enter Your file name without extension: "
read x
gcc ${x}.c -S -o ${x}.s;
as -a ${x}.s > ${x}.lst;
gcc ${x}.c -o ${x};
rm a.out;
cd /home/pi/Desktop/CSC-241/
zip -r output.zip ${y};
./github.sh;
echo "Complete!"