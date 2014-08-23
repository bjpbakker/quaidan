#!/bin/bash

apt-get -y update
apt-get -y install libxml2-dev libxslt1-dev python-setuptools python-dev

#Start at the `/vagrant` directory after login.
echo "cd /vagrant" >> /home/vagrant/.profile
