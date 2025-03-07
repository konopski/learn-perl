#!/bin/bash
perl -pi.old -e 's:^(.)*/([^/]+.py):$2:' cron_scripts
