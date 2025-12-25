#!/bin/sh

# Begin by setting the defaults
sudo ufw default deny incoming
sudo ufw default allow outgoing

# Allow HTTP and HTTPS traffic.
sudo ufw allow http
sudo ufw allow https

#Allow SSH
sudo ufw allow ssh

# Allow NTP for the system time
sudo ufw allow ntp

# Allow DHCP. It’s ports 67 and 68.
sudo ufw allow 67:68/tcp

# Allow DNS traffic to go through
sudo ufw allow 53

# Allow torrent clients like Deluge
sudo ufw allow 56881:56889/tcp

# Allow localsend through port 53317
sudo ufw allow 53317

# Allow steam
#sudo ufw allow 27000:27036/udp
#sudo ufw allow 27036:27037/tcp
#sudo ufw allow 4380/udp
