# == Class: jenkinsci
#
# A wrapper class around the rtyler/jenkins module to allow for installation
# and configuration of Jenkins CI
#
class jenkinsci {

  include jenkinsci::master

}
