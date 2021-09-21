echo "Push Comment:"
read x
cd /home/pi/Desktop/CSC-241; git add --all; git commit -a -m "${x}";git push