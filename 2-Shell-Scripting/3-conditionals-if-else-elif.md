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


# Important , Daily Use Things

| Test | Meaning                      |
| :--: | ---------------------------- |
| `-f` | Regular file exists          |
| `-d` | Directory exists             |
| `-e` | Path exists                  |
| `-r` | Readable                     |
| `-w` | Writable                     |
| `-x` | Executable                   |
| `-s` | File exists and is not empty |


Examples 
```bash
if [[ -f /etc/nginx/nginx.conf ]]; then
    echo "Config file exists"
fi

if [[ -d /var/www/app ]]; then
    echo "App directory exists"
fi

if [[ -s app.log ]]; then
    echo "Log file contains data"
fi
```

# String Conditions — `-z` and `-n`

`-z` and `-n` are **string tests** used inside `[[ ]]`.

---

### `-z` → String is Empty
### `-n` → String is not Empty

`-z` means:

> **"Does this string have zero characters?"**

Example:

The name is empty so if statement run , if its not empty then its not run , it use to check whether anything is empty or not empty then run if statement and exit , script terminate
```bash

# -n is just reverse of -z

name=""

if [[ -z $name ]]; then
    echo "Name is empty"
fi

# one more easy example for understanding

read -p "Enter your name: " name

if [[ -z $name ]]; then
    echo "You did not enter your name"
else
    echo "Hello $name"
fi
```