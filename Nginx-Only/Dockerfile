FROM debian:buster-slim

LABEL author="MG8853" maintainer="TeamFelNull"

RUN useradd -d /home/container -m container

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get -y upgrade
RUN apt-get -y install software-properties-common curl apt-transport-https ca-certificates gnupg tar unzip git wget
RUN apt-get -y install gcc build-essential libpcre3 libpcre3-dev libssl-dev zlib1g-dev

USER container

ENV USER=container HOME=/home/container

WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]
