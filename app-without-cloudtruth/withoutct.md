Configuration sprawl across multiple environments is a major concern. It sort of feels like losing your house or car keys. You know that you put them somewhere, and you think they're safe, but you're not really sure.

Then you get a key hanger by your front door and your problems go away.

That's what CloudTruth is doing for configuration data.

Let's take a look at an example without using CloudTruth.

From the code founde [here](https://github.com/cloudtruth/Config-The-Hard-Way/tree/main/app-without-cloudtruth/nosecrets), you can see that there's a container spec (the app that's going inside of the Kuberentes pod) for Wordpress.

```
      containers:
      - image: wordpress:latest
        name: wordpress
        env:
          - name: WORDPRESS_DB_HOST
            value: wordpress-mysql
          - name: WORDPRESS_DB_USER
            value: devopsguy
          - name: WORDPRESS_DB_PASSWORD
            value: DEVOPS1
          - name: WORDPRESS_DB_NAME
            value: wpdb
          - name: WORDPRESS_DEBUG
            value: “1”
```

Notice in the above code how there are a lot of environment variables which include:
- The MySQL host (which will end of being the Kubernetes Service endpoint)
- The DB username
- The DB password
- The DB name

My first question to you is; where are you going to store that information? Sure, there are solutions out there, but a lot of them are locked into a certain vendor, are focused on secrets only (and some configuration data/environment variables may not be secrets), or require you to spin up servers to host the platform.

Here's the other reality; if you're using Kubernetes, chances are you don't want vendor lock-in. You want to be able to use the Kubernetes Manifests and configurations across any Kubernetes cluster. If you have environment variables pointing to a vendor locked-in secrets platform, you have to re-configure your Kubernetes Manifests for each environment.

That's extremely cumbersome.

Instead of going through all of that, you can use CloudTruth to store configuration data. You can also retrieve configuration data via CloudTruth for any environment on any Kubernetes cluster.

Take a look at the [With CloudTruth](https://github.com/cloudtruth/Config-The-Hard-Way/blob/main/app-with-cloudtruth/withct.md) section to learn how CloudTruth solves this problem.