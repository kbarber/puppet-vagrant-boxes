# Base install

# remove zypper package locks
rm -f /etc/zypp/locks

# install required packages
packages=( gcc-c++ less make bison libtool ruby-devel vim )
zypper --non-interactive install --no-recommends --force-resolution ${packages[@]}

# Make ssh faster by not waiting on DNS
echo "UseDNS no" >> /etc/ssh/sshd_config
