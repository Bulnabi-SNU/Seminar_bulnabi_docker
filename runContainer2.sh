#!/bin/bash

xhost +

if [ ! -d "./ros_workspace" ]; then
	mkdir ros_workspace
fi

# Run docker and open bash shell
docker run -it --rm --privileged \
	--name=bulnabi \
	--env=LOCAL_USER_ID="$(id -u)" \
	-v ./ros_workspace/:/home/user/ros_workspace/:rw \
	-v /tmp/.X11-unix:/tmp/.X11-unix:ro \
	--device=/dev/dri \
	-e DISPLAY=$DISPLAY \
	--network host \
	bulnabi_seminar03:latest	

xhost -
