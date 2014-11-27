#!/bin/bash

NI_DIR="/vagrant_nidata"

cat $NI_DIR/psql.txt | sudo -u postgres psql

cat $NI_DIR/newint2.sql | sudo -u newint2 psql newint2

cat $NI_DIR/join_views.sql | sudo -u newint2 psql newint2
