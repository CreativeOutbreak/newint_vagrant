echo "Would you like to export the MySQL Drupal db?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) vagrant ssh -c "bash /var/parrot-dump-databases.sh"; break;;
        No ) break;;
    esac
done

echo "Would you like to export the PostgreSQL Legacy db?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) vagrant ssh -c "bash /vagrant/scripts/ni/pgdump.sh"; break;;
        No ) exit;;
    esac
done

echo "All done"
