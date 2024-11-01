provider "google" {
  project = "moonlit-order-440304-i7"  # Replace with your project ID
  region  = "us-central1"       # Replace with your desired region
  credentials = file("service-account.json")
}

resource "google_compute_network" "vpc_network" {
  name                    = "my-vpc-network"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnet_1" {
  name          = "my-subnet-1"
  ip_cidr_range = "10.0.1.0/24"
  region        = "us-central1"  # Match the region in the provider
  network       = google_compute_network.vpc_network.name
}

resource "google_compute_subnetwork" "subnet_2" {
  name          = "my-subnet-2"
  ip_cidr_range = "10.0.2.0/24"
  region        = "us-central1"
  network       = google_compute_network.vpc_network.name
}
