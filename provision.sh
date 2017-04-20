#!/usr/bin/env bash

#############################################
## This is the provisioner for vagrant box ##
#############################################

## Environment
#############################################

## Node
curl -sL https://deb.nodesource.com/setup_7.x | sudo -E bash -
sudo apt-get install -y nodejs
sudo npm install -g pm2

## Node - Install Base Express Apps
sudo npm install -g express-generator
cd /home/ubuntu && express --view=pug web00 && cd web00 && npm install
cd /home/ubuntu && express --view=pug web01 && cd web01 && npm install
cd /home/ubuntu && express --view=pug web02 && cd web02 && npm install   

## Node - Port Changes

## HaProxy
sudo add-apt-repository -y ppa:vbernat/haproxy-1.7
sudo apt-get update
sudo apt-get install -y haproxy
sudo service haproxy restart