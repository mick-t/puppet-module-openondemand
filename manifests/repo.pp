# @summary Manage Open OnDemand repos
# @api private
class openondemand::repo {
  assert_private()

  yumrepo { 'ondemand-web':
    descr           => 'Open OnDemand Web Repo',
    baseurl         => $openondemand::repo_baseurl,
    enabled         => '1',
    gpgcheck        => '1',
    gpgkey          => $openondemand::repo_gpgkey,
    metadata_expire => '1'
  }

  if $openondemand::manage_scl {
    if $facts['os']['name'] == 'CentOS' and versioncmp($facts['os']['release']['major'], '7') == 0 {
      file { '/etc/yum.repos.d/ondemand-centos-scl.repo':
        ensure => 'absent',
      }
    }

    case $facts['os']['name'] {
      'RedHat': {
        rhsm_repo { "rhel-server-rhscl-${facts['os']['release']['major']}-rpms":
          ensure => 'present',
        }
      }
      'CentOS': {
        package { 'centos-release-scl':
          ensure => 'installed',
        }
      }
      default: {
        # Do nothing
      }
    }
  }

  if $openondemand::manage_epel and $facts['os']['family'] == 'RedHat' {
    include ::epel
  }

}
