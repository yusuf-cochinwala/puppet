# == Class: puppet::user
#
# Creates and configures a user to run Puppet as
#
class puppet::user {

  group { 'puppet':
    ensure => present,
    name   => 'puppet'
  }

  user { 'puppet':
    ensure  => present,
    name    => 'puppet',
    home    => '/var/lib/puppet',
    shell   => '/bin/false',
    gid     => 'puppet',
    system  => true,
    require => Group['puppet']
  }

}
