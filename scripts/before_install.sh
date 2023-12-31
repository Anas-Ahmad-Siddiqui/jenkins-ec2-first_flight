#!/bin/bash

# Function to check if a package is installed
is_package_installed() {
  command -v "$1" >/dev/null 2>&1
}

# Function to check if a symbolic link already exists
is_symlink_exists() {
  [ -L "$1" ] && [ -e "$1" ]
}

# Update package manager
sudo yum update -y
sudo yum upgrade -y

# Install git if not already installed
if ! is_package_installed git; then
  echo "Installing git..."
  sudo yum install -y git
else
  echo "Git is already installed."
fi

# Install nvm if not already installed
if ! is_package_installed nvm; then
  echo "Installing nvm..."
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
  . ~/.nvm/nvm.sh
else
  echo "nvm is already installed."
fi

# Install Node.js LTS if not already installed
if ! is_package_installed node; then
  echo "Installing Node.js LTS..."
  nvm install --lts
else
  echo "Node.js LTS is already installed."
fi

# Install pm2 if not already installed
if ! is_package_installed pm2; then
  echo "Installing pm2..."
  npm install pm2@latest -g
else
  echo "pm2 is already installed."
fi

# Create symbolic links only if they do not exist
if ! is_symlink_exists "/sbin/node"; then
  sudo ln -sf "$(command -v node)" /sbin/node
  echo "Symbolic link /sbin/node created."
else
  echo "Symbolic link /sbin/node already exists."
fi

if ! is_symlink_exists "/sbin/npm"; then
  sudo ln -sf "$(command -v npm)" /sbin/npm
  echo "Symbolic link /sbin/npm created."
else
  echo "Symbolic link /sbin/npm already exists."
fi

if ! is_symlink_exists "/sbin/pm2"; then
  sudo ln -sf "$(command -v pm2)" /sbin/pm2
  echo "Symbolic link /sbin/pm2 created."
else
  echo "Symbolic link /sbin/pm2 already exists."
fi
