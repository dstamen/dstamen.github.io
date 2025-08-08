provider "aws" {
        region = var.aws_region
}

variable "aws_region" {
    type    = string
    default = "us-west-2"
}

variable "instance_type" {
    type    = string
    default = "t3.small"
}

variable "key_name" {
    type    = string
    default = "dstamen-gso"
}
variable "vpc_security_group_ids" {
    type    = list(string)
    default = ["sg-0916e0106dabdf335"]
}

variable "subnet_id" {
    type    = string
    default = "subnet-0fba548f26fcf8967"
}

variable "ami_id" {
    type    = string
    default = "ami-0e589596b7b8069d6"
}

variable "tags" {
    type        = map(string)
    default    = {
        Name = "ubuntu1"
        owner = "worldwide_sys_eng",
        org = "revenue",
        team = "elob",
        ext-facing = "false",
        importance =  "low",
        env =  "dev",
        administrator = "david_stamen"
        service = "demo"
    }
}
resource "aws_instance" "ubuntu1" {
    ami                     = var.ami_id
    instance_type           = var.instance_type
    vpc_security_group_ids  = var.vpc_security_group_ids
    subnet_id               = var.subnet_id
    key_name                = var.key_name
    user_data               = file("${path.module}/userdata.sh")
    tags                    = var.tags
}