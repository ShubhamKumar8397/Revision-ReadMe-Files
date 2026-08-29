# Linux Learning

## Kernel
-  A kernel is the core part of an operating system. It manages the computer's hardware, memory, processes, and communication between software and hardware.

## All Simple Commands -
### 1) echo "anyText"
- just Print The Text you Enter After echo in " " 
```bash
ubuntu@ip-172-31-23-173:~$ echo "hello Bhaiya"
hello Bhaiya
``` 

### 2) mkdir folderName
- This Command use to make new Folder
- At A Time You can make one or more folders just name them
- In This At a time Three folder make

```bash
ubuntu@ip-172-31-23-173:~$ mkdir folder-1 folder-2 folder-3
ubuntu@ip-172-31-23-173:~$ ls
folder-1  folder-2  folder-3
```

### -v : means verbose
- -v is option or flag , in linux termelogies
- -v = "jo bhi kaam kar raha hai, uska output mujhe dikhao."
- -v can use with anything , cp ,mv ,rm anything

```bash 
ubuntu@ip-172-31-23-173:~$ mkdir -v folder-1
mkdir: folder-1: File exists
ubuntu@ip-172-31-23-173:~$ mkdir -v folder-4
mkdir: created directory 'folder-4'
```

### 3) touch fileName
- touch command is use to make files by this make one or more file at the same time
- **-v is not work in touch remember**

```bash
ubuntu@ip-172-31-23-173:~/folder-1$ touch file1.log file2.json
ubuntu@ip-172-31-23-173:~/folder-1$ ls
file1.log  file2.json
```

### 4) ls
- ls is use to list , whats inside anyfolder list all the folder files in the current directory
- ls list all the files folders in folder-1 directory, current directory where the user present
```bash
ubuntu@ip-172-31-23-173:~/folder-1$ ls
file1.log  file2.json
```

### 5) ls -l 
- It Use To list files and directories detailed information

### 6) To Add A Existing user In group
usermodify - so wo last mein <br>
`sudo usermod -aG GroupName username`
```bash
sudo usermod -aG docker $USER
sudo usermod -aG docker ubuntu
```
> [!TIP]
> $User - Is A Environment Variable in Linux This can return The current working user

> [!IMPORTANT]
> <u> **What does -aG mean?**</u>
> - -a → append the group; don't remove the user's existing groups
> - -G → specify the supplementary groups

### 7) To Remover A user From Group 
gpasswd - group modification - so groupname last mein <br>
To Remove user Rahul from docker <br>
`sudo gpasswd -d username groupname`
```bash
sudo gpasswd -d rahul docker
```
`sudo deluser username groupname`
```
sudo deluser ubuntu docker
```
Both Are Correct

```text
sudo       gpasswd       -d       rahul       docker
 │            │            │          │            │
 │            │            │          │            └── Group name
 │            │            │          └────────────── User name
 │            │            └───────────────────────── Delete/remove
 │            └────────────────────────────────────── Manage group membership
 └─────────────────────────────────────────────────── Run with administrator privileges
 ``` 

