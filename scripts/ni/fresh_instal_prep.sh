mysqladmin -uroot -proot drop drupal7
cd /vagrant_sites/newint/web/sites/default
chmod u+wX . -R
sudo rm /vagrant_sites/newint/web/sites/default/settings.php
sudo rm /vagrant_databases/*.sql
touch /vagrant_databases/drupal7.sql
echo "All done, you just need to run vagrant provision from your machine."
