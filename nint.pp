class core_permissions {
      if $osfamily != 'windows' {

        $rootgroup = $operatingsystem ? {
          'Solaris' => 'wheel',
          default   => 'root',
        }

        file {'/etc/fstab':
          ensure => present,
          mode   => 0644,
          owner  => 'root',
          group  => "$rootgroup",
        }

        file {'/etc/passwd':
          ensure => present,
          mode   => 0644,
          owner  => 'root',
          group  => "$rootgroup",
        }

        file {'/etc/crontab':
          ensure => present,
          mode   => 0644,
          owner  => 'root',
          group  => "$rootgroup",
        }

      }
    }