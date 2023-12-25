#!/bin/bash

echo 'run application_start.sh: ' >> /home/ec2-user/ci-cd_expressjs/deploy.log

cd /home/ec2-user/ci-cd_expressjs >> /home/ec2-user/ci-cd_expressjs/deploy.log
pm2 start server.js --name=expressjs-app
pm2 save
pm2 startup

# nodejs-app is the same name as stored in pm2 process
echo 'pm2 restart expressjs-app' >> /home/ec2-user/ci-cd_expressjs/deploy.log
pm2 restart expressjs-app >> /home/ec2-user/ci-cd_expressjs/deploy.log