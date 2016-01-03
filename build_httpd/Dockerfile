FROM enakai00/centos:centos6
MAINTAINER Etsuji Nakai

RUN yum -y install httpd
ADD index.html /var/www/html/index.html
CMD service httpd start && bash
