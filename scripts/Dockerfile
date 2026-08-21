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
    curl \
    git \
    xz-utils \
    squashfs-tools \
    xorriso \
    debootstrap \
    sudo \
    gpg \
    && rm -rf /var/lib/apt/lists/*

RUN wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > /usr/share/keyrings/packages.microsoft.gpg \
    && echo "deb [arch=amd64,arm64,armhf signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list \
    && wget -qO- https://dl.google.com/linux/linux_signing_key.pub | gpg --dearmor > /usr/share/keyrings/google-chrome.gpg \
    && echo "deb [arch=amd64 signed-by=/usr/share/keyrings/google-chrome.gpg] https://dl-ssl.google.com/usr/bin/linux/chrome/ deb main" > /etc/apt/sources.list.d/google-chrome.list

RUN apt-get update && apt-get install -y \
    # Apps
    google-chrome-stable \
    code \
    mousepad \
    galculator \
    thunar \
    xfce4-terminal \
    xfce4-settings \
    xfce4-session \
    xfwm4 \
    lightdm \
    lightdm-gtk-greeter \
    guvcview \
    eog \
    gnome-clocks \
    mpv \
    feh \
    network-manager-gnome \
    pavucontrol \
    # Drivers e Firmware de Hardware
    linux-firmware \
    xserver-xorg-video-intel \
    xserver-xorg-video-amdgpu \
    mesa-vulkan-drivers \
    mesa-utils \
    # Servidor de Áudio
    pipewire \
    wireplumber \
    pipewire-audio \
    pulseaudio-utils \
    # Gerenciamento de Rede e Comunicação Interna
    dbus \
    network-manager \
    && rm -rf /var/lib/apt/lists/*

RUN useradd -m -s /bin/bash carlinho \
    && echo "carlinho:1234" | chpasswd \
    && usermod -aG sudo,video,audio carlinho

WORKDIR /build
CMD ["/bin/bash"]
