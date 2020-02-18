#!/bin/bash
########################################################################
echo "Configuring IPv6 VXLAN Tunnel"

########################################################################
## Local var and input
local_ip=$1
remote_ip=$2
underlay_mtu=9000

########################################################################
## check for NFP and create SRIOV VFs, no checks for IOMMU
NFP_PCI="0000:$(lspci -d 19ee: | head -1 | awk '{ print $1 }')" || exit -1
echo "Clearing VFs at $NFP_PCI"
echo 0 > /sys/bus/pci/devices/$NFP_PCI/sriov_numvfs
sleep 3
echo "Creating 1 VF at $NFP_PCI"
echo 1 > /sys/bus/pci/devices/$NFP_PCI/sriov_num_vfs

########################################################################
## Set interfaces up
ifaces=$(cat /proc/net/dev | sed -rn 's/^\s*(\S+):.*$/\1/p')

for ifname in $ifaces; do
	index=""; addr=""
	#### skip loopback
	if [ "$ifname" == "lo" ]; then 
		continue
	fi
	phys="/sys/class/net/$ifname/phys_port_name"
	##### if sys class has phy port name
        if [ -f $phys ]; then
    		phys_port=$(cat $phys 2> /dev/null)
		pci=$(ethtool -i $ifname 2>/dev/null | tr '\n' '@' | sed -rn 's/^.*@bus-info: ([^@]*)@.*$/\1/p' )
        else 
		phys_port=""
		pci=""
	fi
	##### if empty phy port name and PCI addr matches NFP (head 1 outputs PCI address excl VF)
	if [ "$(echo $pci | perl -p -e 's/^.*?://')" == "$(lspci -d 19ee: | head -1| awk '{ print $1 }')" ] && [ "$phys_port" == "" ]; then
		phy_repr=$ifname
		echo "Setting $phy_repr PHY REPR up"
		ip l set $phy_repr up
		ip l set $phy_repr mtu $underlay_mtu
	fi
	if [ "$phys_port" == "p0" ]; then
		phy0=$ifname
		echo "Setting $phy0 PHY P0 up"
		ip l set $phy0 up
		ip l set $phy0 mtu $underlay_mtu
	fi
	echo "$ifname $phys_port $pci"
done
