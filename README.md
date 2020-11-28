# Terraform Modules

In Terraform v0.13, HashiCorp enhanced the modules capability allowing Terraform users to define collections of resources as modules and use the modules to quickly construct templates. In other words, collections of resources can be viewed as functions that are reusable. This is a game changer in that it significantly reduces the time to create templates and when the primary modules are updated, the changes are inherited by all the templates consuming the modules.

### Components

There are two components to this repository. The first is a collection of nested CloudFormation templates that are necessary to setup the infrastructure needed to store the remote state. Then there are the modules and the "environments"/"stacks".

Directory Name | Comments
-------------- | --------
remote-state    | Contains the CloudFormation templates needed to store the Terraform remote state.
modules       | Contains all the modules -- self contained in their own directories.
mgmt          | This is the directory where we will be constructing the Terraform template needed to stand up the management VPC and any subsequent resources to be provisioned there.
dev          | This is the directory where we will be constructing the Terraform template needed to stand up the development VPC and any subsequent resources to be provisioned there.

### Getting Started

To get started, follow the steps below:
1. Clone the repository to your workstation.
2. Go into ../mgmt/vpc/ directory and update the `vpccreds.tfvars` and `vpc.tfvars` with the appropriate values.
3. If this is the first time you are doing any of this, either lookup how to get remote state configured with S3 and DynamoDB. Otherwise, use the sample I have available on my [GitHub repository](https://github.com/mochowdhury/terraform-remote-state/ "Terraform Remote State Repository Link").
4. If your Terraform remote state is ready to go, change over to the ../mgmt directory and run `terraform init` to initialize the project.
    1. Perform a `terraform plan` to see what's to be expected.
    2. Perform a `terraform apply` to create the "environment"/"stack".
5. Make sure to also update this `terraform` JSON object at the top of each `main.tf` file.
```json
terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~> 3.0"
        }
    }
    required_version = "= 0.13.3"
    backend "s3" {
        bucket = ""
        key = ""
        region = ""
        encrypt = ""
        dynamodb_table = ""
    }
}
```

---

### Reference

Just as a reference, below are the variable/value pairs for each of the files.

###### vpc.tfvars

Variable Name | Value
--- | ---
vpcCidrBlock | As per your needs
vpcName | As per your needs
instanceTenancy | As per your needs
dnsSupport | As per your needs
dnsHostname | As per your needs
envName | As per your needs
awsRegion | As per your needs
lCManager | As per your needs

###### vpccreds.tfvars

Variable Name | Value
--- | ---
mgmtAccountId | As per your needs
mgmtAccessKey | As per your needs
mgmtSecretKey | As per your needs
