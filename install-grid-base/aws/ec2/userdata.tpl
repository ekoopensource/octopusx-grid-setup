#! /bin/bash

apt-get update && apt-get install -y apache2
apt-update

curl -fsSL https://get.docker.com -o get-docker.sh

sudo sh get-docker.sh

sudo usermod -aG docker jenkins

systemctl start docker
systemctl enable docker

wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -

sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > \
/etc/apt/sources.list.d/jenkins.list'


sudo apt update && sudo apt install -y openjdk-8-jdk && sudo apt install -y jenkins
