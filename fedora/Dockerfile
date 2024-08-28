# syntax=docker/dockerfile:1

FROM fedora:40

ARG PROXY_ADDRESS=127.0.0.1
ARG PROXY_HTTP_PORT=3128
ARG PROXY_SOCKS5_PORT=3129
ARG GIT_USER=example
ARG GIT_EMAIL=example@example.com

EXPOSE 22

RUN sed -i /tsflags/d /etc/dnf/dnf.conf
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


RUN cat <<EOF > /etc/profile.d/prompt.sh
if [ "\$PS1" ]; then
  PS1="\u@\h:\w> "
fi
EOF

RUN cat <<EOF >> /root/.bashrc
alias startproxy='export http_proxy=$PROXY_ADDRESS:$PROXY_HTTP_PORT;\
export HTTPS_PROXY=$PROXY_ADDRESS:$PROXY_HTTP_PORT;\
export ALL_PROXY=$PROXY_ADDRESS:$PROXY_SOCKS5_PORT';
alias stoproxy='unset http_proxy;\
unset HTTPS_PROXY;\
unset ALL_PROXY';
EOF

RUN sed -i s/"socks4 \t127.0.0.1 9050"/"socks5 \t$PROXY_ADDRESS $PROXY_SOCKS5_PORT"/ /etc/proxychains.conf

RUN passwd -d root

RUN ssh-keygen -A
RUN echo -e 'PasswordAuthentication yes\n\
PermitEmptyPasswords yes\n\
PermitRootLogin yes\n' >> /etc/ssh/sshd_config

RUN git config --global user.name $GIT_USER && \
    git config --global user.email $GIT_EMAIL


CMD ["/sbin/sshd", "-D"]
