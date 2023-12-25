#!/bin/bash
echo 'run after_install.sh: ' >> /home/ec2-user/ci-cd_expressjs/deploy.log

echo 'cd /home/ec2-user/ci-cd_expressjs' >> /home/ec2-user/ci-cd_expressjs/deploy.log
cd /home/ec2-user/ci-cd_expressjs >> /home/ec2-user/ci-cd_expressjs/deploy.log

echo 'npm install' >> /home/ec2-user/ci-cd_expressjs/deploy.log 
npm install >> /home/ec2-user/ci-cd_expressjs/deploy.log