output "dns_name" {
  value = module.module-webserver.public_dns
}

output "ip_public" {
  value = module.module-webserver.public_ip
}

output "avaibility_zone" {
  value = module.module-webserver.az_instance_location
}