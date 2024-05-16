# syntax=docker/dockerfile:1

FROM ubuntu:20.04

RUN apt-get update \
    && apt-get install -y ca-certificates \
    && rm -rf /var/lib/apt/lists/*

RUN echo 'deb https://mirrors.aliyun.com/ubuntu/ focal main restricted universe multiverse\n\
deb-src https://mirrors.aliyun.com/ubuntu/ focal main restricted universe multiverse\n\
deb https://mirrors.aliyun.com/ubuntu/ focal-security main restricted universe multiverse\n\
deb-src https://mirrors.aliyun.com/ubuntu/ focal-security main restricted universe multiverse\n\
deb https://mirrors.aliyun.com/ubuntu/ focal-updates main restricted universe multiverse\n\
deb-src https://mirrors.aliyun.com/ubuntu/ focal-updates main restricted universe multiverse\n\
# deb https://mirrors.aliyun.com/ubuntu/ focal-proposed main restricted universe multiverse\n\
# deb-src https://mirrors.aliyun.com/ubuntu/ focal-proposed main restricted universe multiverse\n\
deb https://mirrors.aliyun.com/ubuntu/ focal-backports main restricted universe multiverse\n\
deb-src https://mirrors.aliyun.com/ubuntu/ focal-backports main restricted universe multiverse\n' > /etc/apt/sources.list

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive TZ="Asia/Shanghai" apt-get install -y \
    passwd \
    openssh-server \
    ros-desktop-full \
    && rm -rf /var/lib/apt/lists/* 

RUN passwd -d root

RUN echo 'PasswordAuthentication yes\n\
PermitEmptyPasswords yes\n\
PermitRootLogin yes\n' >> /etc/ssh/sshd_config

RUN echo 'ulimit -Sn 1024\n\
source /opt/ros/noetic/setup.sh\n' >> /root/.bashrc

CMD ["/usr/sbin/sshd", "-D"]
