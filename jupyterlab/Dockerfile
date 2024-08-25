# syntax=docker/dockerfile:1

FROM ubuntu:focal
EXPOSE 8888

RUN sed -i 's@//.*archive.ubuntu.com@//mirrors.ustc.edu.cn@g' /etc/apt/sources.list

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive TZ="Asia/Shanghai" apt-get install -y \
	locales \
	python3-pip \
	&& rm -rf /var/lib/apt/lists/*

RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
	dpkg-reconfigure --frontend=noninteractive locales

RUN pip3 install jupyterlab

RUN echo 'ulimit -Sn 1024\n' >> /root/.bashrc
RUN echo 'export LANG=en_US.UTF-8\n' >> /root/.bashrc
RUN echo 'export DISPLAY=172.18.176.1:0\n' >> /root/.bashrc

CMD ["jupyter", "lab", "--allow-root", "--no-browser", "--ip=*"]
