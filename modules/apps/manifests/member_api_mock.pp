# == Class: apps::member_api_mock
#
# Configures upstart for coop-member-api-mock on apps server
#
class apps::member_api_mock {

  file { '/etc/init/coop-member-api-mock.conf':
    ensure  => present,
    content => template('apps/etc/init/coop-member-api-mock.conf'),
    owner   => 'root',
    group   => 'root',
  }

}
