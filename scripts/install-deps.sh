#!/bin/bash
apt-get update
apt-get install -y \
    python-dev \
    python-pip \
    gcc \
    make \
    build-essential \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg2 \
    software-properties-common
if ! [ -x "$(command -v docker)" ]; then
  curl -fsSL https://get.docker.com -o get-docker.sh
  sh get-docker.sh
  usermod -aG docker vagrant
fi
if ! [ -x "$(command -v docker-compose)" ]; then
  curl -fsSL "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
  chmod +x /usr/local/bin/docker-compose
fi

echo vm.max_map_count=262144 > /etc/sysctl.d/vm_max_map_count.conf
sysctl --system

grep -qF 'vagrant - nofile 65536' /etc/security/limits.conf || echo 'vagrant - nofile 65536' >> /etc/security/limits.conf

