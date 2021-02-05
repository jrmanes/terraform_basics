terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
        }
    }
}

provider "aws" {
    profile        = "default"
    region         = var.region
}

resource "aws_instance" "ec2" {
    instance_type  = var.instance_type
    ami            = var.ami
    tags = {
        Name = var.instance_name
    }
}
