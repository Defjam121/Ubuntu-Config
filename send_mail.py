#!/usr/bin/env python
#     FILE:                                send_mail.py
#     AUTHOR:                        Helpi_Stone
#     EMAIL:                             helpi9007@gmail.com
#     CREATED:                      2017-10-12
#
#     MODIFIED BY:                Defjam
#     MODIFIED DATE:           2017-10-12
#
#     DESCRIPTION:               "Beschreibung"
#
#     VERSION:                        1.0
#======================================== ==================================
import subprocess
import smtplib
import socket
from email.mime.text import MIMEText
import datetime

# Change the following 3 lines to your own account information
to = '@gmail.com'
gmail_user = '@gmail.com'
gmail_password = 'pw'

#TODO(GC) Make examples for other smtp servers
smtpserver = smtplib.SMTP('smtp.gmail.com', 587)
smtpserver.ehlo()
smtpserver.starttls()
smtpserver.ehlo
smtpserver.login(gmail_user, gmail_password)

today = datetime.date.today()

# Very Linux Specific ip sniffing TODO(GC) Add OS X and Windows sometime
#arg='ip route list'
#p=subprocess.Popen(arg,shell=True,stdout=subprocess.PIPE)
#data = p.communicate()
#split_data = data[0].split()
#ipaddr = split_data[split_data.index('src')+1]
my_ip = 'Your ip is %s'

msg = MIMEText(my_ip)
msg['Subject'] = 'IP For RaspberryPi on %s' % today.strftime('%b %d %Y')
msg['From'] = gmail_user
msg['To'] = to

smtpserver.sendmail(gmail_user, [to], msg.as_string())
smtpserver.quit()
