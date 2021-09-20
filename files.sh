echo "File is located on /home/pi/Desktop/"
read y
cd /home/pi/Desktop/${y}
echo "Enter Your file name: "
read x
gcc ${x}.c -S -o ${x}.s;
as -a ${x}.s > ${x}.lst;
gcc ${x}.c -o ${x};
rm a.out;
zip -r ${x}.zip /home/pi/Desktop/${y};
echo "Complete!"