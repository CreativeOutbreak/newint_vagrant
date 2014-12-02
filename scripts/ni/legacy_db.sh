#!/bin/bash

NI_DIR="/vagrant_nidata"



if [ -f $NI_DIR/pgdb/newint2.sql ]; then
    # Check to see if the drupal install has been set up once and the psql db has been exported.
    echo "Importing psql from latest db dump"
    NI_SQL="$NI_DIR/pgdb/newint2.sql"
    cat $NI_SQL | sudo -u newint2 psql newint2
elif [ -f $NI_DIR/newint2.sql ]; then
    # If the above is not true, then check if the psql dump exists.
    echo "Importing psql from newint2 db dump"
    NI_SQL="$NI_DIR/newint2.sql"
    cat $NI_DIR/psql.txt | sudo -u postgres psql
    cat $NI_SQL | sudo -u newint2 psql newint2
    cat $NI_DIR/join_views.sql | sudo -u newint2 psql newint2
else
    # If the above is not true, then we need to downloaded it and set it all up.
    echo "Downloading newint2 and then importing it." 
    NI_SQL="$NI_DIR/newint2.sql"
    wget --user file_admin --password RadicalFish7 -O "$NI_DIR/newint2.sql.tar.gz" http://dev2.newint.org/files/newint2.sql.tar.gz 
    tar -zxvf "$NI_DIR/newint2.sql.tar.gz" -C $NI_DIR/
    sudo rm -R "$NI_DIR/newint2.sql.tar.gz"
    cat $NI_DIR/psql.txt | sudo -u postgres psql
    cat $NI_SQL | sudo -u newint2 psql newint2
    cat $NI_DIR/join_views.sql | sudo -u newint2 psql newint2
fi

echo "Legacy db imported"
