define svn_repo($path) {
  exec {"/usr/bin/svnadmin create ${path}/${title}":
      command => "usr/bin/svnadmin create ${path}/${path}",
      unless => "/bin/test -d ${path}"
    }
    if $require{
       Exec["create_repo_${name}"]{
          require +> $require,
         }
      }
  }
 svn_repo{'puppet':
   path => 'var/svn',
   require => Package['subversion']

   }

svn_repo { 'puppet_repo': path => '/var/svn_puppet'}
svn_repo { 'other_repo':  path => '/var/svn_other' }


