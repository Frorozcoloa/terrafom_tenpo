resource "google_compute_instance" "tenpo-test" {
  name = var.vm_name
  machine_type = var.machine_type
  zone =  var.zone

  boot_disk {
    initialize_params {
      image = var.image
    }
  }

  network_interface {
    network = "default"
  }

    tags= ["http-server", "https-server"]
}

resource "google_compute_firewall" "http_firewall" {
  name    = "http-firewall"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags = ["allow-http"]
  
}