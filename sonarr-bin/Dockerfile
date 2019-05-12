FROM mono:5
ADD opt/Sonarr /opt/Sonarr

RUN apt-get update \
        && apt-get -y install libmediainfo-dev mediainfo \
        && rm -rf /var/lib/apt/lists/*
        
RUN echo '#!/bin/bash \n\
        cd /opt/Sonarr/ && mono Sonarr.exe -data=/config' > entrypoint.sh
RUN chmod +x entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]

EXPOSE 8989
VOLUME /config