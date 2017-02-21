# == Class: redis::params
#
class redis::params {

  case $::operatingsystem {
    'OpenBSD': {
      $redis_version         = 'installed'
      $redis_build_dir       = undef
      $redis_install_dir     = undef
      $redis_install_package = true
      $rc_script_dir         = '/etc/rc.d'
      $download_tool         = 'ftp -o'
      $redis_user            = '_redis'
      $redis_group           = '_redis'
      $manage_logrotation    = false
    }
    default: {
      $redis_version         = 'stable'
      $redis_build_dir       = '/opt'
      $redis_install_dir     = '/usr/bin'
      $redis_install_package = false
      $rc_script_dir         = '/etc/init.d'
      $download_tool         = 'curl -s -L'
      $redis_user            = undef
      $redis_group           = undef
      $manage_logrotation    = true
    }
  }
  $download_base         = 'http://download.redis.io/releases'
}
