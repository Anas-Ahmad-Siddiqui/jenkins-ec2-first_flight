#!/bin/bash

sudo yum update -y
sudo yum upgrade -y
sudo yum install -y git

cd /home/ec2-user/
git clone https://github.com/Anas-Ahmad-Siddiqui/jenkins-ec2-first_flight

cd /home/ec2-user/jenkins-ec2-first_flight
/bin/bash /home/ec2-user/jenkins-ec2-first_flight/scripts/before_install.sh
/bin/bash /home/ec2-user/jenkins-ec2-first_flight/scripts/after_install.sh
/bin/bash /home/ec2-user/jenkins-ec2-first_flight/scripts/befapplication_start.sh