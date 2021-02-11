#!/bin/bash

docker-compose kill &&
docker-compose rm -f &&
docker-compose build &&
docker-compose up agent &&
docker-compose up test &&
docker-compose up builder
