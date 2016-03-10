# == Class: newman::cli
#
# Install and configure Newman
#
class newman::cli {

  package { 'newman':
    ensure   => present,
    provider => 'npm',
    require  => Class['nodejs']
  }

}
