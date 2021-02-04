// Outputs for mariadb container

output "image_id_mariadb" {
    value = module.container_mariadb.image_id
}
output "hostname_mariadb" {
    value = module.container_mariadb.hostname
}
output "ip_address_mariadb" {
    value = module.container_mariadb.ip_address
}
output "id_mariadb" {
    value = module.container_mariadb.id
}

// Outputs for nginx container
output "image_id_nginx" {
    value = module.container_nginx.image_id
}
output "hostname_nginx" {
    value = module.container_nginx.hostname
}
output "ip_address_nginx" {
    value = module.container_nginx.ip_address
}
output "id_nginx" {
    value = module.container_nginx.id
}