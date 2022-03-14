## Prerequisites
To follow along with this documentation, ensure that you have:
- A project called `kubernetes-secrets`. You can change the project name, but just ensure that you change the project name to reflect your project name on step 7.
- Access to create an API key for CloudTruth

1. Install minikube
2. Run `minikube start`
3. Add in the Kubernetes parameters you want CloudTruth to manage. This can be anything from secrets to Docker image names to port numbers. Example CloudTruth code is below to set your CloudTruth project and add in parameters

```
cloudtruth projects set kubernetes-secrets

cloudtruth --project kubernetes-secrets parameter set --value nginx app_name
cloudtruth --project kubernetes-secrets parameter set --value 3 replicas
cloudtruth --project kubernetes-secrets parameter set --value 80 port
cloudtruth --project kubernetes-secrets parameter set --value nginx image_name
cloudtruth --project kubernetes-secrets parameter set --value latest nginx_version
```

4. Create a `.yaml` file for your Kubernetes `deployment`/`configmap`/`service`/`secret`/etc.
5. Within the `.yaml` file that you created in step 4, put in your Kubernetes manifest code. Below is an example:

```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: {{app_name}}
  namespace: ctdeploytest
  labels:
    app: {{app_name}}
spec:
  replicas: 1
  selector:
    matchLabels:
      app: {{app_name}}
  template:
    metadata:
      labels:
        app: {{app_name}}
    spec:
      containers:
        - name: {{image_name}}
          image: {{image_name}}:{{image_version}}
          ports:
            - containerPort: {{app_port}}
```

Notice how there are double brackets with keys. Those keys are the names of the parameters in your CloudTruth environment.

6. Run the following command to let CloudTruth know which exact Kubernetes manifest to look at and to store the template inside of CloudTruth
```
cloudtruth --project 'kubernetes-secrets' template set --body some_file_name.yaml deployment
```

The `deployment` at the end of the command in step 7 indicates that we're running a Kubernetes `deployment`. If it was, for example, a Kubernetes `service`, the command would say `service` at the end instead of `deployment`.

Or just use the Nginx deployment found under the `nginx-sample` directory

7. Configure the operator configuration. Create a new file called `ctdeploytest-values.yaml` and add the following into it.
```
# Applying deployment resources requires additional permissions
rbac:
  additionalRoleRules:
    - apiGroups: ["", "extensions", "apps"]
      resources: ["deployments", "replicasets", "pods", "services"]
      verbs: ["*"]

# Kubetruth is configured using a CustomResourceDefinition called
# ProjectMapping, which allows one to specify how the operator
# transforms the data from your CloudTruth projects into kuberenetes
# resources
projectMappings:

  # Define the root project mapping, skipping all projects except for the
  # example we care about
  root:
    scope: "root"
    environment: default
    skip: true

  # Define an override ProjectMapping to enable deployment of CloudTruth projects named k8s*
  k8s-deploy:
    scope: "override"
    skip: false
    project_selector: "^k8s-"
    resource_templates:
      deployment: '{% if templates.names contains "deployment" %}{{ templates.deployment }}{% endif %}'
      service: '{% if templates.names contains "service" %}{{ templates.service }}{% endif %}'
```

Ensure that the `ctdeploytest-values.yaml` file is saved in the same location that your file containing the Kubernetes deployment is located.

8. Install and run KubeTruth, the Kubernetes operator (A Kubernetes operator is a method of packaging, deploying, and managing a Kubernetes application)

```
helm repo add cloudtruth https://packages.cloudtruth.com/charts/
helm install --values ctdeploytest-values.yaml --set appSettings.apiKey=$CLOUDTRUTH_API_KEY kubetruth cloudtruth/kubetruth
```

Another option is to run the Helm Chart in a specific namespace. That way, it's easier to clean up later on. If you don't, `Kubetruth` will pick up all of the Kubernetes `deployments`/`services`/etc. in the `default` namespace

```
helm repo add cloudtruth https://packages.cloudtruth.com/charts/
helm install --create-namespace --namespace ctdeploytest --values ctdeploytest-values.yaml --set appSettings.apiKey=$CLOUDTRUTH_API_KEY kubetruth cloudtruth/kubetruth
```