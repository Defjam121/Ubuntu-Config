#!/bin/bash
# ======================================= ==================================
#
#       Datei:   		install_samba.sh
#
#       Beschreibung:   Installiert Samba
#       Autor:      	Helpi9007
#       Version:    	1.0
#       Erstellt:   	03.04.2017
#       Revision:   	-
# ======================================= ==================================
### Update
sudo apt-get update
### Samba installieren
sudo apt-get install -y samba-common samba
### Samba User erstellen
sudo smbpasswd -a helpi -n
### smb.conf ersetzten
echo "
[global]

## Browsing/Identification ###

# Change this to the workgroup/NT-domain name your Samba server will part of
   workgroup = HELPIGRP

# server string is the equivalent of the NT Description field
        server string = %h server (Samba, Ubuntu)

# Windows Internet Name Serving Support Section:
# WINS Support - Tells the NMBD component of Samba to enable its WINS Server
   wins support = yes


[home]
  comment=home
  path=/home/helpi
  browseable=Yes
  writeable=Yes
  only guest=no
  public=no
  create mask=0777
  directory mask=0777

[scripts]
  comment=scripts
  path=/scripts
  browseable=Yes
  writeable=Yes
  only guest=no
  public=no
  create mask=0777
  directory mask=0777


[opt]
  comment=opt
  path=/opt
  browseable=Yes
  writeable=Yes
  only guest=no
  public=no
  create mask=0777
  directory mask=0777" > /etc/samba/smb.conf
sleep 4
### Ordner scripts erstellen
sudo mkdir /scripts
### Samba neu starten
sudo service smbd restart
