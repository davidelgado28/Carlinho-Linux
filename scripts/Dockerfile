FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    build-essential \
    bison \
    flex \
    gettext \
    texinfo \
    libncurses-dev \
    libssl-dev \
    elfutils \
    libelf-dev \
    bc \
    cpio \
    syslinux \
    wget \
    git \
    xz-utils \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /build
