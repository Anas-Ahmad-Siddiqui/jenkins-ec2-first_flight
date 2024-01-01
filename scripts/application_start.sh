#!/bin/bash

echo 'run application_start.sh: ' >> /home/ec2-user/jenkins-ec2-first_flight/deploy.log

cd /home/ec2-user/jenkins-ec2-first_flight >> /home/ec2-user/jenkins-ec2-first_flight/deploy.log

sudo pm2 delete jenkins-app >> /home/ec2-user/jenkins-ec2-first_flight/deploy.log

sudo pm2 start server.js --name=jenkins-app >> /home/ec2-user/jenkins-ec2-first_flight/deploy.log

suod pm2 save >> /home/ec2-user/jenkins-ec2-first_flight/deploy.log
sudo pm2 startup systemd >> /home/ec2-user/jenkins-ec2-first_flight/deploy.log

echo 'pm2 restart jenkins-app' >> /home/ec2-user/jenkins-ec2-first_flight/deploy.log
sudo pm2 restart jenkins-app >> /home/ec2-user/jenkins-ec2-first_flight/deploy.log