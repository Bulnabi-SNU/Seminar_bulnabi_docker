# 불나비 px4를 위한 ubuntu 20.04 docker image

Docker image에서 ROS2 foxy, xRCE(10-1 기준 최신), px4 dependencies 등은 모두 다 설치돼있으므로,
오로지 px4 파일을 다운받고 make만 하면 된다.

QGC는 container 대신 host system에서 설치하는 것을 권장한다.

## Setup

docker를 repo에 있는 installDocker.sh를 실행하여 설치한 후(참고: https://docs.docker.com/engine/install/ubuntu/), docker image만 pull하면 된다.
```bash
docker pull jaewonchung7snu/bulnabi_container:latest
```


## Usage

runContainer.sh는 주어진 docker image를 bulnabi라는 이름 display, networking 등의 config 설정과 함께 실행시킨다.

처음 실행시 실행 위치에 docker_home이란 폴더가 생성되며, 이 폴더는 docker container 안의 /home/user에 mount된다. 즉, container 안에서 /home/user 의 수정사항은 host system에 저장이 된다.

!!! 나머지 파일변화 (apt install) 등은 그 container에만 국한되며, 유지되지 않는다!!!

script를 같은 위치에서 실행을 해야 docker_home이 유지되고, 다른 위치면 또다른 docker_home 폴더가 생성된다.

execContainer.sh 는 *벌써 실행중인* container에 새로운 터미널을 실행시킨다.


## WSL
docker는 windows용 docker desktop을 설치하면 된다.  또한, Docker -> Settings -> Resources -> WSL Integration 에서 설치된 WSL2에서 integration을 enable해야 한다. (안하면 에러가 뜬다.)

QGC를 WSL 안에서 실행하고 싶다면, 그냥 runContainer.sh를 실행하면 된다.

QGC를 윈도우에서 실행하고 싶다면 두가지 옵션이 있다.

1) runContainerWSL2_Networking.sh

그리고, QGC -> Application Settings -> Comm Links -> Add 이후
UDP에서 localhost:18570 (혹은 127.0.0.1:18570)을 추가하고, 그 Comm link에 Connect 하면 된다.

아래 사진을 참고하도록.
![image](https://github.com/user-attachments/assets/c555c53a-8481-43ff-9ca7-c1a253321ffa)

2) runContainer.sh
Docker Desktop에 들어가서, Settings -> Resources -> Network에서 "Enable Host Networking"을 키면 된다. (Docker account sign-in이 필요하다.)
이후 runContainer.sh를 실행하면 별 문제없이 돌아갈 것이다.


## TODO
NVIDIA 등 GPU bypass testing/implementation

## Troubleshooting

혹시나 gazebo나 QGC 실행시 graphics driver error가 뜬다면,
```bash
export LIBGL_ALWAYS_SOFTWARE=1
```
를 실행한 후 다시 gazebo 실행 (make px4_sitl .... 등)을 하면 (아마도) 해결될 것이다.
