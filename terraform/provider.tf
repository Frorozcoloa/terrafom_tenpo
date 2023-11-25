terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.51.0"
    }
  }
}

provider "google" {
  credentials = file(".keys/tenpo-test-406220-30780bd8d222.json")
  project     = "tenpo-test-406220"
  region      = "us-central1"
  zone        = "us-central1-c"
}


