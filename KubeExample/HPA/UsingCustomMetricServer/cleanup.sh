
kubectl delete deploy hpa-exp-dep > /dev/null 2>&1
kubectl delete svc apachevc > /dev/null 2>&1
kubectl delete hpa apache-hpa > /dev/null 2>&1