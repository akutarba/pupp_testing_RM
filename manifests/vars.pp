$content = 'some content\n'
file { '/tmp/testing': content => $content }

$user = root
    file { '/etc/passwd':
      owner => $user,
    }
    $user = bin
    file { '/bin':
      owner   => $user,
      recurse => true,
    }

node a {
  $setting = 'this'
  include class_using_setting
}
node b {
  $setting = 'that'
  include class_using_setting
}



 $test = 'top'
    class myclass {
      exec { "/bin/echo ${test}": logoutput => true }
    }

    class other {
      $test = 'other'
      include myclass
    }

include other


class myclass {
      $test = 'content'
    }

    class anotherclass {
      $other = $myclass::test
    }


$inch_to_cm = 2.54
$rack_length_cm = 19 * $inch_to_cm
$gigabyte = 1024 * 1024 * 1024
$can_update = ($ram_gb * $gigabyte) > 1 << 24

$ssh_users = [ 'myself', 'someone' ]

class test {
  $ssh_users += ['someone_else']
}