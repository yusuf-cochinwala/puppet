# == Class: maven::package
#
# Installs and configures the Maven package from Apt repositories
#
class maven::package {

  package { 'maven':
    ensure => present,
  }

}
