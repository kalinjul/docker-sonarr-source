FROM ubuntu

RUN apt-get update \
    && apt-get install -y gnupg ca-certificates \
    && rm -rf /var/lib/apt/lists/*

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
RUN echo "deb https://download.mono-project.com/repo/ubuntu stable-bionic main" > /etc/apt/sources.list.d/mono-official-stable.list

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y nuget mono-devel mono-complete mono-xbuild git nodejs npm wget

RUN npm install -g yarn
RUN nuget update -self

RUN mkdir /src && cd /src

WORKDIR /src/