FROM debian:buster-slim

LABEL author="MG8853" maintainer="TeamFelNull"

RUN useradd -d /home/container -m container

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get -y upgrade
RUN apt-get -y install software-properties-common curl apt-transport-https ca-certificates gnupg tar unzip git wget
RUN apt-get -y install gcc build-essential libpcre3 libpcre3-dev libssl-dev zlib1g-dev

USER container

WORKDIR /home/container
RUN wget https://nginx.org/download/nginx-1.20.2.tar.gz && \
    tar -zxvf nginx-1.20.2.tar.gz && \
    cd nginx-1.20.2 && \
    ./configure --prefix=/home/container/nginx-server --user=container --with-http_ssl_module --with-ipv6 --with-threads \
    --with-stream --with-stream_ssl_module --with-stream_realip_module --with-stream_ssl_preread_module \
    --with-stream=dynamic && \
    make && make install && cp objs/ngx_stream_module.so /usr/lib/nginx/modules/ && \
    cd .. && rm -rf nginx-1.20.2.tar.gz

ENV USER=container HOME=/home/container

COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]
