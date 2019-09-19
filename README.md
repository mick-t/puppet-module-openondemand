# puppet-module-openondemand

[![Puppet Forge](http://img.shields.io/puppetforge/v/osc/openondemand.svg)](https://forge.puppetlabs.com/osc/openondemand)
[![Build Status](https://travis-ci.org/osc/puppet-module-openondemand.png)](https://travis-ci.org/osc/puppet-module-openondemand)

#### Table of Contents

1. [Overview](#overview)
    * [Supported Versions of Open OnDemand](#supported-versions-of-open-ondemand)
2. [Usage - Configuration options](#usage)
3. [Reference - Parameter and detailed reference to all options](#reference)
4. [Limitations - OS compatibility, etc.](#limitations)

## Overview

Manage [Open OnDemand](http://openondemand.org/) installation and configuration.

### Supported Versions of Open OnDemand

The following are the versions of this module and the supported versions of Open OnDemand:

* Module 0.x supports Open OnDemand 1.x

## Usage

All configuration can be done through the `openondemand` class. Example configurations will be done in Hiera format.

```puppet
include ::openondemand
```

Install specific versions of OnDemand from 1.6 repo with OpenID Connect support.

```yaml
openondemand::repo_release: '1.6'
openondemand::ondemand_package_ensure: "1.6.11-1.el7"
openondemand::mod_auth_openidc_ensure: "2.3.11-1.el7"
```

Configure OnDemand SSL certs

```yaml
openondemand::servername: ondemand.osc.edu
openondemand::ssl:
  - "SSLCertificateFile /etc/pki/tls/certs/%{lookup('openondemand::servername')}.crt"
  - "SSLCertificateKeyFile /etc/pki/tls/private/%{lookup('openondemand::servername')}.key"
  - "SSLCertificateChainFile /etc/pki/tls/certs/%{lookup('openondemand::servername')}-interm.crt"
```

If you already declare the apache class you may wish to only include apache in this module:

```yaml
openondemand::declare_apache: false
apache::version::scl_httpd_version: '2.4'
apache::version::scl_php_version: '7.0'
apache::default_vhost: false
```

Add support for interactive apps

```yaml
openondemand::host_regex: '[\w.-]+\.osc\.edu'
openondemand::node_uri: '/node'
openondemand::rnode_uri: '/rnode'
```

Setup OnDemand to authenticate with OpenID Connect system, in these examples the IdP is Keycloak.

```yaml
openondemand::servername: ondemand.osc.edu
openondemand::auth_type: 'openid-connect'
openondemand::auth_configs:
  - 'Require valid-user'
openondemand::user_map_cmd: /opt/ood/ood_auth_map/bin/ood_auth_map.regex
openondemand::logout_redirect: "/oidc?logout=https%3A%2F%2F%{lookup('openondemand::servername')}"
openondemand::oidc_uri: '/oidc'
openondemand::oidc_provider: 'idp.osc.edu/auth/realms/osc'
openondemand::oidc_provider_token_endpoint_auth: 'client_secret_basic'
openondemand::oidc_provider_scope: 'openid email'
openondemand::oidc_provider_client_id: ondemand.osc.edu
openondemand::oidc_crypto_passphrase: 'SOMEHASH'
openondemand::oidc_provider_client_secret: 'SUPERSECRET'
```

Configure OnDemand via git repo that contains app configs, locales and public files

```yaml
openondemand::servername: ondemand.osc.edu
openondemand::apps_config_repo: https://github.com/OSC/osc-ood-config.git
openondemand::apps_config_revision: v30
openondemand::apps_config_repo_path: "%{lookup('openondemand::servername')}/apps"
openondemand::locales_config_repo_path: "%{lookup('openondemand::servername')}/locales"
openondemand::public_files_repo_paths:
  - "%{lookup('openondemand::servername')}/public/logo.png"
  - "%{lookup('openondemand::servername')}/public/favicon.ico"
```

Define a cluster. The following example is based on a cluster at OSC using Torque

```yaml
openondemand::clusters:
  owens:
    cluster_title: 'Owens'
    url: 'https://www.osc.edu/supercomputing/computing/owens'
    login_host: 'owens.osc.edu'
    job_adapter: torque
    job_host: 'owens-batch.ten.osc.edu'
    job_bin: /opt/torque/bin
    job_lib: /opt/torque/lib64
    job_version: '6.0.1'
    batch_connect:
      basic:
        script_wrapper: 'module restore\n%s'
      vnc:
        script_wrapper: 'module restore\nmodule load ondemand-vnc\n%s'
```

Install additional apps of specific versions as well as hide some apps

```yaml
openondemand::install_apps:
  bc_osc_rstudio_server:
    ensure: "0.8.2-1.el7"
  bc_desktop:
    mode: '0700'
```

Add usr apps with a default group

```yaml
openondemand::usr_app_defaults:
  group: staff
openondemand::usr_apps:
  user1:
    gateway_src: /home/user1/ondemand/share
  user2:
    group: faculty
    gateway_src: /home/user2/ondemand/share
```

Add dev app users

```yaml
openondemand::dev_app_users:
  - user1
  - user2
```

## Reference

[http://osc.github.io/puppet-module-openondemand/](http://osc.github.io/puppet-module-openondemand/)

## Limitations

This module has been tested on:

* CentOS 7 x86_64
* RedHat 7 x86_64
