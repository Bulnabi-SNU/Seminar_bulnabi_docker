FROM px4io/px4-dev-ros2-foxy:latest

MAINTAINER Jaewon Chung

WORKDIR /home/user

## Update cmake
RUN <<EOF
test -f /usr/share/doc/kitware-archive-keyring/copyright || wget -O - https://apt.kitware.com/keys/kitware-archive-latest.asc 2>/dev/null | gpg --dearmor - | sudo tee /usr/share/keyrings/kitware-archive-keyring.gpg >/dev/null
echo 'deb [signed-by=/usr/share/keyrings/kitware-archive-keyring.gpg] https://apt.kitware.com/ubuntu/ focal main' | sudo tee /etc/apt/sources.list.d/kitware.list >/dev/null
sudo apt -y update
test -f /usr/share/doc/kitware-archive-keyring/copyright || sudo rm /usr/share/keyrings/kitware-archive-keyring.gpg
sudo apt -y install kitware-archive-keyring
sudo apt -y install cmake
EOF


# Install uXRCE-DDS
RUN <<EOF
git clone https://github.com/eProsima/Micro-XRCE-DDS-Agent.git
cd Micro-XRCE-DDS-Agent
mkdir build
cd build
cmake ..
make -j20
sudo make install
sudo ldconfig /usr/local/lib/
cd /home/user
rm -rf Micro-XRCE-DDS-Agent
EOF

# Allow sudo without password
# 'user'가 이미 존재하는지 확인하고, 없으면 생성한 뒤 sudo 그룹에 추가
RUN id -u user &>/dev/null || useradd -m -s /bin/bash user && \
    usermod -aG sudo user

RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# Add ros setup to bashrc (the home folder is completly mounted to host, so no .bashrc)
RUN echo "source /opt/ros/foxy/setup.bash" >> /etc/bash.bashrc

RUN git clone https://github.com/PX4/PX4-Autopilot.git --recursive
RUN chown -R user:user /home/user

CMD ["/bin/bash"]
