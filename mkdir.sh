echo "Enter folder name:"
read y
mkdir ${y}
cd ${y}
echo ".asm file name:"
read x
touch ${x}.asm
touch README.md
cp /home/pi/Desktop/Caleb-Powell/run.sh ./
chmod +x run.sh
echo "Complete!"