resource "google_compute_firewall" "ssh-firewall" {
  name    = "ssh-firewall"
  direction     = "INGRESS"
  source_ranges =  [ "35.235.240.0/20" ]
  network = module.network.network_name
   depends_on = [
    module.network
  ]
  

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_tags = ["bastion-vm"]
}

