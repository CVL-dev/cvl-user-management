#!/bin/bash

cd /opt/cvl-user-management/python && /usr/bin/celery -A utils worker --loglevel=info --no-color
