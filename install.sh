#!/usr/bin/env bash

# vars
PROJECT_PATH='/nodejs/es6'
MONGO_VERSION="2.4.9"
NODE_VERSION='v0.11.9'

# Fix permissions for NPM
chgrp -R admin /usr/local
chmod -R g+w /usr/local

# mongo repo
apt-key adv --keyserver keyserver.ubuntu.com --recv 7F0CEB10
echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | sudo tee /etc/apt/sources.list.d/10gen.list

# update apt-get
sudo apt-get update
apt-get install -y curl software-properties-common git-core
apt-get install -y libpcre3-dev build-essential libssl-dev g++ imagemagick

# install node
cd ~
wget http://nodejs.org/dist/$NODE_VERSION/node-$NODE_VERSION.tar.gz
tar -zxvf node-$NODE_VERSION.tar.gz
rm node-$NODE_VERSION.tar.gz
mv node-$NODE_VERSION /opt/node
cd /opt/node
./configure
make && make install

# grant node access to port 80
apt-get install libcap2-bin
sudo setcap cap_net_bind_service=+ep /usr/local/bin/node

# install pm2
sudo npm install pm2 -g
sudo env PATH=$PATH:/usr/local/bin pm2 startup ubuntu -u vagrant

# install mongodb
apt-get install -y mongodb-10gen=$MONGO_VERSION

# project dependencies
cd $PROJECT_PATH && sudo npm install

# PS1 colors + git branch
curl https://gist.github.com/ricardobeat/6926021/raw/a4681e3391b3f0eb9995d46631831b9f6594067b/.profile >> ~/.profile
