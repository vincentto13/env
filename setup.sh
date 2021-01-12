#!/usr/bin/bash

sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install -y vim tmux htop git curl wget docker-compose zsh aptitude python3-dev python3 python-pip cmake g++ clang-format
sudo apt-get autoremove -y

sudo pip3 install yap

# Install ZSH and custom plugins
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
chsh --shell /usr/bin/zsh

# Cloning repository with setup
rm -rf /tmp/env_setup
git clone https://github.com/vincentto13/env.git /tmp/env_setup

# Adding known authorized public keys
cat /tmp/env_setup/keys/*.pub > ~/.ssh/authorized_keys
chmod 600 ~/.ssh/authorized_keys

# Generating local key
ssh-keygen -t rsa -b 4096 -C "`whoami`@`hostname`" -N "" -f ~/.ssh/id_rsa

# Install scripts
mkdir -p ~/bin
rsync -av /tmp/env_setup/bin/* ~/bin/

# Install settings
rsync -av /tmp/env_setup/etc/ ~

# Setup VIM
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

cwd=$(pwd)
cd ~/.vim/bundle/YouCompleteMe
python3 install.py --clangd-completer
cd $cwd

