FROM centos:7

ARG USER=docker
ARG UID=1000
ARG GID=1000
ARG PW=docker

RUN yum -y update && \
    yum install -y sudo

RUN adduser ${USER} --uid=${UID} && echo "${USER}:${PW}" | chpasswd && adduser ${USER} sudo && \
    echo "${USER} ALL=(root) NOPASSWD:ALL" > /etc/sudoers.d/user && \
    chmod 0440 /etc/sudoers.d/user

USER ${UID}:${GID}
WORKDIR /home/${USER}
