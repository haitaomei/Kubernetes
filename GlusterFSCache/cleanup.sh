#!/bin/bash

kubectl delete daemonset glusterfs > /dev/null 2>&1
kubectl delete deployment  glusterfs > /dev/null 2>&1