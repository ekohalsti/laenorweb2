# Laenorweb2

## Backend

Backend source code is in `tag/` and `laenorweb2/`.

### Installation

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

### Running development mode

```
./manage.py runserver
```

Open [http://localhost:8000](http://localhost:8000) in browser.


## Frontend

Frontend source code is in `src/`.

### Installation

* Install node.js
* Install dependencies with

```
npm install
```

### Running development mode

```
npm run dev
```

Open [http://localhost:8001/](http://localhost:8001/) in browser.

This will load data from `localhost:8000` so backend should be running also.


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

### Application

Deploys the application backend, executes database migrations and configures nginx and uwsgi.

```
ansible-playbook -i hosts app.yml
```

If this fails on repository cloning, make sure that you have ssh-agent enabled and
private key added. Repository is fetched from github with your private key so that
additional deployment key is not needed.

Private key can be added to ssh-agent with:

```
ssh-add
```

Connection to github from server can be tested with:

```
ansible laenorweb2.dy.fi -i hosts -a "ssh -T git@github.com"

laenorweb2.dy.fi | FAILED | rc=1 >>
Hi rhietala! You've successfully authenticated, but GitHub does not provide shell access.non-zero return code
```

This is a successful reply even tough it says "FAILED". Error would probably be:

```
Permission denied (publickey).
```

