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

}
