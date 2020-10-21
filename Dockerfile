FROM ubuntu:18.04
ENV DEBIAN_FRONTEND=noninteractive
CMD /bin/bash
RUN apt update
RUN apt -y upgrade
RUN apt install -y sudo
RUN sudo apt install -y python3 python3-pip
RUN sudo apt install -y wget cmake git p7zip-full
RUN sudo apt install -y libssl1.0-dev curl unzip wget grep gcc g++ make git ffmpeg build-essential
RUN sudo apt install -y python3 python3-pip
RUN pip3 install --upgrade pip
RUN pip3 install --upgrade launchpadlib
RUN pip3 install --upgrade setuptools
RUN curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
RUN sudo apt -y install nodejs
RUN node -v

LABEL author=MG8853 maintainer=TeamFelNull
WORKDIR /home/container
#USER container
ENV USER=container
ENV HOME=/home/container
