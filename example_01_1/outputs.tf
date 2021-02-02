output "image_id" {
    value = docker_container.ubuntu.image
}
output "hostname" {
    value = docker_container.ubuntu.hostname
}
output "ip_address" {
    value = docker_container.ubuntu.ip_address
}
output "volumes" {
    value = docker_container.ubuntu.volumes
}
