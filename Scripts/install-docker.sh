#!/bin/bash

apt-get install apt-transport-https ca-certificates curl gnupg2 software-properties-common sudo

curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg | sudo apt-key add -

add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") $(lsb_release -cs) stable"

apt-get update

apt-get install docker-ce

curl -L https://github.com/docker/compose/releases/download/1.19.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose

chmod +x /usr/local/bin/docker-compose

docker-compose --version


curl -fsSL https://get.docker.com/ -o get-docker.sh
sh get-docker.sh