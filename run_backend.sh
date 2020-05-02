#!/bin/bash

docker-compose build
docker-compose run --service-ports --name=backend backend
