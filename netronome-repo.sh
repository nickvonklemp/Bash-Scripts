#!/bin/sh
script_dir=$(pwd)
echo "Downloading netronome public key"
wget https://deb.netronome.com/gpg/NetronomePublic.key
echo "Adding public key to apt package"
apt-key add NetronomePublic.key
echo "Updated source list"
mkdir -p /etc/apt/sources.list.d/
echo "deb https://deb.netronome.com/apt stable main" > /etc/apt/sources.list.d/netronome.list
echo "cleaning"
rm -r $script_dir/NetronomePublic.key
echo "Done, updating packages"
apt-get update
echo "Complete"
