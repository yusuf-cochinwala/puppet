#!/usr/bin/env bash
set -e
# Directory in which PuppetFile is placed to be scanned by librarian-puppet.
PUPPET_DIR=/vagrant/puppet
 
echo "Installing Git.."
apt-get -q -y install git
 
echo "Installing librarian-puppet.."
if [ "$(gem search -i librarian-puppet)" = "false" ]; then
   RUBY_VERSION=$(ruby -e 'print RUBY_VERSION')
   case "$RUBY_VERSION" in
   1.8.*)
      # For ruby 1.8.x librarian-puppet needs to use 'highline' 1.6.x
      # highline >= 1.7.0 requires ruby >= 1.9.3
      gem install highline --version "~>1.6.0" > /dev/null 2>&1
      # Install the most recent 1.x.x version, but not 2.x.x which needs Ruby 1.9
      gem install librarian-puppet --version "~>1"
   ;;
   *)
      gem install librarian-puppet
   ;;
   esac
fi
echo "librarian-puppet installed!"
 
echo "Executing PuppetFile.."
cd $PUPPET_DIR && librarian-puppet install --path modules
 
echo "Installing Puppet repo for Ubuntu 12.04 LTS"
wget -qO /tmp/puppetlabs-release-precise.deb \
https://apt.puppetlabs.com/puppetlabs-release-precise.deb
dpkg -i /tmp/puppetlabs-release-precise.deb
rm /tmp/puppetlabs-release-precise.deb
aptitude update
echo Installing puppet
aptitude install -y puppet
echo "Puppet installed!"

