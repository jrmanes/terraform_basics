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
    name  = "ubuntu_container"
    image = docker_image.image-ubuntu.latest
    command = "${var.command}"

    dynamic "volumes" {
        for_each = var.volumes
        content {
            volume_name      = lookup(volumes.value, "volume_name", null)
            host_path        = volumes.value["host_path"]
            container_path   = volumes.value["container_path"]
        }
    }
} 