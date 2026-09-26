#!/bin/bash
# Task 05 - Linux Server Hardening Script

# 1. Create deploy user and set permissions
sudo adduser deploy
sudo usermod -aG sudo deploy

# 2. Configure SSH - Disable password auth
# Copy SSH key first: ssh-copy-id deploy@server_ip
sudo sed -i 's/#PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config
sudo sed -i 's/PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config
sudo sed -i 's/#PermitRootLogin yes/PermitRootLogin no/' /etc/ssh/sshd_config
sudo systemctl restart sshd

# 3. UFW Firewall - Allow only 22, 80, 443
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow 22/tcp
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp
sudo ufw --force enable
sudo ufw status verbose
