**Date**: 13 August 2026

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
