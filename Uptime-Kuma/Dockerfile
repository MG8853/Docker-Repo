FROM        --platform=$TARGETOS/$TARGETARCH node:22-bookworm

LABEL author="MG8853" maintainer="TeamFelNull"

ENV DEBIAN_FRONTEND=noninteractive

RUN         useradd -d /home/container -m container -s /bin/bash

RUN          ln -s /home/container/ /nonexistent

## Update base packages
RUN          apt update \
             && apt upgrade -y

## Install dependencies
RUN          apt install -y gcc g++ libgcc-s1 libc++-dev gdb libc6 git wget curl tar zip unzip binutils xz-utils \
             liblzo2-2 cabextract iproute2 net-tools netcat-openbsd telnet \
             locales ffmpeg gnupg2 apt-transport-https software-properties-common ca-certificates \
             tzdata

## Configure locale
RUN          update-locale lang=en_US.UTF-8 \
             && dpkg-reconfigure --frontend noninteractive locales


USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

COPY        entrypoint.sh /entrypoint.sh
CMD ["/bin/bash", "/entrypoint.sh"]
