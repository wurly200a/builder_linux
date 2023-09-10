FROM ubuntu:22.04

ARG USER_NAME="builder"
ARG GROUP_NAME="builder"
ARG IMAGE_NAME

RUN if [ -z "${USER_NAME}"  ] || \
       [ -z "${IMAGE_NAME}"   ];   \
    then echo "Please specify args"; \
    exit 1; \
    fi

# basic
RUN apt update -y

# add user and group
RUN groupadd ${GROUP_NAME}
RUN useradd -g ${GROUP_NAME} -m ${USER_NAME}

RUN apt install -y git wget cmake libssl-dev g++ kconfig-frontends
RUN apt install -y libcurl4-openssl-dev

USER ${USER_NAME}

# Set Prompt
RUN echo PS1="'(docker)${IMAGE_NAME}:\w${PS1}'" >> ~/.bashrc
