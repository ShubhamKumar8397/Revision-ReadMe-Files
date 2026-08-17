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
# Conditionals - if else elif
- Direct Code Implementation
```bash
#!/bin/bash
<< note
1) Conditionals
2) if block start then with, fi Block End 
3) if<space>[[ $username == "shubham" ]]
4) if[[ ]] #wrong , error face krna padega
note

read -p "Enter Your Name : " username

if [[ $username == "shubham" ]];
then
        echo "username is right"
else
        echo "username is wrong"
fi  
```

## Conditionals with Elif and (-ge -le -gt -lt)
 ### Arithemetic Operators

| Operator | Name           | Description                                       |  Example | Result |
| :------: | -------------- | ------------------------------------------------- | :------: | :----: |
|    `+`   | Addition       | Adds two values                                   |  `5 + 3` |   `8`  |
|    `-`   | Subtraction    | Subtracts the second value from the first         |  `5 - 3` |   `2`  |
|    `*`   | Multiplication | Multiplies two values                             |  `5 * 3` |  `15`  |
|    `/`   | Division       | Divides the first value by the second             |  `6 / 3` |   `2`  |
|    `%`   | Modulus        | Returns the remainder after division              |  `7 % 3` |   `1`  |
|   `**`   | Exponentiation | Raises the first value to the power of the second | `2 ** 3` |   `8`  |

```bash

a=10
b=3

echo $((a + b))   # 13
echo $((a - b))   # 7
echo $((a * b))   # 30
echo $((a / b))   # 3
echo $((a % b))   # 1
echo $((a ** b))  # 1000
```

### Comparison Operator

| Operator | Meaning                  |  Example  | Result |
| :------: | ------------------------ | :-------: | :----: |
|   `-eq`  | Equal to                 | `5 -eq 5` | `true` |
|   `-ne`  | Not equal to             | `5 -ne 3` | `true` |
|   `-gt`  | Greater than             | `5 -gt 3` | `true` |
|   `-lt`  | Less than                | `3 -lt 5` | `true` |
|   `-ge`  | Greater than or equal to | `5 -ge 5` | `true` |
|   `-le`  | Less than or equal to    | `5 -le 5` | `true` |


- code for understanding
- `Take In Mind That If You use comaparison operator like -eq , -ne and all given above then use [[ ]] in any loop, if ,, and if you use arithemetic operator then use this (( )) like + , - , == and others`
```bash
#!/bin/bash

read -p "Enter Your Hindi Subject Marks : " hindi
read -p "Enter Your English Subject Marks : " english
read -p "Enter Your Science Subject Marks : " Science

marks=$((hindi + english + Science))
echo "Total marks is :  $marks"

if [[ $marks -ge 100 ]]; then # then is use means block start for if
        echo "Your Marks is $marks Out of 150 & get First Division Pass"
elif [[ $marks -ge 80 && $marks -lt 100 ]]; then
        echo " Your Marks is $marks Out of 15o & get Second Division Pass"
elif [[ $marks -ge 50 && $marks  -lt 80 ]]; then
        echo  "Your Marks is $marks Out of 150 & get Third Division Pass"
else
        echo " Your Marks is $marks Oop You Fail The Examination"
fi
```
- **In This code There There is not need of && statement because if marks -ge 100 if statement run and echo the output , if marks -ge 80 then first statement fail and second statement execute , just for understanding how to use  i use && no need of && statement here**

# Loop -> (for , while)
## For Loop
- Syntax
```bash
for (( initialization; condition; increment ))
do
    commands
done
```
- A program to Learn Loop
- program to make n number of folder , files anything by loop

```bash
#!/bin/bash

for ((i = 0; i < 5; i++))
do
        mkdir -v day$i 
done
```
## Arguments and How to Pass & Access Arguments

- First Take A Loop on Code and Then understand The Whole Concept
```bash
#!/bin/bash

<< loopLearning
1) Arguments pass during execute the file
2) it access by $ 0, $ 1 , $ 2 ......
3) n nmbers of argunments pass from outside
4) write a command to make files and show their details
loopLearning

mkdir ~/NewFolderForLoops

for (( i = 0 ; i < $1 ; i++ ))
do
        touch ~/NewFolderForLoops/file$i
        if (( i % 2 == 0 )) then
                chmod 777 ~/NewFolderForLoops/file$i
        fi
done
ls -l ~/NewFolderForLoops
```

