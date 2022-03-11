FROM debian:bullseye

LABEL author="MG8853" maintainer="TeamFelNull"

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get -y upgrade
RUN apt-get -y install software-properties-common curl apt-transport-https ca-certificates gnupg tar unzip git wget
RUN apt-get -y install gcc build-essential libpcre3 libpcre3-dev libssl-dev zlib1g-dev

WORKDIR /opt
RUN apt update && \
    apt install debian-keyring debian-archive-keyring apt-transport-https curl lsb-release && \
    curl -sL 'https://deb.dl.getenvoy.io/public/gpg.8115BA8E629CC074.key' | gpg --dearmor -o /usr/share/keyrings/getenvoy-keyring.gpg && \
    echo a077cb587a1b622e03aa4bf2f3689de14658a9497a9af2c427bba5f4cc3c4723 /usr/share/keyrings/getenvoy-keyring.gpg | sha256sum --check && \
    echo "deb [arch=amd64 signed-by=/usr/share/keyrings/getenvoy-keyring.gpg] https://deb.dl.getenvoy.io/public/deb/debian $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/getenvoy.list && \
    apt update && \
    apt install getenvoy-envoy

RUN useradd -d /home/container -m container

USER container
ENV USER=container HOME=/home/container

COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]
