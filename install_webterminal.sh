#!/bin/bash
#======================================== ==================================
#     FILE:                                install_webterminal.sh
#     AUTHOR:                  Helpi_Stone
#     EMAIL:                   helpi9007@gmail.com
#     CREATED:                 2017-10-08
#
#     MODIFIED BY:                Defjam
#     MODIFIED DATE:           2017-10-08
#
#     DESCRIPTION:             "Install Webterminal"
#
#     VERSION:                 1.0
#======================================== ==================================
echo "Installing packages."
sudo apt-get install -y openssl shellinabox

echo "Changing config."
sudo sed -i 's/--no-beep/--no-beep --disable-ssl/g' /etc/default/shellinabox

echo "Reloading and starting the service."
sudo service shellinabox reload
sudo service shellinabox restart

ip_address=$(ifconfig | grep "inet.*broadcast" | grep -v 0.0.0.0 | awk '{print $2}')

echo
echo "Installation done."
echo
echo "You can now access the web terminal here: http://$ip_address:4200"
echo "You can also add this to your Home-Assistant config in an 'panel_iframe'"
echo
echo "If you have issues with this script, please say something in the #Hassbian channel on Discord."
echo
