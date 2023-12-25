#!/bin/bash

sudo yum update -y
sudo yum upgrade -y
sudo yum install -y git

directory="/home/ec2-user/jenkins-ec2-first_flight"
# Check if the directory exists
if [ -d "$directory" ]; then
    # If directory, delete it
    rm -rf "$directory"
    echo "Directory $directory deleted successfully."

cd /home/ec2-user/
git clone https://github.com/Anas-Ahmad-Siddiqui/jenkins-ec2-first_flight

cd /home/ec2-user/jenkins-ec2-first_flight
bash /home/ec2-user/jenkins-ec2-first_flight/scripts/before_install.sh
bash /home/ec2-user/jenkins-ec2-first_flight/scripts/after_install.sh
bash /home/ec2-user/jenkins-ec2-first_flight/scripts/befapplication_start.sh