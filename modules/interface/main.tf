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

resource "aws_network_interface" "ngweip" {
    subnet_id = var.pubSubA.id
    description = var.ngwEniDesc
    tags = {
        Name = var.vpcName
        Environment = var.envName
        Region = var.awsRegion
        LifecycleManager = var.lCManager
    }
}