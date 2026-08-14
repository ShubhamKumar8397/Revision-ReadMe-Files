**Date**: 13 August 2026

# Shell Scripting Learning
    
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

## Variables In Shell Script 
- Same As All The Languages direct code Understand
```bash
#!/bin/bash
# For Writing Multi Level Comment  use << Block Name
<< comment

this is multi line comment
This not Execute
=> comment is the Block name
=> If You Want To End The comment

comment            # => End The Block With Same Name

name="shubham"
echo "My name is $name"   # => Dollar use To Write Variables
```
- << Block Start and Name The Block, End The Block With Same name
<br>

- **Variables write Correctly :**

```text
name="shubham"    # ✅
name=shubham      # ✅
name = "shubham"  # ❌ => No Space after name and =
name= "shubham"   # ❌
name ="shubham"   # ❌
```

## Use Direct Command In Shell Script 
- Direct Code Implementation

```bash
#!/bin/bash

# use commands directly in script file
# date is the command in shell script

country="India"

echo "Country Name is $country and Time now here is $(date)"

#output => after execute - for file newScript.sh

ubuntu@ip-172-31-23-173:~/folder-1$ ./newScript.sh
Country Name is India and Time now here is Fri Aug 14 04:53:55 UTC 2026
```

## Code For Taking Input 
```bash
#!/bin/bash

# code for taking input

echo "Enter Your Name"
read username   # => read For Taking Input , username is Variable to store
echo "Your Name is $username"
```
- when You Run The Script, script run line By Line at line read , CLI ask for name and store in username

```bash
#output
ubuntu@ip-172-31-23-173:~/folder-1$ ./newScript.sh
Enter Your Name
Shubham Bhardwaj  # => This Text enter By You
Your Name is Shubham Bhardwaj
```

## Taking Input With Promt Direct Code : -
```bash 
read   -p "Enter Your name: "   username
 │       │                       │
 │       │                       └── Variable where input is stored
 │       └────────────────────────── Prompt shown to user
 └────────────────────────────────── Take input
```
```bash
#!/bin/bash

read -p "Please Enter Your Name : " username
echo "Your name is $username"

#output ubuntu@ip-172-31-23-173:~/folder-1$ bash newScript.sh
Please Enter Your Name :Shivam kumar
Your Name is Shivam kumar
```
### - A Small Script For Understanding 
- create User By Script and show in /etc/passwd
```bash
#!/bin/bash

<< comment
1) Take input and create user
2) why -m means make home directory /home/username
comment

read -p "Enter Username: " username
sudo useradd -m $username
grep $username /etc/passwd  # find username in /etc/passwd
```

- **If not -m Then User Formed but , directory not formed,**
```bash
ubuntu@ip-172-31-23-173:/home$ ls
Jethalal  ubuntu

# this Jethalal directory not formed  /home/jethalal not formed
```
