resource "google_container_cluster" "gke_cluster" {
  name     = "gke-cluster"
  location = "${var.region}-a"
  node_locations = [ 
        "us-central1-b"

   ]
#remove default node
  remove_default_node_pool = true
  
#no of nodes in cluster
  initial_node_count       = 1

#range ips of pods,, range ips of service
  ip_allocation_policy {
    cluster_ipv4_cidr_block = var.pods_ipv4_cidr_block
    services_ipv4_cidr_block = var.services_ipv4_cidr_block
  }
  network = var.network_name
  subnetwork = var.subnet_name

  logging_service = "logging.googleapis.com/kubernetes"
  monitoring_service = "monitoring.googleapis.com/kubernetes"
  
# enable cluster is private
  private_cluster_config {
    enable_private_endpoint = true
    enable_private_nodes    = true
    master_ipv4_cidr_block  = var.master_ipv4_cidr_block
  }
#update is stable
  release_channel {
      channel = "STABLE"
  }

  #va access to gke
    master_authorized_networks_config {
    cidr_blocks {
        cidr_block   = var.master_authorized_networks_config
        display_name = "External Control Plane access"
      }
  }

  addons_config {
    // Enable network policy (Calico)
    network_policy_config {
        disabled = false
      }
  }

  /* Enable network policy configurations (like Calico).
  For some reason this has to be in here twice. */
  network_policy {
    enabled = "true"
  }
#
  workload_identity_config {
    workload_pool = "${var.project_id}.svc.id.goog"
  }
}
