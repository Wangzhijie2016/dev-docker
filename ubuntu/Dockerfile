FROM ubuntu:18.04

ARG USER=docker
ARG UID=1000
ARG GID=1000
ARG PW=docker
ARG HOME='/Users/jeremy'

RUN sed -i 's/archive.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list && \
    apt-get update && \
    apt-get install -y sudo wget zsh tmux python3 python3-pip nodejs yarn && \
    mkdir -p ${HOME} && useradd -m ${USER} --uid=${UID} -d /Users/jeremy -G sudo && echo "${USER}:${PW}" | chpasswd && \
    echo "${USER} ALL=(root) NOPASSWD:ALL" > /etc/sudoers.d/user && \
    chmod 0440 /etc/sudoers.d/user && \
    chown -R ${USER}:${USER} ${HOME}
    # cleaning

RUN apt-get -y install git ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip && \
    cd /tmp && git clone https://github.com/neovim/neovim && cd neovim && make && make install && cd / && rm -rf /tmp/* && \
    rm -rvf /var/lib/apt/lists/*

RUN cd /tmp && wget https://dl.google.com/go/go1.13.5.linux-amd64.tar.gz && \
    tar -zxvf go1.13.5.linux-amd64.tar.gz && \
    mv go /usr/local/ && \
    ln -s /usr/local/go/bin/go /usr/bin/go && \
    rm -rf /tmp/*

RUN sudo apt-get update && sudo apt-get install curl -y

RUN cd /tmp && git clone https://github.com/Wangzhijie2016/dev-docker.git && \
    pip3 install neovim && \
    mkdir -p ${HOME}/.config/nvim && \
    sudo chown -R ${USER}:${USER} ${HOME}

USER ${UID}:${GID}
WORKDIR /${HOME}
# terminal colors with xterm
ENV TERM xterm
ENV GOPROXY "https://goproxy.cn,direct"
ENV GOPATH ${HOME}/go
# set the zsh theme
ENV ZSH_THEME agnoster

RUN curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim && \
    cp /tmp/dev-docker/plug.vim ${HOME}/.config/nvim/init.vim && \
    wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true
    
# RUN nvim +':silent! :GoUpdateBinaries' +qall
# RUN nvim +PlugInstall +qall 
# RUN nvim -c "execute 'silent GoUpdateBinaries' | execute 'quit'" && \
    #sudo rm -rf ${HOME}/go/pkg && sudo rm -rf ${HOME}/go/src && \
    #sudo ln -s ${HOME}/go/bin/* /usr/bin
#RUN nvim +PlugInstall +qall >> /dev/null
RUN cp /tmp/dev-docker/init.vim ${HOME}/.config/nvim/init.vim && \
    cp ../bin/* /usr/bin
    #sudo chown -R ${USER}:${USER} ${HOME} && \
    #nvim -c "execute 'silent PlugInstall' | execute 'quit'"
RUN sudo chown -R ${USER}:${USER} ${HOME}
ENTRYPOINT ["zsh"]
