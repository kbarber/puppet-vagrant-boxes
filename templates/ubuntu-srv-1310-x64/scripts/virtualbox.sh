# Installing the virtualbox guest additions
apt-get -y install dkms

# Without libdbus virtualbox would not start automatically after compile
apt-get -y install --no-install-recommends libdbus-1-3

# Remove existing VirtualBox guest additions
/etc/init.d/virtualbox-ose-guest-utils stop
rmmod vboxguest
aptitude -y purge virtualbox-ose-guest-x11 virtualbox-ose-guest-dkms virtualbox-ose-guest-utils

# Install the VirtualBox guest additions
mount -o loop ~/VBoxGuestAdditions.iso /mnt
yes|sh /mnt/VBoxLinuxAdditions.run
umount /mnt
rm -rf ~/VBoxGuestAdditions.iso
