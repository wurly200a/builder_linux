FROM ubuntu:24.04

ARG USER_NAME="ubuntu"
ARG GROUP_NAME="ubuntu"

RUN apt update -y
RUN apt install -y git wget cmake libssl-dev g++ kconfig-frontends libcurl4-openssl-dev clangd

USER ${USER_NAME}
RUN echo PS1="'(docker):\w${PS1}'" >> ~/.bashrc
