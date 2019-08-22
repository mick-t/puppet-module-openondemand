#
class openondemand::repo {
  if $caller_module_name != $module_name {
    fail("Use of private class ${name} by ${caller_module_name}")
  }

  $baseurl = "${openondemand::repo_baseurl_prefix}/${openondemand::repo_release}/web/el${facts['os']['release']['major']}/\$basearch"

  yumrepo { 'ondemand-web':
    descr           => 'Open OnDemand Web Repo',
    baseurl         => $baseurl,
    enabled         => '1',
    gpgcheck        => '1',
    gpgkey          => $openondemand::repo_gpgkey,
    metadata_expire => '1'
  }

  if $openondemand::manage_scl {
    if $facts['os']['family'] == 'RedHat' {
      if $facts['os']['name'] == 'RedHat' {
        rhsm_repo { "rhel-server-rhscl-${facts['os']['release']['major']}-rpms":
          ensure => 'present',
        }
      } else {
        package { 'centos-release-scl':
          ensure => 'installed',
        }
      }
    }
  }

  if $openondemand::manage_epel and $facts['os']['family'] == 'RedHat' {
    include ::epel
  }

}
