# The below is used to create an Azure AD App Registration for Terraform to authenticate

[string]$subscription_id = 'your_subscription_id'

az ad sp create-for-rbac --role contributor --scopes /subscriptions/$subscription_id