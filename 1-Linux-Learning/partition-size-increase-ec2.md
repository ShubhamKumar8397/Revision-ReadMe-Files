# Main Disk Size Increase - EC2
1) Increase Volume in EC2 Instance , by going to storage of ec2 => then Volume => modify Volume

2) grow/ Expand the partiton 1, main partition 
```bash
sudo growpart /dev/nvme0n1 1
```

3) know the FileSystem Type
```bash
df -T /
```

4) mainly ext4 File System - Expand/Resize fileSystem
```bash
sudo resize2fs /dev/nvme0n1p1
```


# Full Destructure All Commands -
Lets Assume Your Disk Fully Used of EC2 instance , so you increase The volume
EBS, So When You Increase The Volume This not immedietely increase in partion and filesystem 

1) So First Increase The Volume of Ec2 from aws console , in instances -> then Volume -> modify volume

- When You Modify The volume and do 
``` 
df -h
```
- You see your Volume is now is same as before 

2) First You have To know grow the partiton 
- For show all partition you do 
```bash
lsblk
```
```bash
# you get something like that
ubuntu@ip-172-31-23-173:~/folder-6/flask-app-ecs$ lsblk
NAME         MAJ:MIN RM  SIZE RO TYPE MOUNTPOINTS
loop0          7:0    0 28.2M  1 loop /snap/amazon-ssm-agent/13009
loop1          7:1    0 28.4M  1 loop /snap/amazon-ssm-agent/13349
.

nvme0n1      259:0    0   30G  0 disk
├─nvme0n1p1  259:1    0 28.9G  0 part /
├─nvme0n1p13 259:2    0 1023M  0 part /boot
├─nvme0n1p14 259:3    0    4M  0 part
└─nvme0n1p15 259:4    0  106M  0 part /boot/efi
```

### **When you increase the size ebs volume and do lsblk You get ->**

```
ubuntu@ip-172-31-23-173:~/folder-6/flask-app-ecs$ lsblk
NAME         MAJ:MIN RM  SIZE RO TYPE MOUNTPOINTS
nvme0n1      259:0    0   40G  0 disk
├─nvme0n1p1  259:1    0 28.9G  0 part /
├─nvme0n1p13 259:2    0 1023M  0 part /boot
├─nvme0n1p14 259:3    0    4M  0 part
└─nvme0n1p15 259:4    0  106M  0 part /boot/efi
```
### **Watch carefully , i increase ebs volume 30GB to 40GB**
```
NAME         MAJ:MIN RM  SIZE RO TYPE MOUNTPOINTS
nvme0n1      259:0    0   40G  0 disk
```
### **But Partition 1 size is nvme0n1p1 => 30GB**
```
NAME         MAJ:MIN RM  SIZE RO TYPE MOUNTPOINTS
nvme0n1      259:0    0   40G  0 disk
├─nvme0n1p1  259:1    0 28.9G  0 part /
```

### So We have First Know The Type of File System
```bash
df -h -T /
    |  └─------- Type
    └─---------- To view in Readable format GB MB

ubuntu@ip-172-31-23-173:~/folder-6/flask-app-ecs$ df -T /
Filesystem     Type 1K-blocks    Used Available Use% Mounted on
/dev/root      ext4  29306880 7770460  21520036  27% /
```
### We get File System Type - ext4

### So First We now Grow The Partion By - 
- expand the partiton

```bash
sudo growpart /dev/nvme0n1 1

#example - 
ubuntu@ip-172-31-23-173:~/folder-6/flask-app-ecs$ sudo growpart /dev/nvme0n1 1
CHANGED: partition=1 start=2324480 old: size=60590047 end=62914526 new: size=81561567 end=83886046
```

### Now Your Partition is Expand - Now lsblk
```
NAME         MAJ:MIN RM  SIZE RO TYPE MOUNTPOINTS
nvme0n1      259:0    0   40G  0 disk
├─nvme0n1p1  259:1    0 38.9G  0 part /
```
- partition 1 now size - 40GB

### Then Expand The File System
partition Increase , But This Size Not Reflect To File System , So for type ext , we have to resize the filesystem
```bash
sudo resize2fs /dev/nvme0n1p1
```
**BEFOR RESIZE**
```bash
ubuntu@ip-172-31-23-173:~/folder-6/flask-app-ecs$ df -h
Filesystem       Size  Used Avail Use% Mounted on
/dev/root         28G  7.5G   21G  27% /
```
**AFTER RESIZE**
```bash
ubuntu@ip-172-31-23-173:~/folder-6/flask-app-ecs$ df -h
Filesystem       Size  Used Avail Use% Mounted on
/dev/root         38G  7.5G   31G  20% /
```

