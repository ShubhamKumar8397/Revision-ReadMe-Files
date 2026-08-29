# Docker Commands
### 1) docker login
- docker login in linux cli
- To Login In the Docker By PAT or username and password
### 2) docker images
- To Show All The Images have This Account 
### 3) docker build -t imageName contextpath
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

### 4) docker run -d -p hostPort:containerPort imageName
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

### 5) docker ps
- show all The running container 
### 4) docker logs containerId
- get all the logs for the specific containers
