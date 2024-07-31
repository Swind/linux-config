#!/bin/bash

# Reference: https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html#installation
#
curl -fsSL https://nvidia.github.io/libnvidia-container/gpgkey | sudo gpg --dearmor -o /usr/share/keyrings/nvidia-container-toolkit-keyring.gpg &&
  curl -s -L https://nvidia.github.io/libnvidia-container/stable/deb/nvidia-container-toolkit.list |
  sed 's#deb https://#deb [signed-by=/usr/share/keyrings/nvidia-container-toolkit-keyring.gpg] https://#g' |
    sudo tee /etc/apt/sources.list.d/nvidia-container-toolkit.list

sudo apt-get update
sudo apt-get install -y nvidia-container-toolkit

# The nvidia-ctk command modifies the /etc/docker/daemon.json file on the host. 
# The file is updated so that Docker can use the NVIDIA Container Runtime.
sudo nvidia-ctk runtime configure --runtime=docker
sudo systemctl restart docker

# Run a sample CUDA container:
sudo docker run --rm --runtime=nvidia --gpus all ubuntu nvidia-smi
