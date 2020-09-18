# @summary Manage Open OnDemand repos
# @api private
class openondemand::repo {
  assert_private()

  yumrepo { 'ondemand-web':
    descr           => 'Open OnDemand Web Repo',
    baseurl         => $openondemand::repo_baseurl,
    enabled         => '1',
    gpgcheck        => '1',
    repo_gpgcheck   => '1',
    gpgkey          => $openondemand::repo_gpgkey,
    metadata_expire => '1',
    priority        => $openondemand::repo_priority,
  }

  if versioncmp($openondemand::osmajor, '7') <= 0 and $openondemand::manage_scl {
    if $facts['os']['name'] == 'CentOS' and versioncmp($openondemand::osmajor, '7') == 0 {
      file { '/etc/yum.repos.d/ondemand-centos-scl.repo':
        ensure => 'absent',
      }
    }

    case $facts['os']['name'] {
      'RedHat': {
        rh_repo { "rhel-server-rhscl-${openondemand::osmajor}-rpms":
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

}
