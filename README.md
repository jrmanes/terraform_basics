# terraform_basics

## [PART 1](https://github.com/jrmanes/terraform_basics/tree/main/part_01_basic)
Basic [HCL](https://www.terraform.io/docs/language/syntax/configuration.html) language use, variables, project structure.


## [PART 2](https://github.com/jrmanes/terraform_basics/tree/main/part_02_provisioneres)
Provisioners part, how to inject commands, scripts, ansible playbooks, etc..


## [PART 3](https://github.com/jrmanes/terraform_basics/tree/main/part_03_modules)

In Part 3, we will see how to create a module, use it and improve the variables validation.

### Module for Docker containers

This module is created with the pourpose to create docker containers.

### Requirements

```terraform
    container_name = "name"
    image_name = "image to download"
    image_version = "version to download"
    container_ports = [
        {
            internal = 80
            external = 80
            protocol = "tcp"
        }
    ]
```

### Outputs

- ```image_id```: ***Image*** ID
- ```hostname```: ***Container*** hostname
- ```ip_address```: ***Container's*** ip address
- ```id```: ***Container's*** ID

### Variables

| Variables | Description | Must|
|-|-|-|
|container_name|Name of the image that we will use|YES|
|image_name|Name of the image that we will use|YES|
|image_version|Version for the image that we will use|NO|
|container_ports|Ports needed for the container|YES|


## [PART 4](https://github.com/jrmanes/terraform_basics/tree/main/part_04_ec2)
AWS EC2 basic instance and module

## [PART 5](https://github.com/jrmanes/terraform_basics/tree/main/part_05_aws)
AWS EC2 instance, security_groups and ssh keys


---
Jose Ramón Mañes