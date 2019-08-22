# Private class.
class openondemand::config {
  if $caller_module_name != $module_name {
    fail("Use of private class ${name} by ${caller_module_name}")
  }

  file { '/etc/ood':
    ensure => 'directory',
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
  }

  file { '/etc/ood/config':
    ensure => 'directory',
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
  }

  if $openondemand::manage_apps_config and $openondemand::apps_config_repo {
    vcsrepo { '/opt/ood-apps-config':
      ensure   => 'latest',
      provider => 'git',
      source   => $openondemand::apps_config_repo,
      revision => $openondemand::apps_config_revision,
      user     => 'root',
      before   => File['/etc/ood/config/apps'],
    }
    file { '/etc/ood/config/apps':
      ensure  => 'directory',
      owner   => 'root',
      group   => 'root',
      source  => "/opt/ood-apps-config/${openondemand::apps_config_repo_path}",
      recurse => true,
      purge   => true,
      force   => true,
    }
    if $openondemand::locales_config_repo_path != '' {
      file { '/etc/ood/config/locales':
        ensure  => 'directory',
        owner   => 'root',
        group   => 'root',
        source  => "/opt/ood-apps-config/${openondemand::locales_config_repo_path}",
        recurse => true,
        purge   => true,
        force   => true,
        require => Vcsrepo['/opt/ood-apps-config'],
      }
    }
  } else {
    file { '/etc/ood/config/apps':
      ensure  => 'directory',
      owner   => 'root',
      group   => 'root',
      source  => $openondemand::apps_config_source,
      recurse => true,
      purge   => true,
      force   => true,
    }
  }

  if $openondemand::apps_config_repo and $openondemand::public_files_repo_paths {
    $openondemand::public_files_repo_paths.each |$path| {
      $basename = basename($path)
      file { "${openondemand::public_root}/${basename}":
        ensure  => 'file',
        owner   => 'root',
        group   => 'root',
        mode    => '0644',
        source  => "/opt/ood-apps-config/${path}",
        require => Vcsrepo['/opt/ood-apps-config'],
      }
    }
  }

  file { '/etc/ood/config/clusters.d':
    ensure  => 'directory',
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    purge   => true,
    recurse => true,
    notify  => Class['openondemand::service'],
  }

  $ood_portal_yaml = to_yaml($openondemand::ood_portal_config)
  file { '/etc/ood/config/ood_portal.yml':
    ensure  => 'file',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => "# File managed by Puppet - do not edit!\n${ood_portal_yaml}",
    notify  => Exec['ood-portal-generator-generate'],
  }

  exec { 'ood-portal-generator-generate':
    command     => '/opt/ood/ood-portal-generator/bin/generate -o /etc/ood/config/ood-portal.conf',
    refreshonly => true,
    before      => ::Apache::Custom_config['ood-portal'],
  }

  ::apache::custom_config { 'ood-portal':
    source         => '/etc/ood/config/ood-portal.conf',
    filename       => 'ood-portal.conf',
    verify_command => '/opt/rh/httpd24/root/usr/sbin/apachectl -t',
  }

  file { '/etc/ood/config/nginx_stage.yml':
    ensure  => 'file',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('openondemand/nginx_stage.yml.erb'),
  }

  file { '/etc/ood/profile':
    ensure  => 'file',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('openondemand/profile.erb'),
  }

  file { '/opt/ood/nginx_stage/config/nginx_stage.yml':
    ensure => 'absent',
  }

  file { $openondemand::public_root:
    ensure => 'directory',
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
  }

  sudo::conf { 'ood':
    content        => template('openondemand/sudo.erb'),
    sudo_file_name => 'ood',
  }

  file { '/etc/cron.d/ood':
    ensure  => 'file',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('openondemand/ood-cron.erb'),
  }

  logrotate::rule { 'ood':
    path         => ['/var/log/ondemand-nginx/*/access.log', '/var/log/ondemand-nginx/*/error.log'],
    compress     => true,
    missingok    => true,
    copytruncate => true,
    ifempty      => false,
    rotate       => 52,
    rotate_every => 'week',
  }

  file { '/var/log/ondemand-nginx':
    ensure => 'directory',
    mode   => '0750',
    group  => $openondemand::nginx_log_group,
  }

}
