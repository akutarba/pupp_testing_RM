class unix {
  file {
        '/etc/passwd':
          owner => 'root',
          group => 'root',
          mode  => '0644';
        '/etc/shadow':
          owner => 'root',
          group => 'root',
          mode  => '0440';
      }
}


class freebsd inherits unix {
  File['/etc/passwd'] { group => 'wheel' }
  File['/etc/shadow'] { group => 'wheel' }
}

service { 'sshd':
      subscribe => File['sshdconfig'],
}