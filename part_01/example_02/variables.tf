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