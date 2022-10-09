FROM python:3.8-bullseye

ENV DEBIAN_FRONTEND=noninteractive
##useradd -d /home/container -m container &&
RUN apt-get update -y \
    && apt-get install -y sudo wget git curl unzip git build-essential \
    ca-certificates openssl tar sqlite3 fontconfig tzdata iproute2 jq p7zip-full libsndfile1
    
RUN pip install Cython

#RUN cd / && \
#    wget https://download.pytorch.org/libtorch/cpu/libtorch-cxx11-abi-shared-with-deps-1.11.0%2Bcpu.zip && \
#    unzip libtorch-cxx11-abi-shared-with-deps-1.11.0+cpu.zip

#ENV LD_LIBRARY_PATH=/libtorch/lib

#RUN cd / && \
#    wget https://github.com/microsoft/onnxruntime/releases/download/v1.10.0/onnxruntime-linux-x64-1.10.0.tgz && \
#    tar xzf onnxruntime-linux-x64-1.10.0.tgz && \
#    mv onnxruntime-linux-x64-1.10.0 onnxruntime

#ENV DYLD_LIBRARY_PATH=/onnxruntime/lib

#RUN cd / && \
#    curl -s https://api.github.com/repos/VOICEVOX/voicevox_core/releases/latest \
#    | grep "browser_download_url.*core.zip" \
#    | cut -d : -f 2,3 \
#    | tr -d \" \
#    | wget -qi -
#RUN cd / && \
#    wget https://github.com/VOICEVOX/voicevox_core/releases/download/0.12.0-preview.3/voicevox_core-linux-x64-cpu-0.12.0-preview.3.zip
#RUN cd / && \
#    unzip voicevox_core-linux-x64-cpu-0.12.0-preview.3.zip \
#    && mv voicevox_core-linux-x64-cpu-0.12.0-preview.3 voicevox_core
#    && rm -fr voicevox_core/libcore.so \
#    && mv voicevox_core/libcore_cpu_x64.so voicevox_core/libcore.so

#ENV VOICEVOX_CORE="/voicevox_core/libcore.so"

USER container
ENV USER=container HOME=/home/container

WORKDIR /home/container

COPY entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]
