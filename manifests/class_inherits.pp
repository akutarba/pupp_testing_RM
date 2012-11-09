class apache {
  service { 'apache': require => Package['httpd'] }
}

class apache-ssl inherits apache {
  # host certificate is required for SSL to function
  Service['apache'] { require +> File['apache.pem'] }
}