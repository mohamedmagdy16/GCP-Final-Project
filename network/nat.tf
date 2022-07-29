resource "google_compute_router" "router" {
  name    = "router"
  region  = var.region
  network = google_compute_network.vpc_network.id
}

resource "google_compute_address" "ip_nat" {
  name         = "ip-nat"
  address_type = "EXTERNAL"
  network_tier = "PREMIUM"

}

resource "google_compute_router_nat" "nat" {
  name   = "nat"
  router = google_compute_router.router.name
  region = var.region

  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"
  nat_ip_allocate_option             = "MANUAL_ONLY"

  subnetwork {
    name                    = google_compute_subnetwork.Management_Subnet.id
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }


  subnetwork {
    name                    = google_compute_subnetwork.Restricted_Subnet.id
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }

  
  nat_ips = [google_compute_address.ip_nat.self_link]
}

