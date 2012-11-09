class apache-server {

    # determine the apache-server package based on the operatingsystem fact
    $apache_server = $operatingsystem ? {
        Fedora  => "httpd",
        default => "apache2",
    }

    package { "$apache_server":
        ensure => "present",
        alias  => "apache-server",
    }

    file { "/var/www/html/index.html":
        source  => "puppet:///index.html",
        require => Package["apache-server"],
    }

}
package { 'sinatra':
    ensure   => 'installed',
    provider => 'gem',
}

# notice: /Stage[main]//Package[sinatra]/ensure: created

## in your site.pp
Package { provider => "aptrpm" }


# create a directory
file { "/etc/site-conf":
    ensure => "directory",
}

# a fuller example, including permissions and ownership
file { "/var/log/admin-app-log":
    ensure => "directory",
    owner  => "root",
    group  => "wheel",
    mode   => 750,
}

# this example is incorrect and creates a file
file { "/etc/site-conf/":
    ensure => "present",
}

# create a directory tree, list the directories in order
# and puppet will "do the right thing".
file { [ "/usr/local/whisper/", "/usr/local/whisper/2.0",
         "/usr/local/whisper/2.0/bin", "/usr/local/whisper/2.0/log" ]:
    ensure => "directory",
}

# or you can assign them to a variable and use them in the resource
$whisper_dirs = [ "/usr/local/whisper/", "/usr/local/whisper/2.0",
                  "/usr/local/whisper/2.0/bin", "/usr/local/whisper/2.0/log",
                ]

file { $whisper_dirs:
    ensure => "directory",
    owner  => "root",
    group  => "wheel",
    mode   => 750,
}

# doesn't work - will fail unless whisper and 2.0 already exist
file { "/usr/local/whisper/2.0/bin":
  ensure => "directory",
}


file { "/etc/mysql/conf.d/tuning.cnf":
    ensure => "present",
    source => [
        "puppet:///modules/mysql-server/tuning.$hostname.cnf",
        "puppet:///modules/mysql-server/tuning.$domain.cnf",
        "puppet:///modules/mysql-server/tuning.cnf"
    ],
}


file { "/tmp/hello-file":
    replace => "no", # this is the important property
    ensure  => "present",
    content => "From Puppet\n",
    mode    => 644,
}


File {
  ensure => "present",
  owner  => "root",
  group  => "root",
  mode   => 644,
}

file { "/etc/cobbler/modules.conf":
  content => template("cobbler/modules.conf"),
}

file { "/etc/cobbler/dhcp.template":
  content => template("cobbler/dhcp.template"),
}

File {
  ensure => "present",
  owner  => "root",
  group  => "root",
  mode   => 644,
}

file { "/etc/cobbler/modules.conf":
  content => template("cobbler/modules.conf"),
}

file { "/etc/cobbler/dhcp.template":
  content => template("cobbler/dhcp.template"),
}

File {
  ensure => "present",
  owner  => "root",
  group  => "root",
  mode   => 644,
}

file { "/etc/cobbler/modules.conf":
  content => template("cobbler/modules.conf"),
}

file { "/etc/cobbler/dhcp.template":
  content => template("cobbler/dhcp.template"),
}

# override the permissions for this one file
file {"/etc/cobbler/users.digest":
  source => "puppet:///modules/cobbler/users.digest.live",
  mode   => 660,
}
