# DockerFile
DockerFile is The file where the instructions are written in a manner to built the image and when run the container whats happen 

## DockerFile Destructure
```typescript
#pull a base Image

FROM openjdk:28-ea-jdk-slim

#create a folder where the app code will be stored
WORKDIR /app

#Copy the source code from you host machine to your container
COPY src/Main.java /app/Main.java

#compile the application code
RUN javac /app/Main.java


#run the application
CMD ["java", "Main"]

```

## FROM 
From refers To the Base Image , On Which Your Application Run
```typescript
FROM openjdk:28-ea-jdk-slim
```

## WORKDIR
Workdir - Its The Root Folder of you container , in This all your work is start 

- just understand - you make a directory in Container, in this directory your whole code is available
 
- /app canbe => /folder , /project , /anything
```typescript
WORKDIR /app
```

## COPY
Copy Refers To copy folder files to container <br>
Copy from main source to destination 
```typescript
COPY src/Main.java /app/Main.java
       |                  |
    source path       destination Path
```
### Visulally understand 
```
Your Java project
│
└── src
     └── Main.java

        │
        │ COPY
        ↓
Docker container
/app/
└── Main.java

```

## RUN

RUN is a Dockerfile instruction used to execute a command while Docker is building the image.

- Examples like 
```
RUN npm install
RUN npm run dev
RUN npm start
```

## CMD
CMD specifies the default command that runs when a container starts from your image. For example an Express app, it's what actually launches your Node server.

- Run time (docker run your-image): Docker starts a container from that image and looks up the CMD instruction to know what process to launch inside it.

```typescript
CMD ["node", "server.js"]   # ← runs during CONTAINER START
```


# Build context
Think of the build context as the folder you give to Docker to use when building the image.

- Here is the projext folder.
- You can use the files inside this folder
- while building my image.

```bash
cd /home/ubuntu/rydex
docker build -t rydex .
```
```text
docker build -t rydex .
   │      │      │    │
   │      │      │    └── . = Build Context
   │      │      │        (current folder)
   │      │      │
   │      │      └────── Image Name / Tag
   │      │
   │      └───────────── Build an image
   │
   └──────────────────── Docker CLI
```

Build context = the set of files (from a specified folder) that gets sent to the Docker daemon so it can use them during the build — mainly for COPY and ADD instructions.

-  .   => just refers its the current folder i am now present