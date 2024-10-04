#!/bin/bash

xhost +

if [ ! -d "./docker_home" ]; then
	mkdir docker_home
fi

# Run docker and open bash shell
docker run -it --rm --privileged \
	--name=bulnabi \
	--env=LOCAL_USER_ID="$(id -u)" \
	-v ./docker_home/:/home/user/:rw \
	-v /tmp/.X11-unix:/tmp/.X11-unix:ro \
	--device=/dev/dri \
	-e DISPLAY=$DISPLAY \
	-p 18570:18570/udp \
	jaewonchung7snu/bulnabi_container:latest	

xhost -
