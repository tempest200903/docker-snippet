#!/bin/bash -uex
#:name: install-docker-registry.sh
#:usage: curl install-docker-registry.sh | sh
yum -y install epel-release
yum -y install docker-registry python-sqlalchemy
ls /etc/sysconfig/docker-registry
ls /ec/docker-registry.yaml
ls /etc/sysconfig/docker
