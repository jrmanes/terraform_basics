variable "ami" {
    description = "name to set in the instance"    
    type = string
    default = "ami-0aef57767f5404a3c"
}
variable "instance_type" {
    description = "name to set in the instance"    
    type = string
    default = "t2.micro"
}
variable "instance_name" {
    description = "name to set in the instance"    
    type = string
    default = "jrmanes"
}

variable "region" {
    description = "region"
    type = string
    default = "eu-west-1"
}
