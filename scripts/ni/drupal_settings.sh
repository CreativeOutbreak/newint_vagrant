#!/bin/bash

NI_DIR="/vagrant_nidata"

dbs="name:legacy database:newint2 username:newint2 password:root host:localhost driver:pgsql"

echo "run command to update settings.php"
IFS=" " read -a fields <<< "$dbs"

s='$databases['
d=''
e='),);'
a=''
for (( i=0 ; i < ${#fields[@]} ; i++ )) ; do
    f=${fields[i]}
    IFS=: read -a vals <<< "$f"
    key=${vals[0]}
    if [ "$key" = "name" ]; then
      s=$s"'${vals[1]}'] = array('default' => array("
    else
      d=$d"'${vals[0]}' => '${vals[1]}',"
    fi 
    last=$(( i+1 == ${#fields[@]} ))
    if [ last ]; then
      a=$s$d$e
    fi
done
chmod 777 /var/www/drupal7/sites/default/settings.php 
echo $a >> /var/www/drupal7/sites/default/settings.php


echo "Clear Cache for drupal7"
cd /var/www/drupal7
drush cc all

#echo "Drupal modules"
#drush @drupal7 pml

echo "Print maz"
drush maz --all

echo "migrate tags"
drush mi NewIntTermSQL -v

echo "join other tables"
cat $NI_DIR/second_join_views.sql | sudo -u newint2 psql newint2
