# == Class: base::user
#
# Configures users on machines
#
class base::user{

  create_resources('ssh_authorized_key', hiera_hash('ssh_authorized_keys'))

  file { '/home/deploy':
    ensure  => directory,
    owner   => 'deploy',
    group   => 'deploy',
    require => User['deploy'],
  }

  file { '/home/deploy/.ssh':
    ensure   => 'directory',
    owner    => 'deploy',
    group    => 'deploy',
    require  => File['/home/deploy'],
  }

  user { 'deploy':
    ensure     => present,
    home       => '/home/deploy',
    managehome => true,
  }

}
