terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
    }
  }

}

resource "google_container_cluster" "primary" {
  project = "gold-mode-297211"
  name     = "gkeauto92"
  location = "useast-1"
  initial_node_count = 1
 
  network    = "default"
#   subnetwork = google_compute_subnetwork.subnet.name
 
# Enabling Autopilot for this cluster
  enable_autopilot = true
}