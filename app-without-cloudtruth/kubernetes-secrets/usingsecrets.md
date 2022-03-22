## The Code

Some secrets are better than none. In the previous lab found [here](), you saw how plain-text secrets would look in a Kubernetes manifest. You literally NEVER want to put secrets as plain-text in any code, and you definitely don't want to commit it to source control.

Using the code [here](https://github.com/cloudtruth/Config-The-Hard-Way/tree/main/app-without-cloudtruth/kubernetes-secrets)

## Creating Secrets

## Accessing Secrets

## The Problem

- Secrets aren't encrypted at rest
- Secrets aren't encrypted by default
- You can't re-use the same manifests for each environment without changing a bunch of YAML code