FROM alpine:latest

RUN apk add --no-cache shadow bash bash-completion iputils net-tools iproute2 vlc

# Add user vlc for VideoLAN to work.
ENV HOME /home/vlcstream
RUN useradd --create-home --home-dir $HOME vlcstream \
    && chown -R vlcstream:vlcstream $HOME \
    && chown -R vlcstream:vlcstream /media \
    && usermod -a -G audio,video vlcstream

WORKDIR $HOME
USER vlcstream

COPY stream.sh /tmp/
COPY video.mp4 /tmp/
#ENTRYPOINT ["/tmp/stream.sh"]
ENTRYPOINT ["/bin/bash"]
