# == Class: apps::causes_api
#
# Configures upstart for causes-api on apps server
#
class apps::causes_api {

  file { '/etc/init/causes-api.conf':
    ensure  => present,
    content => template('apps/etc/init/causes-api.conf'),
    owner   => 'root',
    group   => 'root',
  }

}
