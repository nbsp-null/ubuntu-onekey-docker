#!/bin/bash

# 更新软件包列表
sudo apt update

# 安装必要的一些软件包
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common

# 添加 Docker 官方的 GPG 密钥
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# 设置 Docker 稳定版仓库
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# 更新软件包列表以包含 Docker 仓库的内容
sudo apt update

# 安装 Docker CE
sudo apt install -y docker-ce

# 添加当前用户到 docker 组，避免每次运行 docker 都需要 sudo
sudo usermod -aG docker ${USER}

# 安装 Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/download/v2.6.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

# 为 Docker Compose 设置执行权限
sudo chmod +x /usr/local/bin/docker-compose

# 输出 Docker 和 Docker Compose 的版本以验证安装
echo "Docker and Docker Compose installed successfully!"
docker --version
docker-compose --version
