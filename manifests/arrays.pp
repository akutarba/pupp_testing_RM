$foo = [ 'one', 'two', 'three' ]
$value = "${one}${two}"

notice $foo[1]

host { 'one.example.com':
      ensure => present,
      alias  => [ 'satu', 'dua', 'tiga' ],
      ip     => '192.168.100.1',
}

resource { 'baz':
      require  => [ Package['foo'], File['bar'] ],
}

define php::pear() {
      package { "php-${name}": ensure => installed }
    }

php::pear { ['ldap', 'mysql', 'ps', 'snmp', 'sqlite', 'tidy', 'xmlrpc']: }

file { [ 'foo', 'bar', 'foobar' ]:
      owner => 'root',
      group => 'root',
      mode  => '0600',
    }

{ key1 => val1, key2 => val2, ... }
$myhash = { key1 => 'myval', key2 => $b }

$myhash = { key => { subkey => 'b' }}
notice($myhash[key][subkey])


