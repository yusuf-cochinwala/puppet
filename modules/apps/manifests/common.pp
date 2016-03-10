# == Class: apps:common
#
# Creates and configures the apps server directory and Java
#
class apps::common {

  include apps::java

  file { '/var/apps':
    ensure => directory,
    owner  => 'ubuntu'
  }

}
