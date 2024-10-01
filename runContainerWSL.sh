#!/bin/bash

if [ ! -d "./docker_home" ]; then
	mkdir docker_home
fi

# Run docker and open bash shell (WSL display)
docker run -it --rm --privileged \
	--name=bulnabi \
	--env=LOCAL_USER_ID="$(id -u)" \
	-v ./docker_home/:/home/user/:rw \
	-v /run/desktop/mnt/host/wslg/.X11-unix:/tmp/.X11-unix \
	-v /run/desktop/mnt/host/wslg:/mnt/wslg \
	-e DISPLAY=:0 \
	-e WAYLAND_DISPLAY=wayland-0 \
	-e XDG_RUNTIME_DIR=/mnt/wslg/runtime-dir \
	-e PULSE_SERVER=/mnt/wslg/PulseServer \
	--network host \
	jaewonchung7snu/bulnabi_container:latest
