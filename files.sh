echo "Enter folder name in /home/pi/Desktop/CSC-241/Assignments"
read y
cd /home/pi/Desktop/CSC-241//Assignments/${y};
#echo "Enter Your file name without extension: "
#read x
#gcc ${x}.c -S -o ${x}.s;
#as -a ${x}.s > ${x}.lst;
#gcc ${x}.c -o ${x};
#rm a.out;
cd /home/pi/Desktop/CSC-241/;
rm zips/${y}.zip
zip -r zips/${y}.zip Assignments/${y};
./github.sh;
echo "Complete!"