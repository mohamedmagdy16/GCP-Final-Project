resource "google_container_node_pool" "cluster-node" {
  name           = "cluster-node"

  cluster        = google_container_cluster.gke_cluster.id
  node_count     = 1

  autoscaling {
    max_node_count = 1
    min_node_count = 1
  }
  max_pods_per_node = 100

  management {
    auto_repair  = true
    auto_upgrade = true
  }

  node_config {
    preemptible  = true
    disk_size_gb = 10

    service_account = google_service_account.gke_sacc.email
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]

    labels = {
      role = "cluster-pool"
    }

  }

  
}