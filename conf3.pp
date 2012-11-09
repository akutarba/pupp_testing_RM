 file { "${win_common_desktop_directory}\\RunningPuppet.URL":
      ensure  => present,
      content => "[InternetShortcut]\nURL=http://docs.puppetlabs.com/windows/running.html",
    }

    file { "${win_common_desktop_directory}\\Readme.txt":
      ensure  => present,
      content => "This node is managed by Puppet. Some files and
      services cannot be edited locally; contact your sysadmin for details.",
    }