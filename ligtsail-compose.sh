#!/bin/bash

# install latest version of docker the lazy way
curl -sSL https://get.docker.com | sh

# make it so you don't need to sudo to run docker commands
usermod -aG docker ubuntu

# install docker-compose
curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

# copy the dockerfile into /srv/docker 
# if you change this, change the systemd service file to match
# WorkingDirectory=[whatever you have below]
mkdir /srv/step_docker
curl -o /srv/step_docker/docker-compose.yml https://raw.githubusercontent.com/pjbaudin/step_docker/master/docker-compose.yml
curl -o /srv/step_docker/docker-compose.yml https://raw.githubusercontent.com/pjbaudin/step_docker/blob/master/Dockerfile-flask
curl -o /srv/step_docker/docker-compose.yml https://raw.githubusercontent.com/pjbaudin/step_docker/blob/master/Dockerfile-nginx
curl -o /srv/step_docker/docker-compose.yml https://raw.githubusercontent.com/pjbaudin/step_docker/blob/master/app.conf
curl -o /srv/step_docker/docker-compose.yml https://raw.githubusercontent.com/pjbaudin/step_docker/blob/master/app.ini
curl -o /srv/step_docker/docker-compose.yml https://raw.githubusercontent.com/pjbaudin/step_docker/blob/master/app.py
curl -o /srv/step_docker/docker-compose.yml https://raw.githubusercontent.com/pjbaudin/step_docker/blob/master/requirements.txt

# start up the application via docker-compose
docker-compose -f /srv/step_docker/docker-compose.yml up -d