#!/bin/bash
sudo yum update -y
sudo amazon-linux-extras install nginx1 -y
sudo systemctl enable nginx
sudo systemctl start nginx
  
# Print the hostname which includes instance details on nginx homepage  
#  sudo echo Hello from `hostname -f` > /usr/share/nginx/html/index.html
