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
