variable "image_name" {
    description = "Name of the image that we will use"
    type = string
    default = "ubuntu"
}

variable "image_version" {
    description = "Version for the image that we will use"
    type = string
    default = "21.04"
}

variable "volumes" {
    description = "All the volumes that we are going to mount inside container"
    type = list(map(string))
    default = [
        {
            volume_name      = "terraform_basics"
            host_path      = "/home/ubuntu/environment/terraform_basics/"
            container_path = "/cursoTerraform"
        },
        {
            volume_name      = "teach"
            host_path      = "/home/ubuntu/environment/teach"
            container_path = "/teach/"
        }
    ]
}