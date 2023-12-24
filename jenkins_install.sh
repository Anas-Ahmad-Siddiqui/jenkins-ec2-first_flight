#!/bin/bash

sudo yum update -y
sudo yum upgrade -y

# Install git
sudo yum install git

# Add the Jenkins repo using the following command
sudo wget -O /etc/yum.repos.d/jenkins.repo \ 
    https://pkg.jenkins.io/redhat-stable/jenkins.repo

# Import a key file from Jenkins-CI to enable installation from the package
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
sudo yum upgrade -y

# Install Java (Amazon Linux 2023)
sudo dnf install java-17-amazon-corretto -y

# install jenkins 
sudo yum install jenkins -y

# Enable the Jenkins service to start at boot
sudo systemctl enable jenkins

# Start jenkins as a service
sudo systemctl start jenkins