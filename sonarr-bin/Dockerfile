FROM mono:5-slim
ADD opt/Sonarr /opt/Sonarr

RUN echo '#!/bin/bash \n\
        cd /opt/Sonarr/ && mono Sonarr.exe -data=/config' > entrypoint.sh
RUN chmod +x entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]

EXPOSE 8989
VOLUME /config