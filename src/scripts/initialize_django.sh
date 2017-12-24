#!/bin/bash
pip3 install -r requirements.txt
python3 manage.py collectstatic --noinput
python3 manage.py migrate
/usr/local/bin/gunicorn monitoring.wsgi:application -w 2 -b :8000 --reload