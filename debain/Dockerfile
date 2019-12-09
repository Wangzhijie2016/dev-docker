FROM golang

RUN sed -i 's/deb.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list && \
    apt-get update && \
    apt-get install -y git && \
    git clone https://github.com/neovim/neovim.git

RUN apt-get install -y ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip && \
	apt-get install -y git curl zsh wget apt-utils nodejs npm tmux python3

RUN cd neovim && make && make install && cd .. && rm -rf neovim

RUN curl -fLo /root/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && echo 'Asia/Shanghai' >/etc/timezone && rm -rf /var/lib/apt/lists/*

ARG USER=docker
ARG UID=1000
ARG GID=1000
ARG PW=docker
