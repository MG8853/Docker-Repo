FROM ubuntu:18.04

LABEL author="MG8853" maintainer="TeamFelNull"

RUN useradd -d /home/container -m container \
    && apt -y update \
    && apt -y install sudo ffmpeg wget curl libssl1.0-dev unzip \
    && curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash - \
    && apt -y install nodejs && node -v && npm -v

USER container
ENV USER=container HOME=/home/container
WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh
CMD ["/bin/bash", "/entrypoint.sh"]
