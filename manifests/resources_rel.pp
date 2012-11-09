 Apache::Vhost['wordpress']
   File['/etc/ntp.conf'] -> Service['ntpd']
   File['/etc/ntp.conf'] ~> Service['ntpd']
   File['/etc/ntp.conf'] -> Service['ntpd'] <- Package['ntp']
   package { 'ntp': } -> file { '/etc/ntp.conf': }
   Package['ntp'] -> File['/etc/ntp.conf'] -> Service['ntpd']

   yumrepo { 'localyumrepo':  }
       package { 'ntp': provider => yum,  }
       Yumrepo <| |> -> Package <| provider == yum |>