# README

## Install Ruby

### Run this commands

```
sudo apt install curl
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

sudo apt-get update
sudo apt-get install git-core zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev software-properties-common libffi-dev nodejs yarn
```
### Using rbenv

```
cd
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
exec $SHELL

git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
exec $SHELL

rbenv install 2.6.3
rbenv global 2.6.3
ruby -v
```

### Install bundler

```
gem install bundler
```
## Instal Rails

### Run this commands

```
gem install rails -v 6.0.0.rc1
rbenv rehash
rails -v
# Rails 6.0.0.rc1
```

## Install Postgres

### Run this commands

```
sudo apt install postgresql-10 libpq-dev
# change chris for you username
sudo -u postgres createuser chris -s
# If you would like to set a password for the user, you can do the following
sudo -u postgres psql
# change chris for you username
postgres=# \password chris
```

## Finally

```
# Modify the config/database.yml file to contain the username/password that you specified

# Create the database
rake db:create

rails server

#The app is running in http://localhost:3000
```
