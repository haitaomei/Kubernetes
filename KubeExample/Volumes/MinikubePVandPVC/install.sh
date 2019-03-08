
sh cleanup.sh

sudo mkdir /mnt/data
sudo sh -c "echo 'Welcome to PVC.. It seems that nginx can read it' > /mnt/data/index.html"

kubectl create -f PersistentVolume.yaml
kubectl create -f PersistentVolumeClaim.yaml
kubectl create -f nginx.yaml
kubectl create -f nginxSvcNodePort.yaml
