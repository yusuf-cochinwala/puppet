# == Class: base
#
# Configures settings common to all instances.
#
class base {
  include base::buildessential
  include base::git
  include base::ntp
  include base::wget
  include base::zip
  include base::user
}
