# Config-The-Hard-Way

Managing secrets, parameters, environment variables, and .env files is a major pain for all engineers and developers.

This tutorial contains a full, real-world solution for setting up a Kubernetes environment with secrets and configuration data managed for you with CloudTruth.

## DevOps Scenario
The scenario that you're currently facing is you work in an organization that is very monolithic. There is a ton of bare metal, virtualization, manual deployments of applications, and **old school** practices based on the current teams knowledge of IT.

You're brought in to the company and team to make things more modern so the organization can not only succeed, but stay ahead of their competition. Management now understands the needs and complexity that comes with staying ahead of their competition and they know that they need to. Otherwise, the organization will fall...

## DevOps Solution
The solution is to deploy Wordpress and MySQL. Currently this solution is sitting on a bunch of baremetal, but it's time to sprinkle a little DevOps on it.

![](images/app1.png)

As a DevOps Engineer, you're more or less (most likely) not writing the app, but instead, deploying it. That's why you're not writing your own app in this tutorial.

You can find the app [here](https://github.com/kubernetes/examples/tree/master/mysql-wordpress-pd)

## Technology Details
You will be using the following technologies and platforms to set up a DevOps environment.

1. CloudTruth
    - Used to store all secrets, parameters, and environment variables. Any configuration data that you need stored in one location, CloudTruth has you covered.
2. AWS
    - AWS will be used to host the application, cloud infrastructure, and any other services we may need to ensure the Wordpress app is deployed properly.
3. GitHub
    - To store the application and infrastructure/automation code
4. Docker
    - Although you won't be doing anything directly with Docker, Docker is used to build the containers that run in Kubernetes Pods.
5. Kubernetes
   - To run the Docker image that's created for the containerized Wordpress app. Kubernetes, in this case, EKS, will be used to orchestrate the container.

## Labs

These labs are a Work In Progress (WIP). If a link is missing or not working, that means the code is actively being worked on.

1. [Prerequisites](https://github.com/cloudtruth/Config-The-Hard-Way/blob/main/prerequisites.md)
2. Setting Up A Kubernetes Cluster With Terraform
    - [Google GKE]()
        - [prereqs](https://github.com/cloudtruth/Config-The-Hard-Way/blob/main/kubernetes-clusters/GKE/prereqs.md)
        - [GKE Cluster Setup](https://github.com/cloudtruth/Config-The-Hard-Way/tree/main/kubernetes-clusters/EKS)
    - [Azure AKS]()
        - [prereqs](https://github.com/cloudtruth/Config-The-Hard-Way/blob/main/kubernetes-clusters/AKS/prereqs.md)
        - [AKS Cluster Setup](https://github.com/cloudtruth/Config-The-Hard-Way/tree/main/kubernetes-clusters/AKS)
    - [AWS EKS]()
        - [prereqs](https://github.com/cloudtruth/Config-The-Hard-Way/blob/main/kubernetes-clusters/EKS/prereqs.md)
        - [EKS Cluster Setup](https://github.com/cloudtruth/Config-The-Hard-Way/tree/main/kubernetes-clusters/EKS)
3. Using Kubetruth
   - [What Is Kubetruth?]()
   - [Configuring Kubetruth]()
4. Creating A CloudTruth Project
   - [Create A New Project](https://github.com/cloudtruth/Config-The-Hard-Way/blob/main/cloudtruth_commands/project/readme.md)
5. Creating CloudTruth Parameters For The Application
   - [Create Parameters For Wordpress Deployment](https://github.com/cloudtruth/Config-The-Hard-Way/blob/main/cloudtruth_commands/parameters/params.md)