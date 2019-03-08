
rm -rf ./username.txt
rm -rf ./password.txt

kubectl delete deploy nginx-deployment > /dev/null 2>&1
kubectl delete secret mysecret > /dev/null 2>&1