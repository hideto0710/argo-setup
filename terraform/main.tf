variable "password" {
  type = "string"
}

provider "google" {
  project = "hideto0710dev-terraform-admin"
  region  = "asia-northeast1"
}

resource "google_container_cluster" "argo" {
  name               = "argo"
  zone               = "asia-northeast1-a"
  initial_node_count = 1

  additional_zones = [
    "asia-northeast1-b",
    "asia-northeast1-c",
  ]

  master_auth {
    username = "hideto"
    password = "${var.password}"
  }

  node_config {
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform",
    ]
    image_type = "UBUNTU"
    machine_type = "n1-standard-2"
  }
}

# The following outputs allow authentication and connectivity to the GKE Cluster.
output "client_certificate_argo" {
  value = "${google_container_cluster.argo.master_auth.0.client_certificate}"
}

output "client_key_argo" {
  value = "${google_container_cluster.argo.master_auth.0.client_key}"
}

output "cluster_ca_certificate_argo" {
  value = "${google_container_cluster.argo.master_auth.0.cluster_ca_certificate}"
}
