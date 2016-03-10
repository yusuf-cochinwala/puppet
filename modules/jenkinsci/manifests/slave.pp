# == Class: jenkinsci::slave
#
# Configures a Jenkins CI slave.
#
class jenkinsci::slave(
  $master_ssh_key = undef,
  $executors = 3,
){

  include ::maven
  include ::newman
  include ::nodejs
  include ::postgresql
  include ::terraform

  ssh_authorized_key { 'jenkins-master':
    user           => 'jenkins-slave',
    type           => 'ssh-rsa',
    key            => $master_ssh_key,
  }

  class { 'jenkins::slave':
    executors => $executors,
    require   => Class[ 'maven',
                        'nodejs',
                        'postgresql',
                        'terraform'],
  }

}
