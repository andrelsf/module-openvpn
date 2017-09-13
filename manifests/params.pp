class openvpn::params{
  $openvpn_sisar		 = 'SISAR-ANDRE'
  $openvpn_ejbca		 = 'EJBCA-ANDRE'
  $packages_openvpn		 = [
			   	    'epel-release', 
			   	    'lzo',
			   	    'lzo-devel', 
			   	   ]
  
  $service_name_server  	 = 'openvpn@server'
  $service_name_client  	 = 'openvpn@client'
  $service_ensure		 = 'running'
  $service_enable		 = true
  $service_hasstatus		 = true
  $service_hasrestart		 = true
  
  $openvpn_create_service_server = "/usr/bin/systemctl -f enable openvpn@server" 
  $openvpn_verify_service_server = "/usr/bin/test -f /usr/lib/systemd/system/openvpn@.service"
  $openvpn_create_service_client = "/usr/bin/systemctl -f enable openvpn@client"
  $openvpn_verify_service_client = "/usr/bin/test -f /usr/lib/systemd/system/openvpn@.service"

  $openvpn_file_server		 = 'server.conf'
  $config_owner			 = 'root'
  $config_group			 = 'root'
  $config_mode			 = '0640'
  $openvpn_file_client		 = 'client.conf'
  $openvpn_file_key		 = '/etc/openvpn/openvpn.key'

  $openvpn_config_proto		 = 'udp4'
  $openvpn_config_port		 = '5501'
  $openvpn_ips_srv_cli		 = "10.0.0.1 10.0.0.2"
  $openvpn_ips_cli_srv		 = "10.0.0.2 10.0.0.1"
  $openvpn_remote_server	 = "192.168.4.123"
  $openvpn_key_file_name	 = 'openvpn.key'
  $openvpn_file_log		 = '/var/log/openvpn.log'
  $openvpn_file_status		 = '/var/log/openvpn-status.log'
  $openvpn_cipher		 = 'AES-128-CBC'
}
