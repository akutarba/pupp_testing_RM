#node 'www.testing.com'{
#   include common
#   include apache, squid
#}
#
#node 'www.testing.com', 'www2.testing.com', 'www3.testing.com' {
#   include common
#   include apache, squid
#}
#
node /^www\d+$/ {
      include common
}

#node 'www2.testing.com' inherits 'www.testing.com' {
#      include loadbalancer
#    }