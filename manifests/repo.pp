#
class openondemand::repo {
  if $caller_module_name != $module_name {
    fail("Use of private class ${name} by ${caller_module_name}")
  }

  yumrepo { 'ondemand-web':
    descr           => 'Open OnDemand Web Repo',
    baseurl         => $openondemand::repo_baseurl,
    enabled         => '1',
    gpgcheck        => '1',
    gpgkey          => $openondemand::repo_gpgkey,
    metadata_expire => '1'
  }

  if $openondemand::manage_scl {
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
