FROM ubuntu:18.04

LABEL author="MG8853" maintainer="TeamFelNull"

RUN useradd -d /home/container -m container

ENV DEBIAN_FRONTEND=noninteractive
##useradd -d /home/container -m container &&
RUN apt update -y \
    && apt install -y python3 python3-pip sudo wget cmake git p7zip-full libssl1.0-dev curl unzip grep gcc g++ make git ffmpeg build-essential \
    && pip3 install --upgrade pip && pip3 install --upgrade launchpadlib && pip3 install --upgrade setuptools \
    && curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash - && apt -y install nodejs && node -v && npm -v

USER container
ENV USER=container HOME=/home/container

WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]