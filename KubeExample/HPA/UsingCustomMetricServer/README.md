# Kubernetes HPA Examples

1. First, **you need to check if a metric API server has been setup.** If not sure, using the following command

    ``kubectl get --raw "/apis/metrics.k8s.io/v1beta1/nodes" | jq .``

    It should not return nothing if installed properly.

    If you want to install one, a standard/custome metric API server can be found: https://github.com/stefanprodan/k8s-prom-hpa. Standard metric server only provides CPU and memory info, while custome server provides additional metrics, such as http requests/second, etc.

2. run ``hpa.sh`` to install the example

3. run ``kubectl get pods`` to monitor how many pods are running, currently, it should be only 1 pod is running

4. run ``reqSimulate.sh`` to increase the load of the target pod. Note that, you should replace the ip address in this script with your own cluster's public ip or ingress url

5. If multiple pods are now, it indicates that the HPA is working. Note that the downscale-delay (default value is 5 minutes) and upscale-delay (default value is 5 minutes) to make the scaling does not take effect immediately


More information can be found at:
https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale-walkthrough/