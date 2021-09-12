# CSC-241 Commands
Zipping a file
```
zip -r archivename.zip directory_name
```
# Linux Terminal Notes
Running commands from root user:
```
sudo -i
```
Copy a file:
```
cp <source> <destination>
```
Rename Directory:
```
mv <dir1> <dir2>
```
Delete Directory:
```
rm -r <directory name>
```

Edit a file:
```
sudo nano <filename>
```

Make a directory:
```
mkdir <directory name>
```

Make a new file:
```
touch <filename>
```

Navigate to previous directory:
```
cd -
```
## Shell Script Files (.sh)
add series of commands like
```
cd /home/pi/Desktop/CSC-241
git add --all
git commit -a -m "Quick Push"
git push
```
to a file named "github.sh". Make the File executable with
```
sudo chmod +x wsl.sh
```
execute the file with
```
./github.sh
```
## Pushing to Github on Linux:
if adding a new file:
```
git add --all
```
else:
```
git commit --all
git push
```
## Store Sign-in info with git:
```
$ git config credential.helper store

Username for 'https://github.com': <USERNAME>
Password for 'https://USERNAME@github.com': <PASSWORD>
```
## Pushing to Github in a Single Command
```
cd /home/pi/Desktop/CSC-241; git add --all; git commit -a -m "{message}";git push;
```
