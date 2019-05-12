FROM ubuntu

RUN apt-get update \
    && apt-get install -y gnupg ca-certificates libmediainfo-dev mediainfo \
    && rm -rf /var/lib/apt/lists/*

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
RUN echo "deb https://download.mono-project.com/repo/ubuntu stable-bionic main" > /etc/apt/sources.list.d/mono-official-stable.list

RUN mkdir /src
WORKDIR /src/

RUN apt-get update \
        && DEBIAN_FRONTEND=noninteractive apt-get install -y nuget mono-devel mono-runtime mono-xbuild git nodejs npm wget \
        && npm install -g yarn \
        && nuget update -self \
        && cd /src \
        && git clone https://github.com/julakali/Sonarr.git \
        && cd /src/Sonarr \
        && git submodule init && git submodule update \
        && wget https://dist.nuget.org/win-x86-commandline/latest/nuget.exe -O tools/nuget/nuget.exe \
        && /bin/bash build.sh \
        && mv /src/Sonarr/_output_linux /opt/Sonarr \
        && cd / \
        && rm -r src \
        && apt-get -y remove nuget mono-devel mono-xbuild git nodejs npm wget \
        && apt-get -y autoremove \
        && rm -rf /var/lib/apt/lists/*

WORKDIR /

RUN echo '#!/bin/bash \n\
        cd /opt/Sonarr/ && mono Sonarr.exe -data=/config' > entrypoint.sh
RUN chmod +x entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]

EXPOSE 8989
VOLUME /config