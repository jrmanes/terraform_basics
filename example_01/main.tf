terraform {
    required_providers {
        docker = {
            source = "kreuzwerker/docker"
        }
    }
}

provider "docker" {}

resource "docker_image" "image-ubuntu" {
    name = "ubuntu:latest"
} 

resource "docker_container" "ubuntu" {
    name = "ubuntu_container"
    image = docker_image.image-ubuntu.latest
} 