exec { "refresh_cache":
    command => "refresh_cache 8600",
    path    => "/usr/local/bin/:/bin/",
    # path    => [ "/usr/local/bin/", "/bin/" ],  # alternative syntax
}

# put this somewhere global, like site.pp
Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ] }

# uses the globally specified path
exec { "make_foo_state":
    command => "mkdir -p /tmp/foo/state",
}

# overrides the global path for this command
exec { "my_local_command":

    command => "my_special_local_command",

    path    => "/usr/local/sbin/",

}

# exec with the command as the name
exec { "/bin/mkdir -p /tmp/needed/directory":
}

package { "needed":
    ensure  => "installed",
    # awkward, long require
    require => Exec["/bin/mkdir -p /tmp/needed/directory"],
}

# nicer, human friendly naming
exec { "create_needed_directory":
    command => "/bin/mkdir -p /tmp/needed/directory",
}

package { "needed":
    ensure  => "installed",
    # easier to read require
    require => Exec["create_needed_directory"],
}

exec { "create_needed_directory":
    command => "/bin/mkdir -p /tmp/needed/directory",
    creates => "/tmp/needed/directory"
}

# run exec only if command in onlyif returns 0.
exec { "run_account_purger":
    command => "/usr/local/sbin/account_purger",
    onlyif => "grep -c old_account /etc/passwd",
}

# or run multiple commands - all must succeed for exec to run
exec { "run_account_purger":
    command => "/usr/local/sbin/account_purger",
    onlyif => [
                "grep -c old_account /etc/passwd",
                "test -d /home/old_account/"
              ]
}


# run exec only if command in onlyif returns 0.
exec { "run_account_purger":
    command => "/usr/local/sbin/account_purger",
    onlyif => "grep -c old_account /etc/passwd",
}

# or run multiple commands - all must succeed for exec to run
exec { "run_account_purger":
    command => "/usr/local/sbin/account_purger",
    onlyif => [
                "grep -c old_account /etc/passwd",
                "test -d /home/old_account/"
              ]
}

# on_failure logs the commands output on failure
exec { "delete_str_tmp":
    path    => "/usr/local/bin/:/bin:/usr/sbin",
    command => 'find /tmp/ -name "*.str" -type f | xargs -n 1 rm',
    logoutput => "on_failure",
}

service { "cron":
  ensure => "running",
}


service { "cron":
  ensure => "running",
}


# run exec only if command in onlyif returns 0.
exec { "run_account_purger":
    command => "/usr/local/sbin/account_purger",
    onlyif => "grep -c old_account /etc/passwd",
}

# or run multiple commands - all must succeed for exec to run
exec { "run_account_purger":
    command => "/usr/local/sbin/account_purger",
    onlyif => [
                "grep -c old_account /etc/passwd",
                "test -d /home/old_account/"
              ]
}

service { "cron":
  ensure => "running",
}

# minimum required.
group { "logusers":
    ensure => "present",
}

# create a group with a specific GID.
group { "stats":
    gid    => 2001,
}
