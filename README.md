# Laenorweb2

## Installation

* Create db
* Create db user
* Set credentials to local_settings.py with guidance from settings.py
* Create virtualenv
* Install dependencies with:

```
pip install -r requirements.txt
```

* Create db tables &
* Create static content with:

```
./manage.py makemigrations
./manage.py migrate
./manage.py collectstatic
```

## Test API

```
./manage.py runserver
```

## Deployment

### Adding users to server

* Install ansible
* Add your username to `deploy/group_vars/all/vars.yml` and public key to
  `deploy/roles/users/files/<username>.pub`
* Commit, push, ask for someone with access to execute

```
ansible-playbook -i hosts users.yml
```

* Try that you can login to `laenorweb2.dy.fi` and sudo without password

### Server configuration

This playbook will configure basic linux stuff such as firewall, hostname,
ntp, etc. and also the software required to run the application.

It also upgrades all apt packages to latest safe versions, so should be
run regularly.

```
ansible-playbook -i hosts servers.yml
```
