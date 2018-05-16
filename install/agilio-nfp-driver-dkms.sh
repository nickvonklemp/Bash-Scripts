#!/bin/sh
wget http://172.26.1.131/nas/CoreNIC/agilio-nfp-driver-dkms_2018.01.11.2333.f40482a_all.deb
dpkg -i agilio-nfp-driver-dkms_2018.01.11.2333.f40482a_all.deb
apt-get -y install -f
echo "Cleaning"
rm -r agilio-nfp-driver-dkms_2018.01.11.2333.f40482a_all.deb

