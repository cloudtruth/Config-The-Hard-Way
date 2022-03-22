## The Code

Some secrets are better than none. In the previous lab found [here](https://github.com/cloudtruth/Config-The-Hard-Way/blob/main/app-without-cloudtruth/nosecrets/withoutct.md), you saw how plain-text secrets would look in a Kubernetes manifest. You literally NEVER want to put secrets as plain-text in any code, and you definitely don't want to commit it to source control.

Using the code [here](https://github.com/cloudtruth/Config-The-Hard-Way/tree/main/app-without-cloudtruth/kubernetes-secrets), you'll create Kubernetes Secrets for an environment

## Creating Secrets

There are a few different ways to create secrets in Kubernetes. When you see anything secrets-related in Kubernetes, know that it's some type of key/value pair that's encrypted.

For example, let's take the following key/value pair:

```
town: Charleston
```

`Charleston` would be the "Secret", as in, it's not shown to the application/used by the application in a plain-text fashion. 

### From The Command-Line

You can generate secrets from the command-line like the below.

```
kubernetes create secret generic mynewsecret
```

However, it's incredibly cumbersome if you have more than one secret. It's also done via the CLI, so it's not stored/documented anywhere.

### Secrets Manifest
```
apiVersion: v1
kind: Secret
metadata:  
  name: wordpressapp
type: Opaque
data:
  MYSQL_DATABASE: wpdb
  MYSQL_PASSWORD: DEVOPS1
  MYSQL_USER: devopsguy
  MYSQL_ROOT_PASSWORD: DEVOPS1
```

## From A .env File

The other option from a Secrets perspective is that you can create some type of `.env` file and pull secrets from there. The problem is that regardless, you're still storing the passwords SOMEWHERE in plain-text

## Accessing Secrets

Via Wordpress Kubernetes Manifest
```
      containers:
      - image: wordpress:latest
        name: wordpress
        env:
          - name: WORDPRESS_DB_HOST
            value: wordpress-mysql
          - name: WORDPRESS_DB_USER
            valueFrom:
              secretKeyRef:
                name: mysql-pass
                key: wordpressapp
          - name: WORDPRESS_DB_PASSWORD
            valueFrom:
              secretKeyRef:
                name: mysql-pass
                key: MYSQL_PASSWORD
          - name: WORDPRESS_DB_NAME
            valueFrom:
              secretKeyRef:
                name: mysql-pass
                key: MYSQL_DATABASE
          - name: WORDPRESS_DEBUG
            value: “1”
```

Via MySQL Kubernetes Manifest
```
      containers:
      - image: mysql:8.0
        name: mysql
        env:
          - name: MYSQL_ROOT_PASSWORD
            valueFrom:
              secretKeyRef:
                name: mysql-pass
                key: MYSQL_ROOT_PASSWORD
          - name: MYSQL_USER
            valueFrom:
              secretKeyRef:
                name: mysql-pass
                key: MYSQL_USER
          - name: MYSQL_PASSWORD
            valueFrom:
              secretKeyRef:
                name: mysql-pass
                key: MYSQL_PASSWORD
          - name: MYSQL_DATABASE
            valueFrom:
              secretKeyRef:
                name: mysql-pass
                key: MYSQL_DATABASE
```

## The Problem

- Secrets aren't encrypted at rest
- Secrets aren't encrypted by default
- You can't re-use the same manifests for each environment without changing a bunch of YAML code