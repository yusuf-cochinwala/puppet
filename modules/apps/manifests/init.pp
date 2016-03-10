# == Class: apps
#
# Creates and configures the apps server
#
class apps {

  $apps = hiera_hash('localApps')

  include apps::common
  include apps::causes_api
  include apps::causes_management
  include apps::member_api
  include apps::member_api_mock
  include apps::member_portal
  include apps::wallet_api
  include apps::wallet_api_mock

}
