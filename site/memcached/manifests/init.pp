class memcache {
  package { 'memcache':
    ensure => present,
    before => File['memcached'],
  }
  
  file { 'memcached':
    path => 'etc/sysconfig/memcached',
    source => 'puppet:///modules/memcached/memcached',
    notify => Service{'memcached'],
  }
  
  service { 'memcached':
    ensure => running,
    enable => true,
  }
}
