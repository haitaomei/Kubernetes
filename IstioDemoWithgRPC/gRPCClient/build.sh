#!/bin/bash

rm -rf gRPCClient
env GOOS=linux go build

docker build -f Dockerfile -t khitaomei/grpc:client .
docker push khitaomei/grpc:client

docker image rm --force $(docker image ls | grep khitaomei/grpc:client | awk ' { print $3 } ' )

rm -rf gRPCClient