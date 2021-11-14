FROM ubuntu:20.04

SHELL ["/bin/bash", "-c"]

RUN apt-get update && apt install -y ca-certificates
RUN echo $' \n\
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal main restricted universe multiverse \n\
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-updates main restricted universe multiverse \n\
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-backports main restricted universe multiverse \n\
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-security main restricted universe multiverse'  \
    > /etc/apt/sources.list

RUN apt-get update


# Packages required by the website of CS144
RUN apt-get install -y \
    g++-8 \
    clang-tidy-7 \
    clang-format-7 \
    cmake \
    libpcap-dev \
    git \
    iptables \
    mininet \
    tcpdump \
    telnet \
    wireshark \
    socat \
    netcat-openbsd \
    coreutils \
    doxygen \
    graphviz

# Additional utility packages
RUN apt-get install -y \
    build-essential \
    wget \
    vim \
    make

RUN apt-get clean autoclean
RUN apt-get autoremove
