# Set up Vagrant.

date > /etc/vagrant_box_build_time

# Setup sudo to allow no-password sudo for "sudo"
usermod -a -G sudo vagrant

# Installing vagrant keys
mkdir -pm 700 /home/vagrant/.ssh
cd /home/vagrant/.ssh
wget --no-check-certificate 'https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub' -O authorized_keys
chmod 600 /home/vagrant/.ssh/authorized_keys
chown -R vagrant /home/vagrant/.ssh

# Customize the message of the day
echo 'Welcome to your Vagrant-built virtual machine.' > /var/run/motd

# Install NFS client
apt-get -y install nfs-common
