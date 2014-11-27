#!/bin/bash

NI_DIR="/vagrant_nidata"


# Setup Drupal
echo "Cloning Drupal7 repo"

DIR="$NI_DIR/drupal7"

if [ -d "$DIR" ]; then
  # look for empty dir
  cd $DIR 
  if [ "$(ls -A $DIR)" ]; then
    git pull origin 7.x
  else
    git clone --branch 7.x http://git.drupal.org/project/drupal.git .
  fi
else
  mkdir $DIR
  cd $DIR
  git clone --branch 7.x http://git.drupal.org/project/drupal.git .
fi

cp -R "$DIR/." /var/www/drupal7/. 

#git clone --branch 7.x http://git.drupal.org/project/drupal.git .
echo "Drush installing site"
cd /var/www/drupal7
sudo cp /var/www/drupal7/sites/default/default.settings.php /var/www/drupal7/sites/default/settings.php
#drush @drupal7 si standard -y
sudo drush -y site-install standard --account-name=root --account-pass=root --db-url="mysql://root:root@localhost/drupal7"

# echo "Running drush make file --no-core"
# drush make /nidata/drupal7.make --no-core -y


