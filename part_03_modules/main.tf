terraform {
    required_providers {
        docker = {
            source = "kreuzwerker/docker"
        }
    }
}

module "container_mariadb" {
    source = "./container"
    
    container_name = "mariadb"
    image_name = "mariadb"
    image_version = "latest"
    container_ports = [
        {
            internal = 3006
            external = 3006
            protocol = "tcp"
        },
        {
            internal = 3005
            external = 3005
            protocol = "tcp"
        }
    ]
}

module "container_nginx" {
    source = "./container"
    
    container_name = "nginx"
    image_name = "nginx"
    image_version = "latest"
    container_ports = [
        {
            internal = 80
            external = 8080
            protocol = "tcp"
        },
        {
            internal = 81
            external = 8081
            protocol = "tcp"
        }
    ]
}