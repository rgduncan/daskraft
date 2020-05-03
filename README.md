# Das Kraft

## Environment setup

### OSX
```shell script
# Install terraform 
brew install terraform
# Install aws-cli
brew install aws-cli
aws configure --profile <new-profile-name>
```

## Infrastructure

Most of the infrastructure relies on Terraform and [modules](https://www.terraform.io/docs/modules/index.html)
setup to run with the [AWS provider](https://www.terraform.io/docs/providers/aws/index.html)

### VPC

This uses the [Terraform VPC module](https://github.com/terraform-aws-modules/terraform-aws-vpc)

```shell script
cd ./infrastructure/terraform/vpc/
terraform get
terraform plan
terraform apply
```

### Server