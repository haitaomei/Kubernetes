kubectl delete deploy nginx-deployment > /dev/null 2>&1
kubectl delete svc nginxsvc > /dev/null 2>&1
kubectl delete hpa nginx-hpa > /dev/null 2>&1