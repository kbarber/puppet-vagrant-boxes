#!/bin/sh

# Install the vmware guest tools (from the ISO)
mkdir -p /tmp/vmware/mnt
mount -F hsfs -o ro `lofiadm -a $HOME/solaris.iso` /tmp/vmware/mnt

cd /tmp/vmware

/opt/csw/bin/gtar zxf mnt/vmware-solaris-tools.tar.gz
./vmware-tools-distrib/vmware-install.pl -d

cd

umount /tmp/vmware/mnt
lofiadm -d /dev/lofi/1
rm -f "$HOME/solaris.iso"
rm -rf /tmp/vmware
