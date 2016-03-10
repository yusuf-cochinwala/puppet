# == Class: apps::causes_management
#
# Configures upstart for causes-management on apps server
#
class apps::causes_management {

  file { '/etc/init/causes-management.conf':
    ensure  => present,
    content => template('apps/etc/init/causes-management.conf'),
    owner   => 'root',
    group   => 'root',
  }

}
