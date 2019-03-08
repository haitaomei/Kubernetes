
kubectl delete deploy nginx-deployment > /dev/null 2>&1
kubectl delete deploy apache-deployment > /dev/null 2>&1
kubectl delete svc apachesvc > /dev/null 2>&1
kubectl delete svc nginxsvc > /dev/null 2>&1
kubectl delete ing exp-ingress > /dev/null 2>&1