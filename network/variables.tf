variable "region" {
    default = "us-central1"
    type = string
    description = "defualt us-central1 "
  
}


variable "management_subnet_cidr" {

    default = "10.0.0.0/24"
    type = string
  
}


variable "restricted_subnet_cidr" {

    default = "10.0.1.0/24"
    type = string
  
}

variable "project_id" {
  type    = string
}