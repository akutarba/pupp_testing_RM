 file { '/etc/config':
  owner => $operatingsystem ? {
    'sunos'  => 'adm',
    'redhat' => 'bin',
    default  => undef,
  },
}

file { '/etc/passwd':
      owner => 'root',
      group => 'root',
      mode  => '0644',
}
file { 'sshdconfig':
      path => $operatingsystem ? {
        solaris => '/usr/local/etc/ssh/sshd_config',
        default => '/etc/ssh/sshd_config',
      },
      owner => 'root',
      group => 'root',
      mode  => '0644',
}
service { 'sshd':
      subscribe => File['sshdconfig'],
}

service { 'sshd':
      require => File['sshdconfig', 'sshconfig', 'authorized_keys']
}


Exec { path => '/usr/bin:/bin:/usr/sbin:/sbin' }
exec { 'echo this works': }