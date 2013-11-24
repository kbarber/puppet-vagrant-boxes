apt-get -y update
apt-get -y install linux-headers-$(uname -r) build-essential zlib1g-dev libssl-dev libreadline-gplv2-dev libyaml-dev curl wget

# Setup sudo to allow no-password sudo for "admin"
cp /etc/sudoers /etc/sudoers.orig
sed -i -e '/Defaults\s\+env_reset/a Defaults\texempt_group=admin' /etc/sudoers
sed -i -e 's/%admin ALL=(ALL) ALL/%admin ALL=NOPASSWD:ALL/g' /etc/sudoers

# Stop warnings about TTY
sed -i '$d' /root/.profile
cat << 'EOH' >> /root/.profile
if `tty -s`; then
  mesg n
fi
EOH
