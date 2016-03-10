# == Class: base::java
#
# Installs and configures the java package
#
class apps::java {

  class { 'oracle_java':
    version         => '8',
    type            => 'jdk',
    add_alternative => true,
    add_system_env  => true
  }

}
