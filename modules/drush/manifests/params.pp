class drush::params {
  case $::osfamily {
    'Debian': {
      $extra_packages = [
        'bzip2',
        'gzip',
        'less',
        'rsync',
        'unzip',
        'wget',
      ]
    }
    'RedHat': {
      $extra_packages = [
        'bzip2',
        'gzip',
        'less',
        'mysql',
        'rsync',
        'unzip',
        'wget',
      ]
    }
    default: {
      fail("Unsupported operatingsystem: ${::osfamily}/${::operatingsystem}.")
    }
  }
}

