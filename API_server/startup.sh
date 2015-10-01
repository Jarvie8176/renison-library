#!/bin/bash

nohup python ./manage.py runserver 0.0.0.0:8000 > django_log.out &
nohup http-server webapp/templates -p 9000 > angular_log.out &

