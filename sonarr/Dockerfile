FROM julakali/mono-build-base:latest

RUN apt-get update \
        && apt-get -y install libmediainfo-dev mediainfo \
        && rm -rf /var/lib/apt/lists/*

RUN cd /src/ \
        && git clone https://github.com/julakali/Sonarr.git \
        && cd /src/Sonarr \
	&& git checkout dev \
        && git submodule init && git submodule update \
        && wget https://dist.nuget.org/win-x86-commandline/latest/nuget.exe -O tools/nuget/nuget.exe \
        && /bin/bash build.sh \
        && mv /src/Sonarr/_output_linux /opt/Sonarr \
        && cd / \
        && rm -r src

WORKDIR /

RUN echo '#!/bin/bash \n\
        cd /opt/Sonarr/ && mono Sonarr.exe -data=/config' > entrypoint.sh
RUN chmod +x entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]

EXPOSE 8989
VOLUME /config
