
sh cleanup.sh

kubectl create -f PersistentVolumeClaim.yaml
kubectl create -f nginx.yaml
kubectl create -f nginxSvcNodePort.yaml
