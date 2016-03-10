# == Class: apps::wallet_api
#
# Configures upstart for wallet-api on apps server
#
class apps::wallet_api {

  file { '/etc/init/wallet-api.conf':
    ensure  => present,
    content => template('apps/etc/init/wallet-api.conf'),
    owner   => 'root',
    group   => 'root',
  }

}
