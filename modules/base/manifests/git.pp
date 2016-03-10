# == Class: base::git
#
# Installs and configures the Git package
#
class base::git {

  package { 'git':
    ensure => present,
  }

}
