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