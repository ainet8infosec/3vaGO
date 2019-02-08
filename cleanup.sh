#!/bin/bash

num=`docker-machine ls --filter name=devnode --format "{{.Name}}" | wc -l`

if [ ! "$(docker service ls | grep devnode-1)" ]; 
then
  for ((i=$num+3; i <= $num+7; i++)) ; do
    docker-machine rm -y \
    devnode-$i;
  done
else
  for ((i=1; i <= $num; i++)) ; do
    docker-machine rm -y \
    devnode-$i;
  done
fi
