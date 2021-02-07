terraform {
  backend "gcs" {
    bucket      = "terraform-remote-backend-xxxxxxxxxxxxxxxx"
    prefix      = "storage"
    credentials = "keys/terraform-state-storage-xxxxxx-xxxxxxxxxxxx.json"
  }
}

provider "google" {
  credentials = file("keys/storage-xxxxxx-xxxxxxxxxxxx.json")
  project     = "place-project-id-here"
  region      = "us-west1"
}

resource "random_id" "instance_id" {
  byte_length = 8
}

resource "google_storage_bucket" "storage-bucket" {
  force_destroy = true
  name     = "storage-bucket-${random_id.instance_id.hex}"
  location = "US"
}