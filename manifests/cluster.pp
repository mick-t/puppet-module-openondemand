# @summary Manage Open OnDemand cluster definition
#
#
# @param cluster_title
# @param url
# @param hidden
# @param acls
# @param login_host
# @param job_adapter
# @param job_cluster
# @param job_host
# @param job_lib
# @param job_libdir
# @param job_bin
# @param job_bindir
# @param job_conf
# @param job_envdir
# @param job_serverdir
# @param job_exec
# @param sge_root
# @param libdrmaa_path
# @param job_version
# @param job_bin_overrides
# @param scheduler_type
# @param scheduler_host
# @param scheduler_bin
# @param scheduler_version
# @param scheduler_params
# @param rsv_query_acls
# @param ganglia_host
# @param ganglia_scheme
# @param ganglia_segments
# @param ganglia_req_query
# @param ganglia_opt_query
# @param ganglia_version
# @param batch_connect
#
define openondemand::cluster (
  String $cluster_title = $name,
  Optional[Variant[Stdlib::HTTPSUrl, Stdlib::HTTPUrl] ]$url = undef,
  Boolean $hidden = false,
  Array[Openondemand::Acl] $acls = [],
  Optional[Stdlib::Host] $login_host = undef,
  Optional[Enum['torque','slurm','lsf','pbspro','sge']] $job_adapter = undef,
  Optional[String] $job_cluster = undef,
  Optional[Stdlib::Host] $job_host = undef,
  Optional[Stdlib::Absolutepath] $job_lib = undef,
  Optional[Stdlib::Absolutepath] $job_libdir = undef,
  Optional[Stdlib::Absolutepath] $job_bin = undef,
  Optional[Stdlib::Absolutepath] $job_bindir = undef,
  Optional[Stdlib::Absolutepath] $job_conf = undef,
  Optional[Stdlib::Absolutepath] $job_envdir = undef,
  Optional[Stdlib::Absolutepath] $job_serverdir = undef,
  Optional[Stdlib::Absolutepath] $job_exec = undef,
  Optional[Stdlib::Absolutepath] $sge_root = undef,
  Optional[Stdlib::Absolutepath] $libdrmaa_path = undef,
  Optional[String] $job_version = undef,
  Hash[String, Stdlib::Absolutepath] $job_bin_overrides = {},
  Optional[Enum['moab']] $scheduler_type = undef,
  Optional[Stdlib::Host] $scheduler_host = undef,
  Optional[Stdlib::Absolutepath] $scheduler_bin = undef,
  Optional[String] $scheduler_version = undef,
  Hash $scheduler_params = {},
  Array[Openondemand::Acl] $rsv_query_acls = [],
  Optional[Stdlib::Host] $ganglia_host = undef,
  String $ganglia_scheme = 'https://',
  Array $ganglia_segments = ['gweb', 'graph.php'],
  Hash $ganglia_req_query = {'c' => $name},
  Hash $ganglia_opt_query = {'h' => "%{h}.${::domain}"},
  String $ganglia_version = '3',
  Hash[String, Openondemand::Batch_connect] $batch_connect = {},
) {

  include openondemand

  file { "/etc/ood/config/clusters.d/${name}.yml":
    ensure  => 'file',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('openondemand/cluster/main.yml.erb'),
    notify  => Class['openondemand::service'],
  }

}
