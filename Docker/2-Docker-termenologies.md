# Docker Termenologies

## What is Docker
Docker is a containerization platform that allows developers to package an application along with its dependencies into lightweight, isolated containers, ensuring the application runs consistently across different environments.

- **<u>Docker</u>** -
A containerization platform used to package and run applications consistently in isolated environments called containers.


## Docker Images
A Docker image is a read-only, immutable template containing the application code, dependencies, libraries, and instructions required to create and run a container.

- Docker Image - Ek read-only template/blueprint haii jiske ander sare instructions likhe application code, dependencies, libraries, environment variables, configurations, aur instructions (jaise entrypoint/cmd) and many other things ye file immutable hoti haii, inhi instructions ke base per container bnta haii

An image:
- is read-only/immutable
- contains application dependencies
- is made up of layers
- can be used to create multiple containers
- can be stored in Docker Hub or another registry

Dockerfile = recipe 📝 <br>
Image = tayyar dish ka frozen/packed version 📦 (reusable, immutable)

## Docker Containers
A Docker container is a lightweight, isolated, running instance of a Docker image.

### Important interview point
- A container is not a virtual machine.
- Containers share the host machine's OS kernel, making them generally much lighter and faster to start than VMs.
```
Image = Blueprint
Container = Actual running instance
```

## Docker CLI 
Docker CLI (Command Line Interface) is the command-line tool used to interact with and manage Docker resources such as images, containers, networks, and volumes.
```bash
# These Are Commands to manage images and containers and many more
docker pull
docker build
docker run
docker ps
docker stop
docker start
docker exec
docker logs
docker images
docker rm
```

## Docker HUB
Docker Hub is a cloud-based container registry provided by Docker that allows developers to store, share, discover, and download Docker images.

Think of Docker Hub as a GitHub-like platform for Docker images.
-	A cloud-based container registry used to store, share, discover, and pull Docker images.

## Relationship Between All 5
```
                         DOCKER
                           │
                    Docker Platform
                           │
            ┌──────────────┴──────────────┐
            ↓                             ↓
       Docker Image                 Docker Container
        (Blueprint)                 (Running instance)
            │                             │
            └─────────────┬───────────────┘
                          │
                     Docker CLI
                          │
                    Used to manage
                          │
              Images / Containers / etc.
                          │
                          ↓
                     Docker Hub
                  (Image Registry)
             (All Images Present Here)
 ```