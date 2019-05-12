FROM mono-base

RUN apt-get update \
    && apt-get install -y curl apt-transport-https \
    && rm -rf /var/lib/apt/lists/*

RUN curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
RUN mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
RUN sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-ubuntu-bionic-prod bionic main" > /etc/apt/sources.list.d/dotnetdev.list'

RUN apt-get update \
    && apt-get -y install dotnet-sdk-2.2=2.2.105-1 \
    && rm -rf /var/lib/apt/lists/*

RUN cd /src && git clone https://github.com/julakali/Jackett.git \
        && cd /src/Jackett \
        && git submodule init && git submodule update \
        && /bin/bash build.sh -target=Linux \
        && mv /src/Jackett/BuildOutput/netcoreapp2.2/linux-x64/Jackett /opt/Jackett \
        && cd / \
        && rm -r /src/Jackett

ENV XDG_DATA_HOME="/config" \
XDG_CONFIG_HOME="/config"

WORKDIR /
RUN echo '#!/bin/bash \n\
        cd /opt/Jackett/ && ./jackett --NoUpdates' > entrypoint.sh
RUN chmod +x entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]

EXPOSE 9117
VOLUME /config