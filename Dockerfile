FROM ubuntu:20.04

LABEL author="MG8853" maintainer="TeamFelNull"

RUN useradd -d /home/container -m container

ENV DEBIAN_FRONTEND=noninteractive
##useradd -d /home/container -m container &&
RUN apt-get update -y && apt-get install -y software-properties-common \
    && add-apt-repository ppa:deadsnakes/ppa -y && apt-get update -y && apt-get install -y python3.7 && apt-get install -y build-essential unzip \
    && apt-get -y install software-properties-common && apt-get update -y && apt-get install -y git ffmpeg libopus-dev libffi-dev libsodium-dev python3-pip \
    && apt update -y \
    && apt install -y sudo wget cmake git p7zip-full curl unzip grep gcc g++ make git ffmpeg build-essential software-properties-common

USER container
ENV USER=container HOME=/home/container

WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]