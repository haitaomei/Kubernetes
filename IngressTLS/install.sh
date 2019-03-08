
source config.sh

kubectl create -n ${NAMESPACE} secret tls ingress-secret --key IngTLS/server-key.pem --cert IngTLS/server-crt.pem

helm install --set namespacevalue=${NAMESPACE} --name testapp IngTLS/