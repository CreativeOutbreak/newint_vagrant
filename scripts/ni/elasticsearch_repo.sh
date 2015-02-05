#!/bin/bash

# Make sure we've got the add-apt-repository command
sudo apt-get install software-properties-common python-software-properties -y

# Added apt-key and repository for elasticsearch.
wget -qO - https://packages.elasticsearch.org/GPG-KEY-elasticsearch | sudo apt-key add -
sudo add-apt-repository "deb http://packages.elasticsearch.org/elasticsearch/1.4/debian stable main"

# Update apt-get
sudo apt-get update
