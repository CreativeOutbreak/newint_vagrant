#!/bin/bash

#SQL_FILE = '/vagrant_nidata/pgdb/newint2.sql' 

if [ -f /vagrant_nidata/pgdb/newint2.sql ]; then
    sudo mv /vagrant_nidata/pgdb/newint2.sql /vagrant_nidata/pgdb/newint2-old.sql
fi
sudo -u postgres pg_dump newint2 > /vagrant_nidata/pgdb/newint2.sql
