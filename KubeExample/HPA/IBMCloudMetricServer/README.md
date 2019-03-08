# Kubernetes HPA Examples

1. run ``hpa.sh`` to install the example

2. run ``kubectl get pods`` to monitor how many pods are running, currently, it should be only 1 pod is running

3. run ``reqSimulate.sh`` to increase the load of the target pod. Note that, you should replace the ip address in this script with your own cluster's public ip or ingress url

4. If multiple pods are now, it indicates that the HPA is working. Note that the downscale-delay (default value is 5 minutes) and upscale-delay (default value is 5 minutes) to make the scaling does not take effect immediately