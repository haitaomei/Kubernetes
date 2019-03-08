
sh cleanup.sh

echo -n 'haitao' > ./username.txt
echo -n 'ht123a' > ./password.txt

kubectl create secret generic mysecret --from-file=./username.txt --from-file=./password.txt
kubectl create -f nginx.yaml


