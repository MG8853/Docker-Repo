#!/bin/bash

cd /home/container
wget https://nginx.org/download/nginx-1.20.2.tar.gz && \
    tar -zxvf nginx-1.20.2.tar.gz && \
    cd nginx-1.20.2 && \
    ./configure --prefix=/home/container/nginx-server --user=container --with-http_ssl_module --with-ipv6 --with-threads \
    --with-stream --with-stream_ssl_module --with-stream_realip_module --with-stream_ssl_preread_module \
    --with-stream=dynamic && \
    make && make install && cp objs/ngx_stream_module.so /usr/lib/nginx/modules/ && \
    cd .. && rm -rf nginx-1.20.2.tar.gz
