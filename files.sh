echo "File is located on /home/pi/Desktop/CSC-241"
read y
cd /home/pi/Desktop/CSC-241/${y}
echo "Enter Your file name: "
read x
gcc ${x}.c -S -o ${x}.s;
as -a ${x}.s > ${x}.lst;
gcc ${x}.c -o ${x};
rm a.out;
cd /home/pi/Desktop/CSC-241/
zip -r /zips/${x}.zip ${y};
./github.sh;
echo "Complete!"