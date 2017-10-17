FROM ubuntu
MAINTAINER Daiki Kojima <sos.daiki.keion@gmail.com>
ENV PYENV_ROOT /root/.pyenv
ENV PATH /root/.pyenv/shims:/root/.pyenv/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
RUN apt-get update && \
    apt-get install -y git mercurial build-essential libssl-dev libbz2-dev libreadline-dev libsqlite3-dev curl && \
    curl -L https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer | bash
RUN apt-get install -y nodejs
RUN pyenv install 3.5.0
RUN pyenv global 3.5.0
RUN pip install jupyter
RUN apt-get install -y npm nodejs-legacy libzmq-dev
RUN git clone https://github.com/notablemind/jupyter-nodejs.git
WORKDIR "jupyter-nodejs"
RUN mkdir -p ~/.ipython/kernels/nodejs/
RUN npm install && node install.js
RUN npm run build
RUN npm run build-ext
