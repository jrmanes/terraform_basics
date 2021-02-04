terraform {
    required_providers {
        docker = {
            source = "kreuzwerker/docker"
        }
    }
}

resource "docker_image" "image-container" {
    name = "${var.image_name}:${var.image_version}"
}

resource "docker_container" "container" {
    name  = var.container_name
    image = docker_image.image-container.latest
    
    dynamic "ports" {
        for_each = var.container_ports
        content {
            internal = ports.value["internal"]
            external = ports.value["external"]
            protocol = ports.value["protocol"]
        }
    }
}