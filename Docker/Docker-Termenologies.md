# Docker Start Day - 1 
## Setup Docker First in local docker Desktop and docker cli

## Docker Install In Ec2
If Ec2 Instance then first update the system packages and software version
```bash
sudo apt-get update
```

Install Docker in ec2 machine
```bash
sudo apt-get install -y docker.io
```
Now Docker is Install in Linux System

## Check Docker Properly Install
```bash
docker --version

#output
ubuntu@ip-172-31-23-173:~$ docker --version
Docker version 29.1.3, build 29.1.3-0ubuntu4.1
```

## To know Status of Docker deamon /dockerd running or not 
This Tell You Docker is running , stop status 
```bash
sudo systemctl status docker
```

## To Start The docker Service
```bash
sudo systemctl start docker
```

## To Stop The Docker Service
Run Both Command To stop
It Will Stops The All Running Container
```bash
sudo systemctl stop docker.socket
sudo systemctl stop docker
```

## Docker Commands More Infomation
Docker are Root Level Commands<br>
All Time in Every Docker Commands use **sudo**<br>
`To Get Rid of sudo` <br>
Add The Current User To Docker Group to use docker Commands Without Sudo

```bash
sudo usermod -aG docker rahul
```
`What does -aG mean?` <br>
- -a → append the group; don't remove the user's existing groups
- -G → specify the supplementary groups

> [!WARNING] 
> use -aG Together

`Refresh The Shell To use Without Docker` <br>
sudo usermod -aG docker $USER, the operating system records the change, but your active terminal session does not know about it yet. Normally, you would have to log out completely or restart your SSH session to refresh your user permissions.

- Or Use This Command After Adding user To docker

```bash
newgrp docker
```
> [!Note] 
> To permanently apply the group across your entire environment so you never have to run newgrp again, make sure to log out of your desktop environment or disconnect your SSH session completely, then log back in









> [!WARNING]
> ### Refresh the Shell to Use Docker Without `sudo`
>
> After running:
>
> ```bash
> sudo usermod -aG docker $USER
> ```
>
> the operating system records the group membership change, but your active terminal session does not know about it yet.
>
> Normally, you would have to **log out completely** or **restart your SSH session** to refresh your user permissions.
>
> **Or**, use this command after adding the user to the Docker group:
>
> ```bash
> newgrp docker
> ```

> [!NOTE]
> To permanently apply the group membership across your entire environment, log out of your desktop environment or disconnect your SSH session completely, then log back in.