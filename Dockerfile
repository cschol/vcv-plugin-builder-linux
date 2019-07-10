FROM ubuntu:16.04

RUN apt-get update
RUN apt install -y \
    tar \
    unzip \
    zip \
    git \
    gdb \
    curl \
    cmake \
    libx11-dev \
    libglu1-mesa-dev \
    libxrandr-dev \
    libxinerama-dev \
    libxcursor-dev \
    libxi-dev \
    zlib1g-dev \
    libasound2-dev \
    libgtk2.0-dev \
    libjack-jackd2-dev \
    jq
