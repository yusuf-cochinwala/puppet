# == Class: tomcat::package
#
# Installs and configures the Maven package from Apt repositories
#
class tomcat::package {

  package { 'tomcat':
    ensure => present,
  }

}