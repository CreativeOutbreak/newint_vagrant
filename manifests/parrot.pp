node default {

    class {apt: }
    class { parrot_repos: }
    class { parrot_mysql:  }
    class { parrot_php:  }
    class { oh_my_zsh:  }
    class { sudoers: }
    class { ni_user: }
    class { stdlib: }
    class { composer: }
    class { 'drush':
        versions              => ['6', 'master'],
        default_version       => 'master',
        autoupdate            => true,
        ensure_extra_packages => true,
        extensions            => ['registry_rebuild', 'drush_extras'],
    }
    case $parrot_varnish_enabled {
        'true', true: {
            class { 'http_stack::with_varnish': }
        }
        default: {
                     class { 'http_stack::without_varnish': }
                 }
    }
    class { mailcollect: }

    package { 'vim': }
    package { 'vim-puppet': }
    package { 'curl': }

# Ensure ntp is installed.
    class { ntp:
        ensure     => running,
                   autoupdate => true,
    }



}
