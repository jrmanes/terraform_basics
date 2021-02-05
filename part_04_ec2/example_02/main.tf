terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
        }
    }
}

provider "aws" {
    profile       = "default"
    region        = "eu-west-1"
}

module "aws_instance_jr" {
    source        = "./ec2"
    region        = "eu-west-1"
    
    instance_type = "t2.micro"
    ami           = "ami-0aef57767f5404a3c"
    instance_name = "jrmanes"
}