terraform {
    required_providers {
        docker = {
            source = "kreuzwerker/docker"
        }
    }
}

provider "docker" {}

resource "docker_image" "image-ubuntu" {
    name = "${var.image_name}:${var.image_version}"
} 

resource "docker_container" "ubuntu" {
    name = "ubuntu_container"
    image = docker_image.image-ubuntu.latest
} 