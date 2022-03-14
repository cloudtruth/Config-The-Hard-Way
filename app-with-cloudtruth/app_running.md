
## Use Kustomize
`kustomization.yaml`, in this case, allows us to deploy our Kubernetes manifests (for MySQL and Wordpress) at the same time.

```
kubectl apply -k ./
```

## Start The MySQL Deployment
`kubectl create -f mysql-deployment.yaml`

Get to the URL for Wordpress via Minikube
`minikube service wordpress --url`