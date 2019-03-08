#!/bin/bash

rm -rf gRPCServer
env GOOS=linux go build

docker build -f Dockerfile -t khitaomei/grpc:server .
docker push khitaomei/grpc:server

docker image rm --force $(docker image ls | grep khitaomei/grpc:server | awk ' { print $3 } ' )

rm -rf gRPCServer