
resource "google_compute_network" "vpc_network" {
  name = "terraform-network"
}
resource "google_compute_instance" "vm_instance" {
  name         = var.vm_name
  machine_type = "f1-micro"

  boot_disk {
    initialize_params {
      image = var.image
      size = 50
    }
    
  }

  network_interface {
    network = google_compute_network.vpc_network.name
    access_config {
    }
  }
  tags = ["http-server", "ssh"]
}

resource  "google_compute_firewall" "ssh" {
  name = "connect-ssh"
  network = google_compute_network.vpc_network.name
  allow {
    protocol = "tcp"
    ports = ["22"]
  }
  source_ranges = [var.ip_range]
}

resource "google_compute_firewall" "http" {
  name = "connect-http"
  network = google_compute_network.vpc_network.name
  allow {
    protocol = "tcp"
    ports = ["80"]
  }
  source_ranges = [var.ip_range]
  
}