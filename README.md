NBS - Fair Platform
===================

## Environments

### Development

Add to your **.bashrc** or **.zshrc** file

```
export RUBY_HEAP_MIN_SLOTS=1000000
export RUBY_HEAP_SLOTS_INCREMENT=1000000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=1000000000
export RUBY_HEAP_FREE_MIN=500000
```

And reload the environment or `. ~/.bashrc`.

### Staging

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
