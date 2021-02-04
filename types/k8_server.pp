# OnDemand cluster Kubernetes mount
type Openondemand::K8_server = Struct[
  { 'endpoint' => Stdlib::HTTPSUrl,
    'cert_authority_file'  => Stdlib::Absolutepath,
  }
]
