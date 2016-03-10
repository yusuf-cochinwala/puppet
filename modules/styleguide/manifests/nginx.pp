# == Class: styleguide::nginx
#
# Configures Nginx for the styleguide application
#
class styleguide::nginx {

  file { ['/var/apps/styleguide']:
    ensure  => directory
  }

  file { '/var/apps/styleguide/.htpasswd':
    ensure  => present,
    content => 'styleguide:$apr1$1z8.0iEJ$vO30h.PeCLeYx5CPQUVks0',
    require => [ File['/var/apps/styleguide'], Exec['chmod-styleguide'] ]
  }

  # FIXME: This is a slightly nasty hack because of the user running as.
  #        Also need to fix PATH to exec.
  exec { 'chmod-styleguide':
    command => '/bin/chmod -R +w /var/apps/styleguide',
  }

  nginx::resource::vhost { 'styleguide.meaningfulplatform.co.uk':
    www_root             => '/var/apps/styleguide',
    auth_basic           => 'Restricted Content',
    auth_basic_user_file => '/var/apps/styleguide/.htpasswd',
    require              => File['/var/apps/styleguide'],
    before               => Exec['chmod-styleguide']
  }

}
