
sh cleanup.sh

kubectl create -f nginx.yaml,apache.yaml
kubectl create -f apacheSvcClusterIP.yaml,nginxSvcClusterIP.yaml
kubectl create -f ingress.yaml
