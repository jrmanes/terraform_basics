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

// create new volumes to attach them inside the container
resource "docker_volume" "volume_terraform_basics" {
  name = "volume_terraform_basics"
}

// create new volumes to attach them inside the container
resource "docker_volume" "volume_terraform_teacher" {
  name = "volume_terraform_teacher"
}

resource "docker_container" "ubuntu" {
    name = "ubuntu_container"
    image = docker_image.image-ubuntu.latest
    
    volumes {
        volume_name = "volume_terraform_basics"
        host_path      = "/home/ubuntu/environment/terraform_basics/"
        container_path = "/cursoTerraform/"
    }
    volumes {
        volume_name = "volume_terraform_teacher"
        host_path      = "/home/ubuntu/environment/ivan"
        container_path = "/ivan/"
    }
} 