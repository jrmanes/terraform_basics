variable "image_name" {
    description = "Name of the image that we will use"
    type = string
    default = "nginx"
}

variable "image_version" {
    description = "Version for the image that we will use"
    type = string
    default = "1.19.6"
}

variable "container_names" {
    description = "Containers nginx"
    type = map(string)
    default = {
        contenedorA = "8090"
        contenedorB = "8091"
    }
}

variable "nginx_config" {
    description = "All the volumes that we are going to mount inside container"
    type = map(map(string))
    default = {
        nginx_1 = {
            name= "nginx_DEV"
            ports_internal  = "80"
            ports_external  = "8085"
            container_path = "/test"
            host_path      = "/home/ubuntu/environment/"
        }
        nginx_2 = {
            name            = "nginx_PRE"
            ports_internal  = "80"
            ports_external  = "7998"
            container_path = "/test"
            host_path      = "/home/ubuntu/environment/"
        }
        nginx_3 = {
            name             = "nginx_PRO"
            ports_internal   = "80"
            ports_external   = "7999"
            container_path = "/test"
            host_path      = "/home/ubuntu/environment/"
        }
    }
}

variable "nginx_config_pro" {
    description = "All the volumes that we are going to mount inside container"
    type = list(map(string))
    default = [
        {
            name            = "nginx_DEV"
            ports_internal  = "80"
            ports_external  = "8095"
            container_path  = "/test"
            host_path       = "/home/ubuntu/environment/"
        },
        {
            name            = "nginx_PRE"
            ports_internal  = "80"
            ports_external  = "7988"
            container_path  = "/test"
            host_path       = "/home/ubuntu/environment/"
        },
        {
            name             = "nginx_PRO"
            ports_internal   = "80"
            ports_external   = "7979"
            container_path   = "/test"
            host_path        = "/home/ubuntu/environment/"
        }
    ]
}