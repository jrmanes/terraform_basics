terraform {
    required_providers {
        docker = {
            source = "kreuzwerker/docker"
        }
    }
}

provider "docker" {}

resource "docker_image" "image-nginx" {
    name = "${var.image_name}:${var.image_version}"
}

resource "docker_container" "nginx" {
    name  = "nginx_part_02"
    image = docker_image.image-nginx.latest

    provisioner "remote-exec" {
        inline = ["echo ${self.ip_address} >> inline_ip_address.txt"]
    }
    
    connection {
        type      = "ssh"
        host      = self.ip_address
        user      = "root"
        password  = "root"
        port      = 22
    }
    provisioner "remote-exec" {
        inline = ["echo ${self.ip_address} >> remote_ip_address.txt"]
    }
    provisioner "remote-exec" {
        script      = "./script.sh"
        on_failure  = continue
    #    when        = destroy
    }
}