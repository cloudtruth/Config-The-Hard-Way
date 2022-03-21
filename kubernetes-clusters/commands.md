When you're running a Terraform config with CloudTruth, the command will look like the below:

`cloudtruth --project "project_name" --env development run -- terraform init`
`cloudtruth --project "project_name" --env development run -- terraform plan`
`cloudtruth --project "project_name" --env development run -- terraform apply -auto-approve`

1. First, you specify the `--project` that you stored the Terraform configurations in
2. Next, you specify your environment with the `--env` config
3. Finally, you run your Terraform command