#Here's a class sample
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
class unix{
    file {
        'sss':

    }
}
/*
Defined resource type
*/
define svn_repo($path) {
  exec { "create_repo_${name}":
    command => "/usr/bin/svnadmin create ${path}/${title}",
    unless  => "/bin/test -d ${path}",
  }
  if $require =~ /\\wrequire/ {
    Exec["create_repo_${name}"] {
      require +> $require,
    }
  }
}

svn_repo { 'puppet':
  path    => '/var/svn',
  require => Package['subversion'],
}
#Arithmetical operations
$one = 1
$one_thirty = 1.30
$two = 2.034e-2

$result = ((( $two + 2) * $one_thirty) + 4 * 5.45) - (6 << ($two + 4)) + (0x800 + -9)