```bash
# output of this Code 
ubuntu@ip-172-31-23-173:~/folder-2$ bash argumentsInLoop.sh 5
mkdir: /home/ubuntu/NewFolderForLoops: File exists
total 0
-rwxrwxrwx 1 ubuntu ubuntu 0 Aug 16 04:28 file0
-rw-rw-r-- 1 ubuntu ubuntu 0 Aug 16 04:28 file1
-rwxrwxrwx 1 ubuntu ubuntu 0 Aug 16 04:28 file2
-rw-rw-r-- 1 ubuntu ubuntu 0 Aug 16 04:28 file3
-rwxrwxrwx 1 ubuntu ubuntu 0 Aug 16 04:28 file4
```

- **Things To Be Notice**
- 1) In If Statement Why not [[ ]], Because There is Cleaner Syntax to use arithemetic operations (( )), for strings type comparison there is , **if [[ $((i % 2)) -eq 0 ]]; then** use This


### How Arguments are pass in This program , $1 , $2 are the arguments

```bash
# bash argumentsInLoop.sh is $0
# 5 is $1 => arguments are directly pass during execution
# n number of arguments you pass from terminal, access by $0, $1 , $2, $3 ...

ubuntu@ip-172-31-23-173:~/folder-2$ bash argumentsInLoop.sh 5
```

Diagram To show -
```text
# n numbers of arguments pass and access by $1, $2 ..., in this here only one argument pass so $1

╔══════════════════════════════════════════════════════════════════════╗
║                         TERMINAL                                    ║
╚══════════════════════════════════════════════════════════════════════╝
                              │
                              ▼
                 bash argumentsInLoop.sh 5
                              │
                              │
                ┌─────────────┴─────────────┐
                │                           │
                ▼                           ▼
       SCRIPT / COMMAND                ARGUMENTS
                │                           │
                ▼                           ▼
     argumentsInLoop.sh                     5
                │                           │
                $0                          $1
```

```text
╔══════════════════════════════════════════════════════════════════════╗
║                    QUICK REFERENCE                                  ║
╠══════════════════════════════════════════════════════════════════════╣
║                                                                      ║
║  $0   → Script name / path                                          ║
║  $1   → First argument                                               ║
║  $2   → Second argument                                              ║
║  $3   → Third argument                                               ║
║  ...  → More arguments                                               ║
║  $#   → Number of arguments                                          ║
║  $@   → All arguments (best choice for looping)                     ║
║  $*   → All arguments as one string                                  ║
║                                                                      ║
║  "$@" → Keeps each argument separate                                 ║
║                                                                      ║
╚══════════════════════════════════════════════════════════════════════╝
```


## While Loop

```bash
#!/bin/bash

num=0

while [[ $num -le 10 ]]
do
        if (( num % 2 == 0 )) then
        echo  $num
        fi

        num=$((num+1))
done
```
 **num=$((num+1))** 
 <br>

 can't written as  **num = $((num+1))**  beause the starting num is a variable and there is no space after varibale but in (( )) inside a arithemetic operation,

 ```bash
 # it can be written as
# Inside (( )) and $(( )), you normally don't need $ before variable names.

 num=$((num+1)) # => Arithmetic expansion → calculate a value → assign it
 ((num + 1))       # ✅
$((num + 1))      # ✅
((num = num + 1)) # ✅ Arithmetic evaluation → calculate + assign directly
((num = $num + 1)) # works, but unnecessary

```

# Functions In Linux

# Error Handling In Linux
- In Other Languages for Handling Error there are keywords try and catch are available in Linux error handled by **if & else** <br>
**- Example by code**

```bash
#!/bin/bash

create_directory() {
        mkdir demo
}

if ! create_directory; then  # => Here The create_directory call
        echo "The code is being exited as the directory already exists"
        exit 1
fi
echo "Directory create"
```

- **How Code Works**
- **Create Directory is a function to create Directory call in if Statement if "! create_directory" means  any error occur in create Directory echo and exit 1 aage ka code execute nhi hoga ,, if directory create successfully then echo "Directory create"** 

```bash
#output for above code 
ubuntu@ip-172-31-23-173:~/folder-3$ bash handleError.sh
mkdir: demo: File exists
The code is being exited as the directory already exists
```
- **ERROR** - Occured Because The directory already Exist so exit 1


