resource "google_service_account" "gke_sacc" {
  account_id   = "gke-sacc"

}

resource "google_project_iam_member" "storage-useradmin" {
  project = var.project_id
  role    = "roles/storage.admin"
  member  = "serviceAccount:${google_service_account.gke_sacc.email}"

}

resource "google_project_iam_member" "gke_admin_role" {
  project = var.project_id
  role    = "roles/storage.objectViewer"
  member  = "serviceAccount:${google_service_account.gke_sacc.email}"
}