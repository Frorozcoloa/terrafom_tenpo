output "ip_private" {
  value = google_compute_instance.vm_instance.network_interface.0.network_ip
}

output "ip_public" {
  value = google_compute_instance.vm_instance.network_interface.0.access_config.0.nat_ip
  
}
output "name" {
  value = google_compute_instance.vm_instance.name
}