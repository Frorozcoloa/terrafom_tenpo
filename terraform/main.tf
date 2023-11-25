resource "google_compute_instance" "tenpo-test" {
  name = "tenpotest"
  machine_type = "f1-micro"
  zone =  "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
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