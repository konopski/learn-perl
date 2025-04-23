#!/bin/bash

find . -name "deploy.yaml" | xargs perl -pi -e 's/centos6-(.*)operations:0.0.(.*)/"centos6-$1operations:0.0." . ($2+1)/e '

