notice('Something weird is going on')
notice 'Something weird is going on'

file { '/my/file': content => template('mytemplate.erb') }

# site.pp
    node kestrel.example.com {
        # Wrong wrong wrong!
        import nodes/kestrel.pp
    }

    # kestrel.pp
    include ntp
    include apache2
    # These two classes are outside any node statement, and will always be applied.


import 'nodes/*.pp'
import 'packages/[a-z]*.pp'