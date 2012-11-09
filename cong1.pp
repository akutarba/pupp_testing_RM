file {'etc/passwd'
  owner => 'root',
  group => 'root',
  mode => '0644'
}
#
#file {'sshconfig':
#  path => $operatingsystem ? {
#    solaris => 'usr/local/etc/ssh/sshd_config',
#    default => 'etc/ssh/sshd_config',
#    },
#  owner => 'root',
#  group => 'root',
#  mode => '0644'
#    }