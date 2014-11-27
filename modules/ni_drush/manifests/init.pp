# -*- mode: puppet -*-
# vi: set ft=conf :
# vim: set ft=conf :

class ni_drush {
    package { "drush":
        ensure => "installed"
    }

    # file { [ "/home/vagrant/.drush" ]:
    #     ensure => "directory",
    # }

    # # Set up drush Alias (drupal7) 
    # file {'/home/vagrant/.drush/drupal7.aliases.drushrc.php':
    #     source => '/vagrant_nidata/drupal7.aliases.drushrc.php',
    #            require => Package['drush'],
    #            owner => 'vagrant',
    #            group => 'vagrant',
    # }


}


