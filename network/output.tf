output "network_name" {

    value = google_compute_network.vpc_network.name
  
}

output "network_id" {

    value = google_compute_network.vpc_network.id
  
}

output "Management_subnet_name" {

    value = google_compute_subnetwork.Management_Subnet.name
  
}


output "Restricted_subnet_name" {

    value = google_compute_subnetwork.Restricted_Subnet.name
  
}

