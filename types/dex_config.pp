# nginx_stage.yml namespace_config
type Openondemand::Dex_config = Struct[{
  'ssl' => Optional[Boolean],
  'http_port' => Optional[Variant[String, Integer]],
  'https_port' => Optional[Variant[String, Integer]],
  'tls_cert' => Optional[Stdlib::Absolutepath],
  'tls_key' => Optional[Stdlib::Absolutepath],
  'storage_file' => Optional[Stdlib::Absolutepath],
  'grpc' => Optional[Hash],
  'expiry' => Optional[Hash],
  'client_id' => Optional[String],
  'client_redirect_uris' => Optional[Array],
  'client_name' => Optional[String],
  'client_secret' => Optional[String],
  'static_clients' => Optional[Array[Hash]],
  'connectors' => Optional[Array[Hash]],
  'frontend' => Optional[Hash],
  }]
