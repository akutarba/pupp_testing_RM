class apache($version = '1.3.13', $home = '/var/www') {

}

class apache($version = '1.3.13', $home = '/var/www') {


}

stage { 'first': before => Stage['main'] }
stage { 'last': require => Stage['main'] }

class  {
      'apt-keys': stage => first;
      'sendmail': stage => main;
      'apache':   stage => last;
    }


define svn_repo($path) {
      exec { "/usr/bin/svnadmin create ${path}/${title}":
        unless => "/bin/test -d ${path}",
      }
    }

    svn_repo { 'puppet_repo': path => '/var/svn_puppet' }
    svn_repo { 'other_repo':  path => '/var/svn_other' }


define svn_repo($path) {
      exec { "create_repo_${name}":
        command => "/usr/bin/svnadmin create ${path}/${title}",
        unless  => "/bin/test -d ${path}",
      }
      if $require {
        Exec["create_repo_${name}"] {
          require +> $require,
        }
      }
    }

    svn_repo { 'puppet':
      path    => '/var/svn',
      require => Package['subversion'],
    }