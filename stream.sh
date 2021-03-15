#!/bin/bash
ip=$(date +'%y')
cmd="cvlc --repeat /tmp/video.mp4 \":sout=#duplicate{dst=rtp{dst=225.0.0.$ip,port=5004,mux=ts,sap,name=Prob,ttl=16}}\""
eval "$cmd"
#su vlc -c "$cmd"
