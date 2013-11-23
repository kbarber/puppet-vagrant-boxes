# Installing the virtualbox guest additions
cd /tmp
mount -o loop /home/${p_username}/VBoxGuestAdditions.iso /mnt
sh /mnt/VBoxLinuxAdditions.run
umount /mnt
rm -rf /home/${p_username}/VBoxGuestAdditions.iso
