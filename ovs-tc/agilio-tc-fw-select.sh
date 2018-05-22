#Selects OVS-TC firmware for input argument of device name
#!/bin/bash
DEVICE=${1}
DEFAULT_ASSY=scan
ASSY=${2:-${DEFAULT_ASSY}}
APP=${3:-flower}

if [[ "$(ip link | grep $DEVICE)" == "" ]]; then
    echo "No such $DEVICE device recognized"
    exit 1
fi

if [ "x${DEVICE}" = "x" -o ! -e /sys/class/net/${DEVICE} ]; then
    echo Syntax: ${0} device [ASSY] [APP]
    echo
    echo This script associates the TC Offload firmware
    echo with a Netronome SmartNIC.
    echo
    echo device: is the network device associated with the SmartNIC
    echo ASSY: defaults to ${DEFAULT_ASSY}
    echo APP: defaults to flower. flower-next is supported if updated
    echo      firmware has been installed.
    exit 1
fi
# It is recommended that the assembly be determined by inspection
# The following code determines the value via the debug interface
if [ "${ASSY}x" = "scanx" ]; then
    ethtool -W ${DEVICE} 0
    DEBUG=$(ethtool -w ${DEVICE} data /dev/stdout | strings)
    SERIAL=$(echo "${DEBUG}" | grep "^SN:")
    ASSY=$(echo ${SERIAL} | grep -oE AMDA[0-9]{4})
       echo "Detected assembly: $ASSY"
fi

PCIADDR=$(basename $(readlink -e /sys/class/net/${DEVICE}/device))
FWDIR="/lib/firmware/netronome"
echo $PCIADDR
echo $FWDIR

# AMDA0081 and AMDA0097 uses the same firmware
if [ "${ASSY}" = "AMDA0081" ]; then
    if [ ! -e ${FWDIR}/${APP}/nic_AMDA0081.nffw ]; then
        ln -sf nic_AMDA0097.nffw ${FWDIR}/${APP}/nic_AMDA0081.nffw
    fi
fi

FW="${FWDIR}/pci-${PCIADDR}.nffw"
ln -sf "${APP}/nic_${ASSY}.nffw" "${FW}"

if [ "$(cat /etc/os-release | grep "ID=ubuntu" | cut -d '=' -f2)" == "ubuntu" ]; then
     echo "Ubuntu"
     # Ubuntu 18.04 distro-specific initramfs section
     HOOK=/etc/initramfs-tools/hooks/agilio_firmware
     cat >${HOOK} << EOF
#!/bin/sh
PREREQ=""
prereqs()
{
     echo "\$PREREQ"
}
case "\$1" in
prereqs)
     prereqs
     exit 0
     ;;
esac
. /usr/share/initramfs-tools/hook-functions
cp "${FW}" "\${DESTDIR}${FW}"
if have_module nfp ; then
     manual_add_modules nfp
fi
exit 0
EOF
     chmod a+x "${HOOK}"
     update-initramfs -u
fi
if [ "$(cat /etc/os-release | grep 'ID="centos"' | cut -d '"' -f2 | cut -d '"' -f1)" == "centos" ]; then
    echo "Red Had Enterprise Linux"
    # RHEL 7.5 distro-specific initramfs section
    DRACUT_CONF=/etc/dracut.conf.d/98-nfp-firmware.conf
    echo "install_items+=\" ${FW} \"" > "${DRACUT_CONF}"
    dracut --force
fi
# insert distro-specific initramfs section here...
