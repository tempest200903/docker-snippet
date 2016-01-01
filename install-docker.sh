#!/bin/bash -uex
#:name: install-docker.sh
#:usage: curl https://raw.githubusercontent.com/tempest200903/docker-snippet/master/install-docker.sh | sh
yum -y install net-tools
yum -y update
yum -y install docker
