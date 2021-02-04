https://github.com/antonbabenkoterraform {
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
    name  = "nginx_container"
    image = docker_image.image-nginx.latest
    ports {
        internal = 80
        external = 8088
    }
}

resource "docker_container" "multiple_nginx" {
    count = 3
    name  = "nginx_container_${count.index}"
    image = docker_image.image-nginx.latest
    ports {
        internal = 80
        external = "808${count.index}"
    }
} 

resource "docker_container" "envs_nginx" {
    for_each = var.nginx_config

    name = each.key
    image = docker_image.image-nginx.latest
    ports {
        internal = each.value["ports_internal"]
        external = each.value["ports_external"]
    }
    volumes {
        host_path      = each.value["host_path"]
        container_path = each.value["container_path"]
    }
}

resource "docker_container" "envs_nginx_pro" {
    count = length(var.nginx_config_pro)

    name = var.nginx_config_pro[count.index]["name"]
    image = docker_image.image-nginx.latest
    ports {
        internal = var.nginx_config_pro[count.index]["ports_internal"]
        external = var.nginx_config_pro[count.index]["ports_external"]
    }
    volumes {
        host_path      = var.nginx_config_pro[count.index]["host_path"]
        container_path = var.nginx_config_pro[count.index]["container_path"]
    }
}