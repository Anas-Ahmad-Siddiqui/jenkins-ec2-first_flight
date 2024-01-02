
# 🚀 Welcome to Our First CI/CD Project with Jenkins 🚀

This Git repository powers our exciting journey into Continuous Integration and Continuous Deployment (CI/CD) using Jenkins. 🛠️


## installing jenkins on Amazon Linux 2023 Dec
```
#!/bin/bash

sudo yum update -y
sudo yum upgrade -y

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
```

## Retrieve Jenkins Admin Password

```
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
```


## Installing Nginx on Amazon Linux

```
sudo dnf update -y
sudo dnf install nginx -y
sudo systemctl start nginx
sudo systemctl enable nginx
```

### Make changes in the following file for changing nginx configuration

```
sudo vi /etc/nginx/nginx.conf
```

### Sample code which is added for port forwarding requests 

```
location /jenkins/ {
    proxy_set_header   X-Forwarded-For $remote_addr;
    proxy_set_header   Host $http_host;
    proxy_pass         "http://127.0.0.1:3000/";
}
```

#### NOTE: https://awswithatiq.com/how-to-install-nginx-in-amazon-linux-2023/
