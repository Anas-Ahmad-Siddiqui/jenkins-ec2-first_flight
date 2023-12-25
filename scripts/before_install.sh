#!/bin/bash

sudo yum update -y
sudo yum upgrade -y
sudo yum install -y git

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
. ~/.nvm/nvm.sh
nvm install --lts

npm install pm2@latest -g

sudo ln -sn "$(which node)" /sbin/node
sudo ln -sn "$(which npm)" /sbin/npm
sudo ln -sn "$(which pm2)" /sbin/pm2
