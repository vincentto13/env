#!/usr/bin/bash

sudo apt-get update
sudo apt-get upgrade
sudo apt-get install -y vim tmux htop git curl wget docker-compose zsh
sudo apt-get autoremove

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Cloning repository with setup
rm -rf /tmp/env_setup
git clone https://github.com/vincentto13/env.git /tmp/env_setup

# Adding known authorized public keys
cat /tmp/env_setup/keys/*.pub > ~/.ssh/authorized_keys
chmod 600 ~/.ssh/authorized_keys

# Generating local key
ssh-keygen -t rsa -b 4096 -C "`whoami`@`hostname`" -N "" -f ~/.ssh/id_rsa
