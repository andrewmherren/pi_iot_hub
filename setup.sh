#!/bin/bash
apt-get update -y
sudo apt-get install -y git libffi-dev libssl-dev
sudo apt-get install -y python3-dev
sudo apt-get install -y python3 python3-pip
curl -fsSL https://get.docker.com -o get-docker.sh
chmod +x get-docker.sh
./get-docker.sh
usermod -aG docker $(whoami)
sudo pip3 install docker-compose
if [[ $(whoami) -eq "pi" ]]; then
  echo "You are still using the pi user account to login. This is insecure. Please type a new name to create a new user:"
  read newName
  adduser $newName
  adduser $newName sudo
  echo "Next choose a new password"
  echo "Copying files from pi user home directory to $newName's home directory."
  cp -r /home/pi/ /home/$newName
  echo "New user created. Please logout and log back in using that account. Then run the following commands to get rid of the pi user."
  echo "sudo deluser pi"
  echo "sudo rm -r /home/$newName"
fi
