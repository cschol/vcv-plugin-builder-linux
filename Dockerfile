FROM ubuntu:16.04

RUN apt-get update
RUN apt-get install -y \
    cmake \
    curl \
    gcc \
    g++ \
    git \
    make \
    tar \
    unzip \
    zip
