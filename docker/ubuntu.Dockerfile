FROM ubuntu:23.10

COPY install/ubuntu install.sh
COPY check.sh check.sh

RUN ./install.sh

WORKDIR /root/.config/nvim
