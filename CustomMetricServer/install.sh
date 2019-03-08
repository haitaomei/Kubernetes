#!/bin/bash

echo 'apiVersion: v1' > MetricServer/templates/tls.yaml
echo 'kind: Secret' >> MetricServer/templates/tls.yaml
echo 'metadata:' >> MetricServer/templates/tls.yaml
echo ' name: cm-adapter-serving-certs' >> MetricServer/templates/tls.yaml
echo ' namespace: {{ .Values.namespace }}' >> MetricServer/templates/tls.yaml
echo 'data:' >> MetricServer/templates/tls.yaml

echo ' 'serving.crt: $(cat server-crt.pem | base64 ) >> MetricServer/templates/tls.yaml
echo ' 'serving.key: $(cat server-key.pem | base64 ) >> MetricServer/templates/tls.yaml

helm install --name custom-metricserver MetricServer