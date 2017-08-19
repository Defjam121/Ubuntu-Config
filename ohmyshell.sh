#!/bin/bash
#======================================== ==================================
#
#     FILE:                         ohmyshell.sh
#     AUTHOR:                 macbook
#     EMAIL:                      helpi9007@gmail.com
#     CREATED:               2017-08-19
#
#
#     MODIFIED BY:         macbook
#     MODIFIED DATE:    2017-08-19
#
#     DESCRIPTION:        "Beschreibung"
#
#     VERSION:                1.0
#
#======================================== ==================================
#

clear;
sudo apt-get install -y git;
sudo apt-get update && sudo apt-get install -y zsh;
wget –no-check-certificate https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O – | sh;
chsh -s /bin/zsh;
wget --no-check-certificate http://install.ohmyz.sh -O - | sh;
clear;
echo "Restart the system"
