class openvpn::service (
  String $openvpn_sisar			= $openvpn::openvpn_sisar,
  String $openvpn_ejbca			= $openvpn::openvpn_ejbca,
  String $service_name_server		= $openvpn::service_name_server,
  String $service_name_client		= $openvpn::service_name_client,
  String $service_ensure 		= $openvpn::service_ensure,
  Boolean $service_enable 		= $openvpn::service_enable,
  Boolean $service_hasstatus 		= $openvpn::service_hasstatus,
  Boolean $service_hasrestart 		= $openvpn::service_hasrestart,
  String $openvpn_create_service_server = $openvpn::openvpn_create_service_server,
  String $openvpn_verify_service_server = $openvpn::openvpn_verify_service_server,
  String $openvpn_create_service_client = $openvpn::openvpn_create_service_client,
  String $openvpn_verify_service_client = $openvpn::openvpn_verify_service_client,
){
  if $openvpn_sisar == $::hostname {
    exec { 'openvpn_server':
      command => $openvpn_create_service_server,
      #unless  => $openvpn_verify_service_server,
    }
    service { $service_name_server:
      ensure	=> $service_ensure,
      enable	=> $service_enable,
      name	=> $service_name_server,
      hasstatus	=> $service_hasstatus,
      hasrestart=> $service_hasrestart,
    }
  }elsif $openvpn_ejbca == $::hostname {
    exec { 'openvpn_client':
      command => $openvpn_create_service_client,
      #unless  => $openvpn_verify_service_client,
    }
    service { $service_name_client:
      ensure    => $service_ensure,
      enable    => $service_enable,
      name      => $service_name_client,
      hasstatus => $service_hasstatus,
      hasrestart=> $service_hasrestart,
    }
  } else {
    notify { 'OpenVPN_Service':
      message => "OpenVPN [ INFO ] Node not found.",
    }
  }
}
