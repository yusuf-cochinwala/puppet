# == Class: apps::member_portal
#
# Configures upstart for coop-member-portal on apps server
#
class apps::member_portal {

  file { '/etc/init/member-portal.conf':
    ensure  => present,
    content => template('apps/etc/init/member-portal.conf.erb'),
    owner   => 'root',
    group   => 'root',
  }

}
