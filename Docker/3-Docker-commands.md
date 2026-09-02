# Docker Commands
## 1) docker login
- docker login in linux cli
- To Login In the Docker By PAT or username and password
## 2) docker images
- To Show All The Images have This Account 
## 3) docker build -t imageName contextpath
```bash
docker build -t flask-app .

# . refers to current path , current folder You are now in
ubuntu@ip-172-31-23-173:~/folder-6/flask-app-ecs$ docker build -t flask-app .

# flask-app-ecs => i am in this folder,where Dockerfile is present and all folder files need to containerized

```
```
docker build -t flask-app .
│             │            │
│             │            └── Build context (current directory)
│             └── Image name/tag
└── Build Docker image
 ```

## 4) docker run -d -p hostPort:containerPort imageName
- -d detached mod per chalane se terminal stuck nhi hoga and you can running the app in background do their work easily on the flow
```
docker
  │
  └── run
       │
       ├── -d
       │    └── Run container in background/detached mode
       │
       ├── -p 80:5000
       │    │
       │    ├── 80   → EC2/Host port
       │    └── 5000 → Container port
       │
       └── flask-app
            └── Docker image
```
```
              EC2 HOST
        ┌───────────────────┐
        │                   │
Internet│      :80          │
───────►│   HOST PORT       │
        │       │           │
        │       │ -p 80:5000│
        │       ▼           │
        │  ┌─────────────┐  │
        │  │  Container  │  │
        │  │             │  │
        │  │    :5000    │  │
        │  │ CONTAINER   │  │
        │  │    PORT     │  │
        │  └─────────────┘  │
        │         │         │
        │         ▼         │
        │    Flask app      │
        └───────────────────┘
```
- **When someone accesses port 80 on my EC2, forward that traffic to port 5000 inside the container**.

## 5) docker ps
- show all The running container 
## 6) docker logs containerId
- get all the logs for the specific containers

## 7) docker ps -a 
- This show The all Containers details Thats Running , stops with time 
- sometimes a container is run and immedietly stop so we run this command and know the container why it existed by taking its container id and 
- docker logs Container-Id-Of-Existed-Contaier

## 8) Give Name To Container During Run
- --name is use to give name to container during run
```
docker run -d --name containerName nginx
```

## 9) docker network ls
```bash
docker network ls
```
- This Shows All the predefined networks and All The custom Network 
```bash
ubuntu@ip-172-31-23-173:~$ docker network ls
NETWORK ID     NAME        DRIVER    SCOPE
b8f3c68c24ca   bridge      bridge    local
1850120981d3   host        host      local
5012cc06d58f   myNetwork   bridge    local
2ee2ba4ef381   none        null      local
2560dd82c5eb   two-tier    bridge    local
```

## 10) docker Netowork create < Network-Name >
- To Create The Custom Network
```bash
docker network create mynetwork
                          └──------------ Network -Name
```

## 11) docker network inspect < Network-Name >
```bash
docker network inspect two-tier
```
- Get the details about the network 
- Which container is under this network

## 12) docker inspect < container id>
- to get the details about the container , existed , running with exit code or more details in cleaner way

## 13) docker exec -it < container Id > bash
- To run the container in interactive terminal 

```bash
docker exec -it 2dfajlej232d bash

# now you inside the bash shell and login to mysql
mysql -u root -p
# enter password: root

# now run sql commands
SHOW DATABASES;
SELECT user, host FROM mysql.user;
```
