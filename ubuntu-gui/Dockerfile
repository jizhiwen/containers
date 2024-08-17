# syntax=docker/dockerfile:1

FROM ubuntu:focal

RUN sed -i 's@//.*archive.ubuntu.com@//mirrors.163.com@g' /etc/apt/sources.list

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive TZ="Asia/Shanghai" apt-get install -y \
    passwd \
    openssh-server \
	gcc g++ cmake make \
	unzip git vim\
	python3-pip \
	locales \
	fonts-noto-cjk

RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
	dpkg-reconfigure --frontend=noninteractive locales

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive TZ="Asia/Shanghai" apt-get install -y \
	libnss3 libgtk-3-dev xdg-utils

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive TZ="Asia/Shanghai" apt-get install -y \
	qtcreator \
    && rm -rf /var/lib/apt/lists/*
	
RUN pip3 install conan==1.64.1

RUN passwd -d root

RUN echo 'PasswordAuthentication yes\n\
PermitEmptyPasswords yes\n\
PermitRootLogin yes\n' >> /etc/ssh/sshd_config

RUN service ssh start

RUN echo 'ulimit -Sn 1024\n' >> /root/.bashrc
RUN echo 'export LANG=en_US.UTF-8\n' >> /root/.bashrc
RUN echo 'export DISPLAY=172.18.176.1:0\n' >> /root/.bashrc

CMD ["/usr/sbin/sshd", "-D"]
