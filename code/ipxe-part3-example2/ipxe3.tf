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
    default = "ami-067a0fad89512f721"
}

variable "tags" {
    type        = map(string)
    default    = {
        Name = "ubuntu2"
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

variable "purestorage_target" {
    type    = string
    default = "172.18.10.137"
}
variable "purestorage_apitoken" {
    type    = string
    default = "55bff027-6b22-25a2-0f29-728652df341e"
}
variable "purestorage_host" {
    type    = string
    default = "ubuntu2"
}
variable "purestorage_iqn" {
    type    = list(string)
    default = ["iqn.2010-04.org.ipxe:ubuntu2"]
}
variable "purestorage_source_vol" {
    type    = string
    default = "ubuntu24-goldtemplate"
}
terraform {
    required_providers {
        purestorage = {
            source  = "devans10/flash"
        }
        aws = {
            source  = "hashicorp/aws"
        }
    }
}
provider "aws" {
        region = var.aws_region
}
provider "purestorage" {
    target     = var.purestorage_target
    api_token = var.purestorage_apitoken
}

resource "purestorage_host" "ubuntu2" {
    name = var.purestorage_host
    iqn = var.purestorage_iqn
    provider = purestorage
    volume {
        vol = purestorage_volume.boot.name
        lun = 1
    }
    volume {
        vol = purestorage_volume.data1.name
        lun = 2
    }
}

resource "purestorage_volume" "boot" {
    name = "${var.purestorage_host}-boot"
    source = var.purestorage_source_vol
    provider = purestorage
}

resource "purestorage_volume" "data1" {
    name = "${var.purestorage_host}-data1"
    size = 10737418240
    provider = purestorage
}

resource "aws_instance" "ubuntu2" {
    ami                     = var.ami_id
    instance_type           = var.instance_type
    vpc_security_group_ids  = var.vpc_security_group_ids
    subnet_id               = var.subnet_id
    key_name                = var.key_name
    user_data               = file("${path.module}/userdata3.sh")
    tags                    = var.tags
    depends_on = [purestorage_host.ubuntu2]
}