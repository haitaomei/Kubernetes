

source config.sh

kubectl delete -n ${NAMESPACE} secret ingress-secret

helm delete --purge testapp