# Parameters

In every cloudTruth project, you can store parameters. Parameters can be anything from an API key to a password to a username. Pretty much anything that's configuration data can be stored.

For our application deployment, we want to use CloudTruth to store our configuration data in a centralized location. That way, we can easily pull the configuration data from CloudTruth to use in our app.

To do that, we need to create some parameters.

Breaking down the commands below:
- `cloudtruth`: Calls the CloudTruth CLI
- `--project wordpress`: Calls the command to specify the Wordpress project in CloudTruth
- `parameter set`: Calls the `parameter` command with the `set` switch to create new parameters
- `--value`: First specifies the value, then the name. It's a `value/key` pair. For example, the first command specifies the `value` as `wordpress-mysql` and the parameter name/key as `appname`.

```
cloudtruth --project kubernetes parameter set --value wordpress-mysql appname
cloudtruth --project kubernetes parameter set --value mysql storagename
cloudtruth --project kubernetes parameter set --value DEVOPS1 MYSQL_ROOT_PASSWORD
cloudtruth --project kubernetes parameter set --value devopsguy MYSQL_USER
cloudtruth --project kubernetes parameter set --value DEVOPS1 MYSQL_PASSWORD
cloudtruth --project kubernetes parameter set --value wpdb MYSQL_DATABASE
cloudtruth --project kubernetes parameter set --value mysql image_name
cloudtruth --project kubernetes parameter set --value 8.0 mysql_version
```