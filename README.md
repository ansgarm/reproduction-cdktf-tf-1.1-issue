# `different state lineage` error on Terraform 1.1.1
Reproduction case for [terraform-cdk#1428](https://github.com/hashicorp/terraform-cdk/issues/1428)

```
# Using Terraform 1.1.1
terraform init
terraform plan -out test.plan -state test.tfstate
terraform show test.plan
terraform apply -state test.tfstate test.plan # works

terraform plan -out test.plan -state test.tfstate
terraform show test.plan # fails
```

or run `./reproduce.sh`

Fails with (on Terraform 1.1.1) (full output)
```
╷
│ Error: Saved plan does not match the given state
│
│ The given plan file can not be applied because it was created from a different state lineage.
╵
```

but works on Terraform 1.0.7
