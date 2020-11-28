# Use the AWS provider from HashiCorp.
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

# Configure the AWS provider with access information.
provider "aws" {
    region = ""
    access_key = var.mgmtAccessKey
    secret_key = var.mgmtSecretKey
    allowed_account_ids = var.mgmtAccountId
}

# Call the VPC module to define a VPC resource.
module "mgmtvpc" {
    # Define source of module.
    source = "../../modules/vpc"

    vpcCidrBlock = var.vpcCidrBlock
    vpcName = var.vpcName
    instanceTenancy = var.instanceTenancy
    dnsSupport = var.dnsSupport
    dnsHostname = var.dnsHostname
    envName = var.envName
    awsRegion = var.awsRegion
    lCManager = var.lCManager
}