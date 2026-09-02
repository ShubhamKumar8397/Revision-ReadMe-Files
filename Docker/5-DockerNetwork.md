# Docker Network

when we run two or more containers the containers are run in ints isolated environment 

- here container A How Communicates with container B 
- Both The container running in seprate environment
- Every container has its unique private ip
```text
┌──────────────────────┐
│      Your Laptop     │
│                      │
│  ┌───────────────┐   │
│  │ Container A   │   │
│  │   Backend     │   │
│  └───────────────┘   │
│                      │
│  ┌───────────────┐   │
│  │ Container B   │   │
│  │   Database    │   │
│  └───────────────┘   │
│                      │
└──────────────────────┘
```
Here Docker Container Come in presense 
- Docker creates the networking infrastructure that allows these containers to communicate.
```
- Backend Container
       │
       │ HTTP / TCP
       ▼
Database Container
```

## Naming To Container
During run The Container, We give name To Container
```
docker run -d --name container1 nginx
```

## Connections
## Host To Container Connection -
Host is The machine Where the container Is Running, host understand By EC2 isntance , inside EC2 contianer is Running
```
Browser ───────────► Host ───────────► Container
```
```
docker run -p 8080:80 nginx

=> Container Port => 8080
=> host port => 80
```
- When There is Request on host port-number 80, Then this request forward To container having port 8080, because host port 80 map with container port 8080

## Container To Container connection - 
```
Myapp-container ───────────► db-Container
```

# EXPOSE is NOT the same as -p
## Expose -
Expose is nothing , its only useful or information it doesn't do anything in Dockerfile , It Only Useful for know our application is run on which port, Reading Convectional <br>
 <br>
 In a Dockerfile Expose does not actually publish or open any port to the outside world. It's purely informational/documentation — it tells anyone reading the Dockerfile (or inspecting the image) "hey, this app listens on port X internally."

```
 EXPOSE 3000
 ```
- Run This Command
- Docker looks at EXPOSE 3000 in the image, and maps it to some random host port like 32768
 ```
 docker run -P myapp
```

## -p (or ports: in compose) — the actual functionality

This is what actually does the work:

```bash
docker run -p 3000:3000 myapp
```

This means: "take port 3000 on my host machine, and forward it to port 3000 inside the container." Without this, the container's port is only reachable within Docker's internal network (e.g., by other containers on the same bridge network) — not from your host machine or the outside world.

# Docker Default Network

```bash
docker network ls
```
You Get Something like that -
```bash
NETWORK ID     NAME      DRIVER    SCOPE
xxxx           bridge    bridge    local
xxxx           host      host      local
xxxx           none      null      local
```

## 1) Bridge (Focus On Bridge)
**Docker's default bridge network**

When you install Docker, it automatically creates a network called bridge. Every container you run — unless you say otherwise — gets attached to it automatically.

```text
Your Machine (Host)
│
├── docker0 (virtual bridge/switch)
│     │
│     ├── Container A (172.17.0.2)
│     ├── Container B (172.17.0.3)
│     └── Container C (172.17.0.4)
```

- Docker creates a virtual network interface on your host called docker0.
- Every container gets its own private IP address (like 172.17.0.x) on this virtual network.
- Containers can reach each other using these IPs.
- Containers can reach the internet (outbound) through the host, via NAT (Network Address Translation).
- The outside world (or your host machine) can only reach a container if you explicitly publish a port (-p 8080:80).

## 2) Host
Container uses the host's networking stack rather than having its own isolated network namespace in the usual way.

## 3) none
Container gets essentially no network connectivity.

## 4) Custom Docker Network
Instead of using Docker's default bridge, create our own network:<br>
**Custom Docker Network is Create and Then the container need To Talk To Each Other are provided Teh same network name so They come in Same Network**
```bash
docker network create mynetwork
                          └──------------ Network -Name
```

- Run Two Container and Give the same network name 
```bash
docker run -d --name RYDEX --network mynetwork flask-app
                    |               |            └──------ Image Name
                    |               |
                    |               └──------------------- Network Name
                    |
                    └──----------------------------------- Container Name
```

```bash
# " \ " => \ is nothing that line doesn't end here next line with it also
docker run -d \
  --name db \
  --network mynetwork \
  nginx

# Same As
docker run -d --name myMongodb  --network mynetwork mongodb
```

**Both The Container GiveThe Same Network Name So Now They Communicate With each other**

## Two Containers Run and Communicate

```bash

docker network create two-tier

# Thats command To Run The Sql Image
docker run -d --name my-sql-app --network two-tier \
  -e MYSQL_ROOT_PASSWORD=root \
  -e MYSQL_DATABASE=flaskdb \
  mysql


# Thats command To run The Flask App
docker run -d --name flask-app --network two-tier \
  -e MYSQL_HOST=my-sql-app \
  -e MYSQL_USER=root \
  -e MYSQL_PASSWORD=root \
  -e MYSQL_DB=flaskdb \
  your-flask-image

```

###  MYSQL_HOST in flask app should be same as the container name of mysql container 


- Docker registered the hostname my-sql-app → pointing to that container's internal IP address on the two-tier network.

- Docker's internal DNS resolves my-sql-app to the MySQL container's actual IP (e.g., 172.18.0.2) automatically — because both containers are on the same two-tier network. It's exactly like how your computer resolves google.com to an IP address via DNS, except this is a private, Docker-managed DNS just for containers on the same custom network.

- Key rule to remember: the value you put in --name when creating a container becomes its hostname that other containers on the same custom network can use to reach it. If you named it db-server instead:


## docker inspect < ConatinerId >
- It Use To Get All The details About the Container status, Exit code and many more About The container 
- sometimes due to mermory issue container killed automatically, so get details about container Clear Version 

## docker exec -it < container-Id > bash
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
