In the previous lab, you learned what managing configuration data without CloudTruth is like. In this lab, you'll learn how you can make your engineering life easier with CloudTruth.

Below is the same Kubernetes Manifest code snippet from the [Without CloudTruth](https://github.com/cloudtruth/Config-The-Hard-Way/blob/main/app-without-cloudtruth/withoutct.md) section.

```
      containers:
      - image: wordpress:latest
        name: wordpress
        env:
          - name: WORDPRESS_DB_HOST
            value: {{appname}}
          - name: WORDPRESS_DB_USER
            value: {{MYSQL_USER}}
          - name: WORDPRESS_DB_PASSWORD
            value: {{MYSQL_PASSWORD}}
          - name: WORDPRESS_DB_NAME
            value: {{MYSQL_DATABASE}}
          - name: WORDPRESS_DEBUG
            value: “1”
```

Notice how the Parameter names are in a Jinja2-like syntax. The values inside of the curly brackets are the names of the Parameters in CloudTruth. Below is a screenshot of the Parameters in CloudTruth.

![](../images/params.png)

With CloudTruth, you can save the parameters like you see in the screenshot above and can pull the configuration data values from CloudTruth to your Kubernetes Manifest(s).
