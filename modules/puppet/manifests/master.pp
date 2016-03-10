# == Class: puppet::master
#
# Installs and configures a Puppet master
#
class puppet::master {

  apt::source { 'puppetlabs':
    location => 'http://apt.puppetlabs.com',
    release  => $::lsbdistcodename,
    repos    => 'main dependencies',
    before   => Package['puppetmaster-passenger'],
  }

  package { 'puppetmaster-passenger':
    ensure  => present,
  }

  file { '/etc/apt/preferences.d/00-puppet.pref':
    ensure   => present,
    content  => template('puppet/etc/apt/preferences.d/00-puppet.pref'),
    require  => Package['puppetmaster-passenger'],
  }

  file { '/etc/puppet/puppet.conf':
    ensure  => present,
    mode    => '0644',
    content => template('puppet/etc/puppet/puppet.conf.erb'),
    require => Package['puppetmaster-passenger'],
  }

  exec { '/bin/rm -rf /var/lib/puppet/ssl/*':
    unless  => '/usr/bin/test -f /var/lib/puppet/ssl/regenerated',
    before  => Exec['/usr/bin/puppet master --no-daemonize'],
    require => File['/etc/puppet/puppet.conf'],
  }

  exec { '/usr/bin/puppet master --no-daemonize':
    unless  => '/usr/bin/test -f /var/lib/puppet/ssl/regenerated',
    timeout => 30,
    returns => [0, 1],
    require => File['/etc/puppet/puppet.conf']
  }

  # The following resource is a bit of a hack: it stops us regenerating the
  # Puppet Master's CA root certificate and resigning all agents every time
  # we run Puppet on the Puppet master.

  file { '/var/lib/puppet/ssl/regenerated':
    ensure  => present,
    require => [
      Exec['/bin/rm -rf /var/lib/puppet/ssl/*'],
      Exec['/usr/bin/puppet master --no-daemonize']
    ],
  }

  file { '/var/lib/puppet/autosign.conf':
    ensure  => present,
    mode    => '0644',
    content => template('puppet/var/lib/puppet/autosign.conf'),
    require => Package['puppetmaster-passenger'],
  }

}
