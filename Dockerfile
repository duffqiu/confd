FROM centos:latest
MAINTAINER duffqiu@gmail.com

RUN rpm --import http://mirror.centos.org/centos/RPM-GPG-KEY-CentOS-7
RUN yum -y  update
RUN yum install -y wget

RUN wget --no-check-certificate https://github.com/kelseyhightower/confd/releases/download/v0.9.0/confd-0.9.0-linux-amd64

RUN mv confd-0.9.0-linux-amd64 /usr/bin/confd

VOLUME /etc/confd/conf.d/

VOLUME /etc/confd/templates/

VOLUME /workspace/

WORKDIR /workspace/

ENTRYPOINT [ "/usr/bin/confd" ]

