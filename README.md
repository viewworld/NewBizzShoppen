NBS - Fair Platform
===================

## Prerequisites

### Development

#### Environment

**Install ruby: ree 1.8.7**

On OSX Mavericks you can use following code to install REE

```
export CPPFLAGS=-I/opt/X11/include
xcode-select --install
rvm reinstall ree-1.8.7-2012.02
```

or

```
rvm install ree --without-tcl --without-t
```

***Mac OS X Yosemite***

```
brew install gcc48
rvm reinstall ree-1.8.7 --without-tcl --without-tk --with-gcc=gcc-4.8
```

**Setup your .rvmrc**

`rvm use ree@nbs --create`

**Install gems**

`bundle`

In case of problems installing Gherkin, run `gem install gherkin -v '2.3.5' -- --with-cflags=-w` and then `bundle` again

It might happen that `eventmachine` won't be installed out of the box, than run `gem install eventmachine -v '1.0.3' -- --with-cflags=-`.

If you experience following error when installing `active-admin`

```
ArgumentError: wrong number of arguments (1 for 0)
An error occurred while installing activeadmin (0.3.4), and Bundler cannot continue.
Make sure that `gem install activeadmin -v '0.3.4'` succeeds before bundling.
```

then try running `gem update bundler` and then `bundle` again

#### Database setup

* Copy `database.example.yml` to `database.yml`
* Amend your db user name within `database.yml` if necessary
* `rake db:create db:migrate`

In case you experience following error

```
rake aborted!
syntax error on line 50, col 11: `'
```

please, double check if db user name is present within `database.yml`

#### PDF (pisa.py)

```
sudo apt-get install python python-setuptools
sudo apt-get install python-dev build-essential libfreetype6 libfreetype6-dev
sudo easy_install html5lib
sudo easy_install reportlab
sudo easy_install pisa
```

On Mac OS X just install python extensions.

#### Domains

```
/etc/hosts
(ubuntu)
127.0.1.1	faircalls.dk
127.0.1.1	faircalls.eu
127.0.1.1	fairdeals.dk
127.0.1.1	erhvervsanalyse.dk
127.0.1.1	fairdeals.com
(osx)
127.0.0.1	faircalls.dk
127.0.0.1	faircalls.eu
127.0.0.1	fairdeals.dk
127.0.0.1	erhvervsanalyse.dk
127.0.0.1	fairdeals.com
```

#### Speed up development

Add to your **.bashrc** or **.zshrc** file

```
export RUBY_HEAP_MIN_SLOTS=1000000
export RUBY_HEAP_SLOTS_INCREMENT=1000000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=1000000000
export RUBY_HEAP_FREE_MIN=500000
```

And reload the environment or `. ~/.bashrc`.

#### Download database from production

```
ssh rails@fairleads.com # check proper directory, then from local terminal run (for example):
scp rails@fairleads.com:/mnt/backup/backups/fairleads_db_backup/2014.01.20.00.00.02/fairleads_db_backup.tar backup_sql.tar
chmod 0777 backup_sql.tar # the you will be able to unizp a file
psql nbs_development < nbs_production.sql
```

### Testing

#### Running tests

* Prepare your database

```
RAILS_ENV=test bundle exec rake db:drop db:create db:migrate
RAILS_ENV=test bundle exec thor nbs:seed
RAILS_ENV=test bundle exec thor nbs:t
```

* To run unit tests suite, run `rspec spec`

#### Run Cucumber features on local machine

* Prepare your database:

```
RAILS_ENV=test bundle exec rake nbs:refresh_test_db
```

* Download Firefox (17.0) [mac version](http://download-euro.oldapps.com/Firefox/Apple/Firefox%2017.0.2esr.dmg) and export it to `Downloads` directory.
* To run acceptance tests suite, run `FIREFOX_PATH=~/Downloads/Firefox.app/Contents/MacOS/firefox-bin cucumber`

### Local CI

```
# Run CruiseControl.rb

ssh tgn@192.168.10.23
cd projects/cruisecontrol.rb/
rvm use ree@cruise
bundle
bundle exec ./cruise start &
```

Visit local [CruiseControl.rb](http://192.168.10.23:3333)

## Staging

Applications:

- [fairleads.selleo.com](http://fairleads.selleo.com/)
- [fairdeals.selleo.com](http://fairdeals.selleo.com/)
- [faircalls.selleo.com](http://faircalls.selleo.com/)
- [erhvervsanalyse.selleo.com](http://erhvervsanalyse.selleo.com/)

HTTP Basi Auth credentials:

- username: fairleads
- password: staging

Admin credentials:

- username: aossowski@gmail.com
- password: secret

#### Rails Console

```
ssh rails@fairleads.com
cd /srv/nbs/staging/current
RAILS_ENV=staging bundle exec rails c
```

if you want to have all user's passwords set to 'secret' then run

```
User.all.each{|u| u.send(:secretize_password!)};nil
```

#### Deployment

Deploy from **master** branch.

```
cap deploy
```

#### Mailer

All emails are stored in **log/emails** directory.

```
cd /srv/nbs/staging/current/log/emails
```

#### Mailcatcher

Address: [http://144.76.32.51:10801/](http://144.76.32.51:10801/)

Run:

```
ssh rails@fairleads.com
cd /srv/nbs/staging/current
cd /srv/nbs/staging/current; mailcatcher --http-port 10801 --smtp-ip localhost --http-ip 144.76.32.51 --smtp-port 1025 &
```

Stop:

```
ssh rails@fairleads.com
cd /srv/nbs/staging/current
ps aux | grep staging | grep mailcatcher | awk {'print $2'} | xargs kill -QUIT
```

#### Import database from production

```bash
ssh rails@fairleads.com
copy latest backup from

cp /mnt/backup/backups/fairleads_db_backup/2014.02.21.00.00.03/fairleads_db_backup.tar ~/latest_backup.tar
chmod 666 ~/latest_backup.tar
gunzip fairleads_db_backup/databases/PostgreSQL/nbs_production.sql.gz (overwrite yes - y)

createdb staging_2014_02_21
psql -d staging_2014_02_21 < fairleads_db_backup/databases/PostgreSQL/nbs_production.sql

vim /srv/nbs/staging/etc/database.yml -> replace current database to tmp_database
```

From local terminal

```bash
cap deploy #
```

## Production

Applications:

- [fairleads.com](http://www.fairleads.com/) / [fairleads.dk](http://www.fairleads.dk/)
- [fairdeals.dk](http://www.fairdeals.dk/)
- [faircalls.dk](http://www.faircalls.dk/)
- [erhvervsanalyse.dk](http://www.erhvervsanalyse.dk/)

#### Rails Console

```
ssh rails@fairleads.com
cd /srv/nbs/production/current
RAILS_ENV=production bundle exec rails c
```

#### Deployment

Deploy from **staging** branch.

```
cap production deploy
```

## Monitoring

### NewRelic Server Setup

Go through steps from [page](https://rpm.newrelic.com/accounts/477822/servers/get_started#platform=debian).

### Monit

You can check stats [here](http://admin:s3ll3o@fairleads.com:2812)
