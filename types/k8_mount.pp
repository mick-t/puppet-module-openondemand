# OnDemand cluster Kubernetes mount
type Openondemand::K8_mount = Struct[
  { 'type' => String[1],
    'name'  => String[1],
    'host_type' => Optional[String[1]],
    'host' => Optional[String[1]],
    'destination_path' => Stdlib::Absolutepath,
    'path' => Stdlib::Absolutepath,
  }
]
