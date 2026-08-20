# vim Editor & File Permission

## File Permission

```bash
ubuntu@ip-172-31-23-173:~$ ls -l
total 8
-rw-rw-r-- 1 ubuntu ubuntu    0 Aug 14 03:48 file1.json
drwxrwxr-x 2 ubuntu ubuntu 4096 Aug 13 11:33 folder-1
drwxrwxr-x 2 ubuntu ubuntu 4096 Aug 13 10:57 folder-2
```

```text
-rwxrw-r--  1  user  user  1250  Aug 14 09:00  notes.txt
│           │    │     │      │        │             │
│           │    │     │      │        │             └── File name
│           │    │     │      │        └── Date & time
│           │    │     │      └── File size (bytes)
│           │    │     └── Group owner
│           │    └── User/owner
│           └── Number of hard links
└── Permissions + file type ( start word - d means folder , - means file)
```

### 5) cat fileName
- this use to read The file , or print all The things on screen that in the file 

```bash
ubuntu@ip-172-31-23-173:~/folder-1$ cat file1.log
Hello Brother Vim Testing
```


## Text Editor -
### Vim - complete Learning
-  **Vim fileName**

     1) When You Write This Command Then a Editor is Open , If The File already Exist Then The preRequisiting File , if No Such File Exist Then Make A New File.

     2) Now You Enter In Vim Editor, Then For Write In this file , **You Press Insert or I button on Keyboard**, then you Able to write in this file
     3) After That  Your Want to Exit This File and Save The Content you write
        
        - **1) press ->  esc known as Escap**
        - **2) press ->  : known as Colon**
        - **write wq After Colon**
        - **Final Command You Perfom Become => :wq**
    
    4) **wq** - After This You Quit From this file , **wq** means **write & Quit** This Save Your Text
    5) **q!** - If I write **:q!** => **This Means Quit Without Saving**
    6) **q** - You just open the vim editor for any file and dont write anything new in the file and want to exit , just write **:q**

```bash
ubuntu@ip-172-31-23-173:~/folder-1$ ls
file1.log  file2.json
ubuntu@ip-172-31-23-173:~/folder-1$ vim file1.log
```


# Shell Script File -
 1) Shell Script File Extension is **.sh** , File Name End With **file1.sh , anyName.sh**
2) Shell Script file Has Shabang on The top , so know which shell you use - bash , sh or other

```bash
#!/bin/bash  => This is shabang

# This is Script for tws  => Thats Comment not involve in execution

echo "TWS: HEllo Dosto"
echo "Learners: Devops Wale Bhaiya, hum to comment krenge"
echo "dosto, like bhi kr do"
```

## How To execute Script File
1) First of all Your File must have execute permission -> -rwx 
2) If Something like that -> -rw-rw-r-- 
3) Then Your File Has No Execution Permission So Change The Permission By Command <br>
```bash
chmod [permissions] [file]  => Synatx
chmod 755 script.sh
```

## 1) Permission Provide & understand permission Number -
```bash
- = 0  |   --- = 0 + 0 + 0 = 0
r = 4  |   rwx = 4 + 2 + 1 = 7 -> all permission , rwx
w = 2  |   r-x = 4 + 0 + 1 = 5 -> read and execute
x = 1  |   r-- = 4 + 0 + 0 = 4 -> only read no write no execute

This Show as 
chmod 755 script.sh
-rwxr-xr-- => that's the permission for file

- | rwx | r-x | r--
|    │     │     │
|    │     │     └── Others
|    │     └──────── Group
|    └────────────── Owner
└─────────────────── File Type => Directory or file , d for directory, - for file

First Three Tell Permission for user then next three group, next others

```

## 2).How To Execute .sh file
**- Two Ways of  Execution<br>**
1) **./[FileName or fileDestination]** => <br> **./script.sh** <br>
**./folder-1/script.sh**
```bash
ubuntu@ip-172-31-23-173:~/folder-1$ ./hello.sh
TWS: HEllo Dosto
Learners: Devops Wale Bhaiya, hum to comment krenge
dosto, like bhi kr do
```
2) **bash [filename or destiantion]**  => **bash hello.sh**
```bash
ubuntu@ip-172-31-23-173:~/folder-1$ bash hello.sh
TWS: HEllo Dosto
Learners: Devops Wale Bhaiya, hum to comment krenge
dosto, like bhi kr do
```