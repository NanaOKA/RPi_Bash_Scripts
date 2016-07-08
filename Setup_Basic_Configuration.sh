#!/bin/sh
# This script set some basic bash aliases and vim comfiguration to feel at home
# when using the sailrobot
# It only includes widely used configurations

cat <<EOT >> ~/.bashrc
# Some useful aliases
alias ls='ls --color=auto'
alias ll='ls -lh'
alias la='ls -Ah'
alias l='ls -CF'
alias sl='ls'
alias lt='ls -tr'
alias llt='ls -ltrh'
alias vi='vim'
alias mv='mv -i'
alias cp='cp -i'
EOT

cat <<EOT >> ~/.vimrc
syntax enable   " enable syntax processing
set background=dark
set smartcase   " case insensitive smart
set number      " show line numbers
set showcmd     " show command in bottom bar
set cursorline  " highlight current line
set expandtab   " tabs are spaces
set lazyredraw  " redraw only when we need to.
EOT

cd ~

# Install Geos headers (for shapely)
sudo apt-get --assume-yes install libgeos-dev

# Install Latlon, shapely (navigation) and pynmea2 (reading GPS)
yes | sudo pip install Latlon shapely pynmea2

# Needed for serial
yes | sudo pip install spidev

# Wiringpi2 needed for hardware pwm
yes | sudo pip install wiringpi2

# Install vim
sudo apt-get --assume-yes install vim

# Install bc
sudo apt-get --assume-yes install bc

# Needed for dashboard
yes | sudo pip install tornado

# Set time zone to england (it is the same for portugal)
sudo timedatectl set-timezone Europe/London


cd ~
