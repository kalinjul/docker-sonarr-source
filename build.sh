set -x

docker build -t julakali/mono-build-base base/
docker build --no-cache -t julakali/sonarr-source sonarr/
docker build -t julakali/jackett-source jackett/

docker rm sonarr
docker create --name sonarr julakali/sonarr-source 

rm -r sonarr-bin/opt/Sonarr
docker cp sonarr:/opt/Sonarr sonarr-bin/opt/

docker build --no-cache -t julakali/sonarr-bin sonarr-bin/

docker push julakali/sonarr-bin

#docker rm sonarr
#docker rm jackett

#docker run -d --name sonarr -p 8989:8989 -v /mnt/samba/Serien:/Serien sonarr:latest
#docker run -d --name jackett -p 9117:9117 jackett

#docker run --name sonarr sonarrimg
#docker cp sonarr:/src/Sonarr .
