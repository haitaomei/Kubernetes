kubectl delete deploy nginx-deployment > /dev/null 2>&1
kubectl delete pvc nginx-pvc > /dev/null 2>&1
kubectl delete svc nginxsvc > /dev/null 2>&1