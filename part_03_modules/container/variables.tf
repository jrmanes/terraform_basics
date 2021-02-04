variable "container_name" {
    description = "Name of the image that we will use"
    type = string
    validation {
        condition = length(var.container_name) >= 5
        error_message = "ERROR: Name must be more than 5 characters."
    }
}

variable "image_name" {
    description = "Name of the image that we will use"
    type = string
}

variable "image_version" {
    description = "Version for the image that we will use"
    type = string
    default = "latest"
}

variable "container_ports" {
    description = "Containers ports"
    type = list(map(string))
}