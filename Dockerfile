FROM ubuntu
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
&& apt-get install -y bash bash-completion inetutils-tools inetutils-traceroute iputils-ping iputils-tracepath iputils-arping net-tools iproute2 vlc

# Add user vlc for VideoLAN to work.
ENV HOME /home/vlcstream
RUN useradd --create-home --home-dir $HOME vlcstream \
    && chown -R vlcstream:vlcstream $HOME \
    && chown -R vlcstream:vlcstream /media \
    && usermod -a -G audio,video vlcstream

USER vlcstream

COPY stream.sh /tmp/
COPY video.mp4 /tmp/
#ENTRYPOINT ["/tmp/stream.sh"]
ENTRYPOINT ["/bin/bash"]
