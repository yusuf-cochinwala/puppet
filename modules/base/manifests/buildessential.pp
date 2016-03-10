# == Class: base::buildessential
#
# Installs the buildessential package from Apt repositories
# This package has no configurable options
#
class base::buildessential {

  package { 'build-essential':
    ensure => present,
  }

}
