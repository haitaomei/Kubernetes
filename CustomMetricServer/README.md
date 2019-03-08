# Custom Metric Server

Install
-----

Before install (optional), if you want a different namespace, please configure it at MetricServer/values.yaml, and server.cnf's CN. Then run ``generateCert.sh`` to generate certificate and key used by API server.

Run ``install.sh`` to deploy the API metric server into the Kubernetes cluster.

Uninstall
----
Run ``cleanup.sh``

How do I know if it is working or not?
---
Run the following command:

``kubectl get --raw "/apis/custom.metrics.k8s.io/v1beta1/namespaces/default/pods/*/memory_usage_bytes" | jq .``

If you have pods running in the ``defualt`` namesapce, it should return something similar to the following

    {
    "kind": "MetricValueList",
    "apiVersion": "custom.metrics.k8s.io/v1beta1",
    "metadata": {
        "selfLink": "/apis/custom.metrics.k8s.io/v1beta1/namespaces/default/pods/%2A/memory_usage_bytes"
    },
    "items": [        
        {
        "describedObject": {
            "kind": "Pod",
            "namespace": "default",
            "name": "oddk-oddk-596458bcb7-nv4hg",
            "apiVersion": "/__internal"
        },
        "metricName": "memory_usage_bytes",
        "timestamp": "2018-07-19T15:22:57Z",
        "value": "11423744"
        },
        {
        "describedObject": {
            "kind": "Pod",
            "namespace": "default",
            "name": "oddk-tm1-router-65587f4955-2dthg",
            "apiVersion": "/__internal"
        },
        "metricName": "memory_usage_bytes",
        "timestamp": "2018-07-19T15:22:57Z",
        "value": "25948160"
        }
    ]
    }

In addition, ``kubectl get --raw "/apis/custom.metrics.k8s.io/v1beta1" | jq .`` gives you all the possible metrics.

How does HPA work with this custom metric API server
-----
1. We declear the metrics we wanted in HPA

2. HPA contat the Kubernetes API aggratation layer to find this API server

3. This API server returns the metic requested by HPA

````
apiVersion: autoscaling/v2beta1
kind: HorizontalPodAutoscaler
metadata:
name: apache-hpa
spec:
scaleTargetRef:
    apiVersion: extensions/v1beta1
    kind: Deployment
    name: hpa-exp-dep
minReplicas: 1
maxReplicas: 9
metrics:
- type: Resource
    resource:
    name: cpu
    targetAverageUtilization: 70
````

How can I get cutomised metrics, such as http requests per second?
-----
Firstly, we the pod that we want to moniter calculate these metrics by itself. Then this pod will need to open a http server for Prometheus to collect these metrics.
More details please see: https://godoc.org/github.com/prometheus/client_golang/prometheus

An example that exposes CPU tempareture can be found at: https://github.com/haitaomei/Go-Demo/blob/master/Prometheus_Metric_Publish_Pod/main.go  After deploying this example, wait for a while,

``kubectl get --raw "/apis/custom.metrics.k8s.io/v1beta1/namespaces/default/pods/*/cpu_temperature_celsius" | jq .``

Will give 
````
{
  "kind": "MetricValueList",
  "apiVersion": "custom.metrics.k8s.io/v1beta1",
  "metadata": {
    "selfLink": "/apis/custom.metrics.k8s.io/v1beta1/namespaces/default/pods/%2A/cpu_temperature_celsius"
  },
  "items": [
    {
      "describedObject": {
        "kind": "Pod",
        "namespace": "default",
        "name": "custom-metric-deploy-69cfd8bf94-bkvfs",
        "apiVersion": "/__internal"
      },
      "metricName": "cpu_temperature_celsius",
      "timestamp": "2018-07-30T10:24:11Z",
      "value": "65300m"
    },
    {
      "describedObject": {
        "kind": "Pod",
        "namespace": "default",
        "name": "custom-metric-deploy-69cfd8bf94-jxxh9",
        "apiVersion": "/__internal"
      },
      "metricName": "cpu_temperature_celsius",
      "timestamp": "2018-07-30T10:24:11Z",
      "value": "65300m"
    },
    {
      "describedObject": {
        "kind": "Pod",
        "namespace": "default",
        "name": "custom-metric-deploy-69cfd8bf94-z9nrt",
        "apiVersion": "/__internal"
      },
      "metricName": "cpu_temperature_celsius",
      "timestamp": "2018-07-30T10:24:11Z",
      "value": "65300m"
    }
  ]
}
````

Additional Readings
-----
The process of setup an extension API server: https://kubernetes.io/docs/tasks/access-kubernetes-api/setup-extension-api-server/

A sample API server can be found at here: https://github.com/kubernetes/kubernetes/tree/master/staging/src/k8s.io/sample-apiserver

An important concept is API Aggregation: https://kubernetes.io/docs/concepts/extend-kubernetes/api-extension/apiserver-aggregation/,  https://github.com/kubernetes-incubator/apiserver-builder/blob/master/docs/concepts/aggregation.m

Setting up the Prometheus adapter on your cluster and configuring an autoscaler to use application metrics sourced from the adapter can be found at here: https://github.com/DirectXMan12/k8s-prometheus-adapter/blob/master/docs/walkthrough.md
