#!/bin/bash
cd /lib/firmware/netronome
for i in $(ls nic);
do
ln -sf nic/$i $i;
done
rmmod nfp && modprobe nfp
update-initramfs -u
cd

