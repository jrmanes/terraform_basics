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

resource "tls_private_key" "devops" {
  algorithm   = "RSA"
  ecdsa_curve = 4096
}

resource "aws_key_pair" "devops" {
  key_name   = "jrmanes"
  public_key = tls_private_key.devops.public_key_openssh
}

resource "aws_security_group" "sg_devops" {
    name = "Allow access to instance"
    
    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {
      Name = "allow-access-from-internet-jrmanes"
    }
}

resource "aws_instance" "ec2" {
    ami = "ami-0aef57767f5404a3c"
    instance_type = "t2.micro"
    security_groups = [aws_security_group.sg_devops.name]
    key_name = aws_key_pair.devops.key_name
    
    provisioner "remote-exec" {
        inline = [
                "sudo apt update",
                "sudo apt install -y vim net-tools wget curl htop docker docker-compose"
        ]
        connection {
            host        = aws_instance.ec2.public_ip
            type        = "ssh"
            user        = "ubuntu"
            private_key = tls_private_key.devops.private_key_pem
            timeout     = "1m"
        }
    }
    
    tags = {
      Name = "jrmanes"
    }
}
