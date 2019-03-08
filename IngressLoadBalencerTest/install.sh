
# delete all
sh cleanup.sh

kubectl create -f server.yaml
kubectl create -f service.yaml
kubectl create -f ingress.yaml