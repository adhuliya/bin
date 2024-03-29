#!/usr/bin/env bash
#REF: https://docs.docker.com/engine/install/ubuntu/

# Add Docker's official GPG key:
sudo apt-get update;
sudo apt-get install -y ca-certificates curl gnupg;
sudo install -m 0755 -d /etc/apt/keyrings;
sudo rm /etc/apt/keyrings/docker.gpg 2> /dev/null; # remove old key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg;
sudo chmod a+r /etc/apt/keyrings/docker.gpg;

# Add the repository to Apt sources:
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null;
sudo apt-get update;

# Install docker packages
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin;

# Verify that the Docker Engine installation is successful by running the hello-world image
sudo docker run hello-world;

# add current user to docker group
sudo usermod -G docker $USER;
echo "NOTE: Logout and login for session to recognize the user in docker group.";
