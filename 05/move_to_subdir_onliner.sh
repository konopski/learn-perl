#!/bin/bash
#

# create directories

for i in {1..200} 
do
  mkdir -p $i
done

# make a list
ls -1 -d */ > directory_list

mkdir -p subdir

# move them ll
perl -nle 'rename($_, "subdir/$_")' directory_list

