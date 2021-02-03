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
    count = 3
    name  = "nginx_container_${count.index}"
    image = docker_image.image-nginx.latest
    ports {
        internal = 80
        external = "808${count.index}"
    }
} 
