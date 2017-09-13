class openvpn (
  Array[String] $packages_openvpn 	= $openvpn::params::packages_openvpn,
  String $openvpn_sisar    		= $openvpn::params::openvpn_sisar,
  String $openvpn_ejbca    		= $openvpn::params::openvpn_ejbca,
  String $service_name_server  		= $openvpn::params::service_name_server,
  String $service_name_client  		= $openvpn::params::service_name_client,
  String $service_ensure        	= $openvpn::params::service_ensure,
  Boolean $service_enable       	= $openvpn::params::service_enable,
  Boolean $service_hasstatus    	= $openvpn::params::service_hasstatus,
  Boolean $service_hasrestart   	= $openvpn::params::service_hasrestart,
  String $openvpn_create_service_server = $openvpn::params::openvpn_create_service_server,
  String $openvpn_verify_service_server = $openvpn::params::openvpn_verify_service_server,
  String $openvpn_create_service_client = $openvpn::params::openvpn_create_service_client,
  String $openvpn_verify_service_client = $openvpn::params::openvpn_verify_service_client,
  String $openvpn_file_server 		= $openvpn::params::openvpn_file_server,	 
  String $config_owner			= $openvpn::params::config_owner,
  String $config_group			= $openvpn::params::config_group,
  String $config_mode			= $openvpn::params::config_mode,
  String $openvpn_file_client		= $openvpn::params::openvpn_file_client,
  String $openvpn_file_key		= $openvpn::params::openvpn_file_key,
  String $openvpn_config_proto		= $openvpn::params::openvpn_config_proto,
  String $openvpn_config_port		= $openvpn::params::openvpn_config_port,
  String $openvpn_ips_srv_cli		= $openvpn::params::openvpn_ips_srv_cli,
  String $openvpn_key_file_name		= $openvpn::params::openvpn_key_file_name,
  String $openvpn_file_log		= $openvpn::params::openvpn_file_log,
  String $openvpn_file_status		= $openvpn::params::openvpn_file_status,
  String $openvpn_cipher		= $openvpn::params::openvpn_cipher,
  String $openvpn_ips_cli_srv		= $openvpn::params::openvpn_ips_cli_srv,
  String $openvpn_remote_server		= $openvpn::params::openvpn_remote_server,
) inherits ::openvpn::params {
  class { '::openvpn::install': }
  -> class { '::openvpn::config': }
  ~> class { '::openvpn::service': }
}
