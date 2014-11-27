# -*- mode: puppet -*-
# vi: set ft=conf :

class ni_user {
    define user_homedir ($group, $fullname, $ingroups) {
        user { "$name":
            ensure => present,
            comment => "$fullname",
            gid => "$group",
            groups => $ingroups,
            membership => minimum,
            shell => "/bin/bash",
            home => "/home/$name",
            require => Group[$group],
        }

        exec { "$name homedir":
            command => "/bin/cp -R /etc/skel /home/$name; /bin/chown -R $name:$group /home/$name",
            creates => "/home/$name",
            require => User[$name],
        }
    }

   group { "postgres":
        ensure => "present",
   }

   user_homedir { "newint2":
        group => "postgres",
        fullname => "New Internationalist",
        ingroups => ["vagrant", "sudo"],
    }


}
