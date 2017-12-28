#!/bin/bash
docker exec -ti monitoring_django ./manage.py "$@"
