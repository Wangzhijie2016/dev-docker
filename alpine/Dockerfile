FROM alpine

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories
RUN apk add --no-cache --virtual build-deps \
    gettext gettext-dev build-base cmake autoconf ncurses ncurses-dev ncurses-libs ncurses-terminfo alpine-sdk clang automake

RUN apk add --no-cache git sudo zsh && \
    git clone https://github.com/neovim/neovim && \
		cd neovim && \
		make && \
		make install && \
		apk del build-deps

