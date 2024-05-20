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
    curl \
    gnupg \
    && rm -rf /var/lib/apt/lists/* 

RUN echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list
RUN curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | apt-key add -

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive TZ="Asia/Shanghai" apt-get install -y \
    ros-noetic-desktop-full \
    python3-rosdep \
    python3-rosinstall \
    python3-rosinstall-generator \
    python3-wstool \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

RUN passwd -d root

RUN echo 'PasswordAuthentication yes\n\
PermitEmptyPasswords yes\n\
PermitRootLogin yes\n' >> /etc/ssh/sshd_config

RUN service ssh start

RUN echo 'ulimit -Sn 1024\n' >> /root/.bashrc
RUN echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc

CMD ["/usr/sbin/sshd", "-D"]
