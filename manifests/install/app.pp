# @summary Manage Open OnDemand app
#
# @example
#   openondemand::install::app { 'bc_osc_foo':
#     ensure => '0.1.0-1.el7',
#   }
#
# @param ensure
#   Package ensure property if installing from a package
# @param package
#   Package name for the app
# @param manage_package
#   Should package be managed
# @param path
#   Path to app, defaults to `/var/www/ood/apps/sys/$name`
# @param owner
#   File owner of app
# @param group
#   File group owner of app
# @param mode
#   File mode for app
#
define openondemand::install::app (
  String $ensure = 'present',
  String $package = "ondemand-${name}",
  Boolean $manage_package = true,
  Optional[Stdlib::Absolutepath] $path = undef,
  String $owner = 'root',
  String $group = 'root',
  String $mode  = '0755',
) {

  include openondemand

  $_path = pick($path, "${openondemand::_web_directory}/apps/sys/${name}")

  if $manage_package {
    ensure_resource('package', $package, {
      'ensure'  => $ensure,
      'require' => Package['ondemand'],
    })
  }

  if $ensure != 'absent' {
    file { $_path:
      ensure  => 'directory',
      owner   => $owner,
      group   => $group,
      mode    => $mode,
      require => Package[$package],
    }
  }

}
