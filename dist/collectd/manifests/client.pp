# Class: collectd::client
#
# This class configures the collectd client
#
# Parameters:
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
class collectd::client {
  include collectd::params
  require collectd

  $collectd_server = $collectd::params::collectd_server

  file { 'collectd-client':
    path => $collectd::params::collectd_configuration,
    content => template('collectd/collectd-client.conf.erb'),
    ensure => present,
    require => Package['collectd'],
  }

}
