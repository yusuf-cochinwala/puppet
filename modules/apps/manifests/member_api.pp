# == Class: apps::member_api
#
# Configures upstart for coop-member-api on apps server
#
class apps::member_api {

  file { '/etc/init/coop-member-api.conf':
    ensure  => present,
    content => template('apps/etc/init/coop-member-api.conf'),
    owner   => 'root',
    group   => 'root',
  }

}
