FROM devkitpro/devkitppc

RUN dkp-pacman -Syyu --noconfirm 3ds-dev nds-dev gp32-dev gba-dev nds-portlibs && \
    dkp-pacman -S --needed --noconfirm `dkp-pacman -Slq dkp-libs | grep '^3ds-'` && \
    dkp-pacman -Scc --noconfirm
ENV DEVKITARM=${DEVKITPRO}/devkitARM

RUN apt-get update && \
    apt-get install -y --no-install-recommends zip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
