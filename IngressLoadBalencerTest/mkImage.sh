#!/bin/bash
docker login -u khitaomei -p galaxy123

docker build -t khitaomei/upload:latest .
docker push khitaomei/upload:latest