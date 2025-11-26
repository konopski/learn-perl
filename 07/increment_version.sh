#!/bin/bash

find . -name "deploy.yaml" | xargs perl -pi -e 's/(centos6-.*operations:)(\d+(?:\.\d+)*)\.(\d+)/$1 . $2 . "." . ($3+1)/e '
find . -name "cron.yaml" | xargs perl -pi -e 's/(centos6-.*operations-cron:)(\d+(?:\.\d+)*)\.(\d+)/$1 . $2 . "." . ($3+1)/e '

