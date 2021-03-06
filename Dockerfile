FROM anapsix/alpine-java

ENV JAVA_ARGS="-Xmx3G -Xms2G"
ENV SERVER_OP=""
ENV SERVER_MOTD="A Tekkit Server"
ENV SERVER_PVP="true"

RUN apk add unzip
RUN apk add wget
RUN apk add tmux

RUN mkdir /minecraft
RUN wget -O /tmp/tekkit.zip http://servers.technicpack.net/Technic/servers/tekkit/Tekkit_Server_3.1.2.zip
RUN unzip /tmp/tekkit.zip -d /minecraft/

ADD ./launch.sh /minecraft/launch.sh
RUN chmod +x /minecraft/launch.sh

VOLUME /minecraft/world
VOLUME /minecraft/world_nether
VOLUME /minecraft/world_the_end
EXPOSE 25565

WORKDIR /minecraft
ENTRYPOINT ["/minecraft/launch.sh"]
