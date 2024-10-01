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
WSL는 아직 테스트를 안해봤지만, runContainer  대신 runContainerWSL을 실행하면 작동할 것으로 추정된다...
또한 docker는 windows용 docker desktop을 설치해야 할 것이다.

## TODO
NVIDIA 등 GPU bypass testing/implementation

## Troubleshooting

혹시나 gazebo 실행시 graphics driver error가 뜬다면,
```bash
export LIBGL_ALWAYS_SOFTWARE=1
```
를 실행한 후 다시 gazebo 실행 (make px4_sitl .... 등)을 하면 (아마도) 해결될 것이다.
