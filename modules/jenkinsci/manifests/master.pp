# == Class: jenkinsci::master
#
# Creates and configures a Jenkins CI master server.
#
class jenkinsci::master {

  class { 'jenkins':
    executors => 0,
  }

  jenkins::plugin { 'ansicolor': }
  jenkins::plugin { 'aws-java-sdk': }
  jenkins::plugin { 'build-blocker-plugin' : }
  jenkins::plugin { 'build-pipeline-plugin': }
  jenkins::plugin { 'cloudbees-folder': }
  jenkins::plugin { 'configurationslicing': }
  jenkins::plugin { 'copyartifact': }
  jenkins::plugin { 'credentials': }
  jenkins::plugin { 'credentials-binding': }
  jenkins::plugin { 'dashboard-view': }
  jenkins::plugin { 'disk-usage': }
  jenkins::plugin { 'embeddable-build-status': }
  jenkins::plugin { 'envinject': }
  jenkins::plugin { 'ghprb': }
  jenkins::plugin { 'git-client': }
  jenkins::plugin { 'git': }
  jenkins::plugin { 'github': }
  jenkins::plugin { 'github-api': }
  jenkins::plugin { 'github-oauth': }
  jenkins::plugin { 'greenballs': }
  jenkins::plugin { 'jackson2-api': }
  jenkins::plugin { 'javadoc': }
  jenkins::plugin { 'jquery': }
  jenkins::plugin { 'junit': }
  jenkins::plugin { 'logfilesizechecker': }
  jenkins::plugin { 'mailer': }
  jenkins::plugin { 'mapdb-api': }
  jenkins::plugin { 'mask-passwords': }
  jenkins::plugin { 'matrix-auth': }
  jenkins::plugin { 'matrix-project': }
  jenkins::plugin { 'maven-plugin': }
  jenkins::plugin { 'multi-branch-project-plugin': }
  jenkins::plugin { 'node-iterator-api': }
  jenkins::plugin { 'pam-auth': }
  jenkins::plugin { 'parameterized-trigger': }
  jenkins::plugin { 'performance': }
  jenkins::plugin { 'plain-credentials': }
  jenkins::plugin { 'port-allocator': }
  jenkins::plugin { 'project-build-times': }
  jenkins::plugin { 'publish-over-ssh': }
  jenkins::plugin { 's3': }
  jenkins::plugin { 'scm-api': }
  jenkins::plugin { 'scm-sync-configuration': }
  jenkins::plugin { 'script-security': }
  jenkins::plugin { 'sonar': }
  jenkins::plugin { 'ssh': }
  jenkins::plugin { 'ssh-agent': }
  jenkins::plugin { 'ssh-credentials': }
  jenkins::plugin { 'ssh-slaves': }
  jenkins::plugin { 'token-macro': }
  jenkins::plugin { 'translation': }
  jenkins::plugin { 'workflow-step-api': }
  jenkins::plugin { 'ws-cleanup': }

  file { '/var/lib/jenkins/config.xml':
    ensure  => present,
    content => template('jenkinsci/var/lib/jenkins/config.xml.erb')
  }
}
