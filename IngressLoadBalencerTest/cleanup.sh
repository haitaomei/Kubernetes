kubectl delete deploy uploadserver-deployment > /dev/null 2>&1
kubectl delete svc uploadserversvc > /dev/null 2>&1
kubectl delete ing test-ingress  > /dev/null 2>&1