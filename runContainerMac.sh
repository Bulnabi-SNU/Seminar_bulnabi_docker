#!/bin/bash

xhost +

if [ ! -d "./docker_home" ]; then
	mkdir docker_home
fi
export IP=$(ifconfig en0 | grep inet | awk '$1=="inet" {print $2}')
# Run docker and open bash shell
docker run -it --rm --privileged \
	--name=bulnabi \
  -e XAUTHORITY=/.Xauthority \
	--env=LOCAL_USER_ID="$(id -u)" \
	-v ./docker_home/:/home/user/:rw \
	-v /tmp/.X11-unix:/tmp/.X11-unix  -v ~/.Xauthority:/.Xauthority \
	-e DISPLAY=$IP:0 \
	--network host \
	jaewonchung7snu/bulnabi_container:latest	

xhost -
