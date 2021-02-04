terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
        }
    }
}

provider "aws" {
    profile = "default"
    region = "eu-west-1"
}

resource "aws_instance" "ec2" {
    ami = "ami-0aef57767f5404a3c"
    instance_type = "t2.micro"
}