# Installing the virtualbox guest additions
cd /tmp
mount -o loop ~/VBoxGuestAdditions.iso /mnt
sh /mnt/VBoxLinuxAdditions.run
umount /mnt
rm -rf ~/VBoxGuestAdditions.iso
