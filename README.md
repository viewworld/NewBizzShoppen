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

**Setup your .rvmrc**

* `rvm use ree@nbs --create`

**Install gems**

* `bundle`

In case of problems installing Gherkin, run `gem install gherkin -v '2.3.5' -- --with-cflags=-w` and then `bundle` again

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

## Testing

#### Running tests

* To run unit tests suite, run `rspec spec`
* To run acceptance tests suite, run `cucumber`


## Staging

Applications:

- fairleads.selleo.com
- fairdeals.selleo.com
- faircalls.selleo.com
- erhvervsanalyse.selleo.com

HTTP Basi Auth credentials:

- username: fairleads
- password: staging

#### Rails Console

```
ssh rails@fairleads.com
cd /srv/nbs/staging/current
RAILS_ENV=staging bundle exec rails c
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
