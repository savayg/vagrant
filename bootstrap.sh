#!/usr/bin/env bash
# Minimal bootstrap, some of this stuff should be moved to Vagrantfile

export LANGUAGE=en_US.utf-8
export LANG=en_US.utf-8
export LC_ALL=en_US.utf-8

sudo chown -R vagrant /usr/local/rvm

sudo apt-get install libpq-dev
sudo apt-get install imagemagick
apt-get install libicu-dev

git config --global user.name "Sava Gerov"
git config --global user.email sava.jg@gmail.com
git config --global color.ui true

wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh

sudo -u postgres psql -c "CREATE USER vagrant WITH PASSWORD 'password' CREATEDB;"

npm install -g bower
