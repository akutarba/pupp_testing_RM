@user { 'luke': ensure => present }


realize User['luke']


class ssh {
  @@sshkey { $hostname: type => dsa, key => $sshdsakey }
  User <| title == luke |>
  Sshkey <<| |>>
}