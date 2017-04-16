#!/bin/bash
# ======================================= ==================================
#
#       Datei:   		webmin_install.sh
#
#       Beschreibung:   Install Webmin
#       Autor:      	Marc Helpenstein(helpi9007@gmail.com)
#       Version:    	1.0
#       Erstellt:   	
#       Revision:   	-
# ======================================= ==================================


sudo sh -c 'echo "deb http://download.webmin.com/download/repository sarge contrib" > /etc/apt/sources.list.d/webmin.list'

wget -qO - http://www.webmin.com/jcameron-key.asc | sudo apt-key add -

sudo apt-get update

sudo apt-get install -y webmin

echo "Webmin instaliert"