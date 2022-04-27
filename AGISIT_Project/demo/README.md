# Capstone Project

AGISIT 20201-2022

Authors
============

**Team 39A**

| Number | Name              | Username                                       | Email										 |
| -------|-------------------|------------------------------------------------| ---------------------------------------------|
| 87704 | Samuel Vicente |[https://git.rnl.tecnico.ulisboa.pt/ist187704](https://git.rnl.tecnico.ulisboa.pt/ist187704) | [samuel.vicente@tecnico.ulisboa.pt](mailto:samuel.vicente@tecnico.ulisboa.pt) |
| 86392 | Bruno Dias |[https://git.rnl.tecnico.ulisboa.pt/ist186392](https://git.rnl.tecnico.ulisboa.pt/ist186392) | [bruno.ramos.dias@tecnico.ulisboa.pt](mailto:bruno.ramos.dias@tecnico.ulisboa.pt) |
| 92510 | Lúcia Silva | [https://git.rnl.tecnico.ulisboa.pt/ist192510](https://git.rnl.tecnico.ulisboa.pt/ist192510) | [lucia.silva@tecnico.ulisboa.pt](mailto:lucia.silva@tecnico.ulisboa.pt) |



Project Demo
============

Overview of the `default` namespace
------------

This namespace is where the application services reside.

Command:
```txt
$ kubectl get all -n default
```

Output:
```txt
NAME                               READY   STATUS    RESTARTS   AGE
pod/bootstorage-6bcd494fc4-lld2v   1/1     Running   0          41h
pod/expressed-d5ff4c6d4-8nj5k      1/1     Running   0          41h
pod/happy-79d85bc85-79cvb          1/1     Running   0          41h
pod/redis-585c6fb9b7-46pf2         1/1     Running   0          14m
pod/vuecalc-65fdcc4476-ng7xl       1/1     Running   0          41h

NAME                      TYPE           CLUSTER-IP     EXTERNAL-IP   PORT(S)        AGE
service/bootstorage-svc   ClusterIP      10.3.198.226   <none>        5000/TCP       41h
service/expressed-svc     ClusterIP      10.0.37.236    <none>        3000/TCP       41h
service/happy-svc         ClusterIP      10.0.179.14    <none>        4000/TCP       41h
service/kubernetes        ClusterIP      10.0.0.1       <none>        443/TCP        41h
service/redis             ClusterIP      None           <none>        6379/TCP       41h
service/vuecalc-svc       ClusterIP      10.0.254.12    <none>        2000/TCP       41h

NAME                          READY   UP-TO-DATE   AVAILABLE   AGE
deployment.apps/bootstorage   1/1     1            1           41h
deployment.apps/expressed     1/1     1            1           41h
deployment.apps/happy         1/1     1            1           41h
deployment.apps/redis         1/1     1            1           41h
deployment.apps/vuecalc       1/1     1            1           41h

NAME                                     DESIRED   CURRENT   READY   AGE
replicaset.apps/bootstorage-6bcd494fc4   1         1         1       41h
replicaset.apps/expressed-d5ff4c6d4      1         1         1       41h
replicaset.apps/happy-79d85bc85          1         1         1       41h
replicaset.apps/redis-585c6fb9b7         1         1         1       41h
replicaset.apps/vuecalc-65fdcc4476       1         1         1       41h
```

As we can see, none of the services in this namespace have external IP addresses.

Overview of the `kube-prometheus` namespace
------------

This namespace is where the monitoring stack resides.

Command:
```txt
$ kubectl get all -n kube-prometheus
```

Output:
```txt
NAME                                                         READY   STATUS    RESTARTS   AGE
pod/alertmanager-kube-prometheus-kube-prome-alertmanager-0   2/2     Running   0          41h
pod/kube-prometheus-grafana-b774f9656-rlwr2                  2/2     Running   0          40h
pod/kube-prometheus-kube-prome-operator-dcd6f8f7-6pq9h       1/1     Running   0          41h
pod/kube-prometheus-kube-state-metrics-8f6bcb8d8-kkj2n       1/1     Running   0          41h
pod/kube-prometheus-prometheus-node-exporter-dhx2z           1/1     Running   0          41h
pod/kube-prometheus-prometheus-node-exporter-dwgbr           1/1     Running   0          41h
pod/kube-prometheus-prometheus-node-exporter-t49jh           1/1     Running   0          41h
pod/prometheus-kube-prometheus-kube-prome-prometheus-0       2/2     Running   0          36h

NAME                                               TYPE        CLUSTER-IP     EXTERNAL-IP   PORT(S)                      AGE
service/alertmanager-operated                      ClusterIP   None           <none>        9093/TCP,9094/TCP,9094/UDP   41h
service/kube-prometheus-grafana                    ClusterIP   10.1.132.102   <none>        80/TCP                       41h
service/kube-prometheus-kube-prome-alertmanager    ClusterIP   10.1.151.73    <none>        9093/TCP                     41h
service/kube-prometheus-kube-prome-operator        ClusterIP   10.2.20.6      <none>        443/TCP                      41h
service/kube-prometheus-kube-prome-prometheus      ClusterIP   10.3.47.42     <none>        9090/TCP                     41h
service/kube-prometheus-kube-state-metrics         ClusterIP   10.3.250.63    <none>        8080/TCP                     41h
service/kube-prometheus-prometheus-node-exporter   ClusterIP   10.3.95.132    <none>        9100/TCP                     41h
service/prometheus-operated                        ClusterIP   None           <none>        9090/TCP                     41h

NAME                                                      DESIRED   CURRENT   READY   UP-TO-DATE   AVAILABLE   NODE SELECTOR   AGE
daemonset.apps/kube-prometheus-prometheus-node-exporter   3         3         3       3            3           <none>          41h

NAME                                                  READY   UP-TO-DATE   AVAILABLE   AGE
deployment.apps/kube-prometheus-grafana               1/1     1            1           41h
deployment.apps/kube-prometheus-kube-prome-operator   1/1     1            1           41h
deployment.apps/kube-prometheus-kube-state-metrics    1/1     1            1           41h

NAME                                                           DESIRED   CURRENT   READY   AGE
replicaset.apps/kube-prometheus-grafana-65c7bffdcb             0         0         0       41h
replicaset.apps/kube-prometheus-grafana-b774f9656              1         1         1       40h
replicaset.apps/kube-prometheus-kube-prome-operator-dcd6f8f7   1         1         1       41h
replicaset.apps/kube-prometheus-kube-state-metrics-8f6bcb8d8   1         1         1       41h

NAME                                                                    READY   AGE
statefulset.apps/alertmanager-kube-prometheus-kube-prome-alertmanager   1/1     41h
statefulset.apps/prometheus-kube-prometheus-kube-prome-prometheus       1/1     36h
```

As we can see, none of the services in this namespace have external IP addresses.

Overview of the `ingress-controller` namespace
------------

This namespace is where the NGINX ingress controller resides.

Command:
```txt
$ kubectl get all -n ingress-controller
```

Output:
```txt
NAME                                            READY   STATUS    RESTARTS   AGE
pod/ingress-nginx-controller-777d8b54b7-ktgzm   1/1     Running   0          41h

NAME                                         TYPE           CLUSTER-IP     EXTERNAL-IP     PORT(S)                      AGE
service/ingress-nginx-controller             LoadBalancer   10.0.171.103   34.79.197.230   80:31699/TCP,443:32474/TCP   41h
service/ingress-nginx-controller-admission   ClusterIP      10.0.151.101   <none>          443/TCP                      41h
service/ingress-nginx-controller-metrics     ClusterIP      10.0.134.22    <none>          10254/TCP                    41h

NAME                                       READY   UP-TO-DATE   AVAILABLE   AGE
deployment.apps/ingress-nginx-controller   1/1     1            1           41h

NAME                                                  DESIRED   CURRENT   READY   AGE
replicaset.apps/ingress-nginx-controller-777d8b54b7   1         1         1       41h
```

As we can see, there is a LoadBalancer service with an external IP address for the ingress-nginx-controller, that acts as a reverse proxy.

There is also a metrics service running in order to monitor the controller.

Overview of the Ingress rules in our system
------------

Command:
```txt
$ kubectl get ing --all-namespaces
```

Output:
```txt
NAMESPACE         NAME                      CLASS    HOSTS   ADDRESS         PORTS   AGE
default           ingress                   <none>   *       34.79.197.230   80      41h
kube-prometheus   kube-prometheus-grafana   <none>   *       34.79.197.230   80      40h
```

As we can see we have two Ingress rules, one for the `kube-prometheus` namespace and one for the `default` namespace

We can get more information about them using the following command:

First for the application Ingress:

Command:
```txt
$ kubectl describe ing ingress -n default
```

Output:
```txt
Name:             ingress
Namespace:        default
Address:          34.79.197.230
Default backend:  vuecalc-svc:2000 (10.4.2.12:2000)
Rules:
  Host        Path  Backends
  ----        ----  --------
  *           
              /api/happy/         happy-svc:4000 (10.4.0.5:4000)
              /api/express/       expressed-svc:3000 (10.4.2.6:3000)
              /api/bootstorage/   bootstorage-svc:5000 (10.4.2.5:5000)
Annotations:  kubernetes.io/ingress.class: nginx
Events:       <none>
```

Then for the monitoring Ingress:

Command:
```txt
$ kubectl describe ing kube-prometheus-grafana -n kube-prometheus
```

Output:
```txt
Name:             kube-prometheus-grafana
Namespace:        kube-prometheus
Address:          34.79.197.230
Default backend:  default-http-backend:80 (10.4.2.4:8080)
Rules:
  Host        Path  Backends
  ----        ----  --------
  *           
              /grafana   kube-prometheus-grafana:80 (10.4.1.10:3000)
Annotations:  ingress.kubernetes.io/rewrite-target: /
              kubernetes.io/ingress.class: nginx
              meta.helm.sh/release-name: kube-prometheus
              meta.helm.sh/release-namespace: kube-prometheus
Events:       <none>
```

As we can see in the `Annotations`, both the Ingress rules are controlled by NGINX.

Overview of the Service Monitors
------------

With the following command we can see all the service monitors prometheus uses.

Command:
```txt
$ kubectl get servicemonitors --all-namespaces
```

Output:

```txt
NAMESPACE         NAME                                                 AGE
kube-prometheus   ingress-nginx-controller                             37h
kube-prometheus   kube-prometheus-kube-prome-alertmanager              42h
kube-prometheus   kube-prometheus-kube-prome-apiserver                 42h
kube-prometheus   kube-prometheus-kube-prome-coredns                   42h
kube-prometheus   kube-prometheus-kube-prome-grafana                   42h
kube-prometheus   kube-prometheus-kube-prome-kube-controller-manager   42h
kube-prometheus   kube-prometheus-kube-prome-kube-etcd                 42h
kube-prometheus   kube-prometheus-kube-prome-kube-proxy                42h
kube-prometheus   kube-prometheus-kube-prome-kube-scheduler            42h
kube-prometheus   kube-prometheus-kube-prome-kube-state-metrics        42h
kube-prometheus   kube-prometheus-kube-prome-kubelet                   42h
kube-prometheus   kube-prometheus-kube-prome-node-exporter             42h
kube-prometheus   kube-prometheus-kube-prome-operator                  42h
kube-prometheus   kube-prometheus-kube-prome-prometheus                42h
```

As we can see there is an entry for the NGINX controller, which we manually added.

To see the description of this service monitor in particular we can run the following command:

Command:
```txt
$ kubectl describe servicemonitor ingress-nginx-controller -n kube-prometheus
```

Output:

```txt
Name:         ingress-nginx-controller
Namespace:    kube-prometheus
Labels:       app.kubernetes.io/component=controller
              app.kubernetes.io/instance=ingress-nginx
              app.kubernetes.io/managed-by=Helm
              app.kubernetes.io/name=ingress-nginx
              app.kubernetes.io/version=1.0.5
              helm.sh/chart=ingress-nginx-4.0.9
Annotations:  meta.helm.sh/release-name: ingress-nginx
              meta.helm.sh/release-namespace: ingress-controller
API Version:  monitoring.coreos.com/v1
Kind:         ServiceMonitor
Metadata:
  Creation Timestamp:  2021-11-21T06:44:21Z
  Generation:          2
  Managed Fields:
    API Version:  monitoring.coreos.com/v1
    Fields Type:  FieldsV1
    fieldsV1:
      f:metadata:
        f:annotations:
          .:
          f:meta.helm.sh/release-name:
          f:meta.helm.sh/release-namespace:
        f:labels:
          .:
          f:app.kubernetes.io/component:
          f:app.kubernetes.io/instance:
          f:app.kubernetes.io/managed-by:
          f:app.kubernetes.io/name:
          f:app.kubernetes.io/version:
          f:helm.sh/chart:
      f:spec:
        .:
        f:endpoints:
        f:namespaceSelector:
          .:
          f:any:
        f:selector:
          .:
          f:matchLabels:
            .:
            f:app.kubernetes.io/component:
            f:app.kubernetes.io/instance:
            f:app.kubernetes.io/name:
    Manager:         terraform-provider-helm_v2.4.1_x5
    Operation:       Update
    Time:            2021-11-21T06:57:16Z
  Resource Version:  105490
  UID:               d98a0d71-8ed6-4762-842f-7c8266dff761
Spec:
  Endpoints:
    Interval:  30s
    Port:      metrics
  Namespace Selector:
    Any:  true
  Selector:
    Match Labels:
      app.kubernetes.io/component:  controller
      app.kubernetes.io/instance:   ingress-nginx
      app.kubernetes.io/name:       ingress-nginx
Events:                             <none>
```

As we can see here this service monitor will match services with these labels:
-	`app.kubernetes.io/component:  controller`
-	`app.kubernetes.io/instance:   ingress-nginx`
-	`app.kubernetes.io/name:       ingress-nginx`

If we then describe the `ingress-nginx-controller-metrics` service we will see that these labels are present:

Command:
```txt
$ kubectl describe svc ingress-nginx-controller-metrics -n ingress-controller
```

Output:

```txt
Name:              ingress-nginx-controller-metrics
Namespace:         ingress-controller
Labels:            app.kubernetes.io/component=controller
                   app.kubernetes.io/instance=ingress-nginx
                   app.kubernetes.io/managed-by=Helm
                   app.kubernetes.io/name=ingress-nginx
                   app.kubernetes.io/version=1.0.5
                   helm.sh/chart=ingress-nginx-4.0.9
Annotations:       meta.helm.sh/release-name: ingress-nginx
                   meta.helm.sh/release-namespace: ingress-controller
                   prometheus.io/port: 10254
                   prometheus.io/scrape: true
Selector:          app.kubernetes.io/component=controller,app.kubernetes.io/instance=ingress-nginx,app.kubernetes.io/name=ingress-nginx
Type:              ClusterIP
IP Family Policy:  SingleStack
IP Families:       IPv4
IP:                10.0.134.22
IPs:               10.0.134.22
Port:              metrics  10254/TCP
TargetPort:        metrics/TCP
Endpoints:         10.4.0.6:10254
Session Affinity:  None
Events:            <none>
```

We can also see that the port field exposes the port prometheus will scrape for metrics.

Overview of the persistent volumes
------------

With the following command we can list all the Storage Classes available to the cluster.

Command:
```txt
$ kubectl get sc --all-namespaces
```

Output:

```txt
NAME                 PROVISIONER             RECLAIMPOLICY   VOLUMEBINDINGMODE      ALLOWVOLUMEEXPANSION   AGE
gce-storage          kubernetes.io/gce-pd    Retain          Immediate              true                   42h
premium-rwo          pd.csi.storage.gke.io   Delete          WaitForFirstConsumer   true                   42h
standard (default)   kubernetes.io/gce-pd    Delete          Immediate              true                   42h
standard-rwo         pd.csi.storage.gke.io   Delete          WaitForFirstConsumer   true                   42h
```
As we can see, we have the `gce-storage` storage class we defined.

To see the persistent volumes claims used in our cluster we can run the following command:

Command:
```txt
$ kubectl get pvc --all-namespaces
```

Output:

```txt
NAMESPACE         NAME                                                                                                     STATUS   VOLUME                                     CAPACITY   ACCESS MODES   STORAGECLASS   AGE
default           redis-pvc                                                                                                Bound    pvc-526ad487-3cf4-469e-8704-863563f3268a   1Gi        RWO            gce-storage    42h
kube-prometheus   prometheus-kube-prometheus-kube-prome-prometheus-db-prometheus-kube-prometheus-kube-prome-prometheus-0   Bound    pvc-0ea621ac-6c94-4309-a71f-53001af0449e   1Gi        RWO            gce-storage    38h
```

As we can see both persistent volume claims request storage from the `gce-storage` Storage Class.

Grafana NGINX controller dashboard
------------

Since `kube-prometheus-stack` helm chart did not package a Grafana dashboard for the NGINX controller we had to add it ourselves:

Command:
```txt
$ kubectl get cm -n default
```

Output:

```txt
NAME                      DATA   AGE
kube-root-ca.crt          1      42h
nginx-ingress-dashboard   1      42h
```

To describe the config map that stores the dashboard:

Command:
```txt
$ kubectl describe cm nginx-ingress-dashboard -n default
```

Output:

```txt
Name:         nginx-ingress-dashboard
Namespace:    default
Labels:       grafana_dashboard=1
Annotations:  <none>

Data
====
nginx.json:
----
{
  "__inputs": [
    {
      "name": "DS_PROMETHEUS",
      "label": "Prometheus",
      "description": "",
      "type": "datasource",
      "pluginId": "prometheus",
      "pluginName": "Prometheus"
    }
  ],
  "__requires": [
    {
      "type": "grafana",
  (...)
  "timezone": "browser",
  "title": "NGINX Ingress controller",
  "uid": "nginx",
  "version": 1
}

Events:  <none>
```

We can see in the config map label we have `grafana_dashboard=1`. This label is the one that Grafana Sidecar is looking for in order to load new dashboards.

Command:
```txt
$ kubectl describe deployments kube-prometheus-grafana -n kube-prometheus
```

Output:

```txt
Name:                   kube-prometheus-grafana
Namespace:              kube-prometheus
CreationTimestamp:      Sun, 21 Nov 2021 02:28:40 +0000
Labels:                 app.kubernetes.io/instance=kube-prometheus
                        app.kubernetes.io/managed-by=Helm
                        app.kubernetes.io/name=grafana
                        app.kubernetes.io/version=8.2.3
                        helm.sh/chart=grafana-6.17.5
Annotations:            deployment.kubernetes.io/revision: 2
                        meta.helm.sh/release-name: kube-prometheus
                        meta.helm.sh/release-namespace: kube-prometheus
Selector:               app.kubernetes.io/instance=kube-prometheus,app.kubernetes.io/name=grafana
Replicas:               1 desired | 1 updated | 1 total | 1 available | 0 unavailable
StrategyType:           RollingUpdate
MinReadySeconds:        0
RollingUpdateStrategy:  25% max unavailable, 25% max surge
Pod Template:
  Labels:           app.kubernetes.io/instance=kube-prometheus
                    app.kubernetes.io/name=grafana
  Annotations:      checksum/config: a5e1e8a7cc645d9d66efac1c617e6cb4c1b9aebbdd01ff442b49113ae025cef7
                    checksum/dashboards-json-config: 01ba4719c80b6fe911b091a7c05124b64eeece964e09c058ef8f9805daca546b
                    checksum/sc-dashboard-provider-config: 3f6a2e4afee113421a33eac4d1042e6d2096825a76a8aa1d66e503893492381e
                    checksum/secret: 4e37a7a8fea02d0dd95b1859ec69494331393c9a607a84378cab975012949406
  Service Account:  kube-prometheus-grafana
  Init Containers:
   grafana-sc-datasources:
    Image:      quay.io/kiwigrid/k8s-sidecar:1.14.2
    Port:       <none>
    Host Port:  <none>
    Environment:
      METHOD:    LIST
      LABEL:     grafana_datasource
      FOLDER:    /etc/grafana/provisioning/datasources
      RESOURCE:  both
    Mounts:
      /etc/grafana/provisioning/datasources from sc-datasources-volume (rw)
  Containers:
   grafana-sc-dashboard:
    Image:      quay.io/kiwigrid/k8s-sidecar:1.14.2
    Port:       <none>
    Host Port:  <none>
    Environment:
      METHOD:
      LABEL:        grafana_dashboard
      LABEL_VALUE:  1
      FOLDER:       /tmp/dashboards
      RESOURCE:     both
      NAMESPACE:    ALL
    Mounts:
      /tmp/dashboards from sc-dashboard-volume (rw)
   grafana:
    Image:       grafana/grafana:8.2.3
    Ports:       80/TCP, 3000/TCP
    Host Ports:  0/TCP, 0/TCP
    Liveness:    http-get http://:3000/api/health delay=60s timeout=30s period=10s #success=1 #failure=10
    Readiness:   http-get http://:3000/api/health delay=0s timeout=1s period=10s #success=1 #failure=3
    Environment:
      GF_SECURITY_ADMIN_USER:      <set to the key 'admin-user' in secret 'kube-prometheus-grafana'>      Optional: false
      GF_SECURITY_ADMIN_PASSWORD:  <set to the key 'admin-password' in secret 'kube-prometheus-grafana'>  Optional: false
      GF_PATHS_DATA:               /var/lib/grafana/
      GF_PATHS_LOGS:               /var/log/grafana
      GF_PATHS_PLUGINS:            /var/lib/grafana/plugins
      GF_PATHS_PROVISIONING:       /etc/grafana/provisioning
    Mounts:
      /etc/grafana/grafana.ini from config (rw,path="grafana.ini")
      /etc/grafana/provisioning/dashboards/sc-dashboardproviders.yaml from sc-dashboard-provider (rw,path="provider.yaml")
      /etc/grafana/provisioning/datasources from sc-datasources-volume (rw)
      /tmp/dashboards from sc-dashboard-volume (rw)
      /var/lib/grafana from storage (rw)
  Volumes:
   config:
    Type:      ConfigMap (a volume populated by a ConfigMap)
    Name:      kube-prometheus-grafana
    Optional:  false
   storage:
    Type:       EmptyDir (a temporary directory that shares a pod's lifetime)
    Medium:     
    SizeLimit:  <unset>
   sc-dashboard-volume:
    Type:       EmptyDir (a temporary directory that shares a pod's lifetime)
    Medium:     
    SizeLimit:  <unset>
   sc-dashboard-provider:
    Type:      ConfigMap (a volume populated by a ConfigMap)
    Name:      kube-prometheus-grafana-config-dashboards
    Optional:  false
   sc-datasources-volume:
    Type:       EmptyDir (a temporary directory that shares a pod's lifetime)
    Medium:     
    SizeLimit:  <unset>
Conditions:
  Type           Status  Reason
  ----           ------  ------
  Available      True    MinimumReplicasAvailable
  Progressing    True    NewReplicaSetAvailable
OldReplicaSets:  <none>
NewReplicaSet:   kube-prometheus-grafana-b774f9656 (1/1 replicas created)
Events:          <none>
```

We can see here, particularly, the label that grafana sidecar is looking for:

```
Containers:
 grafana-sc-dashboard:
  Image:      quay.io/kiwigrid/k8s-sidecar:1.14.2
  Port:       <none>
  Host Port:  <none>
  Environment:
    METHOD:
    LABEL:        grafana_dashboard
    LABEL_VALUE:  1
    FOLDER:       /tmp/dashboards
    RESOURCE:     both
    NAMESPACE:    ALL
```

Web application usage
------------

1.	Go to the IP address of the Ingress endpoint;
	We will be redirected to the <IP>/#/ path.

2.	Click on the `calculator` tab and preform some operations;

3.	Click on the `history` tab and see the history of the operations;
	We will see the log of operations we did previously.

Redis data persistence
------------

To test the persistence of data delete the Redis pod (substitute for the correct pod name)

Command:
```txt
$ kubectl get pods -n default
```

Output:
```txt
NAME                           READY   STATUS    RESTARTS   AGE
bootstorage-6bcd494fc4-lld2v   1/1     Running   0          40h
expressed-d5ff4c6d4-8nj5k      1/1     Running   0          40h
happy-79d85bc85-79cvb          1/1     Running   0          40h
redis-585c6fb9b7-zhlpj         1/1     Running   0          40h
vuecalc-65fdcc4476-ng7xl       1/1     Running   0          40h
```

Command:
```txt
$ kubectl delete pod redis-585c6fb9b7-zhlpjk -n default
```

Output:
```txt
pod "redis-585c6fb9b7-zhlpj" deleted
```

Now, go to the `history` tab and check if there is any logs now.

Since there is only one Redis pod, we will have to wait to use the system again while another one gets created by Kubernetes.

As soon as the Pod is running we should see the operations we did again.

Prometheus
------------

To see the prometheus interface we must first create a port forwarding rule, as this service is not available outside of the cluster.

Command:
```txt
$ kubectl port-forward svc/kube-prometheus-kube-prome-prometheus 8080:9090 -n kube-prometheus
```

Output:
```txt
Forwarding from 127.0.0.1:8080 -> 9090
Forwarding from [::1]:8080 -> 9090
Handling connection for 8080
Handling connection for 8080
(...)
```
Now go to `http://localhost:8080/`

In `Status > Service Discovery` we can see the multiple service monitors used by prometheus.

Grafana
------------

In order to access grafana we must go to the address of the ingress endpoint to the path `/grafana`

We will then have to login with the `admin` username and the password configured when deploying the system.

Once we are logged in we can then go to `Dashboards > Manage > nginx-ingress-controller` and see the metrics for it.


