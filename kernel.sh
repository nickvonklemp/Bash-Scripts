#!/bin/sh
script_dir="$(pwd)"
echo "Downloading mainline kernel debian packages"
wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.15.18/linux-headers-4.15.18-041518_4.15.18-041518.201804190330_all.deb
wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.15.18/linux-headers-4.15.18-041518-generic_4.15.18-041518.201804190330_amd64.deb
wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.15.18/linux-image-4.15.18-041518-generic_4.15.18-041518.201804190330_amd64.deb
echo "Installing packages"
dpkg -i linux-image-4.15.18-041518-generic_4.15.18-041518.201804190330_amd64.deb
dpkg -i linux-headers-4.15.18-041518-generic_4.15.18-041518.201804190330_amd64.deb
dpkg -i linux-headers-4.15.18-041518_4.15.18-041518.201804190330_all.deb
echo "Ensuring dependencies"
apt-get -y install aptitude
aptitude -f install
echo "Cleaning"
rm -r $script_dir/linux-headers-4.15.18-041518_4.15.18-041518.201804190330_all.deb
rm -r $script_dir/linux-headers-4.15.18-041518-generic_4.15.18-041518.201804190330_amd64.deb
rm -r $script_dir/linux-image-4.15.18-041518-generic_4.15.18-041518.201804190330_amd64.deb
echo "Updating grub"
update-grub
echo "Grub updated, reboot to load new kernel"
