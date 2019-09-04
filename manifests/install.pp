# @summary Manage Open OnDemand install
# @api private
class openondemand::install {
  assert_private()

  package { 'ondemand':
    ensure => $openondemand::ondemand_package_ensure,
    notify => Exec['ood-portal-generator-generate'],
  }

  package { 'ondemand-selinux':
    ensure => $openondemand::selinux_package_ensure,
  }

  if $openondemand::oidc_discover_uri {
    package { 'ondemand-discover':
      ensure  => $openondemand::ood_auth_discovery_ensure,
      require => Package['ondemand'],
    }
  }

  if $openondemand::register_uri {
    package { 'ondemand-register':
      ensure  => $openondemand::ood_auth_registration_ensure,
      require => Package['ondemand'],
    }
  }

}
