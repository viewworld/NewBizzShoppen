NBS - NewBizzShoppen - Fair Platform
====================================

## Environments

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
