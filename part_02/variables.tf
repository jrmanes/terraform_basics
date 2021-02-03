variable "image_name" {
    description = "Name of the image that we will use"
    type = string
    default = "rastasheep/ubuntu-sshd"
}

variable "image_version" {
    description = "Version for the image that we will use"
    type = string
    default = "latest"
}
