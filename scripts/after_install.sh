#!/bin/bash
echo 'run after_install.sh: ' >> /home/ec2-user/jenkins-ec2-first_flight/deploy.log

echo 'cd /home/ec2-user/jenkins-ec2-first_flight' >> /home/ec2-user/jenkins-ec2-first_flight/deploy.log
cd /home/ec2-user/jenkins-ec2-first_flight >> /home/ec2-user/jenkins-ec2-first_flight/deploy.log

echo 'npm install' >> /home/ec2-user/jenkins-ec2-first_flight/deploy.log 
npm install >> /home/ec2-user/jenkins-ec2-first_flight/deploy.log