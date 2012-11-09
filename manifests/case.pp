#case $operatingsystem {
#      'sunos':  { include solaris } # apply the solaris class
#      'redhat': { include redhat  } # apply the redhat class
#      default:  { include generic } # apply the generic class
#    }
#
#case $hostname {
#      'jack','jill':     { include hill    } # apply the hill class
#      'humpty','dumpty': { include wall    } # apply the wall class
#      default:           { include generic } # apply the generic class
#    }

case $hostname {
      /^j(ack|ill)$/: { include hill    } # apply the hill class
      /^[hd]umpty$/:  { include wall    } # apply the wall class
      default:        { include generic } # apply the generic class
    }