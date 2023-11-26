variable "project" { 
}

variable "credentials_file" { 
}

variable "region" {
  default = "us-central1"
}

variable "zone" {
  default = "us-central1-c"
}

variable "machine_type" {
  default = "f1-micro"
}

variable "image" {
  default = "debian-cloud/debian-11"
}

variable "vm_name" {
  default = "tenpotest"
  
}