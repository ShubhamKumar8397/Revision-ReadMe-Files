# Clone Repo With Error Handle

- **important keywords that take in mind:-**
 exit & return <br>
 - **exit 1** - refers To Terminate The Script , if line exit 1 run then script run stop and after that any function script  doesn;t run;
 - **return** - refers To Terminate The function, after that only function return but there is no effect on script, function stop run after that line return 1, possibly means failure , on the behalf of that script continue run or not is decided
    - **return 0** - success
    - **return 1** - failure

```bash
clone_repo() {
        echo "Clone The Repo"

        if [ -d "django-notes-app" ]; then
                echo "Skip The Clone Because Repo Already Exists"
        else
                git clone https://github.com/LondheShubham153/django-notes-app.git  || {
                        echo " CLONING FAILED :::: ERRR"
                        return 1
                }
        fi

}

if ! clone_repo; then
        echo "Function clone repo run , system failed To clone"
        exit 1
fi

cd  django-notes-app  && {
       echo "Enter in directory django-nots-app"
        } || {
               echo "File doesn't exist, enter in django-notes-app failed"
                exit 1
        }

echo "Cloning complete"
```
## destructure The entire Script
1) -d refers to => is Directory Exitst
      - if Exists Then Skip the clone, else git clone run 
        - if Git Clone Run Successfully then return 0 it means success, else 
        return 1 which means failure

```bash
clone_repo() {              # function name
        echo "Clone The Repo"
        if [ -d "django-notes-app" ]; then
                echo "Skip The Clone Because Repo Already Exists"
        else
                git clone https://github.com/LondheShubham153/django-notes-app.git  || {
                        echo " CLONING FAILED :::: ERRR"
                        return 1
                }
        fi
}
```
**Please Watch the syntax carefully ;** <br>
if Success then before,  || code segment run if failure in git clone then after || code segment run;
- thats totally the syntax


## 2) Code Segment destructure

```bash
if ! clone_repo; then
        echo "Function clone repo run , system failed To clone"
        exit 1
fi
```

From **if ! clone_repo; then**  function clone_repo is called , In this code segment , clone_repo call to ho gya , ab uske basis **echo & exit**  decide hoga ki run hoga ki nhi ,
- if clone_repo returns failure then echo & exit run and script terminate
- if success then script continue running , line by line

## 3) code segment destructure of cd

```bash
cd  django-notes-app  && {
       echo "Enter in directory django-nots-app"
        } || {
               echo "File doesn't exist, enter in django-notes-app failed"
                exit 1
        }
```

In this code Segment We just Enter in File and handling Errors
 - if we enter in **django-notes-app** then this line run **echo "Enter in directory django-nots-app"**  
 - otherwise after **||** pipeline code segment run 

### cd CodeBass Written as
```bash
if cd django-notes-app; then
    echo "Successfully entered the django-notes-app directory."
else
    echo "Error: Failed to enter the django-notes-app directory."
    exit 1
fi
```


 ### Cloning The Repo By Script Successfull