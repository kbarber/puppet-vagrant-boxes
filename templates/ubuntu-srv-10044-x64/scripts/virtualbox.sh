# Installing the virtualbox guest additions
apt-get -y install dkms

# Install the VirtualBox guest additions
mount -o loop ~/VBoxGuestAdditions.iso /mnt
yes|sh /mnt/VBoxLinuxAdditions.run
umount /mnt
rm -rf ~/VBoxGuestAdditions.iso
