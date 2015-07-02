FROM ubuntu:latest
MAINTAINER tim@haak.co.uk
MAINTAINER eric@windisch.us

ADD https://downloads.plex.tv/plex-media-server/0.9.12.4.1192-9a47d21/plexmediaserver_0.9.12.4.1192-9a47d21_amd64.deb /root/
RUN dpkg -i /root/plexmediaserver_0.9.12.4.1192-9a47d21_amd64.deb

VOLUME ["/config","/data"]

ADD ./start.sh /start.sh
RUN chmod u+x  /start.sh

ENV RUN_AS_ROOT="true" \
    CHANGE_DIR_RIGHTS="false"

EXPOSE 32400

CMD ["/usr/sbin/start_pms"]
