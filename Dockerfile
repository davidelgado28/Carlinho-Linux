FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive
ENV INITSYSTEM off

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential bison flex gettext texinfo \
    libncurses-dev libssl-dev elfutils libelf-dev bc cpio \
    syslinux wget curl git xz-utils squashfs-tools xorriso \
    debootstrap sudo gpg x11-xserver-utils software-properties-common \
    && rm -rf /var/lib/apt/lists/*

RUN wget -qO- https://microsoft.com | gpg --dearmor > /usr/share/keyrings/packages.microsoft.gpg \
    && echo "deb [arch=amd64,arm64,armhf signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://microsoft.com stable main" > /etc/apt/sources.list.d/vscode.list \
    && wget -qO- https://google.com | gpg --dearmor > /usr/share/keyrings/google-chrome.gpg \
    && echo "deb [arch=amd64 signed-by=/usr/share/keyrings/google-chrome.gpg] http://google.com stable main" > /etc/apt/sources.list.d/google-chrome.list

RUN apt-get update && apt-get install -y --no-install-recommends \
    xserver-xorg-video-intel xserver-xorg-video-amdgpu \
    xserver-xorg-video-ati mesa-vulkan-drivers mesa-utils \
    pipewire wireplumber pipewire-audio pavucontrol \
    network-manager network-manager-gnome dbus \
    google-chrome-stable code mousepad galculator thunar \
    xfce4-terminal xfce4-settings xfce4-session xfwm4 \
    lightdm lightdm-gtk-greeter guvcview eog gnome-clocks mpv feh \
    && rm -rf /var/lib/apt/lists/*

RUN useradd -m -s /bin/bash carlinho \
    && echo "carlinho:1234" | chpasswd \
    && usermod -aG sudo,video,audio,netdev carlinho

RUN mkdir -p /usr/share/backgrounds/ /etc/skel/.config/autostart

COPY scripts/wallpaper.jpg /usr/share/backgrounds/carlinho-wallpaper.jpg

RUN echo "[Desktop Entry]\nType=Application\nExec=feh --bg-fill /usr/share/backgrounds/carlinho-wallpaper.jpg\nHidden=false\nNoDisplay=false\nX-GNOME-Autostart-enabled=true\nName=Wallpaper" > /etc/skel/.config/autostart/wallpaper.desktop

WORKDIR /build
CMD ["/bin/bash"]
