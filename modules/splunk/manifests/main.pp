# == Class: splunk::main
#
# Configures splunk forwarder on machines
#
class splunk::main(
  $credentials_file = undef,
  $deployment_server = undef,
  $forwarder_package = undef
){

  $service = 'splunk'
  $installdir = '/opt/splunkforwarder'
  $script = 'bin/splunk'

  wget::fetch { 'download-splunk-forwarder':
      source      => "https://s3-eu-west-1.amazonaws.com/coop-management-utils/puppet-install/${forwarder_package}",
      destination => '/tmp/',
      before      => Package['install-splunk'],
      require     => Class['base::wget']
  }

  wget::fetch { 'download-splunk-clouduf':
      source      => "https://s3-eu-west-1.amazonaws.com/coop-management-utils/puppet-install/${credentials_file}",
      destination => '/tmp/',
      before      => Package['install-splunk'],
      require     => Class['base::wget']
  }

  package { 'install-splunk':
      ensure   => latest,
      provider => dpkg,
      source   => "/tmp/${forwarder_package}"
  }

  file { "/etc/init.d/${service}":
      ensure  => link,
      target  => "${installdir}/${script}",
      require => Package['install-splunk']
  }

  exec { 'configure-splunk':
    command => "${installdir}/${script} start --accept-license --answer-yes --no-prompt &&
    ${installdir}/${script} install app /tmp/splunkclouduf.spl -auth admin:changeme -update 1 &&
    ${installdir}/${script} add monitor -auth admin:changeme /var/log/ &&
    ${installdir}/${script} set deploy-poll ${deployment_server} -auth admin:changeme &&
    ${installdir}/${script} restart",
    require => File["/etc/init.d/${service}"]
  }

}