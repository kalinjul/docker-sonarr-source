FROM ubuntu:20.04

RUN apt-get update \
    && apt-get install -y gnupg ca-certificates \
    && rm -rf /var/lib/apt/lists/*

#RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
#RUN echo "deb https://download.mono-project.com/repo/ubuntu stable-bionic main" > /etc/apt/sources.list.d/mono-official-stable.list

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y nuget mono-devel mono-complete mono-xbuild git nodejs npm wget curl

#RUN npm install -g yarn
RUN curl -o- -L https://yarnpkg.com/install.sh | bash
RUN ln -s /root/.yarn/bin/yarn /usr/bin/yarn

RUN nuget update -self

RUN mkdir /src && cd /src

WORKDIR /src/
