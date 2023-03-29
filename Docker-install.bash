#!/bin/bash

###Step 1 — Installing Docker###

#First, update your existing list of packages:
sudo apt-get update

#Install a few prerequisite packages which let apt use packages over HTTPS:
sudo apt install apt-transport-https ca-certificates curl software-properties-common -y

#Then add the GPG key for the official Docker repository to your system
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

#Next, update the package database with the Docker packages from the newly added repo:
sudo apt update

#Make sure you are about to install from the Docker repo instead of the default Ubuntu repo:
apt-cache policy docker-ce

#Finally, install Docker:
sudo apt install docker-ce

#Check Docker Status
sudo systemctl status docker

###Step 2 — Executing the Docker Command Without Sudo###

#If you want to avoid typing sudo whenever you run the docker command, add your username to the docker group:
sudo usermod -aG docker ${USER}

#Check user
echo ${USER}

#To apply the new group membership, log out of the server and back in, or type the following:
su - ${USER}

#Confirm that your user is now added to the docker group by typing:
id -nG
