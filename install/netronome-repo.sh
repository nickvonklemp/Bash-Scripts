#Adds netronome's public repo to the APT sources list
#!/bin/sh
script_dir=$(pwd)
if [ "$(cat /etc/os-release | grep "ID=ubuntu" | cut -d '=' -f2)" == "ubuntu" ]; then
	# First download debian package key
	echo "Downloading netronome public key"
	wget https://deb.netronome.com/gpg/NetronomePublic.key
    # Ubuntu specific apt-get changes
	echo "Adding public key to apt package"
	apt-key add NetronomePublic.key
	# Add netronome's repository
	mkdir -p /etc/apt/sources.list.d/
	echo "deb https://deb.netronome.com/apt stable main" > /etc/apt/sources.list.d/netronome.list
	echo "Done, updating packages"
	# Update repository lists
	apt-get update
fi
if [ "$(cat /etc/os-release | grep 'ID="centos"' | cut -d '"' -f2 | cut -d '"' -f1)" == "rhel" ] | [ "$(cat /etc/os-release | grep 'ID="rhel"' | cut -d '"' -f2 | cut -d '"' -f1)" == "centos" ]; then
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
fi
echo "cleaning"
rm -r $script_dir/NetronomePublic.key
echo "Complete"
