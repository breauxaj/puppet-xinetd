class xinetd {
  $required = $operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => 'xinetd',
  }
  
  $path = $operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => '/etc/xinetd.d',
  }

  package { $required: ensure => latest }

  file { $path:
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
  }

}

define xinetd::service ( $ensure = running,
                         $enable = true ) {
  $service = $operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => 'xinetd',
  }

  service { $service:
    ensure => $ensure,
    enable => $enable,
  }

}
