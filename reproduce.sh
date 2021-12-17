#!/bin/bash
set -eo pipefail

terraform init
terraform plan -out test.plan -state test.tfstate
terraform show test.plan
terraform apply -state test.tfstate test.plan # works

terraform plan -out test.plan -state test.tfstate
terraform show test.plan # fails with TF 1.1.1