# Create Ec2 By Script , AWS Cli

Read The Script, You almost understand all the things

## command -v aws , >& /dev/null
```bash
isAwsPresent() {
        if ! command -v aws >& /dev/null; then
                echo "aws Cli Doesn't Present Need To Install"
                return 1
        fi
}
```
whats about **! command -v aws**
- It Use To check is aws cli present in system or not
```bash
# this can be
if ! command -v node then
    echo "node is not present"
fi

command    -v    aws
   │        │     │
   │        │     └── command we are looking for
   │        └──────── verbose/lookup mode
   └───────────────── shell builtin

<< comment
if aws is present you get command aws is present - means aws cli present 
/usr/local/bin/aws
```

## >& /dev/null
/dev/null is understand as a blackhole for out <br>
command -v aws  this something return value  >& /dev/null <br>
you dont see the output on screen 

```bash
#example

echo "hello world" > & /dev/null

# you don't see the output on screen

```

## Store Value

```bash
Instance=$(aws ec2 describe-instances --instance-ids "$instanceId")
```
The line Response with json , store the entire response json in Instance Variable <br>
And Furthur , you get data from the json 

### how To access the data from json stored variable

```bash
InstanceState=$(echo "$Instance" | jq -r '.Reservations[0].Instances[0].State.Name')
```

**Instance** have Json Data and Then Get state name from the Instance , query Like this
- Why echo
    - first query resolve then , With Echo You first get the value print here and then assign

- why -r :-
    - -r means raw , By -r You get The raw basic plain text 


## basic confusion
```bash
 if [[ "$InstanceState" == "running" ]]; then
                        echo "Your Instance is now running"
                        break
fi
```
 You think here == is a arithemetic operation but why [[ ]], this bracket because in if statement two strings
 are compare not any numbers .... (( )) in this numbers operations are done , if i write in this (( )),
 then "$InstanceState" is treated as variable for a number, if not get any number it returns 0, invalid syntax overall if written in (( ))


 ### Or more nothing in this file for learning shell scripting , all other are aws knowledge