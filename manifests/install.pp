class openvpn::install (
  Array[String] $packages_openvpn = $openvpn::packages_openvpn,
){
  package { $packages_openvpn:
    ensure	=> installed,
  }
}
