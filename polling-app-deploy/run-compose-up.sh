#!/usr/bin/env bash

# Creating local database volume folder
mkdir -p /tmp/datadir

# Copying backend and frontend builds to artifacts folders
cp ../polling-app-server/target/polls-*.jar ./backend/artifacts/polls.jar
cp -r ../polling-app-client/build/* ./frontend/artifacts/

docker pull openjdk:8-jdk-alpine
docker-compose build
docker-compose down
docker-compose up -d
