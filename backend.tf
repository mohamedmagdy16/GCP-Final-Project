terraform {
  backend "gcs" {
    bucket = "magdy_bucket01"
    prefix = "terraform/state"
  }
}