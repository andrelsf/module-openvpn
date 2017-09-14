class openvpn::config(
  String $openvpn_sisar 	= $openvpn::openvpn_sisar,
  String $openvpn_file_server 	= $openvpn::openvpn_file_server,	 
  String $config_owner		= $openvpn::config_owner,
  String $config_group		= $openvpn::config_group,
  String $config_mode		= $openvpn::config_mode,
  String $openvpn_ejbca		= $openvpn::openvpn_ejbca,
  String $openvpn_file_client	= $openvpn::openvpn_file_client,
  String $openvpn_file_key	= $openvpn::openvpn_file_key,
  String $openvpn_config_proto  = $openvpn::openvpn_config_proto,
  String $openvpn_config_port   = $openvpn::openvpn_config_port,
  String $openvpn_ips_srv_cli   = $openvpn::openvpn_ips_srv_cli,
  String $openvpn_key_file_name = $openvpn::openvpn_key_file_name,
  String $openvpn_file_log      = $openvpn::openvpn_file_log,
  String $openvpn_file_status   = $openvpn::openvpn_file_status,
  String $openvpn_cipher        = $openvpn::openvpn_cipher,
  String $openvpn_ips_cli_srv   = $openvpn::openvpn_ips_cli_srv,
  String $openvpn_remote_server = $openvpn::openvpn_remote_server,
){
  if $openvpn_sisar == $::hostname {
    file { "/etc/openvpn/${openvpn_file_server}":
      ensure	=> file,
      owner	=> $config_owner,
      group	=> $config_group,
      mode	=> $config_mode,
      content	=> template("$module_name/server.conf.erb")
    }
  } elsif $openvpn_ejbca == $::hostname {
    file { "/etc/openvpn/${openvpn_file_client}":
      ensure    => file,
      owner     => $config_owner,
      group     => $config_group,
      mode      => $config_mode,
      content   => template("$module_name/clien.conf.erb")
    }
  } else {
    notify { 'info_hostname':
      message => "[ Fail ] - Node not found."
    }
  }  
  file { "/etc/openvpn/${openvpn_file_key}":
    ensure    => file,
    content   => template("$module_name/openvpn.key.erb")
  }
}
