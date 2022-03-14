## Destroy the Cluster

## Destroy the Deployments, Service, Pods, and Persistent Voles

```
kubectl delete deployment wordpress-mysql
kubectl delete svc wordpress-mysql
kubectl delete pvc mysql-pv-claim

kubectl delete deployment wordpress
kubectl delete svc wordpress
kubectl delete pvc wp-pv-claim
```