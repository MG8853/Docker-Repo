FROM --platform=$TARGETOS/$TARGETARCH debian:buster-slim

LABEL author="MG8853" maintainer="TeamFelNull"

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get -y upgrade
RUN apt-get -y install software-properties-common curl apt-transport-https ca-certificates gnupg tar unzip git wget
RUN apt-get -y install gcc build-essential libpcre3 libpcre3-dev libssl-dev zlib1g-dev

WORKDIR /opt
RUN wget https://nginx.org/download/nginx-1.20.2.tar.gz && \
    tar -zxvf nginx-1.20.2.tar.gz && \
    cd nginx-1.20.2 && \
    ./configure --prefix=/opt/nginx-server --user=container --with-http_ssl_module --with-ipv6 --with-threads \
    --with-stream --with-stream_ssl_module --with-stream_realip_module --with-stream_ssl_preread_module \
    --with-stream=dynamic && \
    make && make install && mkdir /usr/lib/nginx/ && mkdir /usr/lib/nginx/modules/ && \
    cp objs/ngx_stream_module.so /usr/lib/nginx/modules/ && \
    cd .. && rm -rf nginx-1.20.2.tar.gz

RUN useradd -d /home/container -m container

USER container
ENV USER=container HOME=/home/container

COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]
