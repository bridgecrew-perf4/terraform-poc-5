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

resource "aws_vpc" "vpc" {
    cidr_block = var.vpcCidrBlock
    instance_tenancy = var.instanceTenancy
    enable_dns_support = var.dnsSupport
    enable_dns_hostnames = var.dnsHostname
    tags = {
        Name = var.vpcName
        Environment = var.envName
        Region = var.awsRegion
        LifecycleManager = var.lCManager
    }
}