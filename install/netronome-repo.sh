#!/bin/bash
# Adds netronome repo list to package manger
script_dir=$(pwd)
echo $script_dir
RHEL=$(cat /etc/os-release | grep 'ID="rhel"' | cut -d '"' -f2 | cut -d '"' -f1)
CENTOS=$(cat /etc/os-release | grep 'ID="centos"' | cut -d '"' -f2 | cut -d '"' -f1)
UBUNTU=$(cat /etc/os-release | grep "ID=ubuntu" | cut -d '=' -f2)
if [ "$UBUNTU" == "ubuntu" ]; then
	echo "Ubuntu system detected"
	# First download debian package key
	echo "Downloading netronome public key"
	wget https://deb.netronome.com/gpg/NetronomePublic.key
        # Ubuntu specific apt-get changes
	echo "Adding public key to apt package"
	apt-key add NetronomePublic.key
	# Add netronome's repository
	mkdir -p /etc/apt/sources.list.d
	echo "deb https://deb.netronome.com/apt stable main" > /etc/apt/sources.list.d/netronome.list
	echo "Done, updating packages"
	# Update repository lists
	apt-get update
	echo "Cleaning up"
	rm -r NetronomePublic.key
fi
if [[ ( "$RHEL" == "rhel" ) || ( "$CENTOS" == "centos" ) ]]; then
	echo "RHEL/Centos system detected"
	# First download rpm package key
	echo "Downloading netronome public key"
	wget https://rpm.netronome.com/gpg/NetronomePublic.key
	# RHEL/Centos specific yum changes
	echo "Adding public key to yum package"
	rpm --import NetronomePublic.key
	# Add netronome's repository
	cat << EOF >> /etc/yum.repos.d/netronome.repo
[netronome]
name=netronome
baseurl=https://rpm.netronome.com/repos/centos
EOF
	# Update repository lists
	echo "Done, updating packages"
	yum update
	echo "Cleaning up"
	rm -r -f NetronomePublic.key
fi


