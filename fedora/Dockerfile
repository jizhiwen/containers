# syntax=docker/dockerfile:1

FROM fedora:39

COPY dnf.conf /etc/dnf
RUN dnf -y reinstall $(rpm -qads --qf "PACKAGE: %{NAME}\n" | sed -n -E '/PACKAGE: /{s/PACKAGE: // ; h ; b }; /^not installed/ { g; p }' | uniq)
RUN dnf update -y && dnf install -y \
    man man-pages man-db \
    gcc \
    gcc-c++ \
    make \
    cmake \
    git \
    openssh-server \
    passwd \
    zsh \
    vim \
    net-tools iputils \
    proxychains-ng \
    procps-ng \
    && dnf clean all && rm -rf /var/cache/yum

RUN passwd -d root

RUN ssh-keygen -A
RUN echo -e 'PasswordAuthentication yes\n\
PermitEmptyPasswords yes\n\
PermitRootLogin yes\n' >> /etc/ssh/sshd_config

RUN git config --global user.name example && \
    git config --global user.email example@outlook.com


CMD ["/sbin/sshd", "-D"]
