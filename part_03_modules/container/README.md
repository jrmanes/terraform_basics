## Module for Docker containers

This module is created with the pourpose to create docker containers.

## Requirements

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

## Outputs

- ```image_id```: ***Image*** ID
- ```hostname```: ***Container*** hostname
- ```ip_address```: ***Container's*** ip address
- ```id```: ***Container's*** ID

## Variables

| Variables | Description | Must|
|-|-|-|
|container_name|Name of the image that we will use|YES|
|image_name|Name of the image that we will use|YES|
|image_version|Version for the image that we will use|NO|
|container_ports|Ports needed for the container|YES|

---
Jose Ramón Mañes