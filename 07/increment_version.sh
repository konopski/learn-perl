#!/bin/bash

find . -name "deploy.yaml" | xargs perl -pi -e 's/centos6-operations:0.0.(.*)/"centos6-operations:0.0." . ($1+1)/e '

