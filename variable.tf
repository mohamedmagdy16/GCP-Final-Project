variable "region" {
  type = string
}

variable "project_id" {
  type = string
}

variable "management_subnet_cidr" {
  type = string
}

variable "restricted_subnet_cidr" {
  type = string
}

variable "machine_image" {
  type = string
}

variable "machine_type" {
  type = string
}

variable "pods_ipv4_cidr_block" {
  type = string
}

variable "services_ipv4_cidr_block" {
  type = string
}

variable "master_ipv4_cidr_block" {
  type = string
}