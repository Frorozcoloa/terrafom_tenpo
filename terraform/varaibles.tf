variable "project" { 
}

variable "ssh_ip" {

}
variable "ip_range" {
  default = "0.0.0.0/0"
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
