#!/bin/bash

docker-compose build
docker-compose run backend --service-ports --name=backend