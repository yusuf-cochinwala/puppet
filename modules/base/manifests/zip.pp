# == Class: base::zip
#
# Installs and configures `zip` package
#
class base::zip {

  package { 'zip':
    ensure => present,
  }

}
