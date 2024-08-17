# syntax=docker/dockerfile:1

FROM ubuntu:focal

RUN sed -i 's@//.*archive.ubuntu.com@//mirrors.ustc.edu.cn@g' /etc/apt/sources.list

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive TZ="Asia/Shanghai" apt-get install -y \
    passwd \
    openssh-server \
	gcc g++ cmake make \
	python3-pip \
    && rm -rf /var/lib/apt/lists/*
	
RUN pip3 install conan==1.64.1

RUN passwd -d root

RUN echo 'PasswordAuthentication yes\n\
PermitEmptyPasswords yes\n\
PermitRootLogin yes\n' >> /etc/ssh/sshd_config

RUN service ssh start

RUN echo 'ulimit -Sn 1024\n' >> /root/.bashrc
RUN echo 'export LANG=C.UTF-8\n' >> /root/.bashrc

CMD ["/usr/sbin/sshd", "-D"]
