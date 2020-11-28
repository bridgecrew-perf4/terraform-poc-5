variable "vpcName" {
    type        = string
    description = "This variable holds the name of the VPC"
}

variable "vpcCidrBlock" {
    type        = string
    description = "This variable holds the IP block assigned to the VPC"
}

variable "instanceTenancy" {
    type        = string
    description = "This variable holds the value which determines the type of hosting on AWS -- shared or dedicated"
}

variable "dnsSupport" {
    type        = string
    description = "This variable holds the boolean value indicating whether to enable DNS support for the VPC"
}

variable "dnsHostname" {
    type        = string
    description = "This variable holds the boolean value indicating whether the enable hostname support for the VPC"
}

variable "envName" {
    type        = string
    description = "This variable holds the name of the environment"
}

variable "awsRegion" {
    type        = string
    description = "This value describes in which region this resource is deployed"
}

variable "lCManager" {
    type        = string
    description = "This variable holds the value describing the lifecycle manager -- what tool is used to manage these resources"
}