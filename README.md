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

## Notes on linux terminal:
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
## Store Sign-in info with git:
```
$ git config credential.helper store

Username for 'https://github.com': <USERNAME>
Password for 'https://USERNAME@github.com': <PASSWORD>
```
## Pushing to Github in a Single Command
```
cd /home/pi/Desktop/CSC-241; git add --all; git commit -a -m "{message}";git push
```
