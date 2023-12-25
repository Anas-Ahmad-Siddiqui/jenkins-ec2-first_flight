#!/bin/bash

echo 'run application_start.sh: ' >> /home/ec2-user/jenkins-ec2-first_flight/deploy.log

cd /home/ec2-user/jenkins-ec2-first_flight >> /home/ec2-user/jenkins-ec2-first_flight/deploy.log
pm2 delete all
pm2 start server.js --name=jenkins-app
pm2 save
sudo pm2 startup systemd

# nodejs-app is the same name as stored in pm2 process
echo 'pm2 restart expressjs-app' >> /home/ec2-user/jenkins-ec2-first_flight/deploy.log
pm2 restart expressjs-app >> /home/ec2-user/jenkins-ec2-first_flight/deploy.log