class memcached {
  package { 'memcache':
    ensure => present,
  }
  
  file { '/etc/sysconfig/memcached':
    ensure => file,
    path => 'etc/sysconfig/memcached',
    source => 'puppet:///modules/memcached/memcached',
    require => Package['memcached'],
  }
  
  service { 'memcached':
    ensure => running,
    enable => true,
    subscribe => File['etc/sysconfig/memcached'],
  }
}
