# == Class: apps::wallet_api_mock
#
# Configures upstart for wallet-api-mock on apps server
#
class apps::wallet_api_mock {

  file { '/etc/init/wallet-api-mock.conf':
    ensure  => present,
    content => template('apps/etc/init/wallet-api-mock.conf'),
    owner   => 'root',
    group   => 'root',
  }

}
