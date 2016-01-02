# docker-snippet

## 2016/01/02

```
[root@centos-1gb-sgp1-01-docker ~]# history | tail
    1  which wget
    2  ls
    3  which curl
    4  curl https://raw.githubusercontent.com/tempest200903/docker-snippet/master/install-docker.sh
    5  curl https://raw.githubusercontent.com/tempest200903/docker-snippet/master/install-docker.sh | sh
    6  history | tail
[root@centos-1gb-sgp1-01-docker ~]# ls
[root@centos-1gb-sgp1-01-docker ~]# docker -version
flag needs an argument: -e
See 'docker --help'.
flag provided but not defined: -version
See 'docker --help'.
[root@centos-1gb-sgp1-01-docker ~]# docker --version
Docker version 1.8.2-el7.centos, build a01dc02/1.8.2
[root@centos-1gb-sgp1-01-docker ~]# bash install-docker-registry.sh 
[root@centos-1gb-sgp1-01-docker ~]# wget https://raw.githubusercontent.com/tempest200903/docker-snippet/master/install-docker-registry.sh 
[root@centos-1gb-sgp1-01-docker ~]# cat install-docker-registry.sh 
yum -y install epel-release
yum -y install docker-registry python-sqlalchemy
ls /etc/sysconfig/docker-registry
ls /ec/docker-registry.yaml
ls /etc/sysconfig/docker
[root@centos-1gb-sgp1-01-docker ~]# bash install-docker-registry.sh 
[root@centos-1gb-sgp1-01-docker ~]# vi /etc/sysconfig/docker-registry
[root@centos-1gb-sgp1-01-docker ~]# tail -3 /etc/sysconfig/docker-registry
SEARCH_BACKEND=sqlalchemy


[root@centos-1gb-sgp1-01-docker ~]# vi /etc/docker-registry.yaml
[root@centos-1gb-sgp1-01-docker ~]# vi /etc/docker-registry.yml 
[root@centos-1gb-sgp1-01-docker ~]# cp /etc/docker-registry.yml{,.orig}
[root@centos-1gb-sgp1-01-docker ~]# vi /etc/docker-registry.yml 
[root@centos-1gb-sgp1-01-docker ~]# diff -w /etc/docker-registry.yml{,.orig}
21c21
<     sqlalchemy_index_database: _env:SQLALCHEMY_INDEX_DATABASE:sqlite:////var/lib/docker-registry/docker-registry.db
---
>     sqlalchemy_index_database: _env:SQLALCHEMY_INDEX_DATABASE:sqlite:////tmp/docker-registry.db
[root@centos-1gb-sgp1-01-docker ~]# vi /etc/sysconfig/docker
[root@centos-1gb-sgp1-01-docker ~]# cp /etc/sysconfig/docker{,.orig}
[root@centos-1gb-sgp1-01-docker ~]# vi /etc/sysconfig/docker
[root@centos-1gb-sgp1-01-docker ~]# diff -w /etc/sysconfig/docker{,.orig}
24d23
< INSECURE_REGISTRY='--insecure-registry 188.166.180.48:5000'
[root@centos-1gb-sgp1-01-docker ~]# mkdir /var/lib/docker-registry
[root@centos-1gb-sgp1-01-docker ~]# systemctl enable docker-registry.service
Created symlink from /etc/systemd/system/multi-user.target.wants/docker-registry.service to /usr/lib/systemd/system/docker-registry.service.
[root@centos-1gb-sgp1-01-docker ~]# systemctl start docker-registry.service
[root@centos-1gb-sgp1-01-docker ~]# systemctl restart docker-registry.service
[root@centos-1gb-sgp1-01-docker ~]# systemctl restart docker.service
[root@centos-1gb-sgp1-01-docker ~]# docker images
REPOSITORY          TAG                 IMAGE ID            CREATED             VIRTUAL SIZE
[root@centos-1gb-sgp1-01-docker ~]# docker search enakai00
[root@centos-1gb-sgp1-01-docker ~]# docker pull -a enakai00/centos
Trying to pull repository docker.io/enakai00/centos ... centos6: Pulling from enakai00/centos
f1b10cd84249: Pull complete 
fb9cc58bde0c: Pull complete 
f1b10cd84249: Already exists 
Digest: sha256:1422c5ba80430ae5899e40774bb3033e71cba5589d1163e04b1b801698e61127
f1b10cd84249: Already exists 
c852f6d61e65: Pull complete 
7322fbe74aa5: Already exists 
c852f6d61e65: Already exists 
7322fbe74aa5: Already exists 
Digest: sha256:49ecd6397d1f23deb245d3e0332862d68a9d34bb1d030066ae6175b8e9540c34
Status: Downloaded newer image for docker.io/enakai00/centos

[root@centos-1gb-sgp1-01-docker ~]# docker images
REPOSITORY                  TAG                 IMAGE ID            CREATED             VIRTUAL SIZE
docker.io/enakai00/centos   centos6             a005304e4e74        6 months ago        203.1 MB
docker.io/enakai00/centos   centos7             7322fbe74aa5        6 months ago        172.2 MB
docker.io/enakai00/centos   latest              7322fbe74aa5        6 months ago        172.2 MB
[root@centos-1gb-sgp1-01-docker ~]# docker run -it --name centos01 enakai00/centos:centos6 /bin/bash
[root@77f475a73cf0 /]# cat /etc/centos-release 
CentOS release 6.6 (Final)
[root@77f475a73cf0 /]# df -h
Filesystem            Size  Used Avail Use% Mounted on
rootfs                 99G  278M   94G   1% /
/dev/mapper/docker-253:1-525479-77f475a73cf07b6ac27eb8f56bd8337e7dd51ec92fa33712542eeaa6628c13a4
                       99G  278M   94G   1% /
tmpfs                 497M     0  497M   0% /dev
shm                    64M     0   64M   0% /dev/shm
tmpfs                 497M     0  497M   0% /sys/fs/cgroup
tmpfs                 497M     0  497M   0% /run/secrets
/dev/vda1              30G  4.0G   24G  15% /etc/resolv.conf
/dev/vda1              30G  4.0G   24G  15% /etc/hostname
/dev/vda1              30G  4.0G   24G  15% /etc/hosts
tmpfs                 497M     0  497M   0% /proc/kcore
tmpfs                 497M     0  497M   0% /proc/timer_stats
[root@77f475a73cf0 /]# [root@centos-1gb-sgp1-01-docker ~]# 
[root@centos-1gb-sgp1-01-docker ~]# docker stop centos01

centos01
[root@centos-1gb-sgp1-01-docker ~]# 
[root@centos-1gb-sgp1-01-docker ~]# docker ps
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
[root@centos-1gb-sgp1-01-docker ~]# docker ps -a
CONTAINER ID        IMAGE                     COMMAND             CREATED             STATUS                       PORTS               NAMES
77f475a73cf0        enakai00/centos:centos6   "/bin/bash"         3 minutes ago       Exited (137) 5 seconds ago                       centos01
[root@centos-1gb-sgp1-01-docker ~]# docker start centos01
centos01
[root@centos-1gb-sgp1-01-docker ~]# docker attach centos01

[root@77f475a73cf0 /]# [root@centos-1gb-sgp1-01-docker ~]# 
[root@centos-1gb-sgp1-01-docker ~]# docker commit centos01 decoy2015/httpd:ver1.0
ea432a94a20049b64fddab59d7b7b8b845f2ddfec3de57ec8d8f9d065b291de4
[root@centos-1gb-sgp1-01-docker ~]# docker images decoy2015/httpd
REPOSITORY          TAG                 IMAGE ID            CREATED             VIRTUAL SIZE
decoy2015/httpd     ver1.0              ea432a94a200        12 seconds ago      271.2 MB
[root@centos-1gb-sgp1-01-docker ~]# docker tag decoy2015/httpd:ver1.0 188.166.180.48:5000/decoy2015/httpd:ver1.0
[root@centos-1gb-sgp1-01-docker ~]# docker images decoy2015/httpd
REPOSITORY          TAG                 IMAGE ID            CREATED             VIRTUAL SIZE
decoy2015/httpd     ver1.0              ea432a94a200        2 minutes ago       271.2 MB
[root@centos-1gb-sgp1-01-docker ~]# docker images 188.166.180.48:5000/decoy2015/httpd
REPOSITORY                            TAG                 IMAGE ID            CREATED             VIRTUAL SIZE
188.166.180.48:5000/decoy2015/httpd   ver1.0              ea432a94a200        2 minutes ago       271.2 MB
[root@centos-1gb-sgp1-01-docker ~]# docker push 188.166.180.48:5000/decoy2015/httpd
The push refers to a repository [188.166.180.48:5000/decoy2015/httpd] (len: 1)
Sending image list
Pushing repository 188.166.180.48:5000/decoy2015/httpd (1 tags)
f1b10cd84249: Image successfully pushed 
fb9cc58bde0c: Image successfully pushed 
a005304e4e74: Image successfully pushed 
ea432a94a200: Image successfully pushed 
Pushing tag for rev [ea432a94a200] on {http://188.166.180.48:5000/v1/repositories/decoy2015/httpd/tags/ver1.0}
[root@centos-1gb-sgp1-01-docker ~]# docker search 188.166.180.48:5000/httpd
INDEX            NAME                                  DESCRIPTION   STARS     OFFICIAL   AUTOMATED
188.166.180.48   188.166.180.48:5000/decoy2015/httpd                 0     
[root@centos-1gb-sgp1-01-docker ~]# curl -s http://188.166.180.48:5000/v1/repositories/decoy2015/httpd/tags | python -mjson.tool
{
    "ver1.0": "ea432a94a20049b64fddab59d7b7b8b845f2ddfec3de57ec8d8f9d065b291de4"
}
[root@centos-1gb-sgp1-01-docker ~]# curl -LX DELETE http://188.166.180.48:5000/v1/repositories/decoy2015/httpd/tags/ver1.0
[root@centos-1gb-sgp1-01-docker ~]# docker search 188.166.180.48:5000/httpd
INDEX            NAME                                  DESCRIPTION   STARS     OFFICIAL   AUTOMATED
188.166.180.48   188.166.180.48:5000/decoy2015/httpd                 0                    
[root@centos-1gb-sgp1-01-docker ~]# curl -s http://188.166.180.48:5000/v1/repositories/decoy2015/httpd/tags | python -mjson.tool
{}
[root@centos-1gb-sgp1-01-docker ~]# docker rmi 188.166.180.48:5000/decoy2015/httpd:ver1.0
Untagged: 188.166.180.48:5000/decoy2015/httpd:ver1.0
[root@centos-1gb-sgp1-01-docker ~]# history | tail -22
   43  docker attach centos01
   44  docker stop centos01
   45  docker ps
   46  docker ps -a
   47  docker start centos01
   48  docker attach centos01
   49  docker commit centos01 decoy2015/httpd:ver1.0
   50  docker images decoy2015/httpd
   51  docker tag decoy2015/httpd:ver1.0 188.166.180.48:5000/decoy2015/httpd:ver1.0
   52  docker images decoy2015/httpd
   53  docker images 188.166.180.48:5000/decoy2015/httpd
   54  docker push 188.166.180.48:5000/decoy2015/httpd
   55  docker search 188.166.180.48:5000/httpd
   56  date
   57  curl -s http://188.166.180.48:5000/v1/repositories/decoy2015/httpd/tags | python -mjson.tool
   58  curl -LX http://188.166.180.48:5000/v1/repositories/decoy2015/httpd/tags/ver1.0
   59  curl -LX DELETE http://188.166.180.48:5000/v1/repositories/decoy2015/httpd/tags/ver1.0
   60  docker search 188.166.180.48:5000/httpd
   61  curl -s http://188.166.180.48:5000/v1/repositories/decoy2015/httpd/tags | python -mjson.tool
   62  docker rmi 188.166.180.48:5000/decoy2015/httpd:ver1.0
   63  date
   64  history | tail -22
```

