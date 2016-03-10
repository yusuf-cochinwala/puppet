# == Class: postgresql::client
#
# Installs and configures 'psql', the PostgreSQL client
#
class postgresql::client {

  package { 'postgresql-client':
    ensure => present,
  }

}
