if $variable {
      file { '/some/file': ensure => present }
    } else {
      file { '/some/other/file': ensure => present }
}

   if $server == 'mongrel' {
      include mongrel
    } else {
      include nginx
    }

    if $server == 'mongrel' {
          include mongrel
        } elsif $server == 'nginx' {
          include nginx
        } else {
          include thin
        }


        if $ram > 1024 {
              $maxclient = 500
            }


    if ( $processor_count > 2 ) and (( $ram >= 16 * $gigabyte ) or ( $disksize > 1000 )) {
      include for_big_irons
    } else {
      include for_small_box
    }


if $variable != 'foo' {
      $othervariable = 'bar'
    } else {
      $othervariable = 'foobar'
    }

unless $memorysize > 1024 {
       $maxclient = 500
    